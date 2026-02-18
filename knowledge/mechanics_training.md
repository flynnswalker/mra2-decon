# MRA2 Training & Raising Mechanics

> What actually determines your monster's stat gains, and what hidden costs come with different training choices.

---

## How Training Works at the Code Level

Every week you choose an action: Rest, Light Drill, Heavy Drill, Sparring, or Tournament. The training system works in phases:

1. **Setup phase**: The game allocates a training result buffer (0x670 bytes, pointer stored at `0x0200A398`) and populates it based on your drill type and coach
2. **Challenge phase**: During the training period, the game records a sequence of challenge/minigame results at `result+0x30`
3. **Resolution phase**: At completion, `compute_training_outcome` (0x0801E560) pattern-matches the challenge results against master data tables to determine the final stat deltas
4. **Application phase**: Each week, `weekly_training_step` (0x08020328) applies the pre-computed deltas to your monster's stats

### The Training Result Struct

The delta struct at `result+0x18` (the core data that determines all stat changes):

| Offset | Size | Field |
|--------|------|-------|
| +0x00 | u8 | Breed main ID |
| +0x01 | u8 | Breed sub ID |
| +0x02 to +0x07 | 6 x int8 | Stat deltas: POW, INT, ACC, SPD, DEF, LIF |
| +0x08 to +0x0D | 6 x int8 | Personality/trait modifiers |
| +0x0E | int8 | Lifespan drain (fatigue delta) |
| +0x10 to +0x13 | 4 x u8 | Technique learn slots (0xFF = empty) |

---

## The Coach System: 65 Profiles

MRA2 has **65 predefined coach profiles** at ROM `0x0821856C` (56 bytes each). Each coach defines:

- **Stat totals** for POW, INT, ACC, SPD, DEF, and LIF (cap what your monster can gain)
- **Drill difficulty** (3 = easy, 4 = medium, 5 = hard)
- **A breed association** (main + sub breed)
- **Trait modifiers** (personality traits that can be passed during sparring)
- **Fatigue delta** (lifespan cost per week)
- **Technique slots** (whether sparring can teach moves)

### Coach Quality Tiers

| Tier | Stat Total Range | Drill Difficulty | Examples |
|------|-----------------|-----------------|----------|
| Basic | 1400-1700 | 3 | Early-game AGIMA coaches |
| Standard | 1700-2100 | 3-4 | Mid-game coaches |
| Advanced | 2100-2600 | 4-5 | Named coaches like Morgan, Arther |
| Elite | 2600-3500 | 5 | Late-game / special coaches |
| Legendary | 3500-3850 | 5 | Endgame coaches (700-900 per stat) |

---

## Light Drills vs Heavy Drills

The training dispatcher at `0x08001FDC` handles two distinct drill types with different stat weight distributions.

### Light Drill (Entry Index 0x3C = 60)

- **Stat weights**: (300, 300, 300, 300, 300, 300) -- **equal distribution**
- **Difficulty tier**: 3 (easy)
- **Extra modifier**: 0
- **Technique slot**: None (0xFF) -- cannot teach techniques
- **Challenge events**: 8 minigame steps
- **Lifespan cost**: 0 or -3 (free or slightly beneficial)

Light Drills target a single stat with equal weight, meaning all stats have equal opportunity. The gains are smaller but the cost is negligible.

### Heavy Drill (Entry Index 0x3D = 61)

- **Stat weights**: (480, 120, 150, 150, 450, 400) -- **heavily skewed**
- **Difficulty tier**: 4 (medium)
- **Extra modifier**: 1
- **Technique slot**: 0x4E (can teach a technique)
- **Challenge events**: 5 minigame steps
- **Lifespan cost**: Moderate to expensive (27-45 range for technique coaches)

Heavy Drills create the characteristic "big up / little up / down stat" pattern:
- **"Big up" stats**: POW (weight 480), DEF (weight 450), LIF (weight 400)
- **"Little up" stats**: ACC (weight 150), SPD (weight 150), INT (weight 120)
- **"Down stat"**: Encoded in the pattern-matched outcome -- when the challenge sequence resolves, some stat deltas in the result are **negative**

### How the Down Stat Works

The stat gains are NOT calculated at drill-setup time. Instead:
1. During training, challenge results are recorded
2. At completion, `compute_training_outcome` hashes the challenge sequence against the master pattern table at `0x08217368` + `0x081E9AD0`
3. The hash alternates multiply and add operations on challenge values
4. The final index looks up a complete 12-byte stat delta record from the master data table
5. This record includes both positive AND negative deltas -- the negative ones are the "down stat"

The community observation that "a coach with 999 in the lowered stat will subtract less" is explained by the fact that the delta record is chosen from a finite lookup table, and coaches with higher stats in those areas produce outcome records with smaller negative values.

---

## How Stat Gains Are Actually Computed

### Pattern Matching System

The resolution function at `0x0801E560` works by:

1. Reading the challenge sequence from `result+0x30` (variable-length u16 array, terminated by 0xFFFD)
2. **Hashing** the challenge values with an alternating multiply/add algorithm:
   - Even iterations: accumulator += (challenge[i] + i + 1)
   - Odd iterations: accumulator *= (challenge[i] + i + 1)
3. Final index = accumulator AND 0xFF (256-entry lookup)
4. Looking up the outcome in the master data table, which has 4 sub-tables:
   - Sub-table 0 (+0x00): Breed main lookup (256 entries)
   - Sub-table 1 (+0x04): Breed sub lookup (256 entries)
   - Sub-table 2 (+0x08): **Stat delta records** (12-byte entries: 6 stat deltas + 6 personality modifiers)
   - Sub-table 3 (+0x0C): Technique availability lookup

When only 1 challenge event occurs (default/failure case), the `default_stat_deltas` function at `0x0801E86C` zeros all stat deltas -- meaning a failed drill produces **no stat gain at all**.

### Growth Grade Calculation

Growth grades are computed at `0x08002A5C`:

```
growth_grade = clamp((table_index + modifier - 100) * 40 + growth_curve_type - 3, -5, +5)
```

Where:
- `table_index` = 100 (0x64) for standard drill training
- `modifier` = training-specific parameter
- `growth_curve_type` = field 0x13 (0-5, from monster type record)

Result is an 11-point scale from -5 to +5. The growth grade feeds into a **personality-based difficulty** calculation:

```
personality_sum = sum of 6 signed personality bytes from monster record
difficulty = personality_sum * 24 + growth_grade + training_extra_modifier
difficulty = clamp(difficulty, 1, 6)
```

This difficulty level (1-6, stored in field 0xD6) determines how hard the training minigame is, which in turn affects which challenge result sequence gets recorded, which determines the final stat delta lookup.

### Growth Grades from Monster Type Table

The monster type record at `0x081CACC8` stores growth grades as packed 4-bit nibbles:
- **Field 0x34**: 16 entries (from bytes 0x30-0x37, packed as 4-bit values) -- general growth aptitude per stat combination
- **Field 0x35**: 32 entries (from bytes 0x38-0x47, packed as 4-bit values) -- fine-grained technique/training aptitudes

These 4-bit values (0-15) are the "grade letters" the community sees (A/B/C/D/E mapped to numeric ranges).

---

## Weekly Application

Each week during training, `weekly_training_step` (0x08020328) runs:

1. Gets monster base pointer via field 0x71
2. Loads the training result from `0x0200A398`
3. Reads breed info from `[result+0x18]` and `[result+0x19]`
4. Calls `combine_breed_ids` and `monster_init` (sets up base stats for the breed)
5. Calls `apply_stat_delta` (0x08020AB0):
   - Reads 6 signed bytes at delta[+2] through delta[+7]
   - Applies each as `field_modify(monster, stat_index, delta)` for stats 0-5
   - Stats are clamped to [0, 999] by the type 10 field handler
   - Writes 6 signed bytes from delta[+8] through delta[+13] to personality fields 0x26-0x2B
   - Applies lifespan drain from delta[+0x0E] to both lifespan fields (0x16 and 0x17)
   - Processes up to 4 technique slots from delta[+0x10] through delta[+0x13]

### The 57-Week Training Cycle

A cycle counter at `ranch_state+0x92` runs from 0 to 56 and wraps:

| Cycle Position | Bonus Tier | Effect |
|---------------|------------|--------|
| 0-49 | 0 (None) | Normal training |
| 50-51 | 1 (Small) | Slight boost |
| 52-54 | 2 (Medium) | Notable boost |
| 55-56 | 1 (Small) | Slight boost |

This cycle affects the **display/animation** of stat gains (shown via the stat growth table at `0x081C9F80`, 70 entries x 12 bytes). The cycle does NOT directly modify the actual stat deltas -- those come from the pattern-matched outcome.

---

## The Lifespan Cost of Sparring

### Fatigue Delta Tiers

| Cost | What It Means | Per Week | Found In |
|------|---------------|----------|----------|
| -3 | Adds lifespan | +0.3 weeks gained | High-difficulty drill coaches |
| 0 | No impact | None | Moderate drill coaches |
| 27-45 | Significant drain | 2.7 to 4.5 weeks lost | Technique-teaching coaches (sparring) |

**Practical example:** A monster with 250 weeks of life sparring 8 times (avg fatigue 40) loses 320 lifespan points = 32 weeks. Regular drills with fatigue -3 over 200 weeks actually gains 60 points = 6 weeks.

---

## Success/Failure in Drills

- The success check at `0x08001330` validates breed availability via field 0x9A
- When the pattern match produces only 1 challenge event (failure case), `default_stat_deltas` zeros all stat deltas -- **failed drills give zero stat gain**
- The PRNG (`seed * 41`) makes outcomes deterministic from a given seed state, which is why save/reload ("Nyght Method") works -- reloading and making different choices advances the RNG differently

---

## The Random Number Generator

The PRNG at `0x0806354C`:
```
if seed == 0: seed = 0x2A6D365A
seed = seed * 41
result = (seed >> 16) + seed) & 0x7FFF   // 15-bit output
```

The byte variant at `0x08063588` returns only the low 8 bits. This is a Linear Congruential Generator with low entropy -- outcomes are deterministic from a given seed, enabling the save/reload exploit.

---

## Strategic Summary

1. **Drills are free, sparring is expensive** -- build stats through drills first
2. **Growth grades matter** -- high-grade stats gain faster, matching the community "Statgain Patterns" data
3. **Growth curve timing is critical** -- a 30 growth rate vs 10 means 3x effectiveness at the same coach
4. **Coach stat totals set the ceiling** -- top coaches (3500+ total) enable 999 builds
5. **Heavy Drills have skewed weights** -- POW/DEF/LIF get most gains; INT/ACC/SPD get less
6. **Failed drills give nothing** -- the minigame outcome matters; save/reload can fix bad results
7. **The 57-week cycle provides small bonus windows** at weeks 50-54, but this is minor compared to coach quality and growth timing
