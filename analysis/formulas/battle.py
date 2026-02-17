#!/usr/bin/env python3
"""
MRA2 Battle Mechanics -- Extracted from ROM disassembly.

## Battle Turn Resolution (0x080432E8)

The battle system computes an outcome score `r6` through multiple phases:

### Phase 1: Type Compatibility
- Both monsters' compatibility bytes (at struct+0x104 for each) are looked up
  in a type advantage table at ROM 0x081E9224
- attacker_compat = table[attacker_byte]
- defender_compat = table[defender_byte]
- combined = attacker_compat * 5 + defender_compat
- A signed byte from table 0x081C9A00[combined] gives -2..+2 advantage
- This indexes into a switch table for score bonus

### Phase 2: Guts Modifier
- `avg_guts = (attacker_guts + defender_guts) / 2`  (field 0x2F)
- Thresholds for guts tiers:
  - avg_guts <= 24:  tier 0 -> lookup[0]
  - avg_guts <= 49:  tier 1 -> lookup[4]
  - avg_guts <= 69:  tier 2 -> lookup[8]
  - avg_guts <= 89:  tier 3 -> lookup[12]
  - avg_guts > 89:   tier 4 -> lookup[16]
- Lookup tables at ROM 0x081C9B10 (first set) and 0x081C9B24 (second set)

### Phase 3: Loyalty/Mood Modifier
- Same threshold structure for field 0x32 (loyalty/mood field)

### Phase 4: Stat Differences
For each of the 6 stats (POW, INT, SKI, SPD, DEF, LIF):
- `diff = abs(attacker_stat - defender_stat)`
- If `diff > 100`:
  - `adjusted = abs(diff - 100)`  
  - `modifier = (adjusted * 5) * 4 / 256`  (= adjusted * 20 / 256)
  - `score += 1 + modifier`

### Phase 5: Breed Compatibility (field 0x0C)
- Similar type compatibility lookup using breed IDs
- defender_breed * 15 + attacker_breed indexes into table at 0x081C9A19
- Result gives -2..+2 advantage, another switch-based score modifier

### Phase 6: Level Modifier (field 0x12)
- `level_diff = attacker_level - defender_level`
- If level_diff == 0: score += 10
- If abs(level_diff) == 1: score += 5
- If has valid technique (field 0x18): score = score * 3 / 2

### Phase 7: Final Score to Outcome
Score `r6` is mapped to outcome tier:
- score > 99: tier 4 (overwhelming)
- score > 65: tier 3 (strong)
- score > 50: tier 2 (moderate)
- score > 40: tier 1 (slight)
- score <= 40: tier 0 (fail)

### Phase 8: Guts Change
- Tier 0: attacker guts -= 4
- Tier 1: attacker guts -= 1
- Tier 3+: attacker guts += 1

### Key Data Tables
- Type advantage: 0x081C9A00 (signed byte array)
- Type index: 0x081E9224 (byte array)
- Guts tier lookup 1: 0x081C9B10 (5 x uint32)
- Guts tier lookup 2: 0x081C9B24 (5 x uint32)

## PRNG
Same LCG as training system at 0x0806354C.
"""

import struct
import json
from dataclasses import dataclass
from pathlib import Path

ROM_START = 0x08000000

TYPE_ADVANTAGE_TABLE = 0x081C9A00
TYPE_INDEX_TABLE = 0x081E9224
GUTS_TIER_TABLE_1 = 0x081C9B10
GUTS_TIER_TABLE_2 = 0x081C9B24

SCORE_THRESHOLDS = [40, 50, 65, 99]  # score > threshold -> higher tier
GUTS_THRESHOLDS = [24, 49, 69, 89]   # avg_guts thresholds

OUTCOME_NAMES = {0: "fail", 1: "slight", 2: "moderate", 3: "strong", 4: "overwhelming"}


@dataclass
class BattleState:
    pow: int = 0
    int_stat: int = 0
    ski: int = 0
    spd: int = 0
    def_stat: int = 0
    lif: int = 0
    guts: int = 50
    loyalty: int = 50
    level: int = 1
    breed_id: int = 0
    compat_byte: int = 0


def compute_stat_difference_bonus(attacker: BattleState, defender: BattleState) -> int:
    """
    Phase 4: For each stat where abs(diff) > 100, add a bonus.
    Formula: bonus = 1 + (abs(abs(diff) - 100) * 20) >> 8
    """
    stats_a = [attacker.pow, attacker.int_stat, attacker.ski,
               attacker.spd, attacker.def_stat, attacker.lif]
    stats_d = [defender.pow, defender.int_stat, defender.ski,
               defender.spd, defender.def_stat, defender.lif]

    score = 0
    for sa, sd in zip(stats_a, stats_d):
        diff = abs(sa - sd)
        if diff > 100:
            adjusted = abs(diff - 100)
            modifier = (adjusted * 5 * 4) >> 8  # = adjusted * 20 / 256
            score += 1 + modifier

    return score


def compute_guts_tier(avg_guts: int) -> int:
    """Map average guts to tier 0-4."""
    for i, threshold in enumerate(GUTS_THRESHOLDS):
        if avg_guts <= threshold:
            return i
    return 4


def compute_score_tier(score: int) -> int:
    """Map final score to outcome tier 0-4."""
    if score > 99:
        return 4
    if score > 65:
        return 3
    if score > 50:
        return 2
    if score > 40:
        return 1
    return 0


def compute_guts_change(tier: int) -> int:
    """Guts change based on outcome tier."""
    if tier == 0:
        return -4
    if tier == 1:
        return -1
    if tier >= 3:
        return 1
    return 0


def compute_level_bonus(level_diff: int) -> int:
    """Phase 6 level difference bonus."""
    if level_diff == 0:
        return 10
    if abs(level_diff) == 1:
        return 5
    return 0


def simulate_battle_turn(attacker: BattleState, defender: BattleState,
                         has_technique: bool = False) -> dict:
    """
    Simulate one battle turn.

    Returns dict with score, tier, outcome name, and guts change.
    """
    score = 0

    # Phase 4: stat differences
    score += compute_stat_difference_bonus(attacker, defender)

    # Phase 2: guts modifier (simplified - needs ROM table data)
    avg_guts = (attacker.guts + defender.guts) // 2
    guts_tier = compute_guts_tier(avg_guts)
    # Actual modifier requires reading ROM lookup tables

    # Phase 3: loyalty modifier (simplified)
    avg_loyalty = (attacker.loyalty + defender.loyalty) // 2
    # Similar tier lookup

    # Phase 6: level bonus
    level_diff = attacker.level - defender.level
    score += compute_level_bonus(level_diff)

    # Technique multiplier
    if has_technique:
        score = (score * 3) // 2

    # Phase 7: outcome
    tier = compute_score_tier(score)

    # Phase 8: guts change
    guts_delta = compute_guts_change(tier)

    return {
        "score": score,
        "tier": tier,
        "outcome": OUTCOME_NAMES[tier],
        "guts_delta": guts_delta,
        "stat_bonus": compute_stat_difference_bonus(attacker, defender),
        "level_bonus": compute_level_bonus(level_diff),
    }


def dump_battle_tables(rom_path: str, output_dir: str = "analysis"):
    """Dump battle-related ROM tables."""
    rom_data = Path(rom_path).read_bytes()

    tables = {}

    # Type advantage table
    off = TYPE_ADVANTAGE_TABLE - ROM_START
    type_adv = []
    for i in range(225):  # 15x15 grid
        val = struct.unpack_from('<b', rom_data, off + i)[0]
        type_adv.append(val)
    tables["type_advantage"] = {
        "address": f"0x{TYPE_ADVANTAGE_TABLE:08X}",
        "size": "15x15 signed bytes",
        "values": type_adv,
    }

    # Guts tier lookups
    off1 = GUTS_TIER_TABLE_1 - ROM_START
    off2 = GUTS_TIER_TABLE_2 - ROM_START
    guts1 = list(struct.unpack_from('<IIIII', rom_data, off1))
    guts2 = list(struct.unpack_from('<IIIII', rom_data, off2))
    tables["guts_tiers"] = {
        "table_1_addr": f"0x{GUTS_TIER_TABLE_1:08X}",
        "table_2_addr": f"0x{GUTS_TIER_TABLE_2:08X}",
        "thresholds": GUTS_THRESHOLDS,
        "table_1_values": guts1,
        "table_2_values": guts2,
    }

    out = Path(output_dir) / "formulas"
    out.mkdir(parents=True, exist_ok=True)
    json_path = out / "battle_tables.json"
    json_path.write_text(json.dumps(tables, indent=2))
    print(f"Wrote battle tables to {json_path}")

    # Print summary
    print("\n=== Battle Score Thresholds ===")
    print(f"  Fail:          score <= 40")
    print(f"  Slight:     40 < score <= 50")
    print(f"  Moderate:   50 < score <= 65")
    print(f"  Strong:     65 < score <= 99")
    print(f"  Overwhelming: score > 99")

    print("\n=== Guts Tier Thresholds ===")
    for i, t in enumerate(GUTS_THRESHOLDS):
        print(f"  Tier {i}: avg_guts <= {t}")
    print(f"  Tier 4: avg_guts > 89")

    print("\n=== Guts Change on Outcome ===")
    print(f"  Fail (tier 0):          -4 guts")
    print(f"  Slight (tier 1):        -1 guts")
    print(f"  Moderate (tier 2):       0 guts")
    print(f"  Strong/Overwhelming:    +1 guts")

    print("\n=== Stat Difference Formula ===")
    print(f"  For each stat where abs(diff) > 100:")
    print(f"    bonus = 1 + (abs(abs(diff) - 100) * 20) >> 8")

    return tables


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python battle.py <rom_path>")
        sys.exit(1)
    dump_battle_tables(sys.argv[1])
