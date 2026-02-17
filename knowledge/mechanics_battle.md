# MRA2 Battle Mechanics - Complete ROM Analysis

> Extracted via ARM7TDMI / THUMB disassembly of Monster Rancher Advance 2 (USA) ROM.
> Cross-validated against LegendCup community data where possible.

---

## Overview

Battle resolution in MRA2 is a multi-phase scoring system. Each battle turn computes an **outcome score** through 8 sequential phases that consider type compatibility, guts, loyalty, raw stat differences, breed matchups, level gaps, and technique usage. The final score maps to one of 5 outcome tiers that determine damage dealt and guts changes.

**Main Battle Function**: `0x080432E8`

---

## Phase-by-Phase Breakdown

### Phase 1: Type Compatibility

Both monsters have a compatibility byte at `struct+0x104`. These are looked up in a type advantage table:

**Type Index Table**: `0x081E9224` (byte array)
**Type Advantage Table**: `0x081C9A00` (15x15 grid of signed bytes)

```
attacker_compat = type_index_table[attacker.compat_byte]
defender_compat = type_index_table[defender.compat_byte]
combined_index = attacker_compat * 5 + defender_compat
advantage = type_advantage_table[combined_index]    // range: -2 to +2
```

The advantage value feeds into a switch statement that adds/subtracts from the running score. This is essentially a **rock-paper-scissors** layer -- certain monster type pairings have inherent advantages.

**Gameplay Impact**: Type matchups create a strategic layer before any stats matter. A +2 advantage gives a significant head start on the score, while -2 means you're fighting uphill. This is invisible to the player but heavily influences outcomes.

### Phase 2: Guts Modifier

Uses the average guts between both fighters:

```
avg_guts = (attacker.field_0x2F + defender.field_0x2F) / 2
```

**Guts Tier Thresholds**:

| Avg Guts | Tier | Lookup Table 1 | Lookup Table 2 |
|----------|------|----------------|----------------|
| 0-24 | 0 | 5 | 20 |
| 25-49 | 1 | 8 | 25 |
| 50-69 | 2 | 12 | 27 |
| 70-89 | 3 | 13 | 35 |
| 90+ | 4 | 14 | 40 |

**Lookup Table 1**: `0x081C9B10` (5 x uint32)
**Lookup Table 2**: `0x081C9B24` (5 x uint32)

**Gameplay Impact**: Higher guts means more score potential. Monsters that regenerate guts quickly have a compounding advantage -- they can attack more often AND each attack scores slightly higher. The jump from tier 2 to tier 3 (crossing 70 avg guts) is particularly significant, going from 27 to 35 on table 2.

### Phase 3: Loyalty/Mood Modifier

Uses the same tiered threshold structure for field `0x32` (loyalty/mood). Higher loyalty means better battle performance.

**Gameplay Impact**: This is why keeping your monster happy matters in battle. A well-treated monster with high loyalty gets a score bonus on every action. Neglected or stressed monsters fight worse than their raw stats suggest.

### Phase 4: Stat Differences (The Core Formula)

This is where raw stats matter most. For **each of the 6 stats** (POW, INT, SKI, SPD, DEF, LIF):

```
diff = abs(attacker_stat - defender_stat)

if diff > 100:
    adjusted = abs(diff - 100)
    modifier = (adjusted * 20) >> 8       // = adjusted * 20 / 256
    score += 1 + modifier
```

**Worked Example**: Attacker POW = 500, Defender POW = 300

```
diff = |500 - 300| = 200
200 > 100, so:
adjusted = |200 - 100| = 100
modifier = (100 * 20) >> 8 = 2000 >> 8 = 7
score += 1 + 7 = 8
```

**Key Properties**:
- Stats within 100 points of each other contribute **nothing** to the score
- Only advantages beyond the 100-point threshold count
- The formula uses fixed-point arithmetic (multiply then shift right 8 = divide by 256)
- Each stat is evaluated independently, so being dominant in multiple stats compounds the bonus

**Gameplay Impact**: This means small stat differences are irrelevant in battle. If your monster has 450 POW and the opponent has 400, that 50-point gap contributes zero to the score. You need **decisive** stat advantages (>100 gap) to get scoring benefits. This heavily favors specialized monsters over balanced ones -- a monster with 600 POW and 200 INT will score better against most opponents than a monster with 400 in both.

### Phase 5: Breed Compatibility

Similar to Phase 1 but uses breed IDs (field `0x0C`) instead of compatibility bytes:

```
combined_index = defender_breed * 15 + attacker_breed
advantage = breed_advantage_table[combined_index]    // at 0x081C9A19
```

Result is -2 to +2, feeding into another switch-based score modifier.

**Gameplay Impact**: Another hidden layer of type advantage. Some breed families inherently do better against others regardless of stats.

### Phase 6: Level Modifier

```
level_diff = attacker.field_0x12 - defender.field_0x12

if level_diff == 0:    score += 10
if |level_diff| == 1:  score += 5
```

Then, if the attacker has a valid technique (field `0x18`):
```
score = score * 3 / 2     // 1.5x multiplier
```

**Gameplay Impact**: Equal-level fights get a +10 bonus (encouraging matched competition). Being 1 level apart gives +5. The technique multiplier is massive -- using a technique makes your entire accumulated score 50% higher. This is why technique usage is so dominant in competitive play.

---

## Final Score to Outcome (Phase 7)

The accumulated score `r6` maps to outcome tiers:

| Score Range | Tier | Name | Meaning |
|-------------|------|------|---------|
| 0-40 | 0 | Fail | Attack misses or is blocked |
| 41-50 | 1 | Slight | Grazing hit, minimal damage |
| 51-65 | 2 | Moderate | Solid hit, decent damage |
| 66-99 | 3 | Strong | Heavy hit, major damage |
| 100+ | 4 | Overwhelming | Devastating hit, maximum damage |

---

## Guts Change on Outcome (Phase 8)

After resolving the attack, the attacker's guts are modified:

| Outcome Tier | Guts Change | Meaning |
|-------------|-------------|---------|
| 0 (Fail) | **-4** | Whiffing is heavily punished |
| 1 (Slight) | **-1** | Small penalty for weak hits |
| 2 (Moderate) | **0** | Break even |
| 3 (Strong) | **+1** | Rewarded for strong attacks |
| 4 (Overwhelming) | **+1** | Same reward as Strong |

**Gameplay Impact**: Missing attacks (-4 guts) is extremely costly. It creates a death spiral: low accuracy leads to misses, which drain guts, which prevents attacking, which leads to more missed opportunities. This is why SKI (accuracy) is considered one of the most important stats -- even a slightly inaccurate monster can spiral out of control in battle.

Conversely, strong hits generate guts (+1), creating a positive feedback loop for dominant fighters. A monster that lands consistent strong hits essentially has infinite guts.

---

## The Type Advantage Grid

The 15x15 type advantage table at `0x081C9A00` contains values from -2 to +2. Some notable patterns from the extracted data:

- Values of **+2** indicate strong advantage (rock-paper-scissors winner)
- Values of **-2** indicate strong disadvantage
- Values of **0** indicate neutral matchup
- The grid is **not symmetric** -- A beating B doesn't mean B loses to A equally

This means certain breed types have inherently favorable or unfavorable tournament matchups that no amount of stat training can fully overcome.

---

## PRNG in Battle

Battle uses the same Linear Congruential Generator as training:

```
seed = seed * 41
result = ((seed >> 16) + seed) & 0x7FFF
```

**Function**: `0x0806354C`

The PRNG affects technique hit/miss resolution, critical hit chances, and random variance on damage. Because it's a simple LCG with seed * 41, the sequence is deterministic and predictable.

---

## Strategic Implications

### Why Specialized Monsters Win

The stat difference formula (Phase 4) has a 100-point dead zone. This means:
- A monster with 500/500/500/500/500/500 (balanced, 3000 total) scores 0 from stat diffs against a 400/400/400/400/400/400 opponent
- A monster with 800/100/100/800/100/100 (specialized, 2000 total) scores bonuses from the two 400+ gaps even with lower total stats

### Why Accuracy Matters Most

1. SKI directly affects hit rate (whether your attack lands)
2. Missing costs -4 guts (Phase 8)
3. Landing strong hits gives +1 guts
4. Techniques give a 1.5x score multiplier
5. Combined: accurate monsters maintain guts, land techniques, and snowball

### Why Type Matchups Are Hidden Power

Phases 1 and 5 provide up to +4 or -4 advantage from type/breed compatibility alone. This is equivalent to having massive stat gaps. Players who understand the type chart can pick favorable tournament matchups.

---

## Modding Implications

### Easy Balance Changes

| What | ROM Offset | Size | Notes |
|------|-----------|------|-------|
| Type Advantage Grid | `0x001C9A00` | 225 bytes (15x15) | Signed bytes, -2 to +2 |
| Guts Tier Table 1 | `0x001C9B10` | 20 bytes (5 x uint32) | Score contribution by guts |
| Guts Tier Table 2 | `0x001C9B24` | 20 bytes (5 x uint32) | Score contribution by guts |
| Score Thresholds | In code at `0x080432E8` | Immediate values | Tier boundaries (40/50/65/99) |
| Guts Change Values | In code at `0x080432E8` | Immediate values | -4/-1/0/+1 per tier |
| Technique Multiplier | In code | `score * 3 / 2` | Change 3 to adjust multiplier |
| Stat Diff Dead Zone | In code | `cmp diff, #100` | Change 100 to adjust threshold |

### Example Mod: "Reduce Accuracy Dominance"

- Change miss penalty from -4 to -2 guts (less punishing for inaccurate monsters)
- Reduce technique multiplier from 1.5x to 1.25x
- Lower the stat difference dead zone from 100 to 50 (making small advantages count)
- This would make balanced stat builds more viable and reduce the SKI meta
