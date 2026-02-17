# MRA2 Combining (Breeding) Mechanics

> What determines your offspring's stats, techniques, and traits when you combine two monsters at the Studio.

---

## How Combining Works

When you take two monsters to the Studio, the game creates a new monster whose stats, stress, traits, and techniques are all computed from the parents using specific formulas. Nothing is random -- if you know the inputs, you can predict the outputs exactly.

---

## Step 1: Stress Tier (The Most Important Factor)

The game averages both parents' stress levels and maps the result to a quality tier:

| Average Parent Stress | Tier | Quality Label |
|----------------------|------|--------------|
| 0-24 | **1 (Best)** | Excellent |
| 25-49 | **2** | Good |
| 50-69 | **3** | Average |
| 70-89 | **4** | Poor |
| 90-100 | **5 (Worst)** | Terrible |

**Lower tier number = better offspring.** Tier 1 gives the best stat inheritance.

### How to Get Tier 1

Both parents need stress at or below 49 (ideally below 24 each). The simplest way: **rest both parents for several weeks before combining.** Even a short rest period can drop stress enough to jump from Tier 3 to Tier 1.

---

## Step 2: Breed-Specific Stat Bonuses

Depending on what type of monster the offspring will be, certain stats get a **+10 bonus** in the inheritance calculation. These bonuses are determined by the breed combination, not by the parents' stats:

| Offspring Type | Bonus Stats |
|---------------|-------------|
| Power specialist breeds | POW +10 |
| Defense specialist breeds | DEF +10 |
| Accuracy specialist breeds | ACC +10 |
| Speed specialist breeds | SPD +10 |
| Intelligence specialist breeds | INT +10 |
| Life specialist breeds | LIF +10 |
| Tank breeds | DEF +10, LIF +10 |
| Dual attacker breeds | POW +10, INT +10 |
| Evasion breeds | ACC +10, SPD +10 |

Not all breed combinations have a bonus. Many produce offspring with no special bonus (just the base stress tier effect).

---

## Step 3: The Stat Inheritance Formula

Each of the 6 stats (POW, INT, ACC, SPD, DEF, LIF) is calculated independently:

**In plain English:** The offspring starts with the parent's stat, then gets a percentage bonus based on the stress tier and any breed bonus.

**The formula simplified:**

```
offspring_stat = parent_stat + parent_stat * (breed_bonus + stress_tier) / 100
capped at 255
```

### What This Means in Practice

| Scenario | Parent Stat | Bonus | Tier | Offspring Stat | % Gain |
|----------|-----------|-------|------|---------------|--------|
| Best case (Tier 1 + breed bonus) | 200 | +10 | 1 | 222 | +11% |
| Good case (Tier 1, no bonus) | 200 | 0 | 1 | 202 | +1% |
| Average case (Tier 3 + breed bonus) | 200 | +10 | 3 | 226 | +13% |
| Worst case (Tier 5, no bonus) | 200 | 0 | 5 | 210 | +5% |

### Key Observations

**Breed bonus is WAY more important than stress tier.** A +10 breed bonus is equivalent to 10 tiers of stress improvement (which don't even exist). Getting that breed bonus adds ~10% to the stat, while the difference between Tier 1 and Tier 5 is only 4%.

**Higher parent stats give bigger absolute boosts.** The formula multiplies the parent's stat, so a parent with 200 in a stat gets twice the absolute bonus of a parent with 100. Maximize parent stats before combining.

**The 255 cap matters.** Offspring stats are hard-capped at 255. This means parents with stats near 230+ get diminishing returns because the bonus pushes them into the cap. If both parents have 250 POW, the offspring can only get 255 regardless of tier.

**Zero stays zero.** If a parent has 0 in a stat, the offspring gets 0 too. The formula multiplies the base, so you can't create stats from nothing through breeding.

---

## Step 4: Offspring Stress

```
offspring_stress = (parent1_stress + parent2_stress) / 5
```

The offspring always starts with **much less** stress than its parents:

| Parent 1 Stress | Parent 2 Stress | Offspring Stress |
|-----------------|-----------------|-----------------|
| 0 | 0 | 0 |
| 20 | 20 | 8 |
| 50 | 50 | 20 |
| 100 | 100 | 40 |

Even two maximally stressed parents (100 + 100) only produce an offspring with 40 stress. The offspring won't be in terrible shape regardless -- but the *stat inheritance* was already determined by the parents' stress at the time of combining (Step 1).

---

## Step 5: Trait Inheritance

Each parent has personality traits stored as bit flags. The offspring inherits traits from **both parents** using an OR operation on the lower 3 trait bits:

- If Parent 1 has Trait A and Parent 2 has Trait B, the offspring gets **both** Trait A and Trait B
- Traits are additive -- the offspring can only gain traits, never lose inherited ones
- Only the first 3 trait slots are inherited this way

This matches the community observation that you can "stack" traits by combining monsters with complementary personality traits (like combining a monster with Ironhart and one with Charisma to get both).

---

## Step 6: Technique Inheritance

Both parents must have a **technique proficiency value above 48** for techniques to carry over to the offspring. If either parent is below this threshold, no techniques are inherited.

### What This Means

- **Don't combine too early.** If your parents haven't had enough sparring/battle experience to build up their technique proficiency, the offspring starts with no techniques.
- **Both parents matter.** Even if one parent has learned every technique in the game, if the other parent's proficiency is below the threshold, nothing carries over.
- This creates a tension: sparring builds technique proficiency but costs lifespan. You need to spar enough to pass the threshold (>48) but not so much that you shorten the parent's useful raising period.

---

## Combining Strategy Guide

### The Optimal Combining Checklist

1. **Build parent stats as high as possible**
   - Higher parent stats = higher offspring stats (formula multiplies the base)
   - Focus on the stats you care about -- you don't need all-999 parents

2. **Rest both parents before combining**
   - Get stress below 24 each for Tier 1 inheritance
   - A few weeks of rest is worth the time investment
   - This is the single easiest optimization most players miss

3. **Choose breed combinations with stat bonuses**
   - A +10 breed bonus to your key stat is worth more than any stress optimization
   - Check which breed combinations give dual bonuses (+10 to two stats)

4. **Ensure technique proficiency > 48 on both parents**
   - Do enough sparring/battling with each parent before combining
   - This doesn't need to be a lot -- just clear the threshold

5. **Plan for the 255 cap**
   - Parent stats above ~230 give diminishing returns
   - If both parents are near-max in a stat, the offspring hits the cap and bonus is wasted
   - Consider spreading investment if parents are already strong

### Quick Reference: How Much Do Offspring Stats Improve?

For a parent with a stat of 200:

| Situation | Offspring Stat | Improvement |
|-----------|---------------|------------|
| Tier 1, breed bonus match | 222 | +22 |
| Tier 1, no breed bonus | 202 | +2 |
| Tier 3, breed bonus match | 226 | +26 |
| Tier 3, no breed bonus | 206 | +6 |
| Tier 5, breed bonus match | 230 | +30 |
| Tier 5, no breed bonus | 210 | +10 |

**Wait -- Tier 5 gives MORE stats than Tier 1?** Yes! The tier number is added as a multiplier, and higher tier means a higher number in the formula. The "quality" label is counterintuitive at the formula level. What makes Tier 1 "better" likely relates to other factors not fully traced yet (technique inheritance chances, personality effects, or trait quality), or the tier may function differently in a context we haven't fully resolved.

*Note: This is one area where our ROM analysis needs further verification through emulation testing. The formula is confirmed, but the full gameplay impact of the tier value may involve additional checks we haven't traced.*

---

## What This Means for Balance Modding

Potential combining balance changes:
- **Raise the stat cap** from 255 to a higher value (e.g., 500) to allow deeper multi-generation breeding
- **Adjust breed bonuses** to balance which breed combinations are optimal
- **Change the stress tier thresholds** to make stress management more or less important
- **Lower the technique proficiency threshold** (from 48 to a lower value) so techniques pass on more easily
- **Change the stress divisor** for offspring (currently /5) to make parent stress have more or less impact on the child
