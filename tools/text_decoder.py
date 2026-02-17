#!/usr/bin/env python3
"""
MRA2 Text Decoder -- find and decode the custom text encoding.

GBA games typically use a custom character encoding for displayed text.
This tool:
  1. Searches for the text rendering system via xrefs
  2. Attempts to extract the character mapping table from ROM
  3. Decodes encoded text strings using the discovered mapping
  4. Dumps decoded text tables (monster names, items, menus)

Usage:
    python tools/text_decoder.py rom/mra2.gba [--output analysis/data_tables/]
"""

import argparse
import json
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import ROM_START, rom_offset_to_address, address_to_rom_offset

try:
    from capstone import Cs, CS_ARCH_ARM, CS_MODE_THUMB, CS_MODE_LITTLE_ENDIAN
except ImportError:
    print("ERROR: capstone not installed. Run: pip install capstone")
    sys.exit(1)


# =============================================================================
# Character Map Discovery
# =============================================================================

def find_font_tile_data(rom_data: bytes) -> list[tuple[int, int]]:
    """
    Find 1bpp or 2bpp font tile data in ROM.

    GBA fonts are typically stored as 8x8 pixel tiles. For a 1bpp font,
    each tile is 8 bytes. A full ASCII-ish font (~96 printable chars)
    would be 96*8 = 768 bytes of tile data with specific patterns:
    - Space (first tile) is all zeros: 00 00 00 00 00 00 00 00
    - Letters have non-zero patterns
    - Tiles should have reasonable bit density (not all 0xFF)
    """
    candidates = []
    tile_size_1bpp = 8   # 8 bytes per 8x8 1bpp tile
    tile_size_2bpp = 16  # 16 bytes per 8x8 2bpp tile
    tile_size_4bpp = 32  # 32 bytes per 8x8 4bpp tile (most common on GBA)

    for tile_size in [tile_size_4bpp, tile_size_2bpp, tile_size_1bpp]:
        min_chars = 64
        block_size = tile_size * min_chars

        for i in range(0, len(rom_data) - block_size, 4):
            # Check if first tile (space) is all zeros
            first_tile = rom_data[i:i + tile_size]
            if any(b != 0 for b in first_tile):
                continue

            # Check if next few tiles (! " # $ etc.) are non-zero
            non_zero_tiles = 0
            for t in range(1, min(10, min_chars)):
                tile = rom_data[i + t * tile_size:i + (t + 1) * tile_size]
                if any(b != 0 for b in tile):
                    non_zero_tiles += 1

            if non_zero_tiles >= 6:
                # Check that tiles aren't all 0xFF either
                total_bytes = rom_data[i:i + block_size]
                ff_pct = total_bytes.count(0xFF) / len(total_bytes)
                zero_pct = total_bytes.count(0x00) / len(total_bytes)
                if ff_pct < 0.5 and zero_pct < 0.8:
                    candidates.append((i, tile_size))

    return candidates


def find_char_table_via_pointer_pattern(rom_data: bytes) -> list[tuple[int, int]]:
    """
    Search for character mapping tables in ROM.

    A char table maps encoded byte values to character tile indices or
    to direct glyph data. Common patterns:
    - Pointer to a sequential table where entry N maps to display char N
    - A table of 256 entries (1 byte each) mapping input -> tile index
    """
    candidates = []

    # Pattern: look for a 256-byte table where values roughly increase
    # from 0 to ~95 (mapping byte values to tile indices)
    for i in range(0, len(rom_data) - 256, 4):
        table = rom_data[i:i + 256]

        # Check if it looks like a mapping table:
        # - Many values should be in the range 0-127 (tile indices)
        # - There should be a reasonable spread of values
        # - Entry for 0x00 should be 0 or a special value
        low_vals = sum(1 for b in table if b < 128)
        unique = len(set(table))

        if low_vals >= 200 and 40 <= unique <= 128:
            # Additional check: should have some sequential runs
            sequential_runs = 0
            for j in range(len(table) - 1):
                if table[j + 1] == table[j] + 1 and table[j] > 0:
                    sequential_runs += 1

            if sequential_runs >= 10:
                candidates.append((i, sequential_runs))

    candidates.sort(key=lambda x: -x[1])
    return candidates[:10]


# =============================================================================
# Text String Discovery via Pointer Tables
# =============================================================================

def find_text_pointer_tables(rom_data: bytes) -> list[dict]:
    """
    Find pointer tables where each pointer leads to a short byte sequence
    ending in a common terminator (0x00 or 0xFF).
    """
    results = []

    for term in [0x00, 0xFF]:
        for i in range(0, len(rom_data) - 128, 4):
            ptrs = []
            for j in range(200):
                off = i + j * 4
                if off + 4 > len(rom_data):
                    break
                val = struct.unpack_from('<I', rom_data, off)[0]
                rom_off = val - ROM_START
                if 0 <= rom_off < len(rom_data):
                    # Find terminator within 32 bytes
                    end_search = rom_data.find(bytes([term]), rom_off, rom_off + 32)
                    if end_search != -1 and end_search - rom_off >= 2:
                        str_len = end_search - rom_off
                        ptrs.append({
                            "ptr": val,
                            "rom_off": rom_off,
                            "length": str_len,
                            "data": rom_data[rom_off:rom_off + str_len],
                        })
                    else:
                        break
                else:
                    break

            if len(ptrs) >= 20:
                # Check if string lengths are reasonable and varied
                lengths = [p["length"] for p in ptrs]
                avg_len = sum(lengths) / len(lengths)
                if 3 <= avg_len <= 20:
                    results.append({
                        "table_addr": rom_offset_to_address(i),
                        "entry_count": len(ptrs),
                        "terminator": term,
                        "avg_length": avg_len,
                        "entries": ptrs,
                    })
                    # Skip past this table
                    break

    return results


# =============================================================================
# Brute Force Character Map via Known Text
# =============================================================================

def attempt_char_map_from_known_text(
    rom_data: bytes,
    known_strings: dict[str, int],
) -> dict[int, str]:
    """
    Given known plaintext strings and their ROM addresses, attempt to
    deduce the character mapping.

    known_strings maps: expected_text -> rom_address_of_encoded_bytes
    """
    char_map = {}
    for text, addr in known_strings.items():
        rom_off = addr - ROM_START
        if 0 <= rom_off < len(rom_data):
            encoded = rom_data[rom_off:rom_off + len(text)]
            for i, ch in enumerate(text):
                byte_val = encoded[i]
                if byte_val in char_map:
                    if char_map[byte_val] != ch:
                        print(f"  WARNING: Conflict at 0x{byte_val:02X}: "
                              f"'{char_map[byte_val]}' vs '{ch}'")
                else:
                    char_map[byte_val] = ch
    return char_map


# =============================================================================
# Main Analysis
# =============================================================================

def analyze_text(rom_path: str, output_dir: str = None):
    """Run text encoding analysis."""
    rom_data = Path(rom_path).read_bytes()
    print(f"Loaded ROM: {rom_path} ({len(rom_data):,} bytes)\n")

    # === Step 1: Find font tile data ===
    print("=== Searching for Font Tile Data ===\n")
    font_candidates = find_font_tile_data(rom_data)
    print(f"Found {len(font_candidates)} font candidates")
    for off, tile_size in font_candidates[:5]:
        bpp = {8: "1bpp", 16: "2bpp", 32: "4bpp"}[tile_size]
        addr = rom_offset_to_address(off)
        # Count non-zero tiles
        num_tiles = 0
        for t in range(128):
            tile = rom_data[off + t * tile_size:off + (t + 1) * tile_size]
            if any(b != 0 for b in tile):
                num_tiles += 1
        print(f"  0x{addr:08X}: {bpp}, {num_tiles} non-zero tiles")

    # === Step 2: Try character map table search ===
    print("\n=== Searching for Character Mapping Tables ===\n")
    char_tables = find_char_table_via_pointer_pattern(rom_data)
    print(f"Found {len(char_tables)} candidates")
    for off, score in char_tables[:5]:
        addr = rom_offset_to_address(off)
        sample = rom_data[off:off + 32]
        hex_str = ' '.join(f'{b:02X}' for b in sample)
        print(f"  0x{addr:08X} (score={score}): {hex_str}")

    # === Step 3: Use save data string as known ASCII reference ===
    print("\n=== Testing Character Encoding via Known Strings ===\n")
    # "Monster Farm Advance2 Save Data" is at 0x081CACA8 in plain ASCII
    save_off = 0x1CACA8
    save_text = "Monster Farm Advance2 Save Data"
    save_bytes = rom_data[save_off:save_off + len(save_text)]
    if save_bytes == save_text.encode('ascii'):
        print("  Save string is plain ASCII (confirmed)")
        print("  This means ASCII is used for SOME strings but not player-visible text")
    else:
        print(f"  Save string encoding differs from ASCII!")
        print(f"  Expected: {save_text.encode('ascii').hex()}")
        print(f"  Got:      {save_bytes.hex()}")

    # === Step 4: Search the data region for encoded text tables ===
    print("\n=== Searching for Encoded Text Tables in Data Region ===\n")

    # The growth_data in monster records uses bytes like:
    # '1'-'6' (0x31-0x36), '#'-'%' (0x23-0x25), 'A'-'E' (0x41-0x45)
    # 'S','T' (0x53, 0x54), etc.
    # These may actually be the same encoding as text -- the growth grades
    # might literally be the characters displayed in-game!

    # Let's look for string-like tables with the same character set
    # in the ROM data region (0x081C0000+)
    data_region_start = 0x1B0000
    data_region_end = 0x1E0000

    # Search for clusters of null-terminated encoded strings
    print("  Looking for null-terminated string clusters...")
    string_clusters = []
    i = data_region_start
    while i < data_region_end - 4:
        # Check if this starts a string (non-zero bytes followed by 0x00)
        if rom_data[i] != 0x00 and rom_data[i] < 0x80:
            # Find the null terminator
            end = rom_data.find(b'\x00', i, i + 20)
            if end != -1 and end - i >= 3:
                string_data = rom_data[i:end]
                # Check if all bytes are in the "text" range
                if all(0x20 <= b <= 0x7E for b in string_data):
                    string_clusters.append((i, string_data))
                i = end + 1
                continue
        i += 1

    if string_clusters:
        print(f"  Found {len(string_clusters)} potential encoded strings")
        # Group nearby strings
        groups = []
        current_group = [string_clusters[0]]
        for j in range(1, len(string_clusters)):
            if string_clusters[j][0] - string_clusters[j-1][0] < 40:
                current_group.append(string_clusters[j])
            else:
                if len(current_group) >= 5:
                    groups.append(current_group)
                current_group = [string_clusters[j]]
        if len(current_group) >= 5:
            groups.append(current_group)

        print(f"  String clusters with 5+ entries: {len(groups)}")
        for gi, group in enumerate(groups[:5]):
            addr = rom_offset_to_address(group[0][0])
            print(f"\n  Cluster at 0x{addr:08X} ({len(group)} strings):")
            for off, data in group[:10]:
                text = data.decode('ascii', errors='replace')
                print(f"    0x{rom_offset_to_address(off):08X}: \"{text}\"")

    # === Save Results ===
    if output_dir:
        out = Path(output_dir)
        out.mkdir(parents=True, exist_ok=True)
        results = {
            "font_candidates": [
                {"address": f"0x{rom_offset_to_address(o):08X}",
                 "tile_size": ts}
                for o, ts in font_candidates[:10]
            ],
            "char_table_candidates": [
                {"address": f"0x{rom_offset_to_address(o):08X}",
                 "score": s}
                for o, s in char_tables[:10]
            ],
            "string_clusters": [
                {
                    "address": f"0x{rom_offset_to_address(g[0][0]):08X}",
                    "count": len(g),
                    "strings": [
                        {"addr": f"0x{rom_offset_to_address(o):08X}",
                         "ascii": d.decode('ascii', errors='replace')}
                        for o, d in g[:50]
                    ],
                }
                for g in groups[:20]
            ] if string_clusters else [],
        }
        filepath = out / "text_analysis.json"
        filepath.write_text(json.dumps(results, indent=2))
        print(f"\nSaved analysis to: {filepath}")


def main():
    parser = argparse.ArgumentParser(description="MRA2 Text Decoder")
    parser.add_argument("rom", help="Path to ROM file")
    parser.add_argument("--output", "-o", default="analysis/data_tables")
    args = parser.parse_args()
    analyze_text(args.rom, args.output)


if __name__ == "__main__":
    main()
