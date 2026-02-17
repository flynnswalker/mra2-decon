#!/usr/bin/env python3
"""
MRA2 Data Extractor -- Find and extract data tables from the ROM.

Searches for structured data in the Monster Rancher Advance 2 ROM including:
  - Monster name strings (using GBA text encoding)
  - Stat tables (repeating fixed-size structs)
  - Item data tables
  - Technique data tables

Usage:
    python tools/data_extractor.py rom/mra2.gba [--output analysis/data_tables/]
"""

import argparse
import json
import struct
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import ROM_START, rom_offset_to_address


# =============================================================================
# GBA Text Encoding
# =============================================================================
# GBA games typically use a custom text encoding table, not standard ASCII.
# MRA2 likely uses a table where printable characters map to bytes in a
# game-specific way. We start with ASCII as a baseline and refine as we
# discover the actual encoding.

# Standard ASCII printable range for initial scanning
def is_gba_text_byte(b: int) -> bool:
    """Check if a byte could be part of a GBA text string."""
    return (0x20 <= b <= 0x7E) or b in (0x00, 0x0A)  # printable + null terminator + newline


def extract_null_terminated_strings(
    data: bytes, min_length: int = 3, max_length: int = 32
) -> list[tuple[int, str]]:
    """Extract null-terminated ASCII strings from binary data."""
    results = []
    i = 0
    while i < len(data):
        if 0x20 <= data[i] <= 0x7E:
            start = i
            chars = []
            while i < len(data) and 0x20 <= data[i] <= 0x7E and len(chars) < max_length:
                chars.append(chr(data[i]))
                i += 1
            if i < len(data) and data[i] == 0x00 and len(chars) >= min_length:
                results.append((start, "".join(chars)))
        i += 1
    return results


# =============================================================================
# Repeating Struct Detection
# =============================================================================

@dataclass
class StructPattern:
    """A detected repeating struct pattern in ROM."""
    offset: int
    entry_size: int
    entry_count: int
    address: int
    sample_entries: list

    @property
    def address_hex(self):
        return f"0x{self.address:08X}"

    @property
    def total_size(self):
        return self.entry_size * self.entry_count


def detect_repeating_structs(
    data: bytes,
    entry_size: int,
    min_entries: int = 10,
    value_range: tuple = (0, 1000),
) -> list[StructPattern]:
    """
    Scan for arrays of fixed-size structs where uint16 fields fall within
    a plausible value range (e.g., 0-999 for stats).

    This is a heuristic: we look for sequences where reading uint16 values
    at regular intervals produces values in the expected range.
    """
    patterns = []
    rom_len = len(data)

    for offset in range(0, rom_len - entry_size * min_entries, 4):
        consecutive = 0
        entries = []

        for n in range(min_entries + 50):  # check up to 60 entries
            base = offset + n * entry_size
            if base + entry_size > rom_len:
                break

            entry_bytes = data[base:base + entry_size]
            # Read all uint16 values in this entry
            num_fields = entry_size // 2
            fields = []
            valid = True
            for f in range(num_fields):
                val = struct.unpack_from("<H", entry_bytes, f * 2)[0]
                fields.append(val)
                if not (value_range[0] <= val <= value_range[1]):
                    valid = False
                    break

            if valid:
                consecutive += 1
                if len(entries) < 5:
                    entries.append(fields)
            else:
                break

        if consecutive >= min_entries:
            patterns.append(StructPattern(
                offset=offset,
                entry_size=entry_size,
                entry_count=consecutive,
                address=rom_offset_to_address(offset),
                sample_entries=entries,
            ))

    return patterns


# =============================================================================
# Known Pattern Searches
# =============================================================================

def search_monster_names(rom_data: bytes) -> list[tuple[int, str]]:
    """
    Search for monster breed names in the ROM.
    We know breed names from community data: Golem, Tiger, Hare, Suezo, etc.
    Finding these strings helps locate the breed name table.
    """
    known_names = [
        "Golem", "Tiger", "Hare", "Suezo", "Mocchi", "Naga", "Plant",
        "Pixie", "Dragon", "Durahan", "Arrow Head", "Zuum", "Ducken",
        "Lesione", "Baku", "Gitan", "Zan", "Mogi", "Raiden", "Ogyo",
        "Hengar", "Gaboo", "Jell", "Undine", "Niton", "Mock", "Bajarl",
        "Jill", "Worm",
    ]

    found = []
    for name in known_names:
        name_bytes = name.encode("ascii")
        idx = 0
        while True:
            idx = rom_data.find(name_bytes, idx)
            if idx == -1:
                break
            found.append((idx, name))
            idx += 1

    found.sort(key=lambda x: x[0])
    return found


def search_stat_table_candidates(
    rom_data: bytes,
    entry_sizes: list[int] = None,
) -> list[StructPattern]:
    """
    Search for tables that could contain per-breed stat data.
    Stat values typically range 0-999 (0x0000-0x03E7).
    We try common entry sizes for breed stat tables.
    """
    if entry_sizes is None:
        entry_sizes = [12, 14, 16, 18, 20, 24, 28, 32]

    all_patterns = []
    for size in entry_sizes:
        patterns = detect_repeating_structs(
            rom_data,
            entry_size=size,
            min_entries=20,  # expect at least 20 breeds
            value_range=(0, 999),
        )
        all_patterns.extend(patterns)

    # Sort by entry count (most entries first -- more likely to be real data)
    all_patterns.sort(key=lambda p: p.entry_count, reverse=True)
    return all_patterns


def find_pointer_to_address(rom_data: bytes, target_addr: int) -> list[int]:
    """Find all locations in ROM that contain a pointer to the given address."""
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


# =============================================================================
# Main
# =============================================================================

def extract_data(rom_path: str, output_dir: Optional[str] = None):
    """Run data extraction on the ROM."""
    rom_path = Path(rom_path)
    if not rom_path.exists():
        print(f"ERROR: ROM not found: {rom_path}")
        sys.exit(1)

    rom_data = rom_path.read_bytes()
    print(f"Loaded ROM: {rom_path} ({len(rom_data):,} bytes)\n")

    results = {}

    # --- Monster Name Search ---
    print("=== Monster Name Search ===\n")
    names = search_monster_names(rom_data)
    print(f"  Found {len(names)} name occurrences")

    if names:
        # Group by region to find the name table
        regions = {}
        for offset, name in names:
            region_key = (offset // 0x1000) * 0x1000
            if region_key not in regions:
                regions[region_key] = []
            regions[region_key].append((offset, name))

        print(f"  Names found in {len(regions)} ROM regions:")
        for region, entries in sorted(regions.items()):
            addr = rom_offset_to_address(region)
            print(f"    0x{addr:08X} region: {len(entries)} names "
                  f"({', '.join(e[1] for e in entries[:5])}{'...' if len(entries) > 5 else ''})")

        # The region with the most names is likely the breed name table
        best_region = max(regions.items(), key=lambda x: len(x[1]))
        print(f"\n  Most likely name table region: 0x{rom_offset_to_address(best_region[0]):08X}")
        print(f"  Names in that region: {len(best_region[1])}")
        for offset, name in best_region[1]:
            print(f"    0x{rom_offset_to_address(offset):08X}: \"{name}\"")

        results["monster_names"] = {
            "total_found": len(names),
            "best_region": f"0x{rom_offset_to_address(best_region[0]):08X}",
            "names_in_best_region": len(best_region[1]),
            "entries": [
                {"address": f"0x{rom_offset_to_address(o):08X}", "name": n}
                for o, n in best_region[1]
            ],
        }
    print()

    # --- Stat Table Candidates ---
    print("=== Stat Table Candidate Search ===\n")
    stat_tables = search_stat_table_candidates(rom_data)
    print(f"  Found {len(stat_tables)} candidate stat tables")

    if stat_tables:
        # Show top candidates
        top = stat_tables[:10]
        for i, pt in enumerate(top):
            print(f"\n  Candidate {i+1}: {pt.address_hex}")
            print(f"    Entry size: {pt.entry_size} bytes, Count: {pt.entry_count}")
            print(f"    Total size: {pt.total_size} bytes")
            if pt.sample_entries:
                print(f"    Sample entries (uint16 fields):")
                for j, entry in enumerate(pt.sample_entries[:3]):
                    print(f"      [{j}] {entry}")

        results["stat_table_candidates"] = [
            {
                "address": pt.address_hex,
                "entry_size": pt.entry_size,
                "entry_count": pt.entry_count,
                "total_size": pt.total_size,
                "sample_entries": pt.sample_entries[:3],
            }
            for pt in top
        ]
    print()

    # --- Null-Terminated String Tables ---
    print("=== String Table Search ===\n")
    all_strings = extract_null_terminated_strings(rom_data, min_length=4)
    print(f"  Found {len(all_strings)} null-terminated strings (min 4 chars)")

    # Filter for game-relevant strings
    game_keywords = [
        "monster", "ranch", "train", "battle", "attack", "defense",
        "power", "life", "speed", "item", "gold", "week", "breed",
        "combine", "expedition", "tournament", "errant", "drill",
        "technique", "guts",
    ]
    relevant = [(o, s) for o, s in all_strings if any(
        kw in s.lower() for kw in game_keywords
    )]
    if relevant:
        print(f"  Game-relevant strings: {len(relevant)}")
        for offset, text in relevant[:20]:
            print(f"    0x{rom_offset_to_address(offset):08X}: \"{text}\"")

    results["string_tables"] = {
        "total_strings": len(all_strings),
        "game_relevant": len(relevant),
        "sample_relevant": [
            {"address": f"0x{rom_offset_to_address(o):08X}", "text": s}
            for o, s in relevant[:50]
        ],
    }
    print()

    # --- Output ---
    if output_dir:
        out = Path(output_dir)
        out.mkdir(parents=True, exist_ok=True)

        out_file = out / "extraction_results.json"
        out_file.write_text(json.dumps(results, indent=2))
        print(f"Wrote results to: {out_file}")

    print("\nData extraction complete.")


def main():
    parser = argparse.ArgumentParser(
        description="MRA2 Data Extractor -- find and extract data tables from ROM"
    )
    parser.add_argument("rom", help="Path to the MRA2 GBA ROM file")
    parser.add_argument(
        "--output", "-o",
        default="analysis/data_tables",
        help="Output directory (default: analysis/data_tables/)",
    )
    args = parser.parse_args()
    extract_data(args.rom, args.output)


if __name__ == "__main__":
    main()
