# MRA2 Extracted Mechanics - Master Reference

> Everything we've confirmed about how Monster Rancher Advance 2 works under the hood,
> extracted from ROM disassembly and cross-validated against community knowledge.
> 
> For detailed breakdowns, see the individual docs:
> - [Training & Raising](mechanics_training.md)
> - [Battle System](mechanics_battle.md)
> - [Lifespan & Aging](mechanics_lifespan.md)
> - [Combining / Breeding](mechanics_breeding.md)

---

## At a Glance: What Decides Outcomes

### Training: What determines stat gains?

**Inputs:** Your coach's stat totals, your monster's growth curve type (early/mid/late/flat bloomer), your monster's current aging stage (young vs old), and a 57-week internal cycle.

**Output:** Stat gains per week, capped at 999. Higher coach stats = higher ceiling. Peak growth happens during your breed's "bloom window" (rate of 30 vs minimum of 10). Regular drills are free; sparring costs 2.7-4.5 weeks of lifespan per session.

### Battle: What determines hit/miss and damage?

**Inputs (in order of evaluation):**
1. Hidden type compatibility (-2 to +2, rock-paper-scissors between monster types)
2. Current guts level (higher = stronger attacks, tiered at 25/50/70/90)
3. Loyalty/mood (higher = better performance)
4. Stat gaps vs opponent (only gaps > 100 points count; each stat evaluated independently)
5. Hidden breed compatibility (-2 to +2)
6. Level difference (same level: +10 bonus; 1 apart: +5)
7. Whether a technique was used (1.5x multiplier on entire score)

**Output:** Score mapped to outcome tier:
- 0-40 = Miss (attacker loses 4 guts)
- 41-50 = Grazing hit (attacker loses 1 guts)
- 51-65 = Solid hit (no guts change)
- 66-99 = Heavy hit (attacker gains 1 guts)
- 100+ = Devastating (attacker gains 1 guts)

**Key takeaway:** ACC matters most because missing costs -4 guts (death spiral). Specialization beats balance because stat gaps under 100 contribute nothing. Techniques multiply everything by 1.5x.

### Lifespan: What determines how long your monster lives?

**Inputs:** Breed (determines base lifespan of 237-280 weeks), sparring frequency (each session costs 2.7-4.5 weeks), and growth curve type (determines when growth peaks).

**Output:** Total usable weeks. Regular drills are free or slightly beneficial. The real lifespan drain is sparring.

**Key takeaway:** Breed choice only causes ~18% lifespan variance. Your sparring decisions matter far more. "Train early, learn later" is mechanically optimal.

### Combining: What determines offspring quality?

**Inputs:**
1. Parents' stress levels → averaged → mapped to tier 1-5
2. Breed combination → may give +10 bonus to specific stats
3. Parents' current stats → multiplied by formula
4. Parents' technique proficiency → must be >48 for tech inheritance
5. Parents' personality traits → lower 3 bits OR'd together

**Output:** Offspring with stats calculated as:
```
offspring_stat = parent_stat * (1 + (breed_bonus + stress_tier) / 100), capped at 255
```

**Key takeaway:** Breed bonus (+10) matters more than stress tier. Rest parents before combining to lower stress. Both parents need technique proficiency >48 to pass on moves.

---

## Confirmed vs Community Knowledge

| What We Found | Community Believed | Match? |
|--------------|-------------------|--------|
| Lifespan measured in points (10/week) | 10 pts/week | Confirmed |
| 65 coach profiles with fixed stats | Named coaches like Morgan, Arther | Confirmed (stats match) |
| Stats cap at 999 | 999 cap | Confirmed |
| Sparring costs lifespan (27-45 pts/session) | "Sparring wears them out" | Confirmed, now quantified |
| 6 growth curve types (early/late bloomers) | "Some breeds grow early/late" | Confirmed, now exact values |
| Miss penalty is -4 guts | Not widely known | New finding |
| Stat diff dead zone of 100 | Not widely known | New finding |
| Technique multiplier is 1.5x | Not widely known | New finding |
| Combining stat cap is 255 | Not widely known | New finding |
| RNG is seed * 41 (exploitable) | Save/reload works (Nyght Method) | Explains the exploit |

---

## Technical Reference

For ROM addresses, field offsets, function locations, and data table formats used to extract these mechanics, see:
- `analysis/formulas/` -- Python implementations of each formula with ROM data extraction
- `analysis/functions/` -- Annotated disassembly traces of 20+ key functions
- `analysis/game_state_schema.md` -- Complete 154-field game state layout
