# MRA2 Sparring & Technique Learning Mechanics

> How sparring works, when techniques are learned, and how sparring stat gains are calculated.

---

## Technique Learning: Deterministic, Not Random

One of the most surprising findings from the ROM analysis: **technique learning is NOT probabilistic.** There is no random dice roll. Instead, the technique learning handler at `0x0800D2B0` runs a series of deterministic condition checks.

### The Technique Learning Process

When a coach's sparring can teach a technique, the game checks:

1. **Is the technique already known?** If yes, skip.
2. **Is the technique valid?** Validated against the technique table at `0x08202C00` (87 technique entries).
3. **Is the mode correct?** Different modes enable different learning paths:
   - Mode 0: Training (skips availability check)
   - Mode 2: Sparring
   - Mode 4: Battle learning
   - Mode 8: Special/event learning
4. **Is the breed eligible?** Each technique has a breed bitmask at record+4. The monster's breed must match.
5. **Is the learn condition met?** Each technique has a condition code (1-35) evaluated through a 35-entry jump table.
6. **Is there an empty technique slot?** The monster has 6 technique slots (field 0x4B, indices 0-5). An empty slot (0xFF) must be available.

If ALL conditions pass, the technique is learned immediately.

### The 35 Learn Conditions

The jump table at `tech_check_d928` evaluates conditions including:

- **Stat comparisons**: e.g., "field 0x38 differs from field 0x39" (personality divergence)
- **Stat ratio checks**: e.g., "(lifespan_B × 100) / lifespan_A > 9" (weight ratio above 9%)
- **Win record checks**: e.g., field 0x67[5] == 1 (specific battle victory)
- **Stat thresholds**: Various stats above minimum values

### What "Highly Unlikely / Hard / Good Chance / Likely" Really Means

The UI messages like "Highly Unlikely" or "Good Chance" are NOT random probabilities. They're evaluations of how close you are to meeting the deterministic condition. The condition either passes or it doesn't -- what changes between "Hard" and "Likely" is how many of the prerequisites you've satisfied.

This explains the community observation that "sometimes you learn a technique on 'Highly Unlikely' and sometimes you fail on 'Likely'" -- it's not bad luck, it's about specific hidden conditions being met or not met.

---

## Sparring Stat Gains

### How Sparring Deltas Are Computed

Sparring stat gains are calculated at **coach hiring time**, not weekly. The formula:

```
For each stat (POW, INT, ACC, SPD, DEF, LIF):
    delta = monster_current_stat - breed_base_stat
```

Where:
- `monster_current_stat` = your monster's current value for that stat (0-999)
- `breed_base_stat` = the breed's starting stat value from the monster type table (typically 40-175)

The delta is clamped to int8 range (-128 to +127) and applied every week during the sparring period.

### What This Means

- **If your monster's stat is higher than the breed base**: you get a POSITIVE weekly gain (stat increases)
- **If your monster's stat is lower than the breed base**: you get a NEGATIVE weekly delta (stat DECREASES)
- **The gain is proportional to how far above the base you are**, up to the +127 cap

This explains community reports of "+18 POW when losing badly vs +43 POW when doing well" -- the sparring outcome doesn't directly determine stat gain. Instead, it's the relationship between your monster's current stats and its breed's base stats that determines the weekly delta.

### Practical Implication

Train your stats above the breed base BEFORE sparring. If you spar too early (when stats are near or below the breed base), you'll gain little or nothing -- and could even lose stats. This strongly supports the community advice of "TRAIN EARLY, LEARN LATER."

---

## Trait System During Training

### Traits Are Reset, Not Accumulated

A critical finding: during `apply_stat_delta`, the 6 trait modifier bytes from the coach record are applied as **field_write** (SET), not field_modify (ADD). Furthermore, the training result function at `0x08020BA8` **explicitly zeros** all 6 trait bytes each week.

This means: **Weekly training RESETS traits to 0.** The training system does not accumulate traits over time. Trait development must come through other systems:
- Battle outcomes
- Errantry/adventure events
- Direct gameplay events (items, competitions)

### Coach Trait Modifiers

Each coach's 56-byte record contains 6 trait modifier bytes at +0x08 through +0x0D. These are written to personality fields 0x26-0x2B (monster offsets 0xAB-0xB0). However, since they're reset to 0 weekly, these serve as temporary modifiers during the training week rather than permanent trait transfers.

---

## AGIMA Teacher Stats

AGIMA teacher stats are **hardcoded** in the coach table, not dynamically generated.

### Coach Table Structure (0x0821856C, 56 bytes per entry)

| Offset | Size | Description |
|--------|------|-------------|
| +0x00 | u16 | Coach type code |
| +0x02-0x0F | u16[] | Focus values (terminated by 0xFFFD) |
| +0x20 | u32 | Hiring cost (gold) |
| +0x24 | u16[6] | AGIMA display stats [POW, INT, ACC, SPD, DEF, LIF] |
| +0x30 | u8 | Coach main breed |
| +0x31 | u8 | Coach sub breed |
| +0x32 | u8 | Difficulty (3/4/5) |
| +0x34-0x35 | u8[2] | Technique IDs (0xFF = none) |

The AGIMA stats are used for the **coach selection UI display** and range from low (100s) to very high (900s). However, they are NOT used in the actual stat delta computation -- the delta formula only uses your monster's current stats vs. the breed base.

### AGIMA Stat Ranges

| Coach Tier | Typical AGIMA Stats | Hiring Cost |
|------------|-------------------|-------------|
| Basic (diff 3) | 100-300 per stat | Low |
| Standard (diff 4) | 200-500 per stat | Medium |
| Advanced (diff 5) | 400-700 per stat | High |
| Elite (diff 5) | 500-900 per stat | Very High |

---

## Sparring Outcome Resolution

The sparring outcome check at `0x08001330` is a **breed-pair eligibility check**, not a combat simulation:

1. Reads coach availability flags from player state
2. Checks main breed and sub breed eligibility
3. For specific breed pairs, looks up technique indices (0-18) or returns -1
4. Checks completion status for that technique
5. Returns success (1) or failure (0)

This means sparring outcomes are determined by breed eligibility and completion tracking, not by a simulated battle.

---

## Summary: Sparring Strategy

1. **Train stats above breed base BEFORE sparring** -- sparring deltas depend on how far above base you are
2. **Technique learning is deterministic** -- meet the specific condition and you'll learn it every time
3. **The UI messages are proximity indicators** -- "Good Chance" means most conditions are met, not a 75% roll
4. **AGIMA stats are for show** -- they don't affect your actual stat gains from sparring
5. **Traits reset weekly during training** -- don't rely on training for trait development
6. **Each sparring session costs 27-45 lifespan points** -- budget your sparring carefully
