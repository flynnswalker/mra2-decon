# MRA2 Tournament & Rank System Analysis

Reverse-engineered from the USA ROM (CRC32: 1D695B1B).

---

## 1. Activity State Machine (Field 0x18, offset 0x98)

The weekly dispatch at `0x0802C570` uses field 0x18 as an 8-state switch:

| State | Handler Address | Purpose |
|-------|----------------|---------|
| 0 | `0x0802C5C8` | Normal training week — checks for random events/injuries via `0x0802E0EC` |
| 1 | `0x0802C7C8` | Idle / transition (return) |
| 2 | `0x0802C5E8` | Training event processing |
| 3 | `0x0802C7C8` | Idle / transition (return) |
| 4 | `0x0802C69C` | **Tournament entry** — starts or continues a tournament |
| 5 | `0x0802C6F4` | **Tournament result** — applies win/loss rewards |
| 6 | `0x0802C7C8` | Idle / transition (return) |
| 7 | `0x0802C764` | **Errantry/adventure result** — applies adventure rewards |

Jump table located at `0x0802C5C4` (8 × 32-bit pointers).

---

## 2. Key Fields (Game State Schema)

| Field | Offset | Type | Max | Name | Role in Tournament System |
|-------|--------|------|-----|------|---------------------------|
| 0x18 | 0x0098 | u16 | 8 | `activity_state` | Current weekly activity type |
| 0x19 | 0x009A | u32 | 999 | `rank_points` | Accumulated fame/rank progression points |
| 0x1A | 0x009C | i8 | 15 | `mood_delta` | Mood modifier (adjusted by tournament results) |
| 0x1B | 0x009E | u32 | 999 | `stat_total` | Aggregate stat total used for rank calculations |
| 0x1C | 0x00A0 | u32 | 999 | `money_delta` | Weekly money change (prizes deposited here) |
| 0x1D | 0x00A2 | i8 | 100 | `fatigue` | Fatigue level (decremented by tournament wins) |
| 0x1E | 0x00A3 | u16 | 100 | `loyalty` | Loyalty/mood — decreased by 2 each tournament week |
| 0x1F | 0x00A4 | i8 | 100 | `fame` | Fame/reputation — input to prize calculation |
| 0x31 | 0x00BC | u16 | 99 | `tournament_counter` | Tracks wins in current tournament (0 = entering/lost) |
| 0x71 | — | func | — | `active_monster_ptr` | Indirect accessor for active monster struct |
| 0xB3[0x1E] | — | — | — | `rank_up_flag` | Tournament completion flag (1 = eligible, 2 = rank up) |
| 0xB3[0x1F] | — | — | — | `special_tournament_type` | 1 = stray encountered, 2 = special cup |
| 0xB3[0x20] | — | u8 | 5 | `current_rank` | **Rank value: 0=E, 1=D, 2=C, 3=B, 4=A, 5=S** |
| 0xBB | — | — | — | `tournament_eligible` | Whether monster can enter tournaments this month |
| 0xAC | — | — | — | `months_elapsed` | Incremented each end-of-month |

---

## 3. Rank System

### 3.1 Rank Values

Stored in field `0xB3[0x20]`:

| Value | Rank | Notes |
|-------|------|-------|
| 0 | E | Starting rank |
| 1 | D | |
| 2 | C | Below this, special "stray eligible" flag (field 0xB1[0x53]) is set |
| 3 | B | |
| 4 | A | |
| 5 | S | Maximum normal rank |

### 3.2 Rank Lookup (0x0800A9BC)

```
get_current_rank():
  if field_0xB3[0x1F] == 1: return 4   // Stray encounter → treated as A-rank
  if field_0xB3[0x1F] == 2: return 5   // Special cup → treated as S-rank
  return field_0xB3[0x20]              // Normal rank
```

### 3.3 Rank Progression (0x0802DEE8 → 0x0802DF46)

Rank advancement occurs at the end of each month during the weekly processing function at `0x0802D924`.

The check at `0x0802DEE8`:
1. Read `field_0xB3[0x1E]` (rank-up flag)
2. If flag == 1: Reset flag to 0, clear special tournament flag, set `field_0xB1[0x53] = 2`
3. If flag == 2: **RANK UP** — increment `field_0xB3[0x20]` by 1, clear flag
   - If new rank ≤ 2 (C or below): set `field_0xB1[0x53] = 1` (stray eligibility)

The rank-up flag is set to 2 when the player wins the rank-appropriate official tournament.

### 3.4 Fatigue Tier Function (0x08000654)

This function reads field 0x1D (fatigue, signed byte) and returns a tier used for stat gain scaling:

| Fatigue Range | Tier | Meaning |
|---------------|------|---------|
| > 74 | 0 | Very well-rested (great gains) |
| 45–74 | 1 | Rested (good gains) |
| 15–44 | 2 | Normal |
| -14 to +14 | 3 | Neutral |
| -43 to -15 | 4 | Tired |
| -74 to -44 | 5 | Exhausted |
| < -74 | 6 | Severely overworked |

---

## 4. Tournament Flow

### 4.1 Entry (State 4 → 0x0802C69C)

```
if field_0x31 (tournament_counter) == 0:
    // First entry — register for tournament
    set field_0x18 = 1  (back to idle, scene plays)
    play_sound(0x78, 0x8C)
    show_scene(0x083F1FB0)  // Tournament registration scene
else:
    // Continuing tournament (battle this week)
    field_0x1E -= 2  (loyalty decreases)
    show_scene(0x083F1FA0)  // Pre-battle scene
```

### 4.2 Battle Setup (0x0806439C)

```
tournament_battle_setup(player_index):
    init_battle_state(player_index)     // 0x0806431C
    remove_from_roster(player_index)    // 0x08062AB4 — removes from WRAM slot array at 0x0200DE60
    set_player_flag(player_index, 0)    // 0x080644AC
    finalize_setup(player_index)        // 0x080644E8
```

The roster array at `0x0200DE60` holds up to 10 participant IDs (4 bytes each), with a count at `+0x28`.

Battle state base: `0x0201E2E0`, each entry is 264 bytes (`(index * 33) * 8`).

### 4.3 Result — Win (State 5 → 0x0802C6F4)

```
if field_0x31 (tournament_counter) != 0:  // Won match(es)
    field_0x1E -= 2                       // Loyalty cost
    fame_value = field_read(field_0x1F)   // Read current fame
    prize_tier = fame_to_prize(fame_value) // 0x08024DF0
    prize = prize_tier * 2 / 3
    field_modify(field_0x1C, -prize)      // Money earned (negative delta = gain for this field)
    show_scene(0x083F1FD0)                // Win scene
```

### 4.4 Result — Loss (State 5 → 0x0802C6F4, counter == 0)

```
if field_0x31 == 0:  // Lost all matches
    set field_0x18 = 1  // Return to idle
    show_scene(...)     // Loss scene
```

### 4.5 Errantry Result (State 7 → 0x0802C764)

Same prize logic as tournament wins, applied to errantry/adventure outcomes.

---

## 5. Prize Money System

### 5.1 Fame-to-Prize Lookup (0x08024DF0)

Input: fame value (field 0x1F, signed -100 to +100)
Output: random value in a tier-specific range

**Fame Tier Mapping:**

| Fame Value | Tier | Min PRNG | Max PRNG |
|------------|------|----------|----------|
| < -80 | 0 | 30 | 50 |
| -80 to -41 | 1 | 50 | 70 |
| -40 to -11 | 2 | 70 | 90 |
| -10 to +10 | 3 | 90 | 110 |
| +11 to +40 | 4 | 110 | 130 |
| +41 to +80 | 5 | 130 | 150 |
| > +80 | 6 | 150 | 200 |

Table at `0x083F3ED8` (14 byte-pairs — first 7 for tournaments, second 7 for errantry).

### 5.2 Final Prize Calculation

For tournaments:
```
raw_prize = PRNG_in_range(tier_min, tier_max)
final_prize = raw_prize * 2 / 3
```

| Fame Tier | Approx Prize Range (G) |
|-----------|----------------------|
| 0 (terrible) | 20–33 |
| 1 (bad) | 33–46 |
| 2 (poor) | 46–60 |
| 3 (neutral) | 60–73 |
| 4 (good) | 73–86 |
| 5 (great) | 86–100 |
| 6 (excellent) | 100–133 |

**Note**: These are per-week prizes for individual match wins, not total tournament payouts.

### 5.3 Errantry Prize Table (second half of 0x083F3ED8)

| Tier | Min | Max |
|------|-----|-----|
| 0 | 100 | 130 |
| 1 | 80 | 100 |
| 2 | 70 | 90 |
| 3 | 60 | 90 |
| 4 | 80 | 100 |
| 5 | 120 | 150 |
| 6 | 150 | 200 |

---

## 6. End-of-Month Stat Gains & Penalties (0x0802D924)

This large function (`0x0802D924`, 679 instructions) runs at the end of each month. It processes:

### 6.1 Stat Total Penalty (Field 0x1B)

Based on current stat total, applies a training efficiency penalty to field 0x17:

| Stat Total (0x1B) | Delta Applied |
|--------------------|---------------|
| ≤ 299 | 0 (no penalty) |
| 300–499 (+0xC8 from 0x12B) | -2 |
| 500–699 | -6 |
| 700–899 | -12 |
| > 899 | -20 |

### 6.2 Rank Points Penalty (Field 0x19)

Same threshold structure applied to rank points:

| Rank Points (0x19) | Delta Applied |
|---------------------|---------------|
| ≤ 299 | 0 |
| 300–499 | -2 |
| 500–699 | -6 |
| 700–899 | -12 |
| > 899 | -20 |

### 6.3 Money Penalty (Field 0x1C)

```
if money_delta (field_0x1C) ≤ 100:
    field_0x17 -= 5
```

### 6.4 Tournament Win Rewards (input arg == 1)

When the month ends with a tournament victory:
- `field_0x1B += (PRNG % 21) + 140` (stat total boost: 140–160)
- `field_0x1C += -((PRNG % 21) + 120)` (money reward: 120–140G, negative delta = gain)
- `field_0x1D -= 1` (fatigue decreases)
- `field_0x1F -= 3` (fame decreases by 3)
- Rank points: `base = (PRNG % 41) + 160`, if field 0xFB == 1: `base = base * 15 * 8 / 100` (120% boost), if field 0x55 active: `base *= 2`
- `field_0x19 += base` (rank points gained: ~160–200 base, up to ~384 with multipliers)

### 6.5 Tournament Loss Rewards (input arg == 0)

Same structure as win but with different scaling for rank points based on fatigue tier:

| Fatigue Tier | Rank Points Formula |
|--------------|---------------------|
| 4 (tired) | (PRNG % 11) + 10 |
| 5 (exhausted) | (PRNG % 21) + 30 |
| 6 (overworked) | (PRNG % 21) + 50 |

### 6.6 Errantry Rewards (input arg == 2)

Same stat boost and money reward as tournament wins (+140–160 stat total, +120–140G money). Same rank point calculation with PRNG and multiplier checks.

---

## 7. Stray/Wild Monster Generation

### 7.1 Stray Encounter Check (0x0802CC88)

Called during training weeks from state 0/2. Determines if a stray monster appears.

**Requirements:**
- `stat_total (field 0x1B)` > 499
- `rank_points (field 0x19)` > 699

**Scoring:**
```
rand1 = PRNG()
rand2 = PRNG()
score = (rand1 & 3) * 100 + stat_total - 1200 + rank_points + (rand2 & 7) * 100
```

**Outcomes:**

| Score | Result | Effect |
|-------|--------|--------|
| ≤ 999 | 0 | No encounter |
| 1000 | 0x08 | Common stray |
| 1001–1399 | 0x10 | Rare stray (triggers NPC event via field 0xB3[0x1F]) |
| ≥ 1400 | 0x18 | Ultra-rare stray (triggers NPC event) |

When an encounter triggers at tier 0x10 or 0x18, and `get_rank() ≤ 2` (rank C or below), the game also triggers `field_0xB3[0x1F] = 2` and fires NPC-related functions.

### 7.2 Training Random Event (0x0802E0EC)

Similar encounter check during training, for injuries or special events.

**Requirements:**
- `stat_total (field 0x1B)` > 699 (0x2BB)
- `rank_points (field 0x19)` > 499 (0x1F3)
- Field 0xFB/0xFC checks (event cooldown system)

**Scoring:**
```
score = (PRNG & 7) * 10 + stat_total - 1200 + rank_points + (PRNG & 3) * 10
```

**Outcomes:**

| Score | Result |
|-------|--------|
| ≤ 99 | No event |
| 100–119 | Tier 0x08 (minor event) |
| 120–139 | Tier 0x10 (medium event) |
| > 139 | Tier 0x18 (major event) |

---

## 8. Opponent Monster Generation (0x08034EB0)

Used for creating tournament opponent monsters from roster data entries.

### 8.1 Roster Entry Structure

Each opponent is defined by a ~0xC4-byte roster entry:

| Offset | Size | Field |
|--------|------|-------|
| +0x00 | 22 | Base values (12 × uint16, copied to monster raw data) |
| +0x3C | 2 | POW growth multiplier |
| +0x3E | 2 | INT growth multiplier |
| +0x40 | 2 | SKI growth multiplier |
| +0x42 | 2 | SPD growth multiplier |
| +0x44 | 2 | DEF growth multiplier |
| +0x46 | 2 | LIF growth multiplier |
| +0x68 | 12 | Stat slots (6 × uint16: POW/INT/SKI/SPD/DEF/LIF) |
| +0x84 | 4 | Technique flags bitmask |
| +0xB0 | 1 | Main breed ID |
| +0xB1 | 1 | Sub breed ID (>0x13 = use main breed as pure) |
| +0xC0 | 4 | Additional technique mask |

### 8.2 Generation Process

```
generate_opponent(roster_entry, output_monster):
    1. If sub_breed_id ≤ 0x13:
         combo = combine_breed_ids(main, sub)
       Else:
         combo = combine_breed_ids(main, main)  // Pure breed
    2. monster_init(output_monster, combo)       // Base stats from type table
    3. Copy 22 bytes from roster_entry to monster (raw stat data)
    4. For each of 6 stats:
         stat += growth_value / 10   // Growth applied as percentage
         clamp stat to 250 (0xFA)    // Hard cap
    5. OR technique bitmasks into monster's technique flags
    6. Assign technique slots via lookup function (0x080352B0)
```

**Stat Cap**: All opponent stats are hard-capped at **250** during generation.

### 8.3 Breeding Monster Init (0x0805FB5C)

The second `monster_init` caller at `0x0805FBAA` is part of the **breeding system** (not tournament-related). It:
- Calls `breed_candidate_dispatcher(parentA, parentB, item, output)` at `0x080603D4`
- Initializes offspring monsters with breed combo lookup
- Inherits techniques from parents (if parent field 0x15 > 48)
- Applies compatibility-based stat bonuses using item type checks
- Stats capped at 255 (0xFF) for bred monsters

---

## 9. Scene Table (Tournament Dialog/Cutscene Pointers)

Scene descriptor tables used by the tournament handlers (16 bytes each: 3 pointers + null terminator):

| Address | Scene Pointers | Used By |
|---------|---------------|---------|
| `0x083F1F80` | `0x0802D17D, 0x0802CB21, 0x0802D289` | Training result |
| `0x083F1F90` | `0x0802D29D, 0x0802D311, 0x0802D349` | Training event |
| `0x083F1FA0` | `0x0802D359, 0x0802D381, 0x0802D3B1` | Tournament pre-battle |
| `0x083F1FB0` | `0x0802D3C1, 0x0802D3E9, 0x0802D499` | Tournament registration |
| `0x083F1FC0` | `0x0802D4A9, 0x0802CBD5, 0x0802D4D1` | Tournament continuation |
| `0x083F1FD0` | `0x0802D531, 0x0802D559, 0x0802D589` | Tournament win |
| `0x083F1FE0` | `0x0802D599, 0x0802D5C1, 0x0802D671` | Tournament special |
| `0x083F1FF0` | `0x0802D681, 0x0802D6A9, ...` | Errantry loss (4 ptrs) |
| `0x083F2008` | `0x0802D7A1, 0x0802D7C9, 0x0802D879` | Errantry result |

These are script/dialog data blobs, not THUMB code (odd addresses = Thumb bit set on data).

---

## 10. Battle State Structure

- **Base address**: `0x0201E2E0` (WRAM)
- **Entry size**: 264 bytes per combatant
- **Max entries**: 2 (player index 0 or 1)
- **Computed as**: `base + (index * 33 * 8)`

---

## 11. Summary of Key Functions

| Address | Name | Purpose |
|---------|------|---------|
| `0x0802C570` | `weekly_dispatch` | Main weekly activity processor (8-state switch) |
| `0x0802C69C` | `tournament_entry` | Tournament registration / continue handler |
| `0x0802C6F4` | `tournament_result` | Tournament win/loss reward handler |
| `0x0802C764` | `errantry_result` | Errantry reward handler |
| `0x0802CC88` | `stray_encounter_check` | Checks if stray monster appears during training |
| `0x0802D924` | `end_of_month_processing` | Major end-of-month function: stat penalties, rank up, rewards |
| `0x0802E0EC` | `training_event_check` | Checks for random training events/injuries |
| `0x08024DF0` | `fame_to_prize` | Converts fame value to prize amount via PRNG range table |
| `0x0800A9BC` | `get_rank` | Reads current rank (0-5) with special tournament overrides |
| `0x0800A9FC` | `set_rank` | Writes rank value to field 0xB3[0x20] |
| `0x08000654` | `fatigue_tier` | Converts fatigue to 7-tier scale for stat gain multipliers |
| `0x08034EB0` | `generate_opponent` | Creates tournament opponent from roster data entry |
| `0x0805FB5C` | `breed_monster` | Creates bred monster from parents (not tournament-related) |
| `0x0806439C` | `tournament_battle_setup` | Initializes battle state for tournament fight |
| `0x08062AB4` | `remove_from_roster` | Removes participant from active roster array |
| `0x083F3ED8` | — | Fame→prize PRNG range table (14 byte-pairs) |
| `0x0200DE60` | — | Tournament roster slot array (10 entries × 4 bytes, WRAM) |
| `0x0201E2E0` | — | Battle state base (264 bytes per entry, WRAM) |
