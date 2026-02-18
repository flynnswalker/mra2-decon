# MRA2 Battle Mechanics

> How battles are resolved, what determines damage, and the complete technique system.

---

## Overview: Score-Based, Not RNG-Based

MRA2's battle system is fundamentally **deterministic**. There is no hit/miss dice roll. Instead, each attack computes an **outcome score** through 8 additive phases. The score maps to a tier that determines the result. The only PRNG usage is for tiebreaking when POW equals INT.

---

## The 8-Phase Scoring System (0x080432E8)

Every attack resolves by accumulating a score through these phases:

### Phase 1: Type Compatibility
- Both monsters' type bytes are looked up in a 15x15 compatibility table at `0x081C9A00`
- Each side gets a compatibility value; combined value gives -2 to +2 advantage
- Strong type advantage can shift the score significantly

### Phase 2: Guts Modifier
- `avg_guts = (attacker_guts + defender_guts) / 2`
- Tiered into 5 brackets:

| Avg Guts | Tier |
|----------|------|
| ≤ 24 | 0 (Very Low) |
| 25-49 | 1 (Low) |
| 50-69 | 2 (Medium) |
| 70-89 | 3 (High) |
| ≥ 90 | 4 (Very High) |

- Each tier provides a modifier from lookup tables at `0x081C9B10`

### Phase 3: Loyalty/Morale Modifier
- Same 5-tier structure using the monster's loyalty value
- Lookup from `0x081C9B24`

### Phase 4: Stat Differences (The Big One)
For **each** of the 6 stats (POW, INT, ACC, SPD, DEF, LIF):
```
diff = abs(attacker_stat - defender_stat)
if diff > 100:
    bonus = 1 + (abs(diff - 100) * 20) / 256
    score += bonus
```

**Key insight: The 100-point dead zone.** Stat differences of 100 or less contribute NOTHING to the score. Only the portion above 100 matters. This means having 150 POW vs an opponent with 100 POW only counts as a 50-point advantage (just barely above the threshold).

This affects all 6 stats, so a monster with a 200-point advantage in 3 stats gets a much larger cumulative bonus than one with a 300-point advantage in just 1 stat.

### Phase 5: Breed Compatibility
- Uses breed IDs in a 15x15 breed compatibility table at `0x081C9A19`
- Formula: `table[defender_breed * 15 + attacker_breed]`
- Gives -2 to +2 advantage, similar switch-based score modifier as Phase 1

### Phase 6: Level Modifier
- Same level: +10 to score
- Differ by 1 level: +5 to score
- Differ by 2+: no level bonus

### Phase 7: Technique Multiplier
- If either combatant has a valid technique equipped: **score = score × 3 / 2** (1.5x multiplier)
- This is one of the most important modifiers -- having ANY technique gives a 50% score boost

### Phase 8: Score to Outcome Tier

| Score | Tier | Result |
|-------|------|--------|
| ≤ 40 | 0 | Miss |
| 41-50 | 1 | Slight Hit |
| 51-65 | 2 | Moderate Hit |
| 66-99 | 3 | Strong Hit |
| ≥ 100 | 4 | Overwhelming |

**Level cap**: When `min(attacker_level, defender_level) ≤ 1`, the tier is capped at 3 (Strong). This prevents early-game monsters from getting Overwhelming results.

---

## Guts: Change and Regeneration

### Guts Change per Attack

| Outcome | Guts Change |
|---------|-------------|
| Miss (Tier 0) | -4 guts |
| Slight (Tier 1) | -1 guts |
| Moderate (Tier 2) | 0 guts |
| Strong (Tier 3) | +1 guts |
| Overwhelming (Tier 4) | +1 guts |

Missing attacks is devastating -- you lose 4 guts, which directly reduces your guts modifier in Phase 2 for subsequent attacks.

### Guts Regeneration Rate

Guts regenerate on a timer. The timer interval is determined by the monster's **SPD stat**, tiered into 6 brackets:

| SPD Tier | Timer (frames) | Approx. Seconds |
|----------|---------------|-----------------|
| Very Low | 1751 | ~29 seconds |
| Low | 1501 | ~25 seconds |
| Medium-Low | 1251 | ~21 seconds |
| Medium | 1001 | ~17 seconds |
| Medium-High | 751 | ~12.5 seconds |
| High | 501 | ~8.4 seconds |

**Practical meaning:** A fast monster (high SPD) regenerates guts nearly 3.5x faster than a slow one. This makes SPD critical for sustained battle performance -- not just for dodging, but for being able to attack more frequently.

---

## The Technique System

### Technique Data Table

Located at ROM `0x08208CB0` -- an index table of 300 uint16 offsets (30 breeds × 10 technique slots), pointing to 56-byte technique records. **275 unique techniques** across 30 breeds.

### Technique Record Structure (56 bytes)

| Field | Offset | Size | Range | Description |
|-------|--------|------|-------|-------------|
| Name | 0x00 | 32 | -- | Tile-encoded name |
| Range | 0x24 | u8 | 0-1 | 0 = Close/Mid, 1 = Mid/Far |
| Force Type | 0x25 | u8 | 0-2 | 0 = POW-based, 1 = INT-based, 2 = Both |
| Element | 0x26 | u8 | bitfield | Element flags |
| Hit Class | 0x27 | u8 | 0-6 | Animation/hit style |
| Target | 0x28 | u8 | bitfield | Targeting mode |
| AoE | 0x29 | u8 | bitfield | Area of effect |
| Multi-Hit | 0x2A | u8 | 0-2 | 0 = single, 1 = double, 2 = triple |
| Errantry Rank | 0x2C | u8 | 0-4 | Minimum rank to learn |
| Slot Tier | 0x2D | u8 | 0-5 | Technique tier level |
| **Guts Cost** | 0x2E | u16 | 300-600 | Stored ×10 (actual cost: **30-60 guts**) |
| **Damage** | 0x30 | u8 | 9-56 | Base damage rating |
| **Accuracy** | 0x31 | u8 | 24-80 | Base accuracy rating |
| **Sharpness** | 0x32 | u8 | 0-45 | Critical/sharpness modifier |
| Withering | 0x33 | u8 | 0-54 | Stat drain power |
| Mystery Mod | 0x34 | u8 | 0-40 | Additional modifier |
| Status Chance | 0x35 | u8 | 0-99 | Status infliction % |
| Effect Type | 0x36 | u8 | 0-11 | Status effect ID |
| Effect Param | 0x37 | u8 | 0-35 | Effect magnitude |

### Key Technique Properties

**Guts Cost**: Ranges from 30 to 60 guts per use. Cheaper techniques can be used more often but tend to be weaker. The guts cost directly trades off against guts regeneration rate.

**Damage Rating (9-56)**: This is the base power. Higher values deal more HP damage. Combined with Force Type:
- POW-based (type 0): Damage scales with attacker's POW vs defender's DEF
- INT-based (type 1): Damage scales with attacker's INT vs defender's INT
- Both (type 2): Uses the higher of POW or INT

**Accuracy (24-80)**: Higher accuracy makes the attack more likely to resolve at a higher outcome tier. Low accuracy techniques are powerful but risk missing (tier 0 = -4 guts penalty).

**Sharpness (0-45)**: The "crit" modifier. Higher sharpness increases the probability of the attack resolving at Strong or Overwhelming tier rather than Moderate. There is no separate "critical hit" check -- sharpness simply biases the tier resolution upward.

**Multi-Hit**: Some techniques hit 2 or 3 times. Each hit resolves separately through the scoring system.

### Status Effects

| Effect Type | Name | Count of Techs | Description |
|-------------|------|---------------|-------------|
| 0 | None | -- | No special effect |
| 1 | Buff (passive) | Various | Auto-activates when status_chance=0 |
| 2 | Debuff (passive) | Various | Auto-activates when status_chance=0 |
| 4 | Speed Mod | Various | Modifies SPD |
| 5 | Power Mod | Various | Modifies POW/INT |
| 6 | Defense Mod | Various | Modifies DEF |
| 7 | Paralyze | 8 techs | Prevents action |
| 8 | Poison | 5 techs | Damage over time |
| 9 | Stagger | 31 techs | Interrupts/delays |
| 11 | Instant KO | 1 tech | 99% instant kill chance |

Status effects are applied based on the technique's `status_chance` percentage, using the PRNG.

---

## How Damage Translates to HP Loss

The damage formula uses the technique's base damage combined with the attacker's relevant stat (POW or INT) and the outcome tier:

1. **Base power** = technique.damage
2. **Stat scaling**: For POW-based attacks, the attacker's POW is compared against defender's DEF. For INT-based, attacker's INT vs defender's INT (INT serves as both magic offense and defense).
3. **Tier multiplier**: Higher outcome tiers (Strong, Overwhelming) multiply the final damage. Miss (tier 0) deals zero damage.
4. **Sharpness bonus**: High sharpness biases toward higher tiers, effectively increasing average damage output.

The stat comparison in Phase 4 (the 100-point dead zone) is the primary factor. A monster with 500 POW attacking a defender with 200 DEF has a 300-point difference, of which 200 points (above the 100 threshold) contribute to the score.

---

## Practical Battle Strategy

1. **ACC (Accuracy stat) is king** -- missing costs 4 guts AND deals 0 damage. High ACC improves your score in Phase 4 AND prevents the guts death spiral.

2. **The 100-point dead zone matters** -- being 100 points ahead in a stat is functionally the same as being equal. You need to push PAST 100-point advantages to see returns.

3. **SPD determines guts regen** -- fast monsters attack more frequently with 3.5x faster guts recovery at top tier.

4. **Always equip a technique** -- the 1.5x score multiplier from Phase 7 is enormous. Even a weak technique is better than no technique.

5. **Type and breed matchups** -- the Phase 1 and Phase 5 compatibility checks can swing results by several tiers. Know your matchups.

6. **Loyalty matters** -- high loyalty improves the Phase 3 modifier. Low loyalty can trigger Confusion status in battle.

7. **Multi-hit techniques** are valuable because each hit independently scores, meaning 2-3 chances to land a Strong or Overwhelming result.

8. **Sharpness is the hidden stat** -- techniques with 40+ sharpness consistently resolve at higher tiers, making them more reliable damage dealers than high-damage/low-sharpness alternatives.
