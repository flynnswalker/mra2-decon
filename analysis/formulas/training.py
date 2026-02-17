#!/usr/bin/env python3
"""
MRA2 Training Mechanics -- Extracted from ROM disassembly.

The training system in Monster Rancher Advance 2 works as follows:

1. **Training Result Table** (ROM 0x0821856C):
   - 65 predefined training result records, each 56 bytes
   - Each record defines: stat totals, breed type, personality traits,
     drill difficulty, technique learn slots, growth data
   - When a training begins, one of these records is selected

2. **Weekly Step**:
   - The game calls `weekly_training_step` (0x08020328) each week
   - It reads the training result record from RAM (base: *0x0200A398)
   - The stat deltas at record+0x1A (6 signed bytes: POW/INT/SKI/SPD/DEF/LIF)
     are added to the monster's current stats via `field_modify`
   - The `core_state_accessor` type 10 handler clamps results to [0, 999]

3. **Training Cycle** (ranch_state+0x92):
   - A 57-step cycle counter (0 to 0x38=56, wrapping at 0x39=57)
   - Position in cycle determines which entry from the stat growth table
     (0x081C9F80) is used for display animations
   - The cycle does NOT affect actual stat gains -- gains are fixed per-record

4. **Success/Failure**:
   - The success check at `0x08001330` validates breed availability via
     field 0x9A (monster availability flags)
   - The function at `0x080687C4` uses a PRNG (0x0806354C) to determine
     the specific outcome index, with outcomes cycling through every 4 steps
   - Success is NOT probabilistic in the traditional sense -- it depends on
     whether the breed combination exists and current game state

5. **Stat Growth Table** (ROM 0x081C9F80, 70 entries x 12 bytes):
   - Used primarily for animation/display, indexed by cycle counter position
   - Values are multiples of 8, range 0-216
   - Each 12-byte entry contains 6 x uint16 values for display purposes

6. **Growth Grades** (from monster type table at 0x081CACC8+0x28):
   - 32 bytes per monster type at offset +0x28 in the type record
   - Characters include '1'-'5', 'A'-'E', 'S', 'T', '#', '$', '%'
   - These affect the visual representation and may influence hidden
     calculations in the training animation functions

Usage:
    from training import TrainingResultTable, get_training_record
"""

import struct
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

ROM_START = 0x08000000

TRAINING_TABLE_ADDR = 0x0821856C
TRAINING_RECORD_SIZE = 56
TRAINING_RECORD_COUNT = 65

STAT_GROWTH_TABLE_ADDR = 0x081C9F80
STAT_GROWTH_ENTRY_SIZE = 12
STAT_GROWTH_ENTRY_COUNT = 70

RANCH_STATE_BASE = 0x0201E558
RANCH_STATE_SIZE = 0x98  # 152 bytes per monster

TRAINING_RESULT_PTR = 0x0200A398  # pointer to current training result data

PRNG_SEED_ADDR = 0x0201E15C
PRNG_MAGIC = 0x2A6D365A  # fallback seed if current seed is 0


@dataclass
class TrainingResult:
    """One predefined training result record (56 bytes at ROM 0x0821856C)."""
    index: int
    # Stat totals: how much stat the training aims to produce
    pow_total: int
    int_total: int
    ski_total: int
    spd_total: int
    def_total: int
    lif_total: int
    # Monster type context
    breed_main: int
    breed_sub: int
    drill_difficulty: int  # 3, 4, or 5
    # Weekly deltas (signed bytes): added each week during training
    weekly_deltas: tuple  # (pow, int, ski, spd, def, lif) signed bytes
    # Personality/trait modifiers (signed bytes)
    trait_modifiers: tuple  # 6 signed bytes
    # Fatigue delta
    fatigue_delta: int
    # Technique learn slots (up to 4 bytes, 0xFF = empty)
    technique_slots: tuple
    # Raw record data
    raw: bytes


@dataclass
class StatGrowthEntry:
    """One stat growth table entry (12 bytes at ROM 0x081C9F80)."""
    index: int
    values: tuple  # 6 x uint16


@dataclass
class RanchState:
    """Per-monster ranch state within the 0x98-byte record at 0x0201E558."""
    training_type: int       # +0x8A: current training type
    animation_flag: int      # +0x8D: animation/result pending
    training_subindex: int   # +0x8F: sub-index for variant selection
    drill_step: int          # +0x90: current step in drill sequence
    cycle_counter: int       # +0x92: 57-step cycle (0-56, wraps at 57)
    secondary_counter: int   # +0x94: secondary counter (for outcome cycling)
    result_byte: int         # +0x96: training result outcome byte


def parse_training_record(rom_data: bytes, index: int) -> TrainingResult:
    """Parse a single training result record from the ROM."""
    off = (TRAINING_TABLE_ADDR - ROM_START) + index * TRAINING_RECORD_SIZE
    raw = rom_data[off:off + TRAINING_RECORD_SIZE]

    # Stat totals at +0x24 (6 x uint16)
    stats = struct.unpack_from('<HHHHHH', raw, 0x24)

    # Weekly deltas at +0x1A (6 signed bytes)
    deltas = struct.unpack_from('<bbbbbb', raw, 0x1A)

    # Breed type/sub at +0x30, +0x31
    breed_main = raw[0x30]
    breed_sub = raw[0x31]
    drill_diff = raw[0x32]

    # Trait modifiers at +0x08 (6 signed bytes)
    traits = struct.unpack_from('<bbbbbb', raw, 0x08)

    # Fatigue at +0x0E
    fatigue = struct.unpack_from('<b', raw, 0x0E)[0]

    # Technique slots at +0x10 (up to 4 bytes)
    tech_slots = tuple(raw[0x10:0x14])

    return TrainingResult(
        index=index,
        pow_total=stats[0],
        int_total=stats[1],
        ski_total=stats[2],
        spd_total=stats[3],
        def_total=stats[4],
        lif_total=stats[5],
        breed_main=breed_main,
        breed_sub=breed_sub,
        drill_difficulty=drill_diff,
        weekly_deltas=deltas,
        trait_modifiers=traits,
        fatigue_delta=fatigue,
        technique_slots=tech_slots,
        raw=raw,
    )


def parse_stat_growth_entry(rom_data: bytes, index: int) -> StatGrowthEntry:
    """Parse a stat growth table entry."""
    off = (STAT_GROWTH_TABLE_ADDR - ROM_START) + index * STAT_GROWTH_ENTRY_SIZE
    values = struct.unpack_from('<HHHHHH', rom_data, off)
    return StatGrowthEntry(index=index, values=values)


def prng_step(seed: int) -> tuple:
    """
    MRA2 PRNG (0x0806354C).
    Linear congruential: seed = seed * 41
    Returns (new_seed, random_value_15bit).
    """
    if seed == 0:
        seed = PRNG_MAGIC
    new_seed = (seed * 41) & 0xFFFFFFFF
    high = (new_seed >> 16) & 0xFFFF
    result = (high + new_seed) & 0x7FFF
    return new_seed & 0xFFFF, result


def determine_training_outcome(training_type: int, counter: int,
                                seed: int) -> tuple:
    """
    Determine training outcome (0x080687C4).

    Args:
        training_type: ranch_state+0x8A value
        counter: ranch_state+0x94 secondary counter
        seed: current PRNG seed

    Returns:
        (outcome_index, new_seed)
    """
    if training_type == 6:
        # Type 6: outcome is directly from result_byte
        return 0, seed

    if training_type == 7:
        # Type 7: cycle every 4 steps through random outcomes
        counter += 1
        if counter >= 4:
            counter = 0
            new_seed, rand = prng_step(seed)
            outcome = rand % 6
            return outcome, new_seed

    return 0, seed


def compute_cycle_bonus(cycle_counter: int) -> int:
    """
    Determine cycle-based bonus tier from the 57-step training cycle.

    The cycle counter at ranch_state+0x92 goes 0 to 56, wrapping at 57.
    Based on position in cycle:
      0-49: bonus = 0 (no extra)
      50-51: bonus = 1 (small extra)
      52-54: bonus = 2 (medium extra)
      55-56: bonus = 1 (small extra)
      (at 57 it wraps to 0)
    """
    if cycle_counter <= 0x31:  # <= 49
        return 0
    if cycle_counter <= 0x33:  # 50-51
        return 1
    if cycle_counter <= 0x36:  # 52-54
        return 2
    if cycle_counter <= 0x38:  # 55-56
        return 1
    return 0


def simulate_training_week(monster_stats: list, training_record: TrainingResult,
                            cycle_counter: int) -> list:
    """
    Simulate one week of training.

    Args:
        monster_stats: [pow, int, ski, spd, def, lif] current stats
        training_record: the active training result record
        cycle_counter: current position in 57-step cycle

    Returns:
        New stat values after this week's training step.
    """
    new_stats = list(monster_stats)
    deltas = training_record.weekly_deltas

    for i in range(6):
        new_val = new_stats[i] + deltas[i]
        new_stats[i] = max(0, min(999, new_val))

    return new_stats


def dump_all_training_records(rom_path: str, output_dir: str = "analysis"):
    """Dump all training result records to JSON."""
    rom_data = Path(rom_path).read_bytes()
    records = []

    for i in range(TRAINING_RECORD_COUNT):
        rec = parse_training_record(rom_data, i)
        records.append({
            "index": i,
            "stats": {
                "pow": rec.pow_total,
                "int": rec.int_total,
                "ski": rec.ski_total,
                "spd": rec.spd_total,
                "def": rec.def_total,
                "lif": rec.lif_total,
            },
            "weekly_deltas": list(rec.weekly_deltas),
            "breed_main": rec.breed_main,
            "breed_sub": rec.breed_sub,
            "drill_difficulty": rec.drill_difficulty,
            "trait_modifiers": list(rec.trait_modifiers),
            "fatigue_delta": rec.fatigue_delta,
            "technique_slots": [s for s in rec.technique_slots if s != 0xFF],
        })

    out = Path(output_dir) / "formulas"
    out.mkdir(parents=True, exist_ok=True)

    json_path = out / "training_records.json"
    json_path.write_text(json.dumps(records, indent=2))
    print(f"Wrote {len(records)} training records to {json_path}")

    return records


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python training.py <rom_path>")
        sys.exit(1)

    records = dump_all_training_records(sys.argv[1])

    print(f"\n=== Training Result Table Summary ===")
    print(f"Total records: {len(records)}")
    print(f"\n{'Idx':>4s}  {'POW':>5s} {'INT':>5s} {'SKI':>5s} {'SPD':>5s} "
          f"{'DEF':>5s} {'LIF':>5s}  {'Total':>6s}  Breed  Diff")
    print("-" * 70)
    for r in records:
        s = r["stats"]
        total = sum(s.values())
        print(f"{r['index']:4d}  {s['pow']:5d} {s['int']:5d} {s['ski']:5d} "
              f"{s['spd']:5d} {s['def']:5d} {s['lif']:5d}  {total:6d}  "
              f"{r['breed_main']:2d}/{r['breed_sub']:2d}  {r['drill_difficulty']}")
