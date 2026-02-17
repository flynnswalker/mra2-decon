# MRA2 Lifespan, Aging & Stress Mechanics

> How long your monster lives, what makes it age faster, and why timing your training matters.

---

## Lifespan Basics

Every monster has a fixed pool of lifespan points set at birth. **10 points = 1 in-game week.** This pool drains as the monster ages, and certain actions (especially sparring) drain it faster.

### Lifespan by Breed

All 194 monster types in the game have a base lifespan between **2370 and 2800 points** (237 to 280 weeks, or roughly 4.5 to 5.4 in-game years).

| Category | Lifespan (weeks) | Number of Breeds | Notes |
|----------|-----------------|-----------------|-------|
| Short-lived | 237-244 | 16 | e.g., some Pixie/Jell sub-breeds |
| Below average | 245-254 | 51 | Common for lighter breeds |
| Average | 255-264 | 56 | Most monster types fall here |
| Above average | 265-274 | 28 | Sturdier breeds |
| Long-lived | 275-280 | 1 | Monster #22 at 280 weeks |

**Key insight:** The spread between shortest and longest-lived breeds is only about 18%. Breed choice matters less for lifespan than *how you raise the monster* -- specifically, how much sparring you do (see Training doc for sparring costs).

---

## The Aging Stage System

Internally, the game tracks your monster's age as a **stage from 0 to 15**. This stage determines how fast your monster grows from training.

### How Aging Stage Is Calculated

The game maintains two lifespan values:
- **Remaining lifespan** -- how much life your monster has left
- **Reference lifespan** -- a baseline value set at birth

The formula:

```
aging_stage = (remaining - reference) * 16 / remaining
clamped to range 0-15
```

**In plain terms:** When your monster is young, the aging stage is high (near 15). As it ages and remaining lifespan decreases, the stage drops toward 0. Stage 15 means "just born" and stage 0 means "about to die."

---

## Growth Curves: Early vs Late Bloomers

This is one of the most important hidden mechanics for competitive raising. Each breed has one of 6 **growth curve types** that determine *when* during their life they grow fastest.

The aging stage (0-15) maps to a **growth rate** (10-30) through a breed-specific lookup table:

### Growth Curve Types

| Type | Peak Stage | Peak Timing | Best For |
|------|-----------|-------------|----------|
| **Early Bloomer** | Stage 4-5 | First ~30% of life | Train hard immediately |
| **Early-Mid** | Stage 6 | First ~40% of life | Train hard in first year |
| **Mid Bloomer** | Stage 7 | Middle of life | Steady training throughout |
| **Mid-Late** | Stage 8 | Second half of life | Patient, steady training |
| **Late Bloomer** | Stage 10 | Last ~35% of life | Light training early, heavy training late |
| **Flat** | All stages ~25 | Consistent throughout | Any strategy works |

### Growth Rate Values

The growth rate at peak is **30** (maximum efficiency). At the monster's worst aging stage, it drops to **10** (one-third as effective). The base rate at near-death is always 10 regardless of curve type.

### What This Means for Gameplay

**If your monster is an Early Bloomer:**
- Its growth rate peaks in the first year of life
- Train aggressively from the start -- every week of delay wastes your best growth window
- By mid-life, growth has already tapered significantly
- Prioritize drills early, save sparring (technique learning) for later when growth is slowing anyway

**If your monster is a Late Bloomer:**
- Growth starts slow and peaks around 60-70% through its lifespan
- Light training early on is fine -- you're not wasting much potential
- Save your best coaches and heavy drills for when the growth curve peaks
- These monsters reward patience

**If your monster has a Flat curve:**
- Growth rate stays around 25 regardless of age (never hits the full 30 peak but never drops as low either)
- Most forgiving to raise -- any training schedule works reasonably well
- Good for beginners or for monsters where you plan to spend a lot of time on sparring and tournaments

**Competitive impact:** Understanding your monster's bloomer type and timing your training accordingly can result in **20-30% more total stat gains** over a lifetime compared to a random training schedule. This is why experienced players say some monsters are "easy to raise" and others are "tricky" -- it's not just stat aptitudes, it's when the growth window opens.

---

## What Drains Lifespan

### Weekly Sparring (The Big One)

Every sparring session with a coach that can teach techniques costs **27-45 lifespan points** (2.7 to 4.5 weeks of life). This is the single largest discretionary lifespan drain in the game.

### Regular Drills (Cheap or Free)

Normal drill coaches have a lifespan cost of **0** (no impact) or **-3** (actually adds 0.3 weeks of life). Drilling for stats is essentially free.

### Lifespan Budget Example

A monster with 2500 lifespan points (~250 weeks):

| Activity | Lifespan Cost | Weeks Remaining After |
|----------|--------------|----------------------|
| Start of life | -- | 250 weeks |
| 200 weeks of drills (fatigue 0) | 0 | 250 weeks |
| 6 sparring sessions (fatigue ~40 avg) | ~240 points | 226 weeks |
| 200 weeks of drills (fatigue -3) | -600 points (gain!) | ~286 weeks |

The takeaway: **Drills barely cost anything. Sparring is where your lifespan goes.** Plan your sparring carefully.

---

## Stress

Stress is a hidden 0-100 percentage value. Unlike fatigue (which is visible and recovers with rest), stress accumulates more quietly.

### What Stress Affects

1. **Combining quality** -- stress is the primary input to the breeding formula. High-stress parents produce weaker offspring (see Combining doc)
2. **General performance** -- high stress can cause illness or behavioral issues

### Managing Stress

- Stress accumulates from overwork (consecutive heavy training/sparring without rest)
- **Rest your monsters before combining.** Even a few weeks of rest can dramatically improve offspring quality by lowering the stress tier from "average" to "excellent"

---

## Practical Raising Strategy (Backed by ROM Data)

1. **Identify your monster's growth curve type** (community breed guides or testing)
2. **Match your training intensity to the growth window:**
   - Early Bloomer → heavy drills immediately, ease off by mid-life
   - Late Bloomer → light drills early, heavy drills in second half
   - Flat → steady pace throughout
3. **Minimize sparring sessions:**
   - Each sparring costs 3-5 weeks of life
   - Build stats through drills first (they're free)
   - Spar when your stats are high enough for "Good chance" or better messages (fewer attempts needed)
4. **Use the best coaches you can find:**
   - Higher coach stats = higher ceiling for your monster
   - Elite coaches (stat totals 2600+) enable all-999 builds
5. **Rest before combining:**
   - Get stress below 24 for best offspring quality
   - This single tip has more impact on breeding outcomes than anything else
