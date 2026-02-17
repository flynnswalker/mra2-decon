#!/usr/bin/env python3
"""
MRA2 Function Tracer -- deep disassembly with branch following, literal pool
resolution, and annotated pseudocode output.

Given a function address, traces through all execution paths, resolves
every literal pool reference, identifies field accessor calls, and
produces annotated pseudocode.

Usage:
    python tools/function_tracer.py rom/mra2.gba 0x08068810
    python tools/function_tracer.py rom/mra2.gba 0x08068810 --schema analysis/game_state_schema.json
"""

import argparse
import json
import re
import struct
import sys
from collections import OrderedDict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

try:
    from capstone import (
        Cs, CS_ARCH_ARM, CS_MODE_THUMB, CS_MODE_ARM,
        CS_MODE_LITTLE_ENDIAN,
    )
except ImportError:
    print("ERROR: capstone not installed")
    sys.exit(1)

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import ROM_START, ROM_END

# Known function names
KNOWN_FUNCTIONS = {
    0x08020C5C: "get_monster_record(index)",
    0x08002B28: "combine_breed_ids(main, sub)",
    0x080035BC: "field_read(base, field_idx, arr_idx)",
    0x080035D0: "field_write(base, field_idx, value, arr_idx)",
    0x08002240: "core_state_accessor(...)",
    0x08002B88: "resolve_ptr_16(index)",
    0x08002B9C: "resolve_ptr_32(index)",
    0x081C7D0C: "memcpy(dst, src, len)",
    0x081C7C24: "divmod(a, b)",
    0x081C79D4: "multiply(a, b)",
    0x081C770C: "memset(dst, val, len)",
}

KNOWN_ADDRESSES = {
    0x081CACC8: "MONSTER_TYPE_TABLE",
    0x081E88C0: "BREED_COMBO_TABLE",
    0x081C9F80: "STAT_GROWTH_TABLE",
    0x081D3CCC: "VARIANT_DATA_TABLE",
    0x082006F8: "STRING_TABLE",
    0x02006D48: "WRAM_MONSTER_STRUCT",
    0x02002B24: "WRAM_PLAYER_STATE",
    0x0844386C: "TILE_REMAP_TABLE",
}


@dataclass
class Instruction:
    address: int
    mnemonic: str
    op_str: str
    size: int
    raw_bytes: bytes
    pool_value: Optional[int] = None
    pool_name: Optional[str] = None
    call_name: Optional[str] = None
    comment: Optional[str] = None


def resolve_thumb_pool(rom_data: bytes, addr: int, op_str: str) -> Optional[int]:
    """Resolve a THUMB LDR [PC, #imm] to its literal pool value."""
    m = re.search(r'#(0x[0-9a-fA-F]+)', op_str)
    if not m:
        return None
    imm = int(m.group(1), 16)
    pc_val = (addr + 4) & 0xFFFFFFFC
    pool_addr = pc_val + imm
    pool_off = pool_addr - ROM_START
    if 0 <= pool_off + 4 <= len(rom_data):
        return struct.unpack_from('<I', rom_data, pool_off)[0]
    return None


def resolve_bl_target(rom_data: bytes, addr: int, op_str: str) -> Optional[int]:
    """Resolve a BL target address from operand string."""
    m = re.search(r'#(0x[0-9a-fA-F]+)', op_str)
    if m:
        return int(m.group(1), 16)
    return None


def disassemble_function(
    rom_data: bytes,
    start_addr: int,
    max_instructions: int = 500,
    schema: dict = None,
) -> list[Instruction]:
    """
    Disassemble a complete function, following branches.
    Returns ordered list of Instructions with annotations.
    """
    md = Cs(CS_ARCH_ARM, CS_MODE_THUMB | CS_MODE_LITTLE_ENDIAN)

    visited = set()
    queue = [start_addr]
    instructions = OrderedDict()

    while queue:
        addr = queue.pop(0)
        if addr in visited:
            continue

        off = addr - ROM_START
        if off < 0 or off >= len(rom_data):
            continue

        # Disassemble from this point
        code = rom_data[off:off + max_instructions * 4]
        for insn in md.disasm(code, addr):
            if insn.address in visited:
                break
            visited.add(insn.address)

            inst = Instruction(
                address=insn.address,
                mnemonic=insn.mnemonic,
                op_str=insn.op_str,
                size=insn.size,
                raw_bytes=insn.bytes,
            )

            # Resolve literal pool references
            if insn.mnemonic == 'ldr' and '[pc' in insn.op_str:
                val = resolve_thumb_pool(rom_data, insn.address, insn.op_str)
                if val is not None:
                    inst.pool_value = val
                    inst.pool_name = KNOWN_ADDRESSES.get(val)

            # Resolve BL calls
            if insn.mnemonic == 'bl':
                target = resolve_bl_target(rom_data, insn.address, insn.op_str)
                if target:
                    inst.call_name = KNOWN_FUNCTIONS.get(target)
                    # Annotate field accessor calls
                    if target in (0x080035BC, 0x080035D0) and schema:
                        inst.comment = _annotate_field_call(
                            instructions, insn.address, target, schema
                        )

            instructions[insn.address] = inst

            # Follow conditional branches
            if insn.mnemonic.startswith('b') and insn.mnemonic not in ('bl', 'bx', 'blx'):
                target = resolve_bl_target(rom_data, insn.address, insn.op_str)
                if target and ROM_START <= target < ROM_END:
                    queue.append(target)
                # Unconditional branch: stop linear flow
                if insn.mnemonic == 'b':
                    break

            # Return: stop this path
            if insn.mnemonic == 'bx':
                break
            if insn.mnemonic == 'pop' and 'pc' in insn.op_str:
                break

            # Safety limit
            if len(instructions) >= max_instructions:
                break

        if len(instructions) >= max_instructions:
            break

    return sorted(instructions.values(), key=lambda i: i.address)


def _annotate_field_call(
    prev_instructions: dict,
    call_addr: int,
    func_addr: int,
    schema: dict,
) -> Optional[str]:
    """Try to annotate a field accessor call by looking at preceding movs."""
    # Look for movs r1, #XX in the preceding ~6 instructions
    for lookback in range(2, 14, 2):
        prev_addr = call_addr - lookback
        prev = prev_instructions.get(prev_addr)
        if prev and prev.mnemonic == 'movs' and prev.op_str.startswith('r1,'):
            m = re.search(r'#(0x[0-9a-fA-F]+|\d+)', prev.op_str)
            if m:
                field_idx = int(m.group(1), 0)
                # Look up in schema
                for f in schema.get("fields", []):
                    if f["index"] == field_idx:
                        name = f.get("name", f"field_{field_idx}")
                        off = f.get("struct_offset", "?")
                        return f"-> {name} (offset {off})"
                return f"-> field[{field_idx}]"
    return None


def format_pseudocode(instructions: list[Instruction], start_addr: int) -> str:
    """Format instructions as annotated pseudocode/assembly."""
    lines = [
        f"; Function at 0x{start_addr:08X}",
        f"; {len(instructions)} instructions traced",
        "",
    ]

    for inst in instructions:
        # Build annotation
        parts = []
        if inst.pool_value is not None:
            name = inst.pool_name or ""
            parts.append(f"= 0x{inst.pool_value:08X} {name}")
        if inst.call_name:
            parts.append(f"-> {inst.call_name}")
        if inst.comment:
            parts.append(inst.comment)

        annotation = "  ; " + " | ".join(parts) if parts else ""

        lines.append(
            f"  0x{inst.address:08X}: {inst.mnemonic:<10s} {inst.op_str:<30s}{annotation}"
        )

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description="MRA2 Function Tracer")
    parser.add_argument("rom", help="Path to ROM file")
    parser.add_argument("address", help="Function start address (hex)")
    parser.add_argument("--schema", "-s", help="Path to game_state_schema.json")
    parser.add_argument("--max", "-m", type=int, default=500, help="Max instructions")
    parser.add_argument("--output", "-o", help="Output file path")
    args = parser.parse_args()

    target = int(args.address, 0)
    rom_data = Path(args.rom).read_bytes()

    schema = None
    if args.schema and Path(args.schema).exists():
        schema = json.loads(Path(args.schema).read_text())

    print(f"Tracing function at 0x{target:08X}...")
    instructions = disassemble_function(rom_data, target, args.max, schema)
    print(f"Traced {len(instructions)} instructions")

    output = format_pseudocode(instructions, target)
    print(output)

    if args.output:
        Path(args.output).parent.mkdir(parents=True, exist_ok=True)
        Path(args.output).write_text(output)
        print(f"\nSaved to: {args.output}")


if __name__ == "__main__":
    main()
