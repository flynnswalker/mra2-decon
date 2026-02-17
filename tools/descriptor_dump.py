#!/usr/bin/env python3
"""
MRA2 Game State Descriptor Dump -- extract the field accessor descriptor table.

The core_state_accessor function at 0x08002240 uses a descriptor table at
0x083EE428 to define every game state field. Each descriptor is 16 bytes.
This tool parses the table and outputs the complete game state schema.

Usage:
    python tools/descriptor_dump.py rom/mra2.gba [-o analysis/]
"""

import argparse
import json
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import ROM_START

# =============================================================================
# Constants from disassembly
# =============================================================================

DESCRIPTOR_TABLE_ADDR = 0x083EE428
DESCRIPTOR_SIZE = 16
CORE_ACCESSOR_ADDR = 0x08002240

# Type handler addresses from the switch table at 0x0800229C
# Derived from disassembly of core_state_accessor
TYPE_HANDLERS = {
    0:  0x080022CC,  # int8 - signed byte read/write with clamping
    1:  0x08002438,  # skip/nop
    2:  0x080022F6,  # int16 - signed halfword
    3:  0x08002320,  # int32 - signed word
    4:  0x08002340,  # uint8 - unsigned byte
    5:  0x08002366,  # uint16 - unsigned halfword (with special handling)
    6:  0x08002370,  # uint16_direct - direct halfword access
    7:  0x08002390,  # uint32 - unsigned word
    8:  0x080023B0,  # array/ptr - array element access
    9:  0x080023DC,  # array32 - 32-bit array element
    10: 0x080023FE,  # special_read - custom read with validation
    11: 0x0800241E,  # special_func - calls function pointer in offset field
}

TYPE_NAMES = {
    0: "int8",
    1: "skip",
    2: "int16",
    3: "int32",
    4: "uint8",
    5: "uint16_special",
    6: "uint16",
    7: "uint32",
    8: "array_u16",
    9: "array_u32",
    10: "special_read",
    11: "func_call",
}

# Known field assignments from cheat codes and xref analysis
KNOWN_FIELDS = {
    0: {"name": "stat_pow", "notes": "Power stat (offset 0x68 from monster base)"},
    1: {"name": "stat_int", "notes": "Intelligence stat"},
    2: {"name": "stat_ski", "notes": "Accuracy/Skill stat"},
    3: {"name": "stat_spd", "notes": "Evasion/Speed stat"},
    4: {"name": "stat_def", "notes": "Defense stat"},
    5: {"name": "stat_lif", "notes": "Life stat"},
}


def parse_descriptor(rom_data, table_offset, index):
    """Parse a single 16-byte descriptor entry."""
    off = table_offset + index * DESCRIPTOR_SIZE
    raw = rom_data[off:off + DESCRIPTOR_SIZE]

    field_type = struct.unpack_from("<H", raw, 4)[0]

    if field_type == 11:
        # Special: offset field contains a function pointer
        func_ptr = struct.unpack_from("<I", raw, 0)[0]
        return {
            "index": index,
            "type": field_type,
            "type_name": "func_call",
            "func_ptr": f"0x{func_ptr:08X}",
            "stride": 0,
            "max_value": None,
            "extra": None,
            "struct_offset": None,
        }

    base_offset = struct.unpack_from("<I", raw, 0)[0]
    stride = struct.unpack_from("<H", raw, 6)[0]
    max_value = struct.unpack_from("<I", raw, 8)[0]
    extra = struct.unpack_from("<I", raw, 12)[0]

    return {
        "index": index,
        "struct_offset": f"0x{base_offset:04X}",
        "struct_offset_int": base_offset,
        "type": field_type,
        "type_name": TYPE_NAMES.get(field_type, f"unknown_{field_type}"),
        "stride": stride,
        "max_value": max_value,
        "extra": f"0x{extra:08X}" if extra else None,
    }


def parse_all_descriptors(rom_data):
    """Parse the entire descriptor table."""
    table_offset = DESCRIPTOR_TABLE_ADDR - ROM_START
    descriptors = []

    for i in range(300):
        off = table_offset + i * DESCRIPTOR_SIZE
        if off + DESCRIPTOR_SIZE > len(rom_data):
            break

        desc = parse_descriptor(rom_data, table_offset, i)
        field_type = desc["type"]

        # Stop on clearly invalid entries
        if field_type > 11 and i > 5:
            break
        if field_type != 11 and desc.get("struct_offset_int", 0) > 0x2000 and i > 5:
            break

        # Add known field names
        if i in KNOWN_FIELDS:
            desc["name"] = KNOWN_FIELDS[i]["name"]
            desc["notes"] = KNOWN_FIELDS[i]["notes"]

        descriptors.append(desc)

    return descriptors


def infer_field_names(descriptors):
    """Attempt to name fields based on offset patterns and types."""
    for d in descriptors:
        if "name" in d:
            continue

        off = d.get("struct_offset_int")
        ftype = d["type"]
        max_val = d.get("max_value")

        if off is None:
            continue

        # Stats region: 0x68-0x73
        if 0x68 <= off <= 0x73 and max_val == 999:
            stat_idx = (off - 0x68) // 2
            stat_names = ["pow", "int", "ski", "spd", "def", "lif"]
            if stat_idx < len(stat_names):
                d["name"] = f"stat_{stat_names[stat_idx]}"

        # Byte fields with max 100 = percentage values
        elif ftype == 0 and max_val == 100:
            d["name"] = f"pct_0x{off:02X}"
            d["notes"] = "percentage field (0-100)"

        # Byte fields with max 10 = small counter/level
        elif ftype == 0 and max_val == 10:
            d["name"] = f"level_0x{off:02X}"
            d["notes"] = "small level/counter (0-10)"

        # Byte fields with max 15
        elif ftype == 0 and max_val == 15:
            d["name"] = f"flags_0x{off:02X}"
            d["notes"] = "4-bit flags or small counter (0-15)"

        # Fields with max 999 (stat-like)
        elif max_val == 999:
            d["name"] = f"stat999_0x{off:02X}"

        # Fields with max 9999 (money-like)
        elif max_val == 9999:
            d["name"] = f"amount_0x{off:02X}"


def format_markdown(descriptors):
    """Format descriptors as markdown."""
    lines = [
        "# MRA2 Game State Field Schema",
        "",
        f"Extracted from descriptor table at `0x{DESCRIPTOR_TABLE_ADDR:08X}`.",
        f"Total fields: {len(descriptors)}",
        "",
        "## Field Table",
        "",
        "| Idx | Offset | Type | Max | Stride | Name | Notes |",
        "|-----|--------|------|-----|--------|------|-------|",
    ]

    for d in descriptors:
        idx = d["index"]
        off = d.get("struct_offset", d.get("func_ptr", "N/A"))
        tname = d["type_name"]
        max_val = d.get("max_value", "")
        if max_val is not None and isinstance(max_val, int):
            if max_val > 0xFFFF:
                max_str = f"0x{max_val:X}"
            else:
                max_str = str(max_val)
        else:
            max_str = ""
        stride = d.get("stride", 0)
        name = d.get("name", "")
        notes = d.get("notes", "")

        lines.append(
            f"| {idx} | {off} | {tname} | {max_str} | {stride} | {name} | {notes} |"
        )

    # Add section for struct layout
    lines.extend([
        "",
        "## Monster Struct Layout (base: 0x02006D48)",
        "",
        "Offsets are relative to the struct base pointer.",
        "",
    ])

    # Group by offset
    by_offset = {}
    for d in descriptors:
        off_int = d.get("struct_offset_int")
        if off_int is not None:
            by_offset.setdefault(off_int, []).append(d)

    for off in sorted(by_offset.keys()):
        fields = by_offset[off]
        for f in fields:
            name = f.get("name", f"field_{f['index']}")
            tname = f["type_name"]
            max_val = f.get("max_value", "")
            lines.append(
                f"- `+0x{off:04X}` ({tname}, max={max_val}): "
                f"field[{f['index']}] {name}"
            )

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description="MRA2 Game State Descriptor Dump")
    parser.add_argument("rom", help="Path to ROM file")
    parser.add_argument("--output", "-o", default="analysis")
    args = parser.parse_args()

    rom_data = Path(args.rom).read_bytes()
    print(f"Loaded ROM: {args.rom} ({len(rom_data):,} bytes)")

    descriptors = parse_all_descriptors(rom_data)
    print(f"Parsed {len(descriptors)} field descriptors")

    infer_field_names(descriptors)

    # Count named fields
    named = sum(1 for d in descriptors if "name" in d)
    print(f"Named fields: {named}/{len(descriptors)}")

    out = Path(args.output)
    out.mkdir(parents=True, exist_ok=True)

    # Save JSON
    json_path = out / "game_state_schema.json"
    json_data = {
        "descriptor_table_addr": f"0x{DESCRIPTOR_TABLE_ADDR:08X}",
        "core_accessor_addr": f"0x{CORE_ACCESSOR_ADDR:08X}",
        "total_fields": len(descriptors),
        "fields": descriptors,
    }
    json_path.write_text(json.dumps(json_data, indent=2))
    print(f"Wrote: {json_path}")

    # Save markdown
    md_path = out / "game_state_schema.md"
    md_path.write_text(format_markdown(descriptors))
    print(f"Wrote: {md_path}")


if __name__ == "__main__":
    main()
