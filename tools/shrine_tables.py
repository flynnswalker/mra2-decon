#!/usr/bin/env python3
"""
MRA2 Shrine/Password ROM Table Extractor

Reads the ROM and extracts the lookup tables used by the shrine password system:
  1. Main breed table (256 bytes) - hash byte -> main breed ID (0-29)
  2. Sub breed table (256 bytes) - hash byte -> sub breed ID (0-40)
  3. Stat delta table (64 entries x 13 bytes) - stat/growth/lifespan modifiers
  4. Technique table (256 bytes) - hash byte -> technique ID
  5. Breed combo validation matrix (30 main x 40 sub, int16 entries)

All table addresses are resolved via the pointer table at 0x081E9AD0.
"""

import struct
import json
from pathlib import Path

ROM_START = 0x08000000
DATA_PTR_TABLE = 0x081E9AD0
BREED_COMBO_TABLE = 0x081E88C0
MONSTER_TYPE_TABLE = 0x081CACC8
MONSTER_RECORD_SIZE = 72
MONSTER_COUNT = 194

ROM_PATH = Path(__file__).resolve().parents[1] / "rom" / "Monster Rancher Advance 2 (USA).gba"


def rom_off(addr):
    return addr - ROM_START


def main():
    rom = ROM_PATH.read_bytes()
    print(f"ROM loaded: {len(rom)} bytes")

    ptr_off = rom_off(DATA_PTR_TABLE)
    ptrs = struct.unpack_from('<4I', rom, ptr_off)
    print(f"\nPointer table at 0x{DATA_PTR_TABLE:08X}:")
    labels = ["main_breed", "sub_breed", "stat_delta", "technique"]
    resolved = {}
    for i, (label, rel) in enumerate(zip(labels, ptrs)):
        abs_addr = DATA_PTR_TABLE + rel
        resolved[label] = abs_addr
        print(f"  [{i}] {label:12s}: relative=0x{rel:08X} -> absolute=0x{abs_addr:08X} (ROM+0x{rom_off(abs_addr):06X})")

    # --- Main breed table: 256 bytes ---
    main_breed_off = rom_off(resolved["main_breed"])
    main_breed_table = list(rom[main_breed_off:main_breed_off + 256])
    print(f"\nMain breed table (256 entries at 0x{resolved['main_breed']:08X}):")
    print(f"  Unique values: {sorted(set(main_breed_table))}")
    print(f"  Range: {min(main_breed_table)}-{max(main_breed_table)}")
    for v in sorted(set(main_breed_table)):
        count = main_breed_table.count(v)
        print(f"    breed {v:2d}: {count:3d} entries")

    # --- Sub breed table: 256 bytes ---
    sub_breed_off = rom_off(resolved["sub_breed"])
    sub_breed_table = list(rom[sub_breed_off:sub_breed_off + 256])
    print(f"\nSub breed table (256 entries at 0x{resolved['sub_breed']:08X}):")
    print(f"  Unique values: {sorted(set(sub_breed_table))}")
    print(f"  Range: {min(sub_breed_table)}-{max(sub_breed_table)}")

    # --- Stat delta table: 64 entries x 13 bytes ---
    stat_off = rom_off(resolved["stat_delta"])
    stat_table = []
    for i in range(64):
        entry_off = stat_off + i * 13
        raw = rom[entry_off:entry_off + 13]
        signed = [b if b < 128 else b - 256 for b in raw]
        stat_table.append(signed)
    print(f"\nStat delta table (64 x 13 bytes at 0x{resolved['stat_delta']:08X}):")
    print(f"  {'Idx':>3s} | {'POW':>4s} {'INT':>4s} {'SKI':>4s} {'SPD':>4s} {'DEF':>4s} {'LIF':>4s} | {'Net':>4s} | Growth/Trait bytes | Life")
    print(f"  {'-'*3}-+-{'-'*29}-+-{'-'*4}-+-{'-'*18}-+-{'-'*4}")
    best_net = -999
    best_idx = -1
    for i, entry in enumerate(stat_table):
        stats = entry[:6]
        net = sum(stats)
        growth = entry[6:12]
        life_mod = entry[12]
        if net > best_net:
            best_net = net
            best_idx = i
        print(f"  {i:3d} | {stats[0]:+4d} {stats[1]:+4d} {stats[2]:+4d} {stats[3]:+4d} {stats[4]:+4d} {stats[5]:+4d} | {net:+4d} | {growth} | {life_mod:+4d}")
    print(f"\n  Best entry: #{best_idx} with net {best_net:+d}")

    # --- Technique table: 256 bytes ---
    tech_off = rom_off(resolved["technique"])
    technique_table = list(rom[tech_off:tech_off + 256])
    print(f"\nTechnique table (256 entries at 0x{resolved['technique']:08X}):")
    print(f"  Unique values: {sorted(set(technique_table))}")
    print(f"  Range: {min(technique_table)}-{max(technique_table)}")

    # --- Breed combo validation: 30 main x 40 sub, int16 ---
    combo_off = rom_off(BREED_COMBO_TABLE)
    combo_matrix = []
    for main_id in range(30):
        row = []
        for sub_id in range(40):
            off = combo_off + (main_id * 80) + (sub_id * 2)
            val = struct.unpack_from('<h', rom, off)[0]
            row.append(val)
        combo_matrix.append(row)
    print(f"\nBreed combo matrix (30x40 int16 at 0x{BREED_COMBO_TABLE:08X}):")
    valid_count = sum(1 for row in combo_matrix for v in row if v != 0)
    total = 30 * 40
    print(f"  Valid combinations: {valid_count}/{total}")

    # --- Monster type base stats ---
    type_off = rom_off(MONSTER_TYPE_TABLE)
    header = struct.unpack_from('<I', rom, type_off)[0]
    base_off = type_off + header
    breed_base_stats = []
    for idx in range(MONSTER_COUNT):
        rec_off = base_off + idx * MONSTER_RECORD_SIZE
        stats = list(rom[rec_off + 2:rec_off + 8])  # 6 uint8 values: POW, INT, SKI, SPD, DEF, LIF
        breed_base_stats.append(stats)

    # --- Write Python data module ---
    out_path = Path(__file__).resolve().parent / "shrine_data.py"
    with open(out_path, 'w') as f:
        f.write('"""\nMRA2 Shrine/Password System - ROM Lookup Tables\n\n')
        f.write('Auto-generated by shrine_tables.py from ROM data.\n')
        f.write(f'Data pointer table: 0x{DATA_PTR_TABLE:08X}\n')
        f.write(f'Breed combo table:  0x{BREED_COMBO_TABLE:08X}\n')
        f.write('"""\n\n')

        f.write(f'# 256-byte table at 0x{resolved["main_breed"]:08X}\n')
        f.write(f'# Maps (hash_byte & 0xFF) -> main breed ID (0-29)\n')
        f.write(f'MAIN_BREED_TABLE = {main_breed_table}\n\n')

        f.write(f'# 256-byte table at 0x{resolved["sub_breed"]:08X}\n')
        f.write(f'# Maps (hash_byte & 0xFF) -> sub breed ID (0-40, where 40+ = pure breed)\n')
        f.write(f'SUB_BREED_TABLE = {sub_breed_table}\n\n')

        f.write(f'# 64 entries x 13 signed bytes at 0x{resolved["stat_delta"]:08X}\n')
        f.write('# Each entry: [POW, INT, SKI, SPD, DEF, LIF, growth0..growth5, lifespan_mod]\n')
        f.write('STAT_DELTA_TABLE = [\n')
        for i, entry in enumerate(stat_table):
            net = sum(entry[:6])
            f.write(f'    {entry},  # [{i}] net={net:+d}\n')
        f.write(']\n\n')

        f.write(f'# 256-byte table at 0x{resolved["technique"]:08X}\n')
        f.write('# Maps (hash_byte & 0xFF) -> technique ID (0xFF = none)\n')
        f.write(f'TECHNIQUE_TABLE = {technique_table}\n\n')

        f.write(f'# 30x40 int16 matrix at 0x{BREED_COMBO_TABLE:08X}\n')
        f.write('# BREED_COMBO_MATRIX[main][sub] != 0 means valid combination\n')
        f.write('# Row stride = 80 bytes (40 int16 entries per main breed)\n')
        f.write('BREED_COMBO_MATRIX = [\n')
        for i, row in enumerate(combo_matrix):
            f.write(f'    {row},  # main={i}\n')
        f.write(']\n\n')

        f.write(f'# Base stats for {MONSTER_COUNT} monster types from 0x{MONSTER_TYPE_TABLE:08X}\n')
        f.write('# Each entry: [POW, INT, SKI, SPD, DEF, LIF]\n')
        f.write('BREED_BASE_STATS = [\n')
        for i, stats in enumerate(breed_base_stats):
            f.write(f'    {stats},  # type {i}\n')
        f.write(']\n\n')

        f.write('# Character encoding: ASCII char -> GBA character code (uint16 halfword value)\n')
        f.write('CHAR_TO_CODE = {}\n')
        f.write('for i in range(26):\n')
        f.write('    CHAR_TO_CODE[chr(ord("A") + i)] = 0x01 + i\n')
        f.write('    CHAR_TO_CODE[chr(ord("a") + i)] = 0x1B + i\n')
        f.write('for i in range(10):\n')
        f.write('    CHAR_TO_CODE[str(i)] = 0x40 + i\n')
        f.write('CHAR_TO_CODE[" "] = 0x00\n')
        f.write('CHAR_TO_CODE["."] = 0x3F\n')
        f.write('CHAR_TO_CODE["-"] = 0x35\n')
        f.write("CHAR_TO_CODE[\"'\"] = 0x36\n")
        f.write('CHAR_TO_CODE["&"] = 0x37\n')
        f.write('CHAR_TO_CODE["!"] = 0x38\n')
        f.write('CHAR_TO_CODE["?"] = 0x39\n')
        f.write('CHAR_TO_CODE[","] = 0x3A\n')
        f.write('CHAR_TO_CODE["/"] = 0x3B\n')
        f.write('CHAR_TO_CODE[":"] = 0x3C\n')
        f.write('\n')
        f.write('CODE_TO_CHAR = {v: k for k, v in CHAR_TO_CODE.items()}\n')
        f.write('\n')
        f.write('# All valid character codes that the password system accepts\n')
        f.write('VALID_CODES = sorted(CHAR_TO_CODE.values())\n')
        f.write('\n')
        f.write('# Breed name lookup (main breed IDs 0-29)\n')
        f.write('BREED_NAMES = {\n')
        f.write('    0: "Pixie", 1: "Golem", 2: "Zuum", 3: "Suezo",\n')
        f.write('    4: "Dragon", 5: "Durahan", 6: "Arrow Head", 7: "Tiger",\n')
        f.write('    8: "Hare", 9: "Baku", 10: "Gitan", 11: "Zan",\n')
        f.write('    12: "Mogi", 13: "Raiden", 14: "Ogyo", 15: "Lesione",\n')
        f.write('    16: "Hengar", 17: "Gaboo", 18: "Jell", 19: "Undine",\n')
        f.write('    20: "Niton", 21: "Mock", 22: "Ducken", 23: "Plant",\n')
        f.write('    24: "Naga", 25: "Mocchi", 26: "Bajarl", 27: "Jill",\n')
        f.write('    28: "Worm", 29: "Pancho",\n')
        f.write('}\n')

    print(f"\nWrote data module: {out_path}")
    print(f"  {out_path.stat().st_size:,} bytes")

    # --- Also write a JSON version for reference ---
    json_path = Path(__file__).resolve().parent / "shrine_data.json"
    json_data = {
        "pointer_table": {
            "address": f"0x{DATA_PTR_TABLE:08X}",
            "resolved": {k: f"0x{v:08X}" for k, v in resolved.items()},
        },
        "main_breed_table": main_breed_table,
        "sub_breed_table": sub_breed_table,
        "stat_delta_table": stat_table,
        "technique_table": technique_table,
        "breed_combo_matrix": combo_matrix,
        "breed_base_stats": breed_base_stats,
    }
    json_path.write_text(json.dumps(json_data, indent=2))
    print(f"Wrote JSON: {json_path} ({json_path.stat().st_size:,} bytes)")


if __name__ == "__main__":
    main()
