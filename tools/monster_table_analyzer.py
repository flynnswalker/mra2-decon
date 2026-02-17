#!/usr/bin/env python3
"""
MRA2 Monster Table Analyzer -- parse and analyze all monster type records.

Reads the monster type definition table from the ROM, decodes each record,
performs statistical analysis on fields, and outputs JSON/CSV.

The table starts at ROM 0x081CACC8. The first 4 bytes are an offset to
the first real record. Each record is 72 bytes. The table indexing function
at 0x08020C5C computes: base + header_offset + index * 72.

Usage:
    python tools/monster_table_analyzer.py rom/mra2.gba [--output analysis/data_tables/]
"""

import argparse
import csv
import json
import struct
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import ROM_START, rom_offset_to_address


# =============================================================================
# Table Constants (confirmed via xref analysis)
# =============================================================================

TABLE_ROM_ADDR = 0x081CACC8
TABLE_FILE_OFFSET = TABLE_ROM_ADDR - ROM_START  # 0x1CACC8
RECORD_SIZE = 72  # Confirmed: index * 9 * 8 = index * 72
TABLE_INDEX_FUNC = 0x08020C5C  # Function that indexes into this table


# =============================================================================
# Record Structure
# =============================================================================

@dataclass
class MonsterRecord:
    """A decoded monster type record (72 bytes).

    Corrected field mapping based on record alignment starting at
    table_base + 4 (header offset).

    The record structure based on byte analysis:
    +0x00: separator (always 0x00)
    +0x01: sub-breed index (0-39, resets per main breed group)
    +0x02-0x07: 6 bytes base stat modifiers
    +0x08-0x0B: 4 bytes training properties
    +0x0C-0x0F: 4 bytes additional modifiers
    +0x10-0x11: lifespan value
    +0x12-0x13: type flags
    +0x14-0x1B: 8 bytes signed trait modifiers
    +0x1C-0x1F: record type / breed flags (was mistaken as start)
    +0x20: type_id byte
    +0x21-0x23: FF FF FF padding
    +0x24-0x27: stat count / category
    +0x28-0x47: 32 bytes growth grade data (ASCII-like chars)
    """
    index: int
    rom_address: int

    # Fields in corrected order
    separator: int          # +0x00: always 0x00
    sub_breed_idx: int      # +0x01: sub-breed index within main breed
    base_stats: bytes       # +0x02: 6 bytes
    training_props: bytes   # +0x08: 4 bytes
    extra_mods: bytes       # +0x0C: 4 bytes
    lifespan_raw: int       # +0x10: 2 bytes
    type_flags: int         # +0x12: 2 bytes
    traits: bytes           # +0x14: 8 bytes (signed)
    breed_flags: int        # +0x1C: 4 bytes
    type_id: int            # +0x20: 1 byte
    padding_21: bytes       # +0x21: 3 bytes (FF FF FF)
    stat_count: int         # +0x24: 4 bytes
    growth_data: bytes      # +0x28: 32 bytes growth grades

    @property
    def rom_address_hex(self):
        return f"0x{self.rom_address:08X}"

    @property
    def traits_signed(self):
        return [v if v < 128 else v - 256 for v in self.traits]

    @property
    def growth_grades_str(self):
        return ''.join(
            chr(b) if 0x20 <= b <= 0x7E else f'[{b:02X}]'
            for b in self.growth_data
        )

    @property
    def base_stats_list(self):
        return list(self.base_stats)

    def to_dict(self):
        return {
            "index": self.index,
            "rom_address": self.rom_address_hex,
            "sub_breed_idx": self.sub_breed_idx,
            "base_stats": self.base_stats_list,
            "base_stats_hex": ' '.join(f'{b:02X}' for b in self.base_stats),
            "training_props": ' '.join(f'{b:02X}' for b in self.training_props),
            "extra_mods": ' '.join(f'{b:02X}' for b in self.extra_mods),
            "lifespan_raw": self.lifespan_raw,
            "type_flags": f"0x{self.type_flags:04X}",
            "traits": self.traits_signed,
            "breed_flags": f"0x{self.breed_flags:08X}",
            "type_id": f"0x{self.type_id:02X}",
            "stat_count": self.stat_count,
            "growth_grades": self.growth_grades_str,
        }


def parse_record(rom_data: bytes, offset: int, index: int) -> MonsterRecord:
    """Parse a single 72-byte monster record with corrected alignment."""
    rec = rom_data[offset:offset + RECORD_SIZE]

    return MonsterRecord(
        index=index,
        rom_address=ROM_START + offset,
        separator=rec[0x00],
        sub_breed_idx=rec[0x01],
        base_stats=rec[0x02:0x08],
        training_props=rec[0x08:0x0C],
        extra_mods=rec[0x0C:0x10],
        lifespan_raw=struct.unpack_from("<H", rec, 0x10)[0],
        type_flags=struct.unpack_from("<H", rec, 0x12)[0],
        traits=rec[0x14:0x1C],
        breed_flags=struct.unpack_from("<I", rec, 0x1C)[0],
        type_id=rec[0x20],
        padding_21=rec[0x21:0x24],
        stat_count=struct.unpack_from("<I", rec, 0x24)[0],
        growth_data=rec[0x28:0x48],
    )


# =============================================================================
# Table Parsing
# =============================================================================

def parse_table(rom_data: bytes) -> list[MonsterRecord]:
    """Parse the entire monster type table."""
    # Read header: first 4 bytes at TABLE_FILE_OFFSET are the offset to first record
    header_val = struct.unpack_from("<I", rom_data, TABLE_FILE_OFFSET)[0]
    first_record_offset = TABLE_FILE_OFFSET + header_val

    print(f"Table base:     0x{TABLE_ROM_ADDR:08X} (file offset 0x{TABLE_FILE_OFFSET:06X})")
    print(f"Header value:   {header_val} (0x{header_val:02X})")
    print(f"First record:   0x{ROM_START + first_record_offset:08X}")
    print(f"Record size:    {RECORD_SIZE} bytes")

    # Parse records -- count by looking for sub_breed_idx resets
    # and growth grade patterns
    records = []
    offset = first_record_offset
    max_records = 1000

    for i in range(max_records):
        if offset + RECORD_SIZE > len(rom_data):
            break

        rec = parse_record(rom_data, offset, i)
        # Validate: growth data should contain grade-like chars
        grade_chars = sum(
            1 for b in rec.growth_data
            if (0x30 <= b <= 0x39) or (0x41 <= b <= 0x66) or b == 0x20
        )
        if grade_chars < 8 and i > 5:
            print(f"  Pattern breaks at record {i} (0x{rec.rom_address:08X})")
            break

        records.append(rec)
        offset += RECORD_SIZE

    print(f"Total records:  {len(records)}")
    return records


# =============================================================================
# Analysis
# =============================================================================

def analyze_records(records: list[MonsterRecord]):
    """Perform statistical analysis on the parsed records."""
    print(f"\n=== Field Analysis ({len(records)} records) ===\n")

    # sub_breed_idx distribution
    sb_counts = Counter(r.sub_breed_idx for r in records)
    print(f"sub_breed_idx: min={min(sb_counts)}, max={max(sb_counts)}, "
          f"unique={len(sb_counts)}")

    # Identify breed groups by looking for sub_breed_idx resets
    breed_groups = []
    current_group = [records[0]]
    for i in range(1, len(records)):
        if records[i].sub_breed_idx <= records[i-1].sub_breed_idx and records[i].sub_breed_idx < 5:
            breed_groups.append(current_group)
            current_group = [records[i]]
        else:
            current_group.append(records[i])
    breed_groups.append(current_group)
    print(f"\nBreed groups detected: {len(breed_groups)}")
    print(f"Variants per breed: {[len(g) for g in breed_groups]}")

    # breed_flags distribution
    bf_counts = Counter(r.breed_flags for r in records)
    print(f"\nbreed_flags (top 10):")
    for val, count in bf_counts.most_common(10):
        print(f"  0x{val:08X}: {count} records")

    # stat_count distribution
    sc_counts = Counter(r.stat_count for r in records)
    print(f"\nstat_count distribution:")
    for val, count in sorted(sc_counts.items()):
        print(f"  {val}: {count} records")

    # lifespan_raw
    lifespans = [r.lifespan_raw for r in records]
    print(f"\nlifespan_raw: min={min(lifespans)}, max={max(lifespans)}")
    ls_counts = Counter(lifespans)
    print(f"  Most common: {ls_counts.most_common(5)}")

    # type_flags
    flags = Counter(r.type_flags for r in records)
    print(f"\ntype_flags distribution (top 10):")
    for val, count in sorted(flags.items(), key=lambda x: -x[1])[:10]:
        print(f"  0x{val:04X}: {count} records")

    # traits analysis
    print(f"\ntraits (signed bytes, 8 per record):")
    for pos in range(8):
        vals = [r.traits_signed[pos] for r in records]
        print(f"  trait[{pos}]: min={min(vals):+d}, max={max(vals):+d}, "
              f"mean={sum(vals)/len(vals):+.1f}")

    # Growth data character frequency
    all_growth = b''.join(r.growth_data for r in records)
    growth_freq = Counter(all_growth)
    print(f"\ngrowth_data byte frequency (top 20):")
    for val, count in growth_freq.most_common(20):
        ch = chr(val) if 0x20 <= val <= 0x7E else '.'
        print(f"  0x{val:02X} ('{ch}'): {count}")

    # Base stats analysis
    print(f"\nbase_stats (6 bytes per record):")
    for pos in range(6):
        vals = [r.base_stats[pos] for r in records]
        print(f"  stat[{pos}]: min=0x{min(vals):02X}, max=0x{max(vals):02X}, "
              f"mean={sum(vals)/len(vals):.1f}")

    return breed_groups


# =============================================================================
# Output
# =============================================================================

def save_json(records: list[MonsterRecord], output_dir: str):
    """Save all records as JSON."""
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)

    data = {
        "table_address": f"0x{TABLE_ROM_ADDR:08X}",
        "record_size": RECORD_SIZE,
        "total_records": len(records),
        "index_function": f"0x{TABLE_INDEX_FUNC:08X}",
        "records": [r.to_dict() for r in records],
    }
    filepath = out / "monster_table_full.json"
    filepath.write_text(json.dumps(data, indent=2))
    print(f"\nWrote JSON: {filepath}")


def save_csv(records: list[MonsterRecord], output_dir: str):
    """Save all records as CSV."""
    out = Path(output_dir)
    out.mkdir(parents=True, exist_ok=True)

    filepath = out / "monster_table_full.csv"
    with open(filepath, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([
            "index", "rom_address", "sub_breed_idx",
            "base0", "base1", "base2", "base3", "base4", "base5",
            "train0", "train1", "train2", "train3",
            "mod0", "mod1", "mod2", "mod3",
            "lifespan_raw", "type_flags", "breed_flags",
            "type_id", "stat_count",
            "trait0", "trait1", "trait2", "trait3",
            "trait4", "trait5", "trait6", "trait7",
            "growth_grades",
        ])
        for r in records:
            writer.writerow([
                r.index, r.rom_address_hex, r.sub_breed_idx,
                *r.base_stats,
                *r.training_props,
                *r.extra_mods,
                r.lifespan_raw, f"0x{r.type_flags:04X}",
                f"0x{r.breed_flags:08X}", f"0x{r.type_id:02X}",
                r.stat_count,
                *r.traits_signed,
                r.growth_grades_str,
            ])
    print(f"Wrote CSV: {filepath}")


# =============================================================================
# Main
# =============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="MRA2 Monster Table Analyzer"
    )
    parser.add_argument("rom", help="Path to the MRA2 GBA ROM file")
    parser.add_argument(
        "--output", "-o",
        default="analysis/data_tables",
        help="Output directory (default: analysis/data_tables/)",
    )
    args = parser.parse_args()

    rom_path = Path(args.rom)
    if not rom_path.exists():
        print(f"ERROR: ROM not found: {rom_path}")
        sys.exit(1)

    rom_data = rom_path.read_bytes()
    print(f"Loaded ROM: {rom_path} ({len(rom_data):,} bytes)\n")

    records = parse_table(rom_data)
    breed_groups = analyze_records(records)

    print(f"\n=== Breed Group Summary ===")
    print(f"Total breed groups: {len(breed_groups)}")
    for i, group in enumerate(breed_groups):
        sub_ids = [r.sub_breed_idx for r in group]
        print(f"  Breed {i:2d}: {len(group):2d} variants "
              f"(sub_ids: {min(sub_ids)}-{max(sub_ids)})")

    save_json(records, args.output)
    save_csv(records, args.output)

    print("\nDone.")


if __name__ == "__main__":
    main()
