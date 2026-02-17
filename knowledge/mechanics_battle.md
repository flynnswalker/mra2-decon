# MRA2 Battle Mechanics

> What actually determines whether your monster's attacks land, how hard they hit, and who wins fights.

---

## How a Battle Turn Works

Every time your monster takes an action in battle, the game computes an **outcome score** by running through several checks in order. The final score determines whether the attack was a miss, a weak hit, a solid hit, or a devastating blow. Here's what feeds into that score, in the order the game evaluates them:

### 1. Type Compatibility (Hidden Rock-Paper-Scissors)

Every monster has a hidden **compatibility type**. The game cross-references the attacker's type against the defender's type in a 15x15 matchup grid. The result is a modifier from **-2** (strong disadvantage) to **+2** (strong advantage).

**What this means:** Before stats even matter, some monsters have a built-in edge against others. This is completely invisible to the player. A +2 advantage gives a meaningful head start on the outcome score, while a -2 means you need significantly better stats just to break even.

### 2. Guts Level

The game averages both monsters' current guts and maps it to a tier:

| Average Guts | Tier | Score Contribution |
|-------------|------|-------------------|
| 0-24 | Low | Small bonus |
| 25-49 | Medium-Low | Moderate bonus |
| 50-69 | Medium | Good bonus |
| 70-89 | High | Strong bonus |
| 90+ | Very High | Maximum bonus |

**What this means:** Higher guts at the moment of attack = stronger attacks. Monsters with fast guts regeneration get a double benefit: they can attack more often AND each attack scores higher.

### 3. Loyalty / Mood

Uses the same tiered system as guts. Higher loyalty = better battle performance.

**What this means:** A well-treated, happy monster literally fights harder than a stressed or neglected one. This is a direct, mechanical bonus, not just flavor.

### 4. Stat Differences (The Core of Combat)

This is the biggest factor. For **each of the 6 stats** (POW, INT, ACC, SPD, DEF, LIF), the game checks the gap between attacker and defender:

**The rule:** Stat differences of 100 or less **contribute nothing**. Only gaps above 100 count.

For gaps above 100, the bonus per stat is:

```
bonus = 1 + (gap_above_100 * 20 / 256)
```

**Worked examples:**
- Your POW is 450, opponent's POW is 400 → gap is 50 → **no bonus** (under 100)
- Your POW is 500, opponent's POW is 300 → gap is 200 → bonus = 1 + (100 * 20 / 256) = **8 points**
- Your POW is 700, opponent's POW is 200 → gap is 500 → bonus = 1 + (400 * 20 / 256) = **32 points**

This is calculated for ALL 6 stats and the bonuses stack.

**What this means for gameplay:**

This is the single most important formula in the battle system, and it has huge strategic implications:

- **Small advantages don't matter.** If you and your opponent are within 100 points on every stat, the stat phase contributes ZERO to your score. The battle is decided entirely by type matchups, guts, loyalty, and luck.

- **Specialization beats balance.** A monster with 600 POW and 200 INT will often outperform one with 400 in both, because the 600 creates a gap above the threshold while 400 might not. Total stat points matter less than having *decisive advantages* in specific stats.

- **DEF and LIF count too.** It's not just offensive stats -- the game checks ALL six, so having 300 more DEF than your opponent gives you scoring bonus just like having 300 more POW.

### 5. Breed Compatibility

Similar to type compatibility but uses the monster's breed family. Another hidden -2 to +2 modifier from a matchup grid.

### 6. Level Difference

- Same level: **+10** to score
- One level apart: **+5** to score
- More than one level apart: no bonus

### 7. Technique Multiplier

If the attacker uses a technique: **entire score is multiplied by 1.5x**

**What this means:** Using a technique is enormously powerful. It doesn't just add damage -- it multiplies your ENTIRE accumulated score from all the previous phases by 50%. This is why technique usage dominates competitive play.

---

## From Score to Outcome

After all phases, the final score maps to one of 5 outcomes:

| Score | Outcome | What Happens |
|-------|---------|-------------|
| 0-40 | **Miss / Block** | Attack fails entirely |
| 41-50 | **Grazing Hit** | Minimal damage |
| 51-65 | **Solid Hit** | Decent damage |
| 66-99 | **Heavy Hit** | Major damage |
| 100+ | **Devastating** | Maximum damage |

---

## Guts Change After Attacking

After each attack resolves, the attacker's guts are adjusted:

| Outcome | Guts Change | Why This Matters |
|---------|------------|-----------------|
| Miss | **-4 guts** | Whiffing is brutally punished |
| Grazing Hit | **-1 guts** | Small penalty |
| Solid Hit | **No change** | Break even |
| Heavy Hit+ | **+1 guts** | Rewarded for dominance |

**What this means:** Missing creates a **death spiral**. Your monster misses → loses 4 guts → can't attack for a while → falls behind → the next attack is at lower guts (weaker) → more likely to miss again. This is why ACC (accuracy / hit rate) is widely considered the most important stat in MRA2. An inaccurate monster can lose battles it should win on raw stats because of the miss penalty spiral.

Conversely, a monster landing consistent heavy hits gets +1 guts per attack, essentially fueling infinite aggression.

---

## Why Certain Monsters Dominate

Putting all the formulas together explains the competitive meta:

1. **ACC is king** because missing costs -4 guts and hitting gives +1, creating feedback loops in both directions.

2. **Specialized builds beat balanced ones** because the stat difference formula has a 100-point dead zone. A monster with two stats at 700 creates scoring gaps where a balanced monster with six stats at 450 creates none.

3. **Techniques are essential** because the 1.5x multiplier on your entire score makes the difference between "Solid Hit" and "Devastating" consistently.

4. **Hidden type matchups** mean some fights are rigged before they start. A monster with +2 type advantage AND +2 breed advantage gets roughly the equivalent of a 200-point stat gap for free.

5. **Guts regen rate** compounds everything. Fast guts means more attacks per fight AND higher guts at moment of attack AND ability to recover from misses faster.

---

## What This Means for Balance Modding

The most impactful changes to the battle system:

- **Reducing the 100-point dead zone** (e.g., to 50) would make small stat differences matter, rewarding balanced builds
- **Reducing the miss penalty** (e.g., -4 to -2 guts) would make inaccurate but powerful monsters more viable
- **Reducing the technique multiplier** (e.g., 1.5x to 1.2x) would reduce technique dominance
- **Changing the type matchup grid** could rebalance which breeds are favored in tournaments
