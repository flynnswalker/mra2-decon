# MRA2 Training & Raising Mechanics

> What actually determines your monster's stat gains, and what hidden costs come with different training choices.

---

## How Weekly Training Works

Every week you choose an action for your monster: Rest, Light Drill, Heavy Drill, Sparring, or enter a Tournament. Behind the scenes, each drill and sparring session is governed by a **coach record** -- a set of fixed numbers that determine exactly what your monster gains (and loses) that week.

### The Coach System

MRA2 has **65 predefined coach profiles** stored in the game. Each coach has:

- **Stat totals** for POW, INT, ACC, SPD, DEF, and LIF (these cap what your monster can gain from that coach)
- **Drill difficulty** (3 = easy, 4 = medium, 5 = hard)
- **A breed association** (main + sub breed)
- **Trait modifiers** (personality traits that can be passed to your monster)
- **A fatigue cost** (the hidden lifespan penalty -- see below)
- **Technique slots** (whether this coach's sparring can teach moves)

The named coaches the community knows -- Morgan, Arther, Aegis, Scarlet, etc. -- correspond to specific entries in this table. "AGIMA coaches" (the generic ones the game provides for free) also have entries.

**The key insight**: Your monster's stat gains from drills are bounded by your coach's stat totals. If your coach has 400 POW, once your monster approaches that level, gains from that coach taper off. This is why the community says "get the best coaches" -- coaches with higher stat totals let your monster grow further.

### What Determines Stat Gains

**Inputs that matter:**
1. **Which coach you're using** -- their stat totals set the ceiling for your growth
2. **Your monster's current stats** -- gains slow as you approach the coach's level
3. **Your monster's growth curve type** -- each breed has a hidden "bloomer type" (early, mid, late, or flat) that determines *when* in their life they grow fastest (see Lifespan doc)
4. **Your monster's current aging stage** -- a 0-15 internal value based on how much life your monster has left. Peak growth happens at the sweet spot for your breed type (rate of 30), while very old monsters barely grow (rate of 10)
5. **A hidden 57-week cycle** -- the game has an internal counter that cycles 0-56 and resets. Most of the cycle (weeks 0-49) is normal. Weeks 50-54 are a "bonus window" with slightly elevated gains, peaking at weeks 52-54. Then it resets. This cycle runs regardless of what you do.

**What does NOT matter (as much as you'd think):**
- The specific drill type (Light vs Heavy) mainly determines fatigue cost and which stats are targeted, but within that, the coach's profile dominates
- Random variance exists (via the game's RNG) but the base gains are deterministic per coach

### Stats Are Capped at 999

Every stat is clamped to the range 0-999. You cannot exceed 999 in any stat through training.

---

## The Hidden Lifespan Cost of Sparring

This is one of the most important hidden mechanics in the game. Every coach profile has a **fatigue delta** -- a number that gets subtracted from your monster's remaining lifespan every week you use that coach.

### The Three Tiers of Lifespan Cost

| Cost Category | What It Means | Lifespan Lost Per Week | Found In |
|--------------|---------------|----------------------|----------|
| **Beneficial (-3)** | Actually adds a tiny bit of lifespan | +0.3 weeks gained | Many high-difficulty drill coaches |
| **Neutral (0)** | No lifespan impact at all | None | Many moderate coaches |
| **Expensive (27-45)** | Significant lifespan drain | 2.7 to 4.5 weeks lost | Coaches that can teach techniques via sparring |

### What This Means for Your Game

**Sparring is expensive.** Coaches whose profiles include technique slots (meaning they can teach your monster new moves) carry fatigue costs of 27-45. Since 10 lifespan points equals 1 in-game week, a single week of sparring with a fatigue cost of 45 shortens your monster's life by **4.5 weeks**.

**Regular drills are basically free.** Most drill-only coaches have a fatigue cost of 0 or even -3 (beneficial). This means you can drill for stats all day long with negligible lifespan impact.

**Practical example:** You have a monster with 250 weeks of life. If you spar 8 times (average fatigue cost ~40), that's 320 lifespan points = 32 weeks of life gone. Your monster now effectively has 218 weeks to live -- a 13% reduction. But if you only do regular drills, you might actually gain a few weeks.

**The strategic takeaway (confirmed by community wisdom):** GoldenBoy's advice of "TRAIN EARLY, LEARN LATER" is backed by the code. Build your stats first through cheap drills, then learn techniques through sparring when your monster is strong enough to do it efficiently (fewer sparring attempts needed = less lifespan spent).

---

## The Random Number Generator

The game uses a very simple pseudo-random number generator: `seed = seed * 41`. This is a Linear Congruential Generator with low entropy, which means:

- Training outcomes are **deterministic** if you know the seed
- This is why the **save/reload method** (the "Nyght Method") works -- the RNG state is fixed at save time, so reloading and making the same choices produces the same result. Making a *different* choice advances the RNG to a different state, potentially giving better results.

---

## Coach Quality Tiers (from ROM data)

Looking at the 65 coaches in the game, they cluster into clear tiers:

| Tier | Stat Total Range | Drill Difficulty | Examples |
|------|-----------------|-----------------|----------|
| **Basic** | 1400-1700 | 3 | Early-game AGIMA coaches |
| **Standard** | 1700-2100 | 3-4 | Mid-game coaches |
| **Advanced** | 2100-2600 | 4-5 | Named coaches like Morgan, Arther |
| **Elite** | 2600-3500 | 5 | Late-game / special coaches |
| **Legendary** | 3500-3850 | 5 | Endgame coaches (stat totals of 700-900 per stat) |

The top coaches in the game have individual stats of 800-900 and total stat pools of 3500+. These are the coaches the community refers to when talking about maxing monsters to all-999.

---

## Traits from Coaches

Coaches can pass personality traits (like Hi Aim, Charisma, Ironhart, Up Mind, etc.) to your monster during sparring. Each coach has specific trait modifiers -- whether they pass a trait depends on a probability check using those modifiers.

Community observations confirmed by the code:
- Traits and techniques are resolved independently during sparring
- You can get a trait, a technique, both, or neither from a single sparring session
- If a coach has a high trait modifier, you're very likely to get that trait before getting a technique (which matches the community observation that traits sometimes "block" technique learning until acquired)
