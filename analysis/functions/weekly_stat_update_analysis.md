# Weekly Stat Update - Detailed Analysis

**Function address:** `0x0801FCFC`  
**Size:** 310 instructions  
**Called:** Once per week as part of the weekly game tick

---

## Register Allocation Summary

| Register | Usage |
|----------|-------|
| r5 | Monster record base pointer (persistent) |
| r6 | `aging_rate` (growth rate from aging lookup table) |
| r7 | `errand_bonus` (extra lifespan cost when on errand) |
| r8 | `old_lifespan_1b` (field 0x1B value at start of function) |
| r4 | Scratch / computed drain value |

---

## Complete Pseudocode

```c
void weekly_stat_update(void)
{
    // === SECTION 1: INITIALIZATION ===
    // 0x0801FCFC - 0x0801FD28

    uint8_t* monster = get_current_monster_base();             // bl #0x8002530

    int record_71 = field_read(monster, 0x71, 0);             // field 0x71 - the full monster record / sub-record
    int growth_curve = field_read(monster, 0x13, 0);          // field 0x13 - growth curve type (0-5)

    int aging_stage = compute_aging_stage(record_71);          // bl #0x80027AC
    int aging_rate = aging_lookup(growth_curve, aging_stage);  // bl #0x8024DA8
    // aging_rate comes from the table at 0x083F3E20
    // Indexed by [growth_curve][aging_stage]

    int old_lifespan_1b = field_read(monster, 0x1B, 0);       // save field 0x1B for later fatigue calc


    // === SECTION 2: ERRAND BONUS CALCULATION (for lifespan drain) ===
    // 0x0801FD36 - 0x0801FD68
    // If the monster is NOT on expedition (4) or tournament (6),
    // check if there's an active errand (slot 6) and compute a bonus.

    int errand_bonus_1b = 0;

    int activity = field_read(monster, 0x18, 0);              // activity state
    if (activity != 4 && activity != 6) {
        int errand_slot = game_state_lookup(6);               // bl #0x8002538
        if (errand_slot >= 0) {
            // errand_slot * 5 * 4 = errand_slot * 20
            errand_bonus_1b = errand_slot * 20 + 10;
            // Formula: errand_slot * 4 => r0; r0 + errand_slot => r0 (=5*slot);
            // r0 << 2 => r0 (=20*slot); +10
        }
    }


    // === SECTION 3: LIFESPAN DRAIN (field 0x1B) ===
    // 0x0801FD6A - 0x0801FDF0
    // This section computes the weekly drain on field 0x1B (lifespan counter A).

    int base_drain = aging_rate - 20;   // 0x0801FD6C: subs r4, #0x14

    int random_drain;
    if (base_drain > 0) {
        // aging_rate > 20: monster is aging (positive drain)
        // random_drain = PRNG_byte() % (aging_rate - 19)
        //              = random value in [0 .. aging_rate - 20]
        random_drain = PRNG_byte() % (aging_rate - 19);
    } else {
        // aging_rate <= 20: monster is growing (negative drain = gaining lifespan)
        // random_drain = -(PRNG_byte() % (-base_drain + 1))
        //              = -(PRNG_byte() % (21 - aging_rate))
        // Results in a value in [-(20 - aging_rate) .. 0]
        random_drain = -(PRNG_byte() % (-base_drain + 1));
    }

    // Check field 0xFB (field 251) - possibly a "reduced lifespan drain" flag
    int flag_fb = field_read(monster, 0xFB, 0);

    int total_drain_1b;
    if (flag_fb == 1) {
        // Reduced drain path
        // errand_component = errand_bonus_1b * 10   (lsl #2, add, lsl #1 = x*5*2 = x*10)
        // random_component = random_drain * 10
        // total = errand_component + random_component + 400
        total_drain_1b = errand_bonus_1b * 10 + random_drain * 10 + 400;
    } else {
        // Normal drain path
        // errand_component = errand_bonus_1b * 10
        // random_component = random_drain * 10
        // total = errand_component + random_component + 500
        total_drain_1b = errand_bonus_1b * 10 + random_drain * 10 + 500;
    }

    // Check field 0x33 via special lookup (possibly item/food effect)
    int item_effect = some_lookup(monster, 0x33);             // bl #0x800D3A8
    if (item_effect != -1) {
        // Apply item modifier: drain = drain * 150 / 100 = drain * 1.5
        total_drain_1b = total_drain_1b * 150 / 100;         // signed division
    }

    // Apply drain to field 0x1B (subtract from lifespan)
    // Note: the drain is NEGATED before applying (field_modify_clamped subtracts)
    field_modify_clamped(monster, 0x1B, -total_drain_1b, 0);


    // === SECTION 4: ERRAND BONUS CALCULATION (for lifespan drain 0x19) ===
    // 0x0801FDF4 - 0x0801FE24
    // Identical structure to section 2 but with different final value

    int errand_bonus_19 = 0;

    activity = field_read(monster, 0x18, 0);
    if (activity != 4 && activity != 6) {
        int errand_slot = game_state_lookup(6);
        if (errand_slot >= 0) {
            // errand_slot * 5 * 2 = errand_slot * 10
            errand_bonus_19 = errand_slot * 10 + 5;
        }
    }


    // === SECTION 5: LIFESPAN DRAIN (field 0x19) ===
    // 0x0801FE26 - 0x0801FEAC
    // This section computes the weekly drain on field 0x19 (lifespan counter B).
    // Uses HALF the aging_rate compared to field 0x1B.

    // half_aging_rate = aging_rate / 2 (with rounding toward zero for negatives)
    int half_aging_rate = aging_rate / 2;  // 0x0801FE26-2A: lsrs r0,r6,#0x1f; adds; asrs #1

    int base_drain_19 = half_aging_rate - 10;

    int random_drain_19;
    if (base_drain_19 > 0) {
        // random_drain_19 = PRNG_byte() % (half_aging_rate - 9)
        random_drain_19 = PRNG_byte() % (half_aging_rate - 9);
    } else {
        // random_drain_19 = -(PRNG_byte() % (-base_drain_19 + 1))
        random_drain_19 = -(PRNG_byte() % (-base_drain_19 + 1));
    }

    int total_drain_19;
    flag_fb = field_read(monster, 0xFB, 0);
    if (flag_fb == 1) {
        // Reduced drain: errand*10 + random*10 + 200
        total_drain_19 = errand_bonus_19 * 10 + random_drain_19 * 10 + 200;
        // Note: 0xC8 = 200 (NOT shifted here, just adds #0xC8)
    } else {
        // Normal drain: errand*10 + random*10 + 250
        total_drain_19 = errand_bonus_19 * 10 + random_drain_19 * 10 + 250;
        // Note: 0xFA = 250
    }

    // Same item effect check as above
    item_effect = some_lookup(monster, 0x33);
    if (item_effect != -1) {
        total_drain_19 = total_drain_19 * 150 / 100;         // drain * 1.5
    }

    // Apply drain to field 0x19
    field_modify_clamped(monster, 0x19, -total_drain_19, 0);


    // === SECTION 6: FIELD 0x31 (UNKNOWN COUNTER) WEEKLY DECAY ===
    // 0x0801FEB0 - 0x0801FED0
    // Only happens when activity is NOT rest (1)

    activity = field_read(monster, 0x18, 0);
    if (activity != 1) {
        // Decrease field 0x31 by a random amount in [7..10]
        int decay = (PRNG_byte() & 3) + 7;   // random 0-3, then +7
        field_modify(monster, 0x31, -decay, 0);
    }


    // === SECTION 7: REST-SPECIFIC LOGIC (fatigue, stress, loyalty, flags) ===
    // 0x0801FED4 - 0x0801FFA0
    // This entire block only executes when activity == 1 (rest)

    activity = field_read(monster, 0x18, 0);
    if (activity != 1) goto skip_rest_block;

    // Check global flag at 0x0200A2F3 - if nonzero, skip rest logic
    if (*(uint8_t*)0x0200A2F3 != 0) goto skip_rest_block;


    // --- SECTION 7a: Death flag / field 0x1A increment ---
    // 0x0801FEEA - 0x0801FF2C
    // If both lifespan counters are zero, start incrementing the death counter

    int lifespan_1b = field_read(monster, 0x1B, 0);
    int lifespan_19 = field_read(monster, 0x19, 0);

    if (lifespan_1b == 0 && lifespan_19 == 0) {
        // Both lifespan counters depleted!
        // Read field 0x33 arr_idx=3 twice (second read used for comparison)
        int val_33_3 = field_read(monster, 0x33, 3);
        val_33_3 = field_read(monster, 0x33, 3);    // read again (possibly compiler artifact)

        int death_increment;
        if (val_33_3 > 2) {
            death_increment = 5;
        } else {
            death_increment = 0;
        }

        // Increment field 0x1A (death/flags counter) by 0 or 5
        field_modify_clamped(monster, 0x1A, death_increment, 0);
    }


    // --- SECTION 7b: FATIGUE ACCUMULATION (field 0x1D) ---
    // 0x0801FF2E - 0x0801FF94
    // Base: always +1 fatigue per week when resting
    // Additional fatigue depends on old_lifespan_1b thresholds

    field_modify_clamped(monster, 0x1D, 1, 0);    // +1 fatigue (base)

    if (old_lifespan_1b <= 99) {
        // Lifespan critically low (0-99): +2 additional fatigue
        field_modify_clamped(monster, 0x1D, 2, 0);
    }
    else if (old_lifespan_1b <= 199) {
        // Lifespan low (100-199): +1 additional fatigue
        field_modify_clamped(monster, 0x1D, 1, 0);
    }
    else if (old_lifespan_1b <= 299) {
        // Lifespan moderate-low (200-299): 50% chance of +1 fatigue
        if ((PRNG_byte() & 1) != 0) {
            // odd random: skip additional fatigue
        } else {
            // even random: +1 additional fatigue
            field_modify_clamped(monster, 0x1D, 1, 0);
        }
    }
    else if (old_lifespan_1b <= 399) {
        // Lifespan moderate (300-399): 25% chance of +1 fatigue
        if ((PRNG_byte() & 3) == 0) {
            field_modify_clamped(monster, 0x1D, 1, 0);
        }
    }
    // else: lifespan >= 400: no additional fatigue


    // --- SECTION 7c: STRESS ACCUMULATION (field 0x1E) ---
    // 0x0801FF96 - 0x0801FF9E

    field_modify_clamped(monster, 0x1E, 1, 0);     // +1 stress per rest week


    // === END OF REST-SPECIFIC BLOCK ===
skip_rest_block:


    // === SECTION 8: LOYALTY / MOOD DRAIN (field 0x1C) ===
    // 0x0801FFA2 - 0x0801FFBA
    // This runs EVERY week regardless of activity state

    int loyalty = field_read(monster, 0x1F, 0);     // current mood/loyalty (0-100)
    int loyalty_drain = loyalty_lookup(loyalty);      // bl #0x8024DF0
    // Converts current loyalty to a drain amount (higher loyalty = more drain?)

    field_modify_clamped(monster, 0x1C, -loyalty_drain, 0);


    // === SECTION 9: CLEANUP ===
    // 0x0801FFBE - 0x0801FFCC

    *(uint8_t*)0x0200A2F3 = 0;   // Clear global flag

    return;
}
```

---

## Section-by-Section Breakdown

### Section 1: Initialization (0x0801FCFC - 0x0801FD28)

Reads the monster's growth curve type (field 0x13) and passes the monster's record through `compute_aging_stage()` to determine what life phase the monster is in (0-15 stages). These two values index into the aging lookup table at `0x083F3E20` to get the current `aging_rate`. This rate controls how fast the monster's lifespan depletes.

Also saves the current value of field 0x1B (lifespan counter) into `r8` for use in the fatigue threshold logic later.

### Section 2 & 4: Errand Bonus Calculation

These two sections share identical structure. If the monster is NOT on expedition (activity=4) or in a tournament (activity=6), the function checks `game_state_lookup(6)` for an active errand. If an errand is active (slot >= 0), it adds a bonus to lifespan drain:

| Section | For Field | Formula |
|---------|-----------|---------|
| Section 2 | 0x1B | `errand_slot * 20 + 10` |
| Section 4 | 0x19 | `errand_slot * 10 + 5` |

The errand bonus for 0x19 is exactly half the bonus for 0x1B, consistent with the overall pattern that field 0x19 drains at half the rate.

### Section 3: Lifespan Drain A (field 0x1B)

**Core lifespan depletion formula:**

```
base_drain = aging_rate - 20

if base_drain > 0:
    random_component = PRNG_byte() % (aging_rate - 19)      // [0 .. aging_rate-20]
else:
    random_component = -(PRNG_byte() % (21 - aging_rate))    // [-(20-aging_rate) .. 0]

if field_0xFB == 1:
    total = errand_bonus*10 + random_component*10 + 400      // reduced base
else:
    total = errand_bonus*10 + random_component*10 + 500      // normal base

if item_effect_0x33 != -1:
    total = total * 150 / 100                                 // +50% penalty

field_0x1B -= total   (clamped to valid range)
```

**Key observations:**
- The base weekly drain is **500** (or **400** if flag 0xFB is set, likely a special item or breed trait)
- When `aging_rate > 20`, the random component adds **0 to (aging_rate-20)\*10** additional drain
- When `aging_rate <= 20`, the random component *reduces* drain by **0 to (20-aging_rate)\*10**
- The item effect at field 0x33 increases drain by **50%** (multiplier 1.5)
- Since field 0x1B is a stat999 (0-999), this counter presumably starts at 999 and drains to 0

### Section 5: Lifespan Drain B (field 0x19)

Identical structure to Section 3 but uses **half** the aging rate:

```
half_rate = aging_rate / 2
base_drain = half_rate - 10

if base_drain > 0:
    random_component = PRNG_byte() % (half_rate - 9)
else:
    random_component = -(PRNG_byte() % (-base_drain + 1))

if field_0xFB == 1:
    total = errand_bonus*10 + random_component*10 + 200
else:
    total = errand_bonus*10 + random_component*10 + 250

if item_effect_0x33 != -1:
    total = total * 150 / 100

field_0x19 -= total
```

**Key observations:**
- Base drain is **250** (or **200** with flag), exactly half of field 0x1B's drain
- All scaling is halved (half aging rate, half errand bonus, half base)
- Field 0x19 is likely a secondary lifespan counter (possibly visible lifespan vs hidden lifespan)

### Section 6: Field 0x31 Decay (0x0801FEB0 - 0x0801FED0)

When the monster is NOT resting (activity != 1):
```
decay = (PRNG_byte() & 3) + 7     // random value in [7, 8, 9, 10]
field_0x31 -= decay
```

Field 0x31 (offset 0x00BC, field 49) decreases by 7-10 per non-rest week. This is likely a **training enthusiasm / willingness** counter that decays when the monster is active and recovers when resting.

### Section 7: Rest-Week Logic (0x0801FED4 - 0x0801FFA0)

Only executes when `activity == 1` (rest) AND global flag `0x0200A2F3 == 0`.

#### 7a: Death Counter (field 0x1A)

When both lifespan counters (0x1B and 0x19) reach zero:
```
if field_read(0x33, arr_idx=3) > 2:
    field_0x1A += 5
else:
    field_0x1A += 0    // no increment
```

Field 0x1A (max 15) is a **death countdown counter**. Once both lifespans are depleted, it increments by 5 each rest week (if field 0x33[3] > 2). Since max is 15, this gives roughly 3 weeks before reaching maximum (death trigger). The field 0x33[3] check may relate to the monster's condition/illness state.

#### 7b: Fatigue Accumulation (field 0x1D)

**Always:** `fatigue += 1`

**Additional fatigue based on remaining lifespan (field 0x1B at start of function):**

| Lifespan Range (0x1B) | Additional Fatigue | Total Weekly Fatigue |
|------------------------|-------------------|---------------------|
| 0 - 99                | +2 always         | 3                   |
| 100 - 199             | +1 always         | 2                   |
| 200 - 299             | +1 (50% chance)   | 1 or 2              |
| 300 - 399             | +1 (25% chance)   | 1 or 1.25 avg       |
| 400+                  | +0                | 1                   |

**Interpretation:** As the monster ages and its lifespan counter drops, it accumulates fatigue faster during rest. A young/healthy monster gains only 1 fatigue per rest week, while an elderly monster (lifespan < 100) gains 3 per week. This creates the aging mechanic where old monsters tire more quickly.

#### 7c: Stress Accumulation (field 0x1E)

```
stress += 1    // always, every rest week
```

Simple +1 stress per rest week. Stress (0-100) presumably gets reduced by other activities or items.

### Section 8: Loyalty/Mood Drain (field 0x1C)

Runs **every week** regardless of activity:
```
loyalty_value = field_read(0x1F)          // current loyalty/mood (0-100)
drain = loyalty_lookup(loyalty_value)      // 0x08024DF0
field_0x1C -= drain
```

Field 0x1C is a loyalty/mood **accumulator** (stat999, 0-999). The drain amount depends on the current loyalty level, looked up via `0x08024DF0`. Higher or lower loyalty likely produces different drain amounts from the lookup table.

### Section 9: Cleanup

Clears the global flag at `0x0200A2F3` to 0 and returns.

---

## Summary of Weekly Field Modifications

| Field | Name | Direction | When | Formula |
|-------|------|-----------|------|---------|
| 0x1B | Lifespan A | Decrease | Always | `-(errand*10 + random*10 + base)`, base=500 or 400, x1.5 if item |
| 0x19 | Lifespan B | Decrease | Always | Same structure, half the values (base=250/200) |
| 0x31 | Enthusiasm? | Decrease | Non-rest | `-(rand[7..10])` |
| 0x1A | Death counter | Increase | Rest, both lifespans=0 | `+5` if field_0x33[3]>2, else `+0` |
| 0x1D | Fatigue | Increase | Rest only | `+1` base, `+1` or `+2` extra based on lifespan tier |
| 0x1E | Stress | Increase | Rest only | `+1` flat |
| 0x1C | Loyalty accum. | Decrease | Always | `-loyalty_lookup(current_loyalty)` |

---

## Exact Threshold Constants

```
Field 0x1B base drain:      500 (normal), 400 (flag 0xFB)
Field 0x19 base drain:      250 (normal), 200 (flag 0xFB)
Item penalty multiplier:    150% (x1.5)
Aging rate pivot:           20 (for 0x1B), 10 (for 0x19)
Fatigue tier thresholds:    99, 199, 299, 399 (on field 0x1B)
Death increment:            5 (when both lifespans = 0 and field_0x33[3] > 2)
Field 0x31 weekly decay:    7-10 (uniform random)
Global flag address:        0x0200A2F3
```

---

## Observations and Game Design Notes

1. **Dual lifespan system:** The game tracks two lifespan counters (0x1B and 0x19) that drain at different rates (2:1 ratio). Both must reach zero before the death counter starts. This creates a more gradual aging curve.

2. **Errand penalty:** Sending a monster on an errand while not on expedition/tournament increases lifespan drain. The penalty scales with the errand slot index.

3. **Flag 0xFB reduces aging:** When set, the base drain drops from 500 to 400 (0x1B) or 250 to 200 (0x19) -- a 20% reduction. This is likely a breed trait or special item effect.

4. **The item/food penalty at field 0x33:** When active (not -1), it increases lifespan drain by 50%. This could be a "pushing too hard" penalty from certain training items.

5. **Fatigue scaling with age:** The progressive fatigue accumulation (1-3 per week based on lifespan remaining) is the primary mechanical representation of aging. Old monsters fatigue faster, requiring more rest, which in turn means less training time.

6. **Rest paradox:** Resting accumulates fatigue AND stress (each +1/week). This seems counterintuitive but likely represents natural aging during idle time. Other activities (training, tournaments) presumably also add fatigue/stress through different code paths, likely at higher rates.
