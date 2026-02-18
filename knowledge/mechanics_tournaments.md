# MRA2 Tournaments, Rank Progression & Stray Encounters

> How tournaments work, how you rank up, prize money, and encountering stray monsters.

---

## Rank System

Ranks are stored as a value 0-5 in field 0xB3[0x20]:

| Value | Rank | Notes |
|:-----:|:----:|-------|
| 0 | E | Starting rank |
| 1 | D | |
| 2 | C | Stray encounters become possible below this |
| 3 | B | |
| 4 | A | Forced by stray encounter flag |
| 5 | S | Forced by special cup flag |

### Rank Progression

Rank-up occurs at **month end** processing (0x0802DF2A) when `field_0xB3[0x1E] == 2`. The rank value is simply incremented by 1. Reaching S-rank requires accumulating sufficient rank points through tournament victories.

### Rank Points and Monthly Decay

Both stat_total and rank_points incur monthly penalties based on their current magnitude:

| Value Range | Monthly Penalty |
|:-----------:|:--------------:|
| 300-499 | -2 |
| 500-699 | -6 |
| 700-899 | -12 |
| 900+ | -20 |

This decay system means you must keep winning to maintain high rank points. If your money earnings drop below 100, an additional -5 penalty applies.

---

## Prize Money

The prize system maps the monster's **fame** (field 0x1F, range -100 to +100) into 7 tiers, each with a random range from the loyalty drain table at `0x083F3ED8`. The tournament handler scales the result by × 2 / 3:

| Fame Level | Approximate Prize Per Match |
|------------|---------------------------|
| Terrible (< -80) | 20-33g |
| Very Bad (-80 to -40) | 33-47g |
| Bad (-40 to -10) | 47-60g |
| Neutral (-10 to +10) | 60-73g |
| Good (+10 to +40) | 73-87g |
| Very Good (+40 to +80) | 87-100g |
| Excellent (> +80) | 100-133g |

---

## Stat Gains from Tournament Victories

End-of-month tournament processing at `0x0802D924` awards:

| Reward | Amount | Notes |
|--------|--------|-------|
| Stat total | +140 to +160 | `(PRNG % 21) + 140` |
| Money | +120 to +140g | |
| Fatigue | -1 | Slight fatigue reduction |
| Fame | -3 | Fame decays after tournaments |
| Rank points | +160 to +384 | Base 160-200, multiplied by field 0xFB (×1.2) and field 0x55 (×2) |

### Weekly Tournament Processing

During tournament weeks (activity state 4), the weekly dispatch applies:
- Stress: -2 per week (tournaments reduce stress)
- Happiness: -(loyalty × 2 / 3) per week

---

## Opponent Generation

Tournament opponents are generated at `0x08034EB0` from **roster entries** (approximately 196 bytes each) stored in WRAM at `0x0200DE60` (10 slots).

Each opponent entry contains:
- Breed IDs (main + sub)
- Base stats
- Growth multipliers
- Technique bitmasks

Opponent stats are computed as: `base_stat + (growth_value / 10)`, **capped at 250**. This means tournament opponents max out at 250 in any individual stat, which is significantly lower than what a well-trained player monster can achieve (999).

---

## Stray/Wild Monster Encounters

### Encounter Requirements

The stray encounter check at `0x0802CC88` requires:
- **stat_total > 499** (your monster must be reasonably strong)
- **rank_points > 699** (you must be at a decent rank)

### Encounter Scoring

```
score = (PRNG & 3) * 100 + stat_total - 1200 + rank_points + (PRNG & 7) * 100
```

| Score | Encounter Tier |
|-------|---------------|
| ≤ 999 | No encounter |
| 1000-1399 | Common stray |
| ≥ 1400 | Rare stray (1-in-3 chance of special event) |

### Stray Encounter Effects

When a stray encounter triggers:
- A stray monster appears for battle
- The encounter sets `field_0xB3[0x1F] = 1`, which forces A-rank access
- Special events can award inventory items

---

## Calendar/Monthly Events

Monthly processing includes:
- Rank-up evaluation
- Stat/rank point decay
- Tournament roster refresh
- Stray encounter eligibility recalculation
