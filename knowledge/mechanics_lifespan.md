# MRA2 Lifespan, Aging & Growth Curve Mechanics

> How long your monster lives, what makes it age faster, and why timing your training matters.

---

## Lifespan Basics

Every monster has a fixed pool of lifespan points set at birth. The game tracks two lifespan values internally:
- **Lifespan A** (field 0x16): The total/reference lifespan, set at birth
- **Lifespan B** (field 0x17): A running counter that increases as life is spent

The difference between these two values determines the monster's aging stage. Both are modified by sparring fatigue deltas, but only Lifespan B is affected by the weekly drain formula.

### Lifespan by Breed

All 194 monster types have a base lifespan between **2370 and 2800 points** (roughly 237 to 280 weeks, or 4.5 to 5.4 in-game years).

| Category | Lifespan (weeks) | Number of Breeds | Notes |
|----------|-----------------|-----------------|-------|
| Short-lived | 237-244 | 16 | Some Pixie/Jell sub-breeds |
| Below average | 245-254 | 51 | Common for lighter breeds |
| Average | 255-264 | 56 | Most monster types fall here |
| Above average | 265-274 | 28 | Sturdier breeds |
| Long-lived | 275-280 | 1 | Monster #22 at 280 weeks |

The spread between shortest and longest-lived breeds is only about 18%. Breed choice matters less for lifespan than *how you raise the monster*.

---

## Aging Stage (0-15)

The game calculates an aging stage from 0 to 15 each week. This drives the growth rate lookup.

**Formula:**
```
aging_stage = clamp( (lifespan_A - lifespan_B) * 16 / lifespan_A, 0, 15 )
```

- Stage 15 = just born (lifespan_B is near 0)
- Stage 0 = near death (lifespan_B has nearly caught up to lifespan_A)

**Trait override:** If the monster has trait 0x3E (likely "Baby" or "Stunted"), the aging stage is forced to 1 regardless of actual age, permanently locking the monster into a low-growth state.

---

## Growth Curves: 6 Types

Each breed has a **growth curve type** (stored as field 0x13, values 0-5) that determines when during its life the monster grows fastest. The aging stage indexes into a 6x16 lookup table at ROM `0x083F3E20`.

### Full Growth Rate Table

Values are growth multipliers (10 = minimum, 30 = maximum):

| Stage → | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
|---------|---|---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|
| **0: Early Peak** | 10 | 15 | 20 | 25 | 28 | **30** | 28 | 25 | 20 | 20 | 20 | 18 | 16 | 14 | 12 | 10 |
| **1: Mid-Early** | 10 | 14 | 18 | 22 | 26 | 29 | **30** | 29 | 25 | 22 | 20 | 18 | 16 | 14 | 12 | 10 |
| **2: Mid** | 10 | 13 | 16 | 21 | 24 | 26 | 28 | **30** | 28 | 25 | 22 | 20 | 18 | 16 | 13 | 10 |
| **3: Mid-Late** | 10 | 12 | 14 | 17 | 20 | 23 | 26 | 28 | **30** | 28 | 26 | 24 | 22 | 20 | 17 | 12 |
| **4: Late Bloom** | 10 | 12 | 14 | 16 | 18 | 20 | 22 | 25 | 27 | 29 | **30** | 29 | 26 | 23 | 20 | 17 |
| **5: Balanced** | 10 | 13 | 17 | 21 | **25** | 25 | 25 | 25 | 25 | 25 | 24 | 22 | 20 | 18 | 16 | 14 |

### Growth Curve Strategy Guide

| Type | Peak Timing | Strategy |
|------|-------------|----------|
| Early Peak (0) | First ~30% of life | Train hard immediately; every week of delay wastes your best window |
| Mid-Early (1) | First ~40% of life | Push hard in first year, ease off second half |
| Mid (2) | Middle of life | Steady training throughout works well |
| Mid-Late (3) | Second half | Patient approach; light early, heavy later |
| Late Bloom (4) | Last ~35% of life | Light training early; save best coaches for when curve peaks |
| Balanced (5) | Consistent (25 plateau) | Any strategy works; most forgiving to raise |

**Competitive impact:** Matching training intensity to your growth window yields **up to 3x more stat gain per week** at peak vs. trough (30 vs. 10 growth rate). Over a lifetime, this translates to 20-30% more total stats if you time it right.

---

## Weekly Lifespan Drain Formula

Every week, the game runs the weekly stat update function (0x0801FCFC). This is the core lifespan drain calculation:

### Step 1: Get Growth Rate
```
growth_rate = growth_table[growth_type][aging_stage]   // 10-30
```

### Step 2: Check for Food Bonus
The game scans your inventory for food items (type 6). If a matching food item is found:
```
food_bonus = item_bonus_value   // from item descriptor table
food_bonus_scaled = food_bonus * 5 * 2 + 10   // for Lifespan A
food_bonus_scaled = food_bonus * 5 * 2 + 5    // for Lifespan B
```
If no food item found or activity is tournament/expedition, food_bonus = 0.

### Step 3: Compute Random Drain Component
```
base = growth_rate - 20
if base > 0:
    random_component = prng_byte() % (growth_rate - 19)    // positive
else:
    random_component = -(prng_byte() % (-base + 1))        // zero or negative
```

### Step 4: Apply Base and Combine
```
if field_0xFB == 1:    // special condition flag
    total = food_bonus_scaled + random_component * 10 + 400
else:
    total = food_bonus_scaled + random_component * 10 + 500
```

### Step 5: Trait Modifier
```
if monster has trait 0x33:
    total = total * 150 / 100    // 50% MORE drain
```

### Step 6: Apply Drain
```
lifespan_B += total   // (applied as negative via field_modify_clamped)
```

A similar calculation runs for Lifespan A but uses `growth_rate / 2` instead and a +5 base offset instead of +10.

### What This Means in Practice

Under ideal conditions (no food bonus, no trait 0x33, normal flag):
- **Base weekly drain ≈ 500 points** to Lifespan B
- With growth rate at peak (30), the random component adds 0-10 extra per week
- With growth rate at minimum (10), the random component is negative, slightly reducing drain
- **Trait 0x33 increases drain by 50%** -- avoid this trait for longevity
- The food bonus from correct food slightly offsets the drain

---

## Money Drain

Each non-rest week, the monster costs money:
```
weekly_money_cost = (prng_byte() & 3) + 7   // 7-10 gold per week
```
This is applied to field 0x31 (money/upkeep counter).

---

## Retirement / Death Trigger

When the monster is resting (activity = 1) and the game detects:
- Both Lifespan A (field 0x1B) == 0 AND Lifespan B (field 0x19) == 0

Then the game checks a trait condition:
- If trait check (field_51, index 3) > 2: set field 0x1A = 5 (triggers retirement sequence)
- Otherwise: set field 0x1A = 0

The retirement warning appears when the monster's aging stage reaches very low values (0-1), signaling that remaining lifespan is nearly depleted.

### Fatigue-Based Extra Aging at Milestones

The weekly update also adds extra fatigue based on lifespan thresholds:

| Lifespan B Value | Extra Fatigue per Week |
|------------------|----------------------|
| ≤ 99 | +2 (on top of base +1) |
| 100-199 | +1 |
| 200-299 (0x12B) | +1 (50% chance, random) |
| 300-399 (0x18F) | +1 (25% chance, random) |
| ≥ 400 | None extra |

This means older monsters accumulate fatigue faster, making training less effective in their final weeks.

---

## Practical Raising Strategy

1. **Identify your monster's growth curve** -- this determines when to push hardest
2. **Time training to the growth window** -- at peak (30 growth rate), every drill is 3x as effective as at trough (10)
3. **Minimize sparring** -- each sparring costs 27-45 lifespan points directly off both lifespan fields
4. **Avoid trait 0x33** -- it increases weekly lifespan drain by 50%
5. **Feed correctly** -- the food bonus offsets some weekly drain
6. **Watch for the aging cascade** -- once aging stage drops, growth rate drops, and fatigue accumulates faster, creating a downward spiral
7. **Rest before combining** -- stress below 24 gives best offspring quality
