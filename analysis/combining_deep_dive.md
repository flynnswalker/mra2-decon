# MRA2 Combining (Breeding) Deep Dive

## Overview

The combining system is orchestrated by `breeding_main` at `0x0805FB5C`, called
from the entry point at `0x0805B09C`. The full pipeline:

1. Determine offspring breed candidates (`0x080603D4`)
2. Initialize offspring with breed defaults (`monster_init` at `0x08020774`)
3. Inherit traits (OR lower 3 bits of trait words)
4. Inherit techniques (threshold > 48 proficiency)
5. Compute compatibility bonus (`0x0805FF28`)
6. Apply stat multipliers with item + compatibility bonuses
7. Set stress = `(parent_A_stress + parent_B_stress) * 5`
8. Apply item effects (`0x08060694`)
9. Copy technique ancestry data from both parents

---

## 1. Breed Combination Table

### Location and Structure

- **Address**: `0x081E88C0` (ROM)
- **Format**: 30 rows x 40 columns of `int16` entries
- **Row stride**: 80 bytes (40 entries x 2 bytes)
- **Index formula**: `table[main_breed * 80 + sub_breed * 2]`
- **Bounds**: `main_breed` clamped to `[0..29]`, `sub_breed` clamped to `[0..39]`

### How combine_breed_ids Works (0x08002B28)

```
combine_breed_ids(main, sub):
    if main > 29: main = 0
    if sub > 39: sub = 0
    result = BREED_COMBO_TABLE[main][sub]   // signed int16
    if result == 0:
        result = BREED_COMBO_TABLE[sub][main]  // try reversed
    return (result & 0xFFFF) - 0x10000 if result > 0x7FFF else result
```

- The table is **asymmetric**: `table[A][B]` may differ from `table[B][A]`
- Zero entries mean "no valid combination for this pair in this order"
- When the primary lookup returns 0, it tries the **transposed** lookup
- Result values are 1-indexed monster IDs (512 total entries across all breeds)

### Offspring Breed Determination (0x080603D4)

The dispatcher builds a candidate list of up to 6 breed IDs:

```
candidates = []
breed_A = combine_breed_ids(parent_A.main, parent_A.sub)
breed_B = combine_breed_ids(parent_B.main, parent_B.sub)

if breed_A == breed_B:
    candidates = [breed_A]              // 1 option
else:
    candidates = [breed_A, breed_B]     // 2 options

    // Cross-breed lookups for 3rd slot
    cross_1 = BREED_COMBO_TABLE[parent_B.sub][parent_A.main]
    cross_2 = BREED_COMBO_TABLE[parent_A.main][parent_B.sub]  // reversed
    if cross_1 != 0: cross_1 -= 1
    if cross_2 != 0: cross_2 -= 1

    if cross_1 == cross_2 and cross_1 not in candidates:
        candidates.append(cross_1)      // 3rd slot
    else:
        if cross_1 valid: candidates.append(cross_1)
        if cross_2 valid: candidates.append(cross_2)

    // Special recipe check (4th+ slots) - see Legendary section
```

After building candidates, `breeding_main` iterates each candidate and
initializes a full offspring struct per candidate (struct stride = 0x594 bytes).

---

## 2. Parent Stat Selection

### Critical Finding: Stats Are NOT Directly Inherited

**The offspring's base stats come entirely from the breed defaults**, not from
either parent's actual stats. The process:

1. `combine_breed_ids` determines the offspring breed ID
2. `monster_init(offspring, breed_id)` sets breed-default base stats
3. Each base stat is multiplied by a bonus factor

### Stat Modification Formula

```
new_stat = base_stat + (base_stat << 8) / 100 * (bonus + compat_pct) >> 8
         = base_stat * (100 + bonus + compat_pct) / 100
```

Clamped to `[0, 255]`.

Where:
- `base_stat` = breed default (set by `monster_init`)
- `bonus` = item bonus (0 or 10, see Item Effects below)
- `compat_pct` = compatibility percentage from `0x0805FF28`

Division function at `0x081C79D4` is `__aeabi_idiv` (software signed integer
division, confirmed by instruction-level analysis).

### Stat Order in Modification Loop

| Stat | Struct Offset | Bonus Index |
|------|--------------|-------------|
| POW  | +0x68        | bonus[0]    |
| INT  | +0x70        | bonus[1]    |
| SKI  | +0x6C        | bonus[2]    |
| SPD  | +0x6E        | bonus[3]    |
| DEF  | +0x6A        | bonus[4]    |
| LIF  | +0x72        | bonus[5]    |

---

## 3. Compatibility Score (0x0805FF28)

Returns a percentage bonus used in the stat formula. Built from 5 phases:

### Phase 1: Stress Gate

Both parents must have stress > 47 (field_21, offset 0x90) or the function
returns 0 immediately (no bonus at all).

### Phase 2: Stress Tier

```
avg = (parent_A.stress + parent_B.stress) / 2
stress_tier:
    avg <= 24 (0x18):  +1
    avg <= 49 (0x31):  +2
    avg <= 69 (0x45):  +3
    avg <= 89 (0x59):  +4
    avg <= 100 (0x64): +5
    avg > 100:         +0 (over-stressed penalty)
```

### Phase 3: Stat Rank Matching

For each parent, rank their 6 stats from lowest (rank 0) to highest (rank 5).
Count how many rank positions match between parents.

```
matches = count(rank_A[i] == rank_B[i] for i in 0..5)
stat_tier:
    matches == 0: +1
    matches == 1: +2
    matches <= 3: +3
    matches <= 5: +4
    matches == 6: +5
    matches > 6:  +0 (impossible; capped)
```

### Phase 4: Growth Grade Rank Matching

Same algorithm applied to growth grades (fields 38-43 at offsets +0xAB to +0xB0).
The bonus is **inverted** (less matching = higher bonus):

```
grade_matches = count(grade_rank_A[i] == grade_rank_B[i] for i in 0..5)
grade_tier:
    matches == 0: +5
    matches == 1: +4
    matches <= 3: +3
    matches <= 5: +2
    matches == 6: +1
    matches > 6:  +0
```

### Phase 5: Breed Type Affinity

Uses a breed type table at `0x081E9224` (30 bytes, one per breed, values 0-4):

| Type | Breeds |
|------|--------|
| 0    | Durahan, Mocchi, Ape, Naga, Ghost |
| 1    | Golem, Gaboo, Undine, Mock, Metalner |
| 2    | Zuum, Pixie, Arrow Head, Hopper, Jill, Jell, Ducken |
| 3    | Hare, Baku, Zilla, Joker, Niton, Plant |
| 4    | Dragon, Tiger, Gali, Kato, Suezo, Monol, Worm |

Bonus based on type combination:
- Same type: +5
- Type 0 vs Type 0: +1
- Cross-type with complementary pairs: +2 to +4
- Default fallback: +3

### Tier to Percentage Conversion

The cumulative tier (sum of phases 2-5, range 0-20) maps to a base percentage:

```
tier <= 9:   pct = 2
tier <= 14:  pct = 10
tier <= 19:  pct = 20
tier <= 25:  pct = 30
tier > 25:   pct = 0
```

### Phase 6: Nature Bonus

Field_18 (nature/personality, offset 0x88, max 11) for each parent:

```
if parent_A.nature > 4: pct += 10
if parent_B.nature > 4: pct += 10
if parent_A.nature == 4: pct += 5
if parent_B.nature == 4: pct += 5
```

Maximum possible pct_bonus = 30 + 10 + 10 = **50**.

---

## 4. Legendary Combination System

### Recipe Table

- **Address**: `0x081F188C` (ROM)
- **Format**: `uint32 count` at offset 0, then `uint32 offsets[count]`
- **Total recipes**: 27

### Recipe Record Structure

```c
struct recipe {
    uint8_t type;           // always 0
    uint8_t parent_main;    // required main breed (0xFF = any)
    uint8_t parent_sub;     // required sub breed (0xFF = any)
    uint8_t item_required;  // required item ID (0xFF = no item needed)
    uint8_t result_main;    // offspring main breed
    uint8_t result_sub;     // offspring sub breed
    uint8_t padding[2];
    struct condition {      // variable-length chain
        uint16_t sentinel;  // 0xFFFF = end of chain
        uint16_t source;    // 1=active_monster, 2=parent_A, 3=parent_B
        uint16_t field_idx;
        uint16_t arr_idx;
        uint16_t compare_op; // 0=equal, 1=not_equal, 2=greater, 3=less
        uint16_t value;
    } conditions[];
};
```

### Category 1: Item-Triggered Legendaries (Recipes 1-11, 21)

Any two parents + specific item = forced breed override:

| Recipe | Item ID | Result Breed |
|--------|---------|-------------|
| 1  | 0x2C | Jill/Jill (pure) |
| 2  | 0x2D | Durahan/Durahan (pure) |
| 3  | 0x2E | Jell/Jell (pure) |
| 4  | 0x36 | Ducken/Ducken (pure) |
| 5  | 0x37 | Mocchi/Mocchi (pure) |
| 6  | 0x38 | Ape/Ape (pure) |
| 7  | 0x3F | Ghost/Ghost (pure) |
| 8  | 0x40 | Naga/Naga (pure) |
| 9  | 0x42 | Worm/Worm (pure) |
| 10 | 0x43 | Monol/Monol (pure) |
| 11 | 0x45 | Plant/Plant (pure) |
| 21 | 0x44 | Monol/sub_30 (special variant) |

When item matches: **entire candidate list is cleared**, replaced with recipe result only.

### Category 2: Breed-Pair + Unlock Flag (Recipes 12-20)

Requires specific parent breed pair + global unlock flag:

| Recipe | Parent Pair | Unlock Check | Result |
|--------|------------|-------------|--------|
| 12 | Golem x Jill | field[263][0] == 1 | Golem/sub_35 |
| 13 | Zuum x Ducken | field[263][1] == 1 | Zuum/sub_35 |
| 14 | Pixie x Niton | field[263][2] == 1 | Pixie/sub_35 |
| 15 | Dragon x Jell | field[263][3] == 1 | Dragon/sub_35 |
| 16 | Durahan x Naga | field[263][4] == 1 | Durahan/sub_35 |
| 17 | Arrow Head x Mocchi | field[263][5] == 1 | Arrow Head/sub_35 |
| 18 | Baku x Ape | field[263][9] == 1 | Baku/sub_35 |
| 19 | Mocchi x Ape | field[263][15] == 1 | Mocchi/sub_35 |
| 20 | Mock x Monol | field[263][21] == 1 | Mock/sub_35 |

Sub-breed 35 = legendary variant. The unlock flag `field[263][N]` is stored in
the active save state (accessed via active_monster/save context).

These **append** to the candidate list (do not replace it).

### Category 3: Advanced Condition Recipes (Recipes 22-27)

Multi-condition chains checking parent technique lineage:

**Recipes 22-23** (Dragon x Jell -> Dragon/sub_35):
- All 6 technique slots of the Dragon parent must originate from breed 3
  (`field[93][0..5]` all == 3, stride 40 = technique breed origin)
- All 6 technique slots of the Jell parent must originate from breed 18
- This is a "pure lineage" check -- no cross-breed techniques allowed

**Recipes 24-25** (Arrow Head x Mocchi -> Arrow Head/sub_35):
- One parent must have nature > 2 (`field[18] > 2`)
- The other must have all techniques from Arrow Head (`field[93][0..5]` all == 5)

**Recipes 26-27** (Baku x Ape -> Baku/sub_35):
- Baku parent must have all techniques from Baku (`field[93][0..5]` all == 9)
- AND all technique proficiency levels > 3 (`field[95][0..5]` all > 3)
- Paired recipes handle both parent orderings (A/B vs B/A)

---

## 5. Combining Item Effects

### Stat-Boosting Stones (Hardcoded in breeding_main)

Add +10 to the bonus term in the stat formula:

| Item ID | Name | Stat Bonus |
|---------|------|-----------|
| 0x14 (20) | PowStone | POW +10 |
| 0x15 (21) | DefStone | DEF +10 |
| 0x16 (22) | WndStone | SKI +10 |
| 0x17 (23) | SpdStone | SPD +10 |
| 0x18 (24) | IntStone | INT +10 |
| 0x19 (25) | LifStone | LIF +10 |

### Fusion Statues (Dual-Stat Items)

| Item ID | Name | Effect |
|---------|------|--------|
| 0x1F (31) | **Fureria** | DEF +10, LIF +10 |
| 0x20 (32) | **Gadamon** | POW +10, INT +10 |
| 0x21 (33) | **Buragma** | SPD +10, SKI +10 |

These are strictly superior to single stones. The +10 is additive with the
compatibility percentage in the formula:

```
Example: Gadamon + 20% compatibility
  POW = base_POW * (100 + 10 + 20) / 100 = base * 1.30
  INT = base_INT * (100 + 10 + 20) / 100 = base * 1.30
  Other stats = base * (100 + 0 + 20) / 100 = base * 1.20
```

Note: The item effects table at `0x081F1D94` contains type=3 entries for the
fusion statues that nominally represent growth grade boosts, but the handler at
`0x08060694` only processes types 1 and 2. Type 3 entries are **dead code** --
the growth grade boost is not executed. The fusion statues' only confirmed
effect is the hardcoded dual stat bonus.

### Technique Teaching Items

Processed via the effects table handler:

| Item ID | Name | Teaches |
|---------|------|---------|
| 0x1A (26) | LuckFrag | Technique #23 |
| 0x1B (27) | SeeScrol | Technique #40 |
| 0x1C (28) | DefCharm | Technique #44 |
| 0x1D (29) | VicCharm | Technique #65 |
| 0x1E (30) | EaglMask | Technique #41 |

---

## Key ROM Addresses

| Address | Description |
|---------|------------|
| `0x0805B09C` | breeding_entry (calling wrapper) |
| `0x0805FB5C` | breeding_main (core combining logic) |
| `0x080603D4` | breed candidate dispatcher |
| `0x08002B28` | combine_breed_ids(main, sub) |
| `0x0805FF28` | compatibility score calculator |
| `0x08060694` | combining item effects handler |
| `0x080605F0` | recipe condition evaluator |
| `0x081C79D4` | __aeabi_idiv (software division) |
| `0x081E88C0` | BREED_COMBO_TABLE (30x40 int16) |
| `0x081E9224` | Breed type affinity table (30 bytes) |
| `0x081F188C` | Legendary recipe table (27 entries) |
| `0x081F1D94` | Combining item effects table (14 entries) |
| `0x08208CB0` | Breed data table |
