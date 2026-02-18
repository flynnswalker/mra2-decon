#!/usr/bin/env python3
"""
MRA2 Fatigue, Stress & Food Mechanics -- ROM data extraction.

## Confirmed Table Structures

### Item Descriptor Table (0x082067AC)
Structure: uint16 offset table (38 entries) followed by variable-length item records.
- First entry (index 0) is itself a sub-offset table pointing to 38 more items
  (trophies, incense, special equipment, fusion items).
- Entries 1-37 are the main shop/inventory item descriptors.
- Total items: 38 (main) + 38 (sub) = 76 items.

Each item record layout:
  +0x00: uint8  item_type  (0=consumable/equip, 2=food, 3=food?, 8=gem, 0x0B=feed, 0x0C=fusion)
  +0x01: uint8  flags/bonus_byte
  +0x02: uint16 name_index (high byte = category, low byte = sub-index)
  +0x04: uint16 buy_price  (0xFFFF = not buyable)
  +0x06: uint16 sell_price
  +0x08: uint8  food_flag_a
  +0x09: uint8  food_flag_b
  +0x0A: uint16 unknown
  +0x0C+: encoded text (item name + description), variable length

Text encoding: A-Z = 0x01-0x1A, a-z = 0x1B-0x34, space = 0x00,
               period = 0x3F, 0xFFFF = separator, 0xF4FF = terminator

### Item Types
- 0x00: Consumable/Equipment (Gold Bar, stones, charms, masks, scrolls)
- 0x02: Food items (Honey Candy, Oily Oil, NitroBerry, Mint Leaf, Mint Candy)
- 0x03: Food item (Newt)
- 0x08: Gems (Shiny/Glimmer/Bright Gem)
- 0x0B: Feed/supplements (Star Prune, Gelatin, DietWeed, Dodorin, MeatSlab, etc.)
- 0x0C: Fusion materials (Fureria, Gadamon, Buragma)
- 0x06: Incense items (sub-table)
- 0x07: Trophies (sub-table)
- 0x09: Wind instruments (sub-table)
- 0x0A: Drums (sub-table)

### Loyalty Drain Table (0x083F3ED8)
7 entries, stride 2 (uint8 min, uint8 max). Higher brackets = higher loyalty = more drain.
Values: [30,50], [50,70], [70,90], [90,110], [110,130], [130,150], [150,200]

### Growth Rate Table (0x083F3E20)
6 rows x 16 columns of uint8. Indexed by [field_0x13][aging_stage].
Row 0 = early peaker, Row 4 = late bloomer, Row 5 = balanced.

### Monster Type Record Food Fields (0x12-0x1F)
- byte 0x12: food_preference (1-5, likely maps to preferred food type among the 5 foods)
- byte 0x13: growth_type (always 0 -- likely set elsewhere or unused)
- byte 0x14: figure_type or body_type (1-13, determines visual appearance)
- bytes 0x15-0x1F: signed stat modifiers (interpreted as int8), likely food-specific
  stat bonuses per breed. Values cluster around small positives/negatives.
"""

import struct
import json
from pathlib import Path

ROM_START = 0x08000000
ROM_PATH = Path(__file__).resolve().parents[2] / "rom" / "Monster Rancher Advance 2 (USA).gba"

GROWTH_RATE_TABLE = 0x083F3E20
LOYALTY_DRAIN_TABLE = 0x083F3ED8
ITEM_DESCRIPTOR_TABLE = 0x082067AC
MONSTER_TYPE_TABLE = 0x081CACC8
FOOD_BONUS_FUNC = 0x08002538

MONSTER_RECORD_SIZE = 72
MONSTER_COUNT = 194

CHARMAP = {}
for i in range(26):
    CHARMAP[0x01 + i] = chr(ord('A') + i)
    CHARMAP[0x1B + i] = chr(ord('a') + i)
CHARMAP[0x00] = ' '
CHARMAP[0x3F] = '.'
CHARMAP[0x35] = '-'
CHARMAP[0x36] = "'"
CHARMAP[0x37] = '&'
CHARMAP[0x38] = '!'
CHARMAP[0x39] = '?'
CHARMAP[0x3A] = ','
CHARMAP[0x3B] = '/'
CHARMAP[0x3C] = ':'


def rom_off(addr: int) -> int:
    return addr - ROM_START


def decode_text_u16(data: bytes) -> str:
    """Decode uint16 LE encoded text. Each character is 2 bytes (charcode, 0x00).
    0xFFF4 = end-of-section, 0xFFFF = section separator."""
    result = []
    i = 0
    while i + 1 < len(data):
        w = struct.unpack_from('<H', data, i)[0]
        if w == 0xFFF4:
            break
        if w == 0xFFFF:
            result.append(' | ')
            i += 2
            continue
        lo = w & 0xFF
        if lo in CHARMAP:
            result.append(CHARMAP[lo])
        elif 0x40 <= lo <= 0x49:
            result.append(str(lo - 0x40))
        else:
            result.append(f'[{w:04X}]')
        i += 2
    return ''.join(result)


def decode_item_text_sections(data: bytes, start: int) -> list[str]:
    """Decode multiple text sections separated by 0xFFF4 markers.
    Each section: [0x10, 0x00] control + [width, 0x00] pixel width + uint16 chars."""
    sections = []
    i = start
    while i + 1 < len(data):
        w = struct.unpack_from('<H', data, i)[0]
        if w == 0xFFF4:
            i += 2
            continue
        if (w & 0xFF) == 0x10:
            i += 2
            if i + 1 >= len(data):
                break
            i += 2
        else:
            i += 2
        text = decode_text_u16(data[i:])
        if text.strip():
            sections.append(text.strip())
        while i + 1 < len(data):
            w2 = struct.unpack_from('<H', data, i)[0]
            i += 2
            if w2 == 0xFFF4:
                break
    return sections


def dump_growth_rate_table(rom: bytes) -> dict:
    """6 rows x 16 columns of uint8 growth multipliers at 0x083F3E20."""
    off = rom_off(GROWTH_RATE_TABLE)
    rows = {}
    for row in range(6):
        vals = [rom[off + row * 16 + col] for col in range(16)]
        rows[row] = vals
    return rows


def dump_loyalty_drain_table(rom: bytes) -> dict:
    """7 bracket entries at 0x083F3ED8, stride 2: (min_drain, max_drain) uint8 pair."""
    off = rom_off(LOYALTY_DRAIN_TABLE)
    raw = rom[off:off + 32]

    entries = []
    for i in range(7):
        base = off + i * 2
        entries.append({
            "bracket": i,
            "min_drain": rom[base],
            "max_drain": rom[base + 1],
        })

    print(f"\n  Raw hex (32 bytes): {raw.hex(' ')}")
    for e in entries:
        print(f"  Bracket {e['bracket']}: drain [{e['min_drain']:3d}, {e['max_drain']:3d}]")

    following_data = []
    for i in range(7, 16):
        base = off + i * 2
        following_data.append((rom[base], rom[base + 1]))
    print(f"\n  Following data (bytes 14-31, possibly second table):")
    for i, (a, b) in enumerate(following_data):
        print(f"    [{i+7:2d}] {a:3d}, {b:3d}")

    return {
        "entries": entries,
        "raw_hex": raw.hex(' '),
        "following_pairs": [{"idx": i + 7, "a": a, "b": b} for i, (a, b) in enumerate(following_data)],
    }


def dump_item_table(rom: bytes) -> dict:
    """
    Item table at 0x082067AC: uint16 offset index -> variable-length item records.
    Entry 0 is a sub-offset table; entries 1-37 are main item descriptors.
    """
    table_off = rom_off(ITEM_DESCRIPTOR_TABLE)

    first_offset = struct.unpack_from('<H', rom, table_off)[0]
    num_entries = first_offset // 2

    offsets = [struct.unpack_from('<H', rom, table_off + i * 2)[0] for i in range(num_entries)]

    print(f"\n  Table at 0x{ITEM_DESCRIPTOR_TABLE:08X}: {num_entries} entries via uint16 offset index")
    print(f"  First offset: 0x{first_offset:04X} -> {num_entries} index slots")

    def parse_item(data: bytes, length: int) -> dict:
        item = {
            "type": data[0],
            "flags": data[1],
            "name_index": struct.unpack_from('<H', data, 2)[0],
            "buy_price": struct.unpack_from('<H', data, 4)[0],
            "sell_price": struct.unpack_from('<H', data, 6)[0],
            "header_bytes": list(data[:12]),
            "header_hex": data[:12].hex(' '),
        }
        text_sections = decode_item_text_sections(data, 0x0C)
        item["name"] = text_sections[0] if text_sections else ""
        item["descriptions"] = text_sections[1:] if len(text_sections) > 1 else []
        item["raw_hex"] = data[:length].hex(' ')
        item["length"] = length
        return item

    main_items = []
    for i in range(1, num_entries):
        data_start = table_off + offsets[i]
        end = offsets[i + 1] if i < num_entries - 1 else offsets[i] + 128
        length = end - offsets[i]
        d = rom[data_start:data_start + length]
        item = parse_item(d, length)
        item["main_index"] = i
        main_items.append(item)

    sub_off_base = table_off + offsets[0]
    sub_count = (offsets[1] - offsets[0]) // 2
    sub_offsets = [struct.unpack_from('<H', rom, sub_off_base + i * 2)[0] for i in range(sub_count)]

    sub_items = []
    for i in range(sub_count):
        data_start = table_off + sub_offsets[i]
        if i < sub_count - 1:
            end = sub_offsets[i + 1] - sub_offsets[i]
        else:
            end = 128
        d = rom[data_start:data_start + end]
        item = parse_item(d, end)
        item["sub_index"] = i
        sub_items.append(item)

    type_names = {
        0x00: "consumable/equipment",
        0x02: "food",
        0x03: "food(alt)",
        0x06: "incense",
        0x07: "trophy",
        0x08: "gem",
        0x09: "wind_instrument",
        0x0A: "drum",
        0x0B: "feed/supplement",
        0x0C: "fusion_material",
    }

    print(f"\n  === Main Items (1-{num_entries-1}) ===")
    for item in main_items:
        tn = type_names.get(item["type"], f"unknown(0x{item['type']:02X})")
        name = item.get("name", "???")
        buy = item["buy_price"]
        sell = item["sell_price"]
        buy_str = "N/A" if buy == 0xFFFF else str(buy)
        print(f"    [{item['main_index']:2d}] {tn:22s} buy={buy_str:>5s} sell={sell:5d}  {name[:30]}")

    print(f"\n  === Sub-table Items (trophies/special) ===")
    for item in sub_items:
        tn = type_names.get(item["type"], f"unknown(0x{item['type']:02X})")
        name = item.get("name", "???")
        buy = item["buy_price"]
        sell = item["sell_price"]
        buy_str = "N/A" if buy == 0xFFFF else str(buy)
        print(f"    [{item['sub_index']:2d}] {tn:22s} buy={buy_str:>5s} sell={sell:5d}  {name[:30]}")

    return {
        "structure": {
            "address": f"0x{ITEM_DESCRIPTOR_TABLE:08X}",
            "format": "uint16 offset index -> variable-length records",
            "main_count": len(main_items),
            "sub_count": len(sub_items),
            "total_items": len(main_items) + len(sub_items),
        },
        "type_map": {f"0x{k:02X}": v for k, v in type_names.items()},
        "main_items": main_items,
        "sub_items": sub_items,
    }


def dump_monster_food_data(rom: bytes) -> list:
    """
    Monster type table at 0x081CACC8. 72 bytes/record, 194 records.
    Header is a 4-byte offset. Extract food preference and figure data.
    """
    table_off = rom_off(MONSTER_TYPE_TABLE)
    header = struct.unpack_from('<I', rom, table_off)[0]

    base_off = table_off + header

    print(f"\n  Table: 0x{MONSTER_TYPE_TABLE:08X}, header offset: {header}, base: ROM+0x{base_off:06X}")

    first_rec = rom[base_off:base_off + 72]
    print(f"\n  First record (72 bytes):")
    for i in range(0, 72, 16):
        chunk = first_rec[i:min(i + 16, 72)]
        hex_str = ' '.join(f'{b:02x}' for b in chunk)
        print(f"    +0x{i:02X}: {hex_str}")

    monsters = []
    for idx in range(MONSTER_COUNT):
        rec_off = base_off + idx * MONSTER_RECORD_SIZE
        rec = rom[rec_off:rec_off + MONSTER_RECORD_SIZE]

        lifespan_raw = struct.unpack_from('<H', rom, rec_off + 0x10)[0]

        stat_mods = {}
        for off in range(0x15, 0x20):
            val = rec[off]
            stat_mods[f"0x{off:02X}"] = val if val < 128 else val - 256

        entry = {
            "index": idx,
            "lifespan_raw": lifespan_raw,
            "food_preference": rec[0x12],
            "byte_0x13": rec[0x13],
            "figure_type": rec[0x14],
            "stat_modifiers": stat_mods,
            "food_region_hex": rec[0x12:0x20].hex(' '),
            "growth_grades": list(rec[0x28:0x28 + 6]),
            "full_record_hex": rec.hex(' '),
        }
        monsters.append(entry)

    print(f"\n  Extracted {MONSTER_COUNT} monster records")

    print(f"\n  Key field distributions:")
    food_prefs = {}
    figure_types = {}
    for m in monsters:
        food_prefs.setdefault(m["food_preference"], []).append(m["index"])
        figure_types.setdefault(m["figure_type"], []).append(m["index"])

    print(f"    food_preference (0x12): {len(food_prefs)} values")
    for fp in sorted(food_prefs):
        print(f"      {fp}: {len(food_prefs[fp])} monsters")

    print(f"    figure_type (0x14): {len(figure_types)} values")
    for ft in sorted(figure_types):
        print(f"      {ft}: {len(figure_types[ft])} monsters (first 5: {figure_types[ft][:5]})")

    print(f"\n  Stat modifier (0x15-0x1F) ranges per byte:")
    for off in range(0x15, 0x20):
        key = f"0x{off:02X}"
        vals = [m["stat_modifiers"][key] for m in monsters]
        print(f"    {key}: [{min(vals):4d}, {max(vals):4d}]  mean={sum(vals)/len(vals):+.1f}")

    return monsters


def find_weekly_drain_constants(rom: bytes) -> dict:
    return {
        "base_field_0xFB_eq_1": {"value": 400, "encoding": "0xC8 << 1",
                                  "description": "Base drain when field_0xFB == 1"},
        "base_normal": {"value": 500, "encoding": "0xFA << 1",
                        "description": "Base drain for normal weekly path"},
        "trait_0x33_numerator": {"value": 150, "encoding": "0x96",
                                 "description": "Multiplier numerator when trait 0x33 active"},
        "trait_0x33_denominator": {"value": 100, "encoding": "0x64",
                                   "description": "Multiplier denominator when trait 0x33 active"},
        "formula": "weekly_drain = base * (trait_0x33 ? 150/100 : 1); base=500 normal, 400 if field_0xFB==1",
    }


def main():
    rom = ROM_PATH.read_bytes()
    print(f"ROM loaded: {len(rom)} bytes ({len(rom) / 1024 / 1024:.1f} MB)")

    print("\n" + "=" * 70)
    print("1. GROWTH RATE TABLE (6x16 at 0x083F3E20)")
    print("=" * 70)
    growth = dump_growth_rate_table(rom)
    labels = ["Early Peak", "Mid-Early", "Mid", "Mid-Late", "Late Bloom", "Balanced"]
    for row_idx, vals in growth.items():
        peak = vals.index(max(vals))
        print(f"  Row {row_idx} ({labels[row_idx]:>10s}): {vals}  peak@stage={peak}")

    print("\n" + "=" * 70)
    print("2. LOYALTY DRAIN TABLE (7 entries at 0x083F3ED8)")
    print("=" * 70)
    loyalty = dump_loyalty_drain_table(rom)

    print("\n" + "=" * 70)
    print("3. ITEM DESCRIPTOR TABLE (0x082067AC)")
    print("=" * 70)
    items = dump_item_table(rom)

    print("\n" + "=" * 70)
    print("4. MONSTER TYPE FOOD/FIGURE DATA (0x081CACC8)")
    print("=" * 70)
    monsters = dump_monster_food_data(rom)

    print("\n" + "=" * 70)
    print("5. WEEKLY LIFESPAN DRAIN CONSTANTS")
    print("=" * 70)
    drain_consts = find_weekly_drain_constants(rom)
    for k, v in drain_consts.items():
        if isinstance(v, dict):
            print(f"  {k}: {v['value']} ({v['encoding']}) - {v['description']}")
        else:
            print(f"  {k}: {v}")

    output_path = Path(__file__).resolve().parent / "fatigue_stress_food_data.json"
    output = {
        "growth_rate_table": {
            "address": f"0x{GROWTH_RATE_TABLE:08X}",
            "description": "6 rows x 16 cols, uint8, indexed by [field_0x13][aging_stage]. 15=youngest, 0=oldest.",
            "row_labels": {str(i): labels[i] for i in range(6)},
            "rows": {str(k): v for k, v in growth.items()},
        },
        "loyalty_drain_table": {
            "address": f"0x{LOYALTY_DRAIN_TABLE:08X}",
            "description": "7 brackets (stride 2), uint8 min/max drain. Higher bracket = higher loyalty = more drain.",
            "entries": loyalty["entries"],
            "raw_hex": loyalty["raw_hex"],
            "following_data": loyalty["following_pairs"],
        },
        "item_table": items,
        "monster_food_data": {
            "address": f"0x{MONSTER_TYPE_TABLE:08X}",
            "record_size": MONSTER_RECORD_SIZE,
            "record_count": MONSTER_COUNT,
            "field_map": {
                "0x12": "food_preference (1-5)",
                "0x13": "always 0 (unused or set at runtime)",
                "0x14": "figure_type/body_type (1-13)",
                "0x15-0x1F": "signed stat modifiers (11 bytes, likely per-food or personality bonuses)",
            },
            "records": monsters,
        },
        "weekly_drain_constants": drain_consts,
    }

    output_path.write_text(json.dumps(output, indent=2))
    print(f"\nWrote {output_path.stat().st_size:,} bytes to {output_path}")


if __name__ == "__main__":
    main()
