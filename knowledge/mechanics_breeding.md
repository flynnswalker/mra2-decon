# MRA2 Breeding / Combining Mechanics - Complete ROM Analysis

> Extracted via ARM7TDMI / THUMB disassembly of Monster Rancher Advance 2 (USA) ROM.
> Cross-validated against LegendCup community data where possible.

---

## Overview

Breeding (called "Combining" at the Studio) is how you create new monsters that inherit traits from two parents. The MRA2 breeding system is surprisingly mathematical -- offspring stats are determined by a precise formula involving the parents' stats, a stress-based quality tier, and breed-specific bonuses. Understanding these formulas lets you optimize breeding for maximum stat carryover.

**Main Breeding Function**: `0x0805FB5C`
**Breeding Entry Point**: `0x0805B09C`

---

## The Breeding Process (Step by Step)

When two monsters are combined:

1. **Stress Tier** is computed from both parents' stress levels
2. **Breed Bonus** is determined from the result monster's breed parameter
3. **Each stat** is computed independently using the inheritance formula
4. **Child stress** is set based on parent stress levels
5. **Traits** are inherited via bitwise OR of lower 3 bits
6. **Techniques** may carry over if both parents meet a threshold

---

## Step 1: Stress Tier Calculation

**Function**: `0x0805FF28`

The average of both parents' stress (field 0x1E, range 0-100) is mapped to a quality tier:

```
avg_stress = (parent1_stress + parent2_stress) / 2
```

| Avg Stress | Tier | Quality |
|-----------|------|---------|
| 0-24 | **1** | Excellent (lowest stress = best inheritance) |
| 25-49 | **2** | Good |
| 50-69 | **3** | Average |
| 70-89 | **4** | Poor |
| 90-100 | **5** | Terrible |

**Lower tier = better outcome**. Tier 1 gives the highest stat boost, tier 5 the lowest.

### Gameplay Impact

This is the most important factor in breeding quality. To get Tier 1:
- Both parents must have stress below 49 (ideally below 24 each)
- **Rest your monsters before breeding!** Even a few weeks of rest to bring stress down from 50 to 20 can jump you from Tier 3 to Tier 1

The difference between Tier 1 and Tier 5 is dramatic -- the tier number directly feeds into the stat inheritance formula as a multiplier.

---

## Step 2: Breed-Specific Bonuses

Certain breed parameter values grant a +10 bonus to specific stats during inheritance:

| Breed Param | Stat Bonus | Favored Stats |
|-------------|-----------|---------------|
| 0x14 | POW +10 | Power specialist |
| 0x15 | DEF +10 | Defense specialist |
| 0x16 | SKI +10 | Accuracy specialist |
| 0x17 | SPD +10 | Speed specialist |
| 0x18 | INT +10 | Intelligence specialist |
| 0x19 | LIF +10 | Life specialist |
| 0x1F | DEF +10, LIF +10 | Tank combination |
| 0x20 | POW +10, INT +10 | Dual attacker |
| 0x21 | SKI +10, SPD +10 | Evasion specialist |

**Note**: The breed parameter is determined by the resulting monster's breed combination, not the parents' breeds directly. Some breed combos inherently produce better offspring for certain stat builds.

---

## Step 3: The Stat Inheritance Formula

This is the core formula applied to **each of the 6 stats** independently:

```
if base_stat == 0:
    child_stat = 0
else:
    scaled = (base_stat * 256) / 100
    modifier = breed_bonus + stress_tier
    delta = (scaled * modifier) >> 8
    child_stat = min(base_stat + delta, 255)
```

### Breaking It Down

1. **base_stat**: The parent's stat value for this stat (which parent is used depends on the breed combination)
2. **scaled = (base * 256) / 100**: Converts the base stat to a fixed-point representation (essentially multiplying by 2.56)
3. **modifier = breed_bonus + stress_tier**: Combines the breed bonus (0 or 10) with the stress tier (1-5)
4. **delta = (scaled * modifier) >> 8**: The actual inheritance boost. The `>> 8` divides by 256, undoing the fixed-point scaling
5. **Result**: Base stat plus the computed delta, capped at 255

### Simplified Formula

The formula simplifies to:

```
child_stat = min(base_stat + base_stat * (breed_bonus + stress_tier) / 100, 255)
```

Or equivalently:

```
child_stat = min(base_stat * (1 + (breed_bonus + stress_tier) / 100), 255)
```

### Worked Examples

**Example 1**: Parent POW = 200, Stress Tier 1, No breed bonus

```
scaled = (200 * 256) / 100 = 512
modifier = 0 + 1 = 1
delta = (512 * 1) >> 8 = 2
child_stat = min(200 + 2, 255) = 202
```

**Example 2**: Parent POW = 200, Stress Tier 1, POW breed bonus (+10)

```
scaled = (200 * 256) / 100 = 512
modifier = 10 + 1 = 11
delta = (512 * 11) >> 8 = 5632 >> 8 = 22
child_stat = min(200 + 22, 255) = 222
```

**Example 3**: Parent POW = 200, Stress Tier 5 (worst), No breed bonus

```
scaled = (200 * 256) / 100 = 512
modifier = 0 + 5 = 5
delta = (512 * 5) >> 8 = 2560 >> 8 = 10
child_stat = min(200 + 10, 255) = 210
```

### Key Observations

1. **Breed bonus (+10) is massive**: It's worth 10x a stress tier. Getting a +10 breed bonus is equivalent to having a stress tier improvement of 10 levels (which doesn't even exist). This makes breed selection for combining far more important than stress management.

2. **Higher base stats get more benefit**: A parent with 200 base gets a bigger absolute boost than one with 100 base (because the formula multiplies the base stat).

3. **The cap at 255 matters**: Parents with stats near 255 get diminishing returns. A parent with 250 POW can only gain 5 more points regardless of tier/bonus.

4. **Tier 1 vs Tier 5 is relatively small**: Without breed bonus, Tier 1 gives +1% and Tier 5 gives +5%. The difference is only 4% of the base stat. With breed bonus, Tier 1 gives +11% and Tier 5 gives +15%.

5. **Zero stats stay zero**: If a parent has 0 in a stat, the child gets 0 too. You can't breed stats from nothing.

---

## Step 4: Child Stress

```
child_stress = (parent1_stress + parent2_stress) / 5
```

Using integer division. Examples:

| Parent 1 Stress | Parent 2 Stress | Child Stress |
|-----------------|-----------------|--------------|
| 0 | 0 | 0 |
| 10 | 10 | 4 |
| 50 | 50 | 20 |
| 100 | 100 | 40 |

The child always starts with **much less** stress than its parents. Even maxed-out parents (100 + 100) only produce a child with 40 stress. This is designed so that bred monsters aren't immediately in poor condition.

---

## Step 5: Trait Inheritance

```
child_traits = (parent1_traits & 0x7) | (parent2_traits & 0x7)
```

The lower 3 bits of each parent's trait field are OR'd together. This means:
- Traits are **additive** -- the child can have traits from both parents
- Only the lowest 3 trait bits are inherited (bits 0, 1, 2)
- A trait present in either parent will be present in the child

### Trait Bit Meanings

| Bit | Value | Likely Meaning |
|-----|-------|---------------|
| 0 | 0x01 | Personality trait A |
| 1 | 0x02 | Personality trait B |
| 2 | 0x04 | Personality trait C |

The exact gameplay meaning of each trait bit needs further analysis, but they likely influence behavior in training and battle (e.g., obedience, aggression, playfulness).

---

## Step 6: Technique Inheritance

```
if parent1.field_0x15 > 48 AND parent2.field_0x15 > 48:
    copy parent techniques to child
```

Field 0x15 appears to be a "technique proficiency" or "experience" counter. Both parents must have a value above 48 for their techniques to carry over. If either parent is below the threshold, no techniques are inherited.

### Gameplay Impact

This creates a breeding strategy requirement:
- Before combining, make sure both parents have sufficient technique experience (field_0x15 > 48)
- If you breed too early before parents have developed their techniques, the child starts with nothing
- This incentivizes raising parents longer before combining, creating a tension with the lifespan cost of extended training

---

## Complete Breeding Strategy Guide

### Optimal Breeding Checklist

1. **Minimize stress** before combining
   - Rest both parents until stress is below 24 each (for Tier 1)
   - This provides the best inheritance multiplier

2. **Choose breed combination for bonuses**
   - Pick a breed_param that gives +10 to your desired stat
   - Dual bonuses (0x1F, 0x20, 0x21) are especially valuable

3. **Maximize parent stats**
   - Higher base stats = higher absolute inheritance
   - Focus on the stats you want in the child

4. **Ensure technique proficiency**
   - Both parents need field_0x15 > 48 for technique carryover
   - Train techniques before combining

5. **Understand the cap**
   - Stats above ~230 in parents get diminishing returns (255 cap)
   - Spread stats if parents are near cap

### Breeding Math Cheat Sheet

For quick estimation without the full formula:

| Scenario | Approximate Boost |
|----------|------------------|
| Tier 1, no breed bonus | +1% of base stat |
| Tier 1, with breed bonus | +11% of base stat |
| Tier 3, no breed bonus | +3% of base stat |
| Tier 3, with breed bonus | +13% of base stat |
| Tier 5, no breed bonus | +5% of base stat |
| Tier 5, with breed bonus | +15% of base stat |

---

## Modding Implications

### Easy Balance Changes

| What | Location | Size | Notes |
|------|----------|------|-------|
| Stress tier thresholds | In code at `0x0805FF28` | Compare immediates | Currently 24/49/69/89/100 |
| Breed bonuses | In code at `0x0805FB5C` area | Compare/add immediates | Currently +10 per matching stat |
| Stat cap | In code | `min(result, 255)` | Change 255 to raise cap |
| Technique threshold | In code | `cmp field_0x15, #48` | Lower to make technique inheritance easier |
| Child stress divisor | In code | Divide by 5 | Change divisor to adjust starting stress |
| Trait inheritance mask | In code | `& 0x7` | Change mask to inherit more/fewer trait bits |

### Example Mod: "Enhanced Breeding"

To make breeding more impactful (bigger stat carryover):
- Change the breed bonus from +10 to +20 (doubles the breed-specific advantage)
- Lower stress tier thresholds: 10/30/50/70/90 (easier to get Tier 1)
- Raise stat cap from 255 to 500 (removes the ceiling)
- Lower technique threshold from 48 to 20 (easier technique inheritance)

### Example Mod: "Stress Matters More"

To make stress management a bigger part of breeding strategy:
- Widen the stress tier gaps: Tier 1 at stress 0-10, Tier 2 at 11-30, etc.
- Increase the tier multiplier effect (change the formula scaling)
- Set breed bonuses to 0 (removes breed-specific advantages, makes stress the dominant factor)
