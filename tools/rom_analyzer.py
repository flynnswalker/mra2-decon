#!/usr/bin/env python3
"""
MRA2 ROM Analyzer -- First-pass disassembly and function identification.

Uses the Capstone disassembly engine to perform a first-pass analysis of the
Monster Rancher Advance 2 GBA ROM, identifying:
  - Functions (via PUSH/POP patterns and BL call targets)
  - String references
  - Pointer tables
  - Basic code vs. data region classification

Usage:
    python tools/rom_analyzer.py rom/mra2.gba [--output analysis/]
"""

import argparse
import json
import os
import struct
import sys
from collections import defaultdict
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Optional

try:
    from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB, CS_MODE_LITTLE_ENDIAN
except ImportError:
    print("ERROR: capstone not installed. Run: pip install capstone")
    sys.exit(1)

# Add parent dir to path so we can import memory_map
sys.path.insert(0, str(Path(__file__).parent))
from memory_map import (
    ROM_START, ROM_END, EWRAM_START, EWRAM_END,
    IWRAM_START, IWRAM_END, MRA2_ROM_SIZE,
    rom_offset_to_address, address_to_rom_offset,
)


# =============================================================================
# GBA ROM Header
# =============================================================================

GBA_HEADER_SIZE = 0xC0  # 192 bytes
GBA_ENTRY_POINT_OFFSET = 0x00  # ARM branch instruction
GBA_LOGO_OFFSET = 0x04  # Nintendo logo (156 bytes)
GBA_TITLE_OFFSET = 0xA0  # 12-byte game title
GBA_GAMECODE_OFFSET = 0xAC  # 4-byte game code
GBA_MAKERCODE_OFFSET = 0xB0  # 2-byte maker code


@dataclass
class ROMHeader:
    """Parsed GBA ROM header."""
    entry_point: int
    title: str
    game_code: str
    maker_code: str
    rom_size: int

    def __str__(self):
        return (
            f"Title:       {self.title}\n"
            f"Game Code:   {self.game_code}\n"
            f"Maker Code:  {self.maker_code}\n"
            f"Entry Point: 0x{self.entry_point:08X}\n"
            f"ROM Size:    {self.rom_size:,} bytes ({self.rom_size // 1024} KB)"
        )


def parse_header(rom_data: bytes) -> ROMHeader:
    """Parse the GBA ROM header."""
    entry_instr = struct.unpack_from("<I", rom_data, 0)[0]
    # The entry point is an ARM branch: offset is bits [23:0] shifted left 2
    offset = (entry_instr & 0x00FFFFFF) << 2
    entry_point = ROM_START + 8 + offset  # +8 for pipeline

    title = rom_data[GBA_TITLE_OFFSET:GBA_TITLE_OFFSET + 12].decode("ascii", errors="replace").rstrip("\x00")
    game_code = rom_data[GBA_GAMECODE_OFFSET:GBA_GAMECODE_OFFSET + 4].decode("ascii", errors="replace")
    maker_code = rom_data[GBA_MAKERCODE_OFFSET:GBA_MAKERCODE_OFFSET + 2].decode("ascii", errors="replace")

    return ROMHeader(
        entry_point=entry_point,
        title=title,
        game_code=game_code,
        maker_code=maker_code,
        rom_size=len(rom_data),
    )


# =============================================================================
# Function Detection
# =============================================================================

@dataclass
class Function:
    """A detected function in the ROM."""
    address: int
    size: int = 0
    name: str = ""
    detection_method: str = ""
    calls_to: list = None
    called_by: list = None

    def __post_init__(self):
        if self.calls_to is None:
            self.calls_to = []
        if self.called_by is None:
            self.called_by = []
        if not self.name:
            self.name = f"FUN_{self.address:08X}"

    @property
    def address_hex(self):
        return f"0x{self.address:08X}"


def find_functions_thumb(rom_data: bytes, max_funcs: int = 50000) -> dict[int, Function]:
    """
    Identify functions in THUMB code using heuristic patterns.

    Strategy:
    1. Look for PUSH {r4-r7, lr} patterns (function prologues)
    2. Track BL (branch-with-link) targets as function entry points
    3. Cross-reference to build a call graph
    """
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)
    md.detail = True

    functions: dict[int, Function] = {}
    bl_targets: set[int] = set()

    code_start = GBA_HEADER_SIZE
    code_bytes = rom_data[code_start:]
    base_addr = ROM_START + code_start

    print(f"  Scanning for functions from 0x{base_addr:08X}...")
    print(f"  ROM size to scan: {len(code_bytes):,} bytes")

    # Pass 1: Find PUSH {*, lr} prologues and BL targets
    push_count = 0
    bl_count = 0

    for insn in md.disasm(code_bytes, base_addr):
        # Detect function prologues: push {r4-r7, lr}
        if insn.mnemonic == "push" and "lr" in insn.op_str:
            addr = insn.address
            if addr not in functions:
                functions[addr] = Function(
                    address=addr,
                    detection_method="push_lr_prologue",
                )
                push_count += 1

        # Detect BL (function call) targets
        elif insn.mnemonic == "bl":
            try:
                target = int(insn.op_str.lstrip("#"), 0) if insn.op_str.startswith("#") else int(insn.op_str, 0)
                if ROM_START <= target <= ROM_END:
                    bl_targets.add(target)
                    bl_count += 1
            except (ValueError, TypeError):
                pass

        if len(functions) >= max_funcs:
            print(f"  WARNING: Hit function limit ({max_funcs}), stopping scan early")
            break

    # Pass 2: Add BL targets that weren't already found via PUSH
    new_from_bl = 0
    for target in bl_targets:
        if target not in functions:
            functions[target] = Function(
                address=target,
                detection_method="bl_target",
            )
            new_from_bl += 1

    print(f"  Found {push_count} functions via PUSH prologue")
    print(f"  Found {bl_count} BL call instructions")
    print(f"  Added {new_from_bl} additional functions from BL targets")
    print(f"  Total unique functions: {len(functions)}")

    return functions


# =============================================================================
# String Detection
# =============================================================================

@dataclass
class StringRef:
    """A detected string in the ROM."""
    address: int
    text: str
    encoding: str
    length: int

    @property
    def address_hex(self):
        return f"0x{self.address:08X}"


def find_ascii_strings(rom_data: bytes, min_length: int = 4) -> list[StringRef]:
    """Find printable ASCII strings in the ROM."""
    strings = []
    current_start = None
    current_chars = []

    for i, byte in enumerate(rom_data):
        if 0x20 <= byte <= 0x7E:  # printable ASCII
            if current_start is None:
                current_start = i
            current_chars.append(chr(byte))
        else:
            if current_start is not None and len(current_chars) >= min_length:
                text = "".join(current_chars)
                strings.append(StringRef(
                    address=ROM_START + current_start,
                    text=text,
                    encoding="ascii",
                    length=len(text),
                ))
            current_start = None
            current_chars = []

    return strings


# =============================================================================
# Pointer Table Detection
# =============================================================================

@dataclass
class PointerTable:
    """A detected pointer table in the ROM."""
    address: int
    count: int
    targets: list
    description: str = ""

    @property
    def address_hex(self):
        return f"0x{self.address:08X}"


def find_pointer_tables(rom_data: bytes, min_entries: int = 4) -> list[PointerTable]:
    """
    Find sequences of consecutive 32-bit values that look like ROM pointers.
    A pointer table is a sequence of 4-byte values all pointing into ROM space.
    """
    tables = []
    rom_len = len(rom_data)
    i = 0
    stride = 4

    while i < rom_len - 16:
        # Check if we're at the start of a pointer sequence
        consecutive = 0
        targets = []

        j = i
        while j + 4 <= rom_len:
            val = struct.unpack_from("<I", rom_data, j)[0]
            if ROM_START <= val <= ROM_START + rom_len:
                consecutive += 1
                targets.append(val)
                j += stride
            else:
                break

        if consecutive >= min_entries:
            tables.append(PointerTable(
                address=ROM_START + i,
                count=consecutive,
                targets=targets[:32],  # cap stored targets
            ))
            i = j  # skip past this table
        else:
            i += stride

    return tables


# =============================================================================
# Main Analysis
# =============================================================================

def analyze_rom(rom_path: str, output_dir: Optional[str] = None):
    """Run full first-pass analysis on a GBA ROM."""
    rom_path = Path(rom_path)
    if not rom_path.exists():
        print(f"ERROR: ROM not found: {rom_path}")
        sys.exit(1)

    rom_data = rom_path.read_bytes()
    print(f"Loaded ROM: {rom_path} ({len(rom_data):,} bytes)\n")

    # --- Header ---
    print("=== ROM Header ===\n")
    header = parse_header(rom_data)
    print(header)
    print()

    # --- Functions ---
    print("=== Function Detection ===\n")
    functions = find_functions_thumb(rom_data)
    sorted_funcs = sorted(functions.values(), key=lambda f: f.address)
    print()

    # Estimate function sizes (distance to next function)
    for i, func in enumerate(sorted_funcs):
        if i + 1 < len(sorted_funcs):
            func.size = sorted_funcs[i + 1].address - func.address
        else:
            func.size = 0  # unknown for last function

    # --- Strings ---
    print("=== String Detection ===\n")
    strings = find_ascii_strings(rom_data, min_length=5)
    print(f"  Found {len(strings)} ASCII strings (min length 5)")

    game_strings = [s for s in strings if any(
        kw in s.text.lower() for kw in
        ["monster", "ranch", "train", "battle", "power", "life", "attack",
         "defense", "speed", "item", "gold", "week", "month", "year",
         "golem", "tiger", "hare", "suezo", "mocchi", "pixie", "dragon",
         "naga", "plant", "jell", "durahan"]
    )]
    if game_strings:
        print(f"  Found {len(game_strings)} game-relevant strings")
        for s in game_strings[:20]:
            print(f"    {s.address_hex}: \"{s.text[:60]}\"")
    print()

    # --- Pointer Tables ---
    print("=== Pointer Table Detection ===\n")
    ptr_tables = find_pointer_tables(rom_data, min_entries=8)
    print(f"  Found {len(ptr_tables)} pointer tables (min 8 entries)")
    for pt in ptr_tables[:20]:
        print(f"    {pt.address_hex}: {pt.count} pointers "
              f"(first -> 0x{pt.targets[0]:08X})")
    print()

    # --- Summary ---
    print("=== Analysis Summary ===\n")
    print(f"  Functions detected:    {len(functions):,}")
    print(f"  ASCII strings found:   {len(strings):,}")
    print(f"  Game-relevant strings: {len(game_strings):,}")
    print(f"  Pointer tables found:  {len(ptr_tables):,}")

    # --- Output ---
    if output_dir:
        out = Path(output_dir)
        out.mkdir(parents=True, exist_ok=True)

        # Functions catalog
        func_file = out / "functions" / "function_catalog.json"
        func_file.parent.mkdir(parents=True, exist_ok=True)
        func_data = {
            "rom": str(rom_path),
            "total_functions": len(functions),
            "functions": [
                {
                    "address": f"0x{f.address:08X}",
                    "address_int": f.address,
                    "name": f.name,
                    "size": f.size,
                    "detection_method": f.detection_method,
                }
                for f in sorted_funcs
            ]
        }
        func_file.write_text(json.dumps(func_data, indent=2))
        print(f"\n  Wrote function catalog: {func_file}")

        # Strings catalog
        str_file = out / "data_tables" / "strings.json"
        str_file.parent.mkdir(parents=True, exist_ok=True)
        str_data = {
            "total_strings": len(strings),
            "game_relevant": len(game_strings),
            "strings": [
                {
                    "address": s.address_hex,
                    "address_int": s.address,
                    "text": s.text,
                    "length": s.length,
                }
                for s in strings
            ]
        }
        str_file.write_text(json.dumps(str_data, indent=2))
        print(f"  Wrote strings catalog: {str_file}")

        # Pointer tables
        ptr_file = out / "data_tables" / "pointer_tables.json"
        ptr_data = {
            "total_tables": len(ptr_tables),
            "tables": [
                {
                    "address": pt.address_hex,
                    "address_int": pt.address,
                    "entry_count": pt.count,
                    "first_targets": [f"0x{t:08X}" for t in pt.targets[:8]],
                }
                for pt in ptr_tables
            ]
        }
        ptr_file.write_text(json.dumps(ptr_data, indent=2))
        print(f"  Wrote pointer tables: {ptr_file}")

    print("\nAnalysis complete.")


def main():
    parser = argparse.ArgumentParser(
        description="MRA2 ROM Analyzer -- first-pass disassembly and function identification"
    )
    parser.add_argument("rom", help="Path to the MRA2 GBA ROM file")
    parser.add_argument(
        "--output", "-o",
        default="analysis",
        help="Output directory for analysis results (default: analysis/)",
    )
    args = parser.parse_args()
    analyze_rom(args.rom, args.output)


if __name__ == "__main__":
    main()
