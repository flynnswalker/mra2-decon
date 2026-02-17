# MRA2 Training Mechanics - Complete ROM Analysis

> Extracted via ARM7TDMI / THUMB disassembly of Monster Rancher Advance 2 (USA) ROM.
> Cross-validated against LegendCup community data where possible.

---

## Overview

Training in MRA2 is driven by a **coach system**. When you assign a training drill, the game selects one of **65 predefined coach records** from a ROM table. Each coach has fixed stat totals, personality modifiers, a fatigue cost, and optionally teaches techniques. The coach's properties determine what your monster gains each week of training.

---

## The Coach / Training Result Table

**ROM Address**: `0x0821856C`
**Record Size**: 56 bytes each
**Record Count**: 65

Each record represents one "coach" or training outcome template. When a training drill is selected, the game picks the appropriate record and copies it into RAM at `*0x0200A398`.

### Record Layout (56 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 8 | Header | Internal control bytes |
| 0x08 | 6 | Trait Modifiers | 6 signed bytes: personality/trait adjustments |
| 0x0E | 1 | Fatigue Delta | Signed byte: lifespan cost of this training |
| 0x10 | 4 | Technique Slots | Up to 4 technique IDs (0xFF = empty) |
| 0x1A | 6 | Weekly Deltas | 6 signed bytes: POW/INT/SKI/SPD/DEF/LIF per-week stat changes |
| 0x24 | 12 | Stat Totals | 6 x uint16: POW/INT/SKI/SPD/DEF/LIF target totals |
| 0x30 | 1 | Breed Main | Main breed ID this coach is associated with |
| 0x31 | 1 | Breed Sub | Sub-breed ID |
| 0x32 | 1 | Drill Difficulty | 3 = easy, 4 = medium, 5 = hard |

### Fatigue Delta Values (Lifespan Cost)

This is the most impactful hidden value for long-term play:

| Value | Meaning | Found In |
|-------|---------|----------|
| **-3** | Beneficial -- slightly extends lifespan | Regular training, high-difficulty coaches |
| **0** | No lifespan impact | Moderate coaches |
| **27-45** | Heavy lifespan cost | Coaches that teach techniques |

**Key Insight**: Coaches with technique slots (the ones that can teach your monster new moves) carry a significant lifespan penalty (27-45 points per training week). Regular training coaches either have no cost (0) or actually give a small lifespan benefit (-3). This means **learning techniques is the most expensive thing you can do to your monster's lifespan**.

### How This Affects Gameplay

1. **Technique learning is expensive**: Every week spent in a technique-teaching training costs 27-45 lifespan points. Since 10 points = 1 week of life, a single training week with fatigue_delta=45 costs your monster 4.5 weeks of life.

2. **Regular training is cheap or free**: Most non-technique coaches have fatigue_delta of 0 or -3, meaning pure stat training is essentially free in terms of lifespan.

3. **Coach difficulty matters**: Difficulty 5 coaches tend to have higher stat totals (better training) but the lifespan cost varies independently.

### Sample Coach Records

| Coach# | POW | INT | SKI | SPD | DEF | LIF | Total | Diff | Fatigue | Teaches? |
|--------|-----|-----|-----|-----|-----|-----|-------|------|---------|----------|
| 0 | 200 | 350 | 320 | 330 | 150 | 250 | 1600 | 3 | -3 | No |
| 1 | 400 | 100 | 200 | 150 | 400 | 400 | 1650 | 3 | 0 | No |
| 2 | 280 | 320 | 400 | 300 | 250 | 300 | 1850 | 4 | 35 | Yes |
| 3 | 500 | 550 | 300 | 250 | 350 | 450 | 2400 | 5 | -3 | No |
| 6 | 200 | 50 | 220 | 450 | 250 | 300 | 1470 | 3 | 44 | Yes |
| 62 | 500 | 850 | 700 | 600 | 500 | 700 | 3850 | 5 | 0 | No |
| 63 | 500 | 500 | 500 | 200 | 900 | 900 | 3500 | 5 | 0 | No |
| 64 | 800 | 600 | 700 | 400 | 650 | 700 | 3850 | 5 | 0 | No |

**Note**: The last few coaches (62-64) have exceptionally high stat totals and appear to be "elite" coaches associated with rare or special breed combinations.

---

## Weekly Training Step

**Function**: `weekly_training_step` at `0x08020328`

Each in-game week during training:

1. The game reads the active training record from RAM at `*0x0200A398`
2. The 6 weekly delta bytes at record offset `+0x1A` are read as signed bytes
3. Each delta is added to the monster's corresponding stat via `field_modify`
4. Stats are clamped to **[0, 999]** by the Type 10 field handler in `core_state_accessor`

### The Stat Gain Formula

```
new_stat = clamp(current_stat + weekly_delta, 0, 999)
```

This is straightforward -- the weekly deltas are fixed per-coach-record. There is no randomness in the per-week stat application itself.

**However**, most coach records have weekly_deltas of all zeros. This suggests that the stat totals at offset `+0x24` are used differently -- likely as targets or caps for the overall training period rather than per-week increments. The actual per-week gain calculation likely involves dividing the total by the training duration.

---

## The 57-Step Training Cycle

**Counter Location**: `ranch_state + 0x92`

Training uses a 57-step cycle counter (0 to 56, wrapping at 57). This counter advances each training week and determines visual feedback:

| Cycle Position | Bonus Tier | Meaning |
|---------------|-----------|---------|
| 0-49 | 0 | Normal training |
| 50-51 | 1 | Small bonus window |
| 52-54 | 2 | Peak bonus window |
| 55-56 | 1 | Small bonus window |

**Gameplay Impact**: The cycle primarily affects the training animation/display system. It indexes into the **Stat Growth Display Table** at `0x081C9F80` (70 entries of 12 bytes, containing 6 x uint16 values that are multiples of 8, range 0-216). This determines what the player sees during training results but the actual stat gains come from the coach record's fixed deltas.

---

## Training Success / Failure

**Success Check Function**: `0x08001330`

Training success is determined by:

1. Breed availability validation via field `0x9A` (monster availability flags)
2. The function at `0x080687C4` uses the PRNG (`0x0806354C`) to determine the specific outcome
3. Outcomes cycle through every 4 steps via a secondary counter at `ranch_state + 0x94`

### The PRNG

```
if seed == 0:
    seed = 0x2A6D365A    // fallback magic number
new_seed = (seed * 41) & 0xFFFFFFFF
high = (new_seed >> 16) & 0xFFFF
result = (high + new_seed) & 0x7FFF
```

This is a simple Linear Congruential Generator. The low entropy means training outcomes are **predictable** if you know the seed state -- which is theoretically exploitable for TAS/speedrun play.

---

## Stat Growth Grades

**Location**: Monster type table at `0x081CACC8`, offset `+0x28` per record

Each monster type has 32 bytes of growth grade data using characters:
- `'1'` through `'5'` (numeric tiers)
- `'A'` through `'E'` (letter tiers)
- `'S'`, `'T'`, `'#'`, `'$'`, `'%'` (special grades)

These grades influence the visual representation of stat aptitudes and may serve as multipliers in hidden growth calculations.

---

## Modding Implications

### Easy Balance Changes

1. **Coach stat totals** (offset `+0x24`): Change how much stat potential each training type offers
2. **Fatigue deltas** (offset `+0x0E`): Make technique learning cheaper or make regular training costlier
3. **Drill difficulty** (offset `+0x32`): Adjust which coaches are available at different game stages
4. **Technique slots** (offset `+0x10`): Change which techniques each coach can teach

### Example Mod: "Balanced Technique Learning"

Currently, technique-learning coaches cost 27-45 lifespan points per week. To make this less punishing:
- Change fatigue_delta from `0x2D` (45) to `0x0F` (15) at the relevant record offset
- This halves the lifespan cost of learning techniques
- Alternatively, set all fatigue_deltas to 0 to remove lifespan costs entirely

### ROM Locations for Patching

| What | Address | Size | Notes |
|------|---------|------|-------|
| Coach Table Start | `0x0021856C` (ROM offset) | 65 x 56 bytes | All coach records |
| Single Coach Fatigue | `table_start + index*56 + 0x0E` | 1 byte (signed) | Per-coach lifespan cost |
| Coach Stat Totals | `table_start + index*56 + 0x24` | 12 bytes (6 x uint16 LE) | Per-coach stat targets |
| Stat Growth Display | `0x001C9F80` (ROM offset) | 70 x 12 bytes | Visual feedback table |
