#!/usr/bin/env python3
"""
MRA2 Lifespan & Stress Mechanics -- Extracted from ROM disassembly.

## Summary of Confirmed Findings

### Key Fields (from game_state_schema)
- **Field 0x16** (uint16 at offset 0x0094, max 9999): Lifespan value A
- **Field 0x17** (int16 at offset 0x0096, max 9999): Lifespan value B
  Both initialized from monster_type_record+0x10 (e.g. ~2500 for typical monsters).
  Typical raw values: 2480-2590.

### Type 2 vs Type 7 Field Handler Differences
- Type 7 (field 0x16): unsigned uint16, clamped to [0, max]
- Type 2 (field 0x17): signed int16, clamped to [-max, +max]
  This is the key difference: 0x17 can go negative, 0x16 cannot.

### Aging Stage Calculation (function at 0x080027AC)
```
r5 = field_read(monster, 0x16)  // lifespan_A
r0 = field_read(monster, 0x17)  // lifespan_B
remaining = r5 - r0
stage = (remaining * 16) / r5   // signed divide at 0x081C79D4
stage = clamp(stage, 0, 15)
```
- Result: 0-15 aging stage (15 = young, 0 = near death)
- Used as index into stat growth/decay tables at 0x083F3E20

### Divide Function (0x081C79D4)
Confirmed as SIGNED INTEGER DIVISION (not multiply):
- Handles divide by zero (returns 0)
- Preserves sign via XOR of operands
- Uses shift-and-subtract algorithm

### Training Effect on Lifespan (via apply_stat_delta at 0x08020AB0)
The delta struct byte at offset 0x0E is applied to BOTH fields:
```
delta = signed_byte(delta_struct + 0x0E)
field_modify(monster, 0x16, delta)  // lifespan_A += delta
field_modify(monster, 0x17, delta)  // lifespan_B += delta
```
- Only call site for these modifications: 0x08020AB0
- Training record fatigue values: [-3, 0, 27, 33, 35, 37, 38, 40, 41, 44, 45]
- Negative (-3): appears in records WITHOUT technique slots (regular training)
- Positive (27-45): appears in records WITH technique slots (intensive training)

### Monster Initialization (0x08020774)
- Memsets 0x594 bytes to zero
- Reads monster_type_record via get_monster_record(0x08020C5C)
- Both field 0x16 and 0x17 are SET (not modified) to [record+0x10]
- Also initializes: stats (fields 0-5), personality (fields 0x20-0x25),
  lifespan fields (0x13, 0x16, 0x17), breed info (0x6B, 0x6C),
  and numerous other fields

### Stress from Breeding (0x0805FB5C)
When two monsters are combined:
```
new_stress = (parent1_stress + parent2_stress) * 5
field_write(child, 0x1E, new_stress)
```

### Aging Stage Usage
The aging_stage result (0-15) is consumed by a lookup table function (0x08024DA8):
```
rate = rom[0x083F3E20 + field_0x13 * 16 + aging_stage]
```
This provides age-dependent growth/decay modifiers used in the weekly stat
update function (0x0801FCFC).

## Open Questions (need emulation verification)
1. How do fields 0x16 and 0x17 diverge during normal gameplay?
   - Both initialized to same value, both modified by same delta
   - The aging_stage formula depends on their DIFFERENCE
   - Possibility: weekly age increment via direct WRAM write (not through field_modify API)
   - Possibility: one of the fields represents something other than lifespan/age
2. What do the raw lifespan values (2480-2590) mean in game weeks?
   - MR2 console has lifespans of ~200-500 weeks
   - 2500/7 ≈ 357 weeks if unit is days
3. Do stress/fatigue accumulate through direct WRAM writes?
   - Fields 0x1D (fatigue) and 0x1F (mood) have NO field_modify or field_write calls
"""

import struct
import json
from dataclasses import dataclass
from pathlib import Path

ROM_START = 0x08000000
DIVIDE_FUNC = 0x081C79D4
AGING_STAGE_FUNC = 0x080027AC
AGING_LOOKUP_TABLE = 0x083F3E20
MONSTER_TYPE_TABLE = 0x081CACC8


@dataclass
class LifespanState:
    lifespan_a: int   # field 0x16 (uint16 at 0x0094)
    lifespan_b: int   # field 0x17 (int16 at 0x0096)
    stress: int = 0   # field 0x1E (uint16 at 0x00A3)


def compute_aging_stage(lifespan_a: int, lifespan_b: int) -> int:
    """
    Compute aging stage (0-15) from ROM function at 0x080027AC.

    Formula: stage = clamp( (lifespan_a - lifespan_b) * 16 / lifespan_a, 0, 15)

    Uses signed integer division.
    """
    if lifespan_a == 0:
        return 0
    remaining = lifespan_a - lifespan_b
    # Signed integer division (truncates toward zero)
    if lifespan_a > 0:
        raw = (remaining * 16) // lifespan_a
    else:
        raw = 0
    return max(0, min(raw, 15))


def apply_training_lifespan_delta(state: LifespanState, fatigue_delta: int) -> LifespanState:
    """
    Apply training fatigue delta to lifespan fields.
    Both fields are modified by the same delta.

    fatigue_delta comes from delta_struct offset 0x0E (signed byte).
    """
    new_a = max(0, min(9999, state.lifespan_a + fatigue_delta))
    new_b = max(-9999, min(9999, state.lifespan_b + fatigue_delta))
    return LifespanState(new_a, new_b, state.stress)


def compute_breeding_stress(parent1_stress: int, parent2_stress: int) -> int:
    """
    Compute child's initial stress from breeding (0x0805FB5C).
    """
    return (parent1_stress + parent2_stress) * 5


def get_monster_lifespan_raw(rom_data: bytes, monster_type_index: int) -> int:
    """Read the raw lifespan value from the monster type table."""
    table_off = MONSTER_TYPE_TABLE - ROM_START
    header = struct.unpack_from('<I', rom_data, table_off)[0]
    base_off = table_off + header
    rec_off = base_off + monster_type_index * 72
    return struct.unpack_from('<H', rom_data, rec_off + 0x10)[0]


def dump_aging_lookup_table(rom_data: bytes, output_dir: str = "analysis"):
    """Dump the aging stage -> growth rate lookup table."""
    off = AGING_LOOKUP_TABLE - ROM_START
    table = {}
    # Read first few rows (indexed by field 0x13 value)
    for breed_type in range(16):  # first 16 types as example
        row = []
        for stage in range(16):
            val = rom_data[off + breed_type * 16 + stage]
            row.append(val)
        table[breed_type] = row

    return table


def dump_lifespan_data(rom_path: str, output_dir: str = "analysis"):
    """Dump lifespan data from monster type table."""
    rom_data = Path(rom_path).read_bytes()

    # Monster lifespans
    table_off = MONSTER_TYPE_TABLE - ROM_START
    header = struct.unpack_from('<I', rom_data, table_off)[0]
    base_off = table_off + header

    lifespans = []
    for i in range(194):  # 194 monster types
        rec_off = base_off + i * 72
        raw = struct.unpack_from('<H', rom_data, rec_off + 0x10)[0]
        if raw > 0:
            lifespans.append({"monster_index": i, "lifespan_raw": raw})

    # Aging lookup table
    aging_table = dump_aging_lookup_table(rom_data)

    out = Path(output_dir) / "formulas"
    out.mkdir(parents=True, exist_ok=True)

    json_path = out / "lifespan_data.json"
    json_path.write_text(json.dumps({
        "fields": {
            "0x16": "uint16 at offset 0x0094, max 9999 - lifespan value A",
            "0x17": "int16 at offset 0x0096, max 9999 - lifespan value B",
        },
        "aging_stage_formula": "clamp((field_0x16 - field_0x17) * 16 / field_0x16, 0, 15)",
        "training_effect": "delta_struct[0x0E] added to BOTH fields per training week",
        "breeding_stress": "(parent1_stress + parent2_stress) * 5",
        "aging_lookup_table_addr": "0x083F3E20",
        "aging_lookup_table_sample": aging_table,
        "monster_lifespans": lifespans,
    }, indent=2))
    print(f"Wrote lifespan data to {json_path}")

    raws = [l["lifespan_raw"] for l in lifespans]
    if raws:
        print(f"\n=== Lifespan Summary ===")
        print(f"  Monsters with data: {len(raws)}")
        print(f"  Min raw value: {min(raws)}")
        print(f"  Max raw value: {max(raws)}")
        print(f"  Average: {sum(raws)/len(raws):.0f}")

    print(f"\n=== Aging Stage Formula ===")
    print(f"  stage = clamp((field_0x16 - field_0x17) * 16 / field_0x16, 0, 15)")
    print(f"  15 = young, 0 = near death")

    print(f"\n=== Training Fatigue Deltas ===")
    print(f"  Regular training: -3 (beneficial)")
    print(f"  No effect: 0")
    print(f"  Intensive/technique training: 27-45 (costly)")


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python lifespan.py <rom_path>")
        sys.exit(1)
    dump_lifespan_data(sys.argv[1])
