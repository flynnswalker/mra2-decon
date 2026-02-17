#!/usr/bin/env python3
"""
MRA2 Cross-Reference Finder -- find all code that references a given address.

Given a target address (ROM data or WRAM), scans the entire ROM for:
  - Literal pool entries containing the address (LDR Rn, =addr pattern)
  - Direct pointer values embedded in data tables
  - THUMB BL/B targets pointing to the address

Then disassembles surrounding code to show context.

Usage:
    python tools/xref_finder.py rom/mra2.gba 0x081CADC4
    python tools/xref_finder.py rom/mra2.gba 0x02006DB0
    python tools/xref_finder.py rom/mra2.gba 0x081CADC4 --context 12 --output analysis/xrefs/
"""

import argparse
import json
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

try:
    from capstone import (
        Cs, CS_ARCH_ARM, CS_MODE_THUMB, CS_MODE_ARM,
        CS_MODE_LITTLE_ENDIAN,
    )
except ImportError:
    print("ERROR: capstone not installed. Run: pip install capstone")
    sys.exit(1)

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import (
    ROM_START, ROM_END, EWRAM_START, EWRAM_END,
    IWRAM_START, IWRAM_END, IO_START,
    rom_offset_to_address, address_to_rom_offset,
    classify_address, GBA_MEMORY_REGIONS,
)


# =============================================================================
# Data Structures
# =============================================================================

@dataclass
class XRef:
    """A cross-reference: a location in ROM that references a target address."""
    location: int        # ROM address where the reference is found
    target: int          # The address being referenced
    ref_type: str        # "literal_pool", "pointer_table", "bl_target"
    context_asm: list    # Disassembly lines around the reference
    containing_func: Optional[int] = None  # Address of the containing function

    @property
    def location_hex(self):
        return f"0x{self.location:08X}"

    @property
    def target_hex(self):
        return f"0x{self.target:08X}"


# =============================================================================
# Literal Pool / Pointer Search
# =============================================================================

def find_literal_references(rom_data: bytes, target_addr: int) -> list[int]:
    """
    Find all locations in ROM where the 4-byte LE representation of
    target_addr appears. These are literal pool entries or pointer table
    entries that reference the target.
    """
    target_bytes = struct.pack("<I", target_addr)
    locations = []
    idx = 0
    while True:
        idx = rom_data.find(target_bytes, idx)
        if idx == -1:
            break
        locations.append(idx)
        idx += 1
    return locations


def find_nearby_references(rom_data: bytes, target_addr: int, window: int = 4) -> list[int]:
    """
    Find references to addresses near the target (within +/- window bytes).
    Useful for finding code that accesses fields within a struct starting
    at the target address.
    """
    all_refs = []
    for offset in range(-window, window + 1, 4):
        addr = target_addr + offset
        refs = find_literal_references(rom_data, addr)
        for r in refs:
            all_refs.append((r, addr))
    return all_refs


# =============================================================================
# Disassembly Context
# =============================================================================

def disassemble_context(
    rom_data: bytes,
    center_offset: int,
    num_instructions: int = 8,
    mode: str = "thumb",
) -> list[str]:
    """
    Disassemble instructions around a given ROM offset.
    Returns a list of formatted assembly lines.
    """
    if mode == "thumb":
        md = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)
        align = 2
    else:
        md = Cs(CS_ARCH_ARM, CS_MODE_ARM | CS_MODE_LITTLE_ENDIAN)
        align = 4

    # Start a bit before center to get context
    start = max(0, center_offset - num_instructions * align)
    start = (start // align) * align  # Align
    end = min(len(rom_data), center_offset + num_instructions * align + 16)

    code = rom_data[start:end]
    base_addr = ROM_START + start
    center_addr = ROM_START + center_offset

    lines = []
    for insn in md.disasm(code, base_addr):
        marker = " >>>" if insn.address == center_addr else "    "
        lines.append(f"{marker} 0x{insn.address:08X}: {insn.mnemonic:<8s} {insn.op_str}")
        if len(lines) >= num_instructions * 2 + 4:
            break

    return lines


def find_containing_function(rom_data: bytes, offset: int) -> Optional[int]:
    """
    Search backwards from offset to find the nearest PUSH {*, lr} prologue,
    which marks the start of the containing function.
    """
    # Search backwards for THUMB PUSH {*, lr} (0xB5xx)
    search_start = max(0, offset - 512)
    for i in range(offset - 2, search_start, -2):
        if i + 1 < len(rom_data) and rom_data[i + 1] == 0xB5:
            return ROM_START + i
    return None


def classify_reference(rom_data: bytes, offset: int) -> str:
    """
    Determine if a literal pool reference is in a code region (literal pool)
    or a data region (pointer table).
    """
    # Check if there are THUMB instructions nearby
    # Look at bytes before and after
    before_looks_like_code = False
    after_looks_like_code = False

    # Check 8 bytes before: do they look like THUMB instructions?
    if offset >= 8:
        for i in range(offset - 8, offset, 2):
            if i + 1 < len(rom_data):
                hi = rom_data[i + 1]
                # Common THUMB opcode high bytes
                if hi in (0xB5, 0xBD, 0x46, 0x47, 0x68, 0x60, 0x88, 0x80,
                          0x20, 0x21, 0x22, 0x23, 0xD0, 0xD1, 0xE0, 0xF0):
                    before_looks_like_code = True
                    break

    # Check if there's a function at a nearby aligned address after
    if offset + 8 < len(rom_data):
        for i in range(offset + 4, min(offset + 32, len(rom_data) - 1), 2):
            if rom_data[i + 1] == 0xB5:
                after_looks_like_code = True
                break

    if before_looks_like_code or after_looks_like_code:
        return "literal_pool"
    return "pointer_table"


# =============================================================================
# LDR Instruction Reference Finder
# =============================================================================

def find_ldr_references_to_pool(
    rom_data: bytes,
    pool_offset: int,
) -> list[int]:
    """
    Given a literal pool entry at pool_offset, find THUMB LDR instructions
    that reference it. THUMB LDR PC-relative: LDR Rd, [PC, #imm8*4]
    The instruction encodes: 0x48xx-0x4Fxx where xx is the offset/4.
    PC is aligned to 4 and points 4 bytes ahead.
    """
    refs = []
    pool_addr = ROM_START + pool_offset
    # Pool must be word-aligned for PC-relative LDR
    if pool_addr & 3:
        return refs

    # LDR Rd, [PC, #imm] can reach up to 1020 bytes forward
    # Search instructions before the pool entry
    search_start = max(0, pool_offset - 1020)

    for i in range(search_start, pool_offset, 2):
        if i + 1 >= len(rom_data):
            break
        hw = struct.unpack_from("<H", rom_data, i)[0]
        # LDR Rd, [PC, #imm8*4]: 0100 1ddd iiii iiii
        if (hw & 0xF800) == 0x4800:
            imm8 = hw & 0xFF
            # PC is (instruction_address + 4) & ~3
            pc_val = ((ROM_START + i + 4) & ~3)
            target = pc_val + imm8 * 4
            if target == pool_addr:
                refs.append(i)

    return refs


# =============================================================================
# Main XRef Engine
# =============================================================================

def find_xrefs(
    rom_data: bytes,
    target_addr: int,
    context_lines: int = 8,
) -> list[XRef]:
    """
    Find all cross-references to the target address in the ROM.
    """
    xrefs = []

    # Step 1: Find all literal pool / pointer table entries with this address
    literal_offsets = find_literal_references(rom_data, target_addr)

    for pool_off in literal_offsets:
        ref_type = classify_reference(rom_data, pool_off)

        if ref_type == "literal_pool":
            # Find LDR instructions that reference this pool entry
            ldr_offsets = find_ldr_references_to_pool(rom_data, pool_off)
            for ldr_off in ldr_offsets:
                ctx = disassemble_context(rom_data, ldr_off, context_lines, "thumb")
                func = find_containing_function(rom_data, ldr_off)
                xrefs.append(XRef(
                    location=ROM_START + ldr_off,
                    target=target_addr,
                    ref_type="ldr_from_pool",
                    context_asm=ctx,
                    containing_func=func,
                ))

            # If no LDR found, still record the pool entry itself
            if not ldr_offsets:
                ctx = disassemble_context(rom_data, pool_off, context_lines, "thumb")
                func = find_containing_function(rom_data, pool_off)
                xrefs.append(XRef(
                    location=ROM_START + pool_off,
                    target=target_addr,
                    ref_type="literal_pool_entry",
                    context_asm=ctx,
                    containing_func=func,
                ))
        else:
            # Pointer table entry -- just record it
            xrefs.append(XRef(
                location=ROM_START + pool_off,
                target=target_addr,
                ref_type="pointer_table_entry",
                context_asm=[],
                containing_func=None,
            ))

    # Step 2: For ROM addresses, also check if any BL instructions target it
    if ROM_START <= target_addr <= ROM_END:
        target_off = target_addr - ROM_START
        # Check THUMB BL
        for i in range(0, len(rom_data) - 3, 2):
            hi = struct.unpack_from("<H", rom_data, i)[0]
            lo = struct.unpack_from("<H", rom_data, i + 2)[0]
            if (hi & 0xF800) == 0xF000 and (lo & 0xF800) == 0xF800:
                offset_hi = (hi & 0x07FF) << 12
                offset_lo = (lo & 0x07FF) << 1
                if offset_hi & 0x00400000:
                    offset_hi |= 0xFF800000
                bl_offset = offset_hi | offset_lo
                bl_target = (ROM_START + i + 4 + bl_offset) & 0xFFFFFFFF
                if bl_target == target_addr:
                    ctx = disassemble_context(rom_data, i, context_lines, "thumb")
                    func = find_containing_function(rom_data, i)
                    xrefs.append(XRef(
                        location=ROM_START + i,
                        target=target_addr,
                        ref_type="bl_call",
                        context_asm=ctx,
                        containing_func=func,
                    ))

    # Deduplicate by location
    seen = set()
    unique = []
    for xref in xrefs:
        if xref.location not in seen:
            seen.add(xref.location)
            unique.append(xref)

    return sorted(unique, key=lambda x: x.location)


# =============================================================================
# Output
# =============================================================================

def print_xrefs(xrefs: list[XRef], target_addr: int):
    """Print cross-reference results in a readable format."""
    region = classify_address(target_addr)
    print(f"\n=== Cross-References to 0x{target_addr:08X} ({region or 'unknown'}) ===\n")
    print(f"Total references found: {len(xrefs)}")

    # Group by type
    by_type = {}
    for xref in xrefs:
        by_type.setdefault(xref.ref_type, []).append(xref)

    for rtype, refs in by_type.items():
        print(f"\n--- {rtype} ({len(refs)} refs) ---")
        for xref in refs:
            func_str = f" [in FUN_{xref.containing_func:08X}]" if xref.containing_func else ""
            print(f"\n  {xref.location_hex}{func_str}")
            for line in xref.context_asm:
                print(f"    {line}")


def save_xrefs(xrefs: list[XRef], target_addr: int, output_dir: str):
    """Save cross-reference results to JSON."""
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)

    filename = f"xref_{target_addr:08X}.json"
    data = {
        "target": f"0x{target_addr:08X}",
        "target_region": classify_address(target_addr),
        "total_refs": len(xrefs),
        "refs": [
            {
                "location": xref.location_hex,
                "location_int": xref.location,
                "ref_type": xref.ref_type,
                "containing_func": f"0x{xref.containing_func:08X}" if xref.containing_func else None,
                "context_asm": xref.context_asm,
            }
            for xref in xrefs
        ],
    }
    filepath = out / filename
    filepath.write_text(json.dumps(data, indent=2))
    print(f"\nSaved to: {filepath}")


# =============================================================================
# Main
# =============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="MRA2 Cross-Reference Finder -- find code that references an address"
    )
    parser.add_argument("rom", help="Path to the MRA2 GBA ROM file")
    parser.add_argument(
        "address",
        help="Target address to find references to (hex, e.g., 0x081CADC4)",
    )
    parser.add_argument(
        "--context", "-c",
        type=int, default=8,
        help="Number of disassembly lines for context (default: 8)",
    )
    parser.add_argument(
        "--output", "-o",
        default=None,
        help="Output directory for JSON results (e.g., analysis/xrefs/)",
    )
    parser.add_argument(
        "--no-bl-scan",
        action="store_true",
        help="Skip BL instruction scanning (faster for non-function targets)",
    )
    args = parser.parse_args()

    # Parse address
    try:
        target = int(args.address, 0)
    except ValueError:
        print(f"ERROR: Invalid address: {args.address}")
        sys.exit(1)

    # Load ROM
    rom_path = Path(args.rom)
    if not rom_path.exists():
        print(f"ERROR: ROM not found: {rom_path}")
        sys.exit(1)

    rom_data = rom_path.read_bytes()
    print(f"Loaded ROM: {rom_path} ({len(rom_data):,} bytes)")
    print(f"Searching for references to 0x{target:08X}...")

    xrefs = find_xrefs(rom_data, target, args.context)
    print_xrefs(xrefs, target)

    if args.output:
        save_xrefs(xrefs, target, args.output)


if __name__ == "__main__":
    main()
