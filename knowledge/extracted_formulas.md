# MRA2 Extracted Mechanics - Complete Master Reference

> Everything confirmed about how Monster Rancher Advance 2 works under the hood,
> extracted from ROM disassembly and cross-validated against community knowledge.
> 
> **Individual Detailed Guides:**
> - [Training & Raising](mechanics_training.md) -- Drill types, coach system, stat gain formula
> - [Battle System](mechanics_battle.md) -- 8-phase scoring, technique table, guts regen
> - [Lifespan & Aging](mechanics_lifespan.md) -- Weekly drain formula, growth curves, aging stages
> - [Fatigue, Stress & Food](mechanics_fatigue_stress_food.md) -- Fatigue accumulation, stress, food bonuses, happiness
> - [Sparring & Technique Learning](mechanics_sparring.md) -- Deterministic learning conditions, sparring stat gains
> - [Traits / Characteristics](mechanics_traits.md) -- 87 traits, effect types, stat modifiers
> - [Items, Food & Expeditions](mechanics_items_food.md) -- 76 items, food preferences, expedition loot
> - [Combining / Breeding](mechanics_combining.md) -- Breed table, 27 Legendary recipes, stat inheritance
> - [Tournaments & Rank](mechanics_tournaments.md) -- Rank progression, prizes, stray encounters
> - [Shrine / Passwords](mechanics_shrine.md) -- Password hashing algorithm, breed/stat generation

---

## At a Glance: What Decides Outcomes

### Training: What determines stat gains?

**Inputs:** Coach profile (65 hardcoded coaches), Light vs Heavy Drill type, monster's growth curve (6 types), aging stage (0-15), challenge minigame results, pattern matching against master data table.

**Key findings:**
- Light Drills have **equal stat weights** (300 per stat), Heavy Drills are **skewed** (POW:480, DEF:450, LIF:400 >> INT:120, ACC:150, SPD:150)
- Stat deltas are determined by **pattern matching** challenge results against a master data table -- not by a simple formula
- Failed drills give **zero stats** (the default handler zeros all deltas)
- Growth grades (4-bit nibbles from monster type record) affect training difficulty, which affects minigame results, which affects stat lookups
- Stats capped at 999, drills cost 0 or -3 lifespan, sparring costs 27-45

### Battle: Score-Based, Not Random

**Inputs (8 phases):**
1. Type compatibility (-2 to +2)
2. Guts level (tiered at 25/50/70/90)
3. Loyalty (7-bracket lookup)
4. Stat gaps (only gaps > 100 matter)
5. Breed compatibility (-2 to +2)
6. Level difference (+10 same, +5 off by 1)
7. Technique multiplier (1.5x if either has a technique)
8. Score → Tier (Miss/Slight/Moderate/Strong/Overwhelming)

**Key findings:**
- **No hit/miss dice roll** -- outcomes are deterministic from the score
- **275 techniques** across 30 breeds, 56 bytes each (damage 9-56, accuracy 24-80, guts cost 30-60, sharpness 0-45)
- **Guts regen by SPD**: 8.4 seconds (fast) to 29.2 seconds (slow) per tick
- **Sharpness** biases toward higher tiers (replaces "crit" in other games)
- **Multi-hit techniques** resolve each hit independently

### Lifespan: Weekly Drain Formula

**Base drain:** 400-500 points per week to Lifespan B, plus random component based on growth rate (±10 points), plus food bonus offset.

**Key findings:**
- **Trait 0x33 (Listless)** increases drain by 50%
- **Fatigue accelerates with age**: +1 base/week, up to +3/week for elderly monsters
- **Stress increases by +1 every REST week** (counterintuitive -- idle = bored)
- **Happiness drain scales with loyalty**: high-loyalty monsters need MORE attention (150-200 drain/week vs 30-50 for disloyal)

### Sparring: Deterministic, Not Random

**Key findings:**
- **Technique learning is NOT probabilistic** -- it's a series of 35 condition checks via a jump table
- **"Good Chance" messages** are proximity indicators to meeting conditions, not probabilities
- **Sparring stat gain = current_stat - breed_base_stat** (calculated at hiring, applied weekly)
- **AGIMA stats are display-only** -- they don't affect actual stat gains
- **Traits reset to 0 weekly** during training -- traits develop through other systems

### Traits: 87 Characteristics with 6 Effect Types

**Key findings:**
- **StatKing** (0x56): +50 to ALL 6 battle stats (best trait)
- **Listless** (0x33): 50% more lifespan drain + halved training (worst trait)
- **Worn Out** (0x3E): Forces aging_stage=1 permanently (stunted growth)
- Element traits (Fire/Ice/Lightning/Water/Wind/Earth/Mind/Magic) give +3 or +5 to matching techniques, -3 or -5 to opposing
- Traits stored in 6 slots, checked via linear search at runtime

### Combining: Breed Table + Compatibility Score

**Key findings:**
- **30×40 breed combination matrix** at 0x081E88C0 (asymmetric with transposed fallback)
- **Stats are NOT inherited from parents directly** -- offspring starts from breed base stats, modified by compatibility percentage
- **27 Legendary recipes**: 11 item-triggered, 9 breed-pair + unlock flag, 7 advanced condition
- **Fureria/Gadamon/Buragma**: +10% to 2 stats each during combining

### Items: 76 Items Decoded

**Key findings:**
- **Food reduces fatigue/stress** (HonCandy: -30 fatigue, MntCandy: -50 fatigue + -100 stress)
- **Supplements are breed-indexed** -- same item has different effects on different breeds
- **Gems are passive weekly bonuses** -- Shiny/Glimmer/Bright Gem offset weekly drain
- **Expedition loot requires stat thresholds** (>499 and >699) and PRNG scoring

### Tournaments: Rank + Decay System

**Key findings:**
- **Ranks E through S** (0-5), rank-up at month end
- **Monthly stat/rank point decay**: -2 to -20 based on current magnitude
- **Stray encounters** require stat_total > 499 AND rank_points > 699
- **Opponent stats capped at 250** per stat (much lower than player max of 999)

### Shrine: Polynomial Hash Password System

**Key findings:**
- 4 polynomial hashes (main breed, sub breed, stat deltas, trait) from same password
- Hash 4 assigns a **trait** (not technique as originally labeled) -- only **23 of 87 traits** are password-assignable
- **IronHart** (0x2C) is NOT password-assignable -- only appears as breed default on Zuum/Special
- Breed default traits (from monster type record +0x24) are assigned separately during `monster_init`
- Final shrine monster = breed defaults + 1 password trait
- TRAIT_NAMES mapping verified against LegendCup community data (492 breed entries cross-referenced with ROM)

**Key findings:**
- **4 separate hashes** from one password (alternating multiply/add per character)
- **256-entry lookup tables** for breed determination
- **64-entry stat delta table** for starting stat variation (-23 to +25 per stat)
- **Dictionary table** at 0x08217368 provides hardcoded word-to-monster shortcuts
- **Password length matters**: 1 char = pure breed only; 3+ chars = full system

---

## Confirmed vs Community Knowledge

| What We Found | Community Believed | Match? |
|--------------|-------------------|--------|
| Lifespan measured in points (10/week) | 10 pts/week | Confirmed |
| 65 coach profiles with fixed stats | Named coaches like Morgan, Arther | Confirmed |
| Stats cap at 999 | 999 cap | Confirmed |
| Sparring costs 27-45 pts/session | "Sparring wears them out" | Confirmed + quantified |
| 6 growth curve types | "Some breeds grow early/late" | Confirmed + exact values |
| Technique learning is deterministic | "It's probabilistic" | **Contradicts** community belief |
| AGIMA stats are display-only | "AGIMA stats affect gains" | **Contradicts** community belief |
| Stress +1 per REST week | Not widely known | New finding |
| High loyalty = more happiness drain | Counter-intuitive | New finding |
| Miss penalty is -4 guts | Not widely known | New finding |
| 100-point stat dead zone | Not widely known | New finding |
| 1.5x technique multiplier | Not widely known | New finding |
| Parent stats don't directly transfer | "Stats inherited from parents" | **Major correction** |
| Traits reset during training | Not widely known | New finding |
| 87 decoded traits with 6 effect types | Partial community lists | Extended + quantified |
| 27 Legendary combining recipes | Partially known | Fully decoded |
| Only 23 traits assignable by passwords | Not documented | New finding |
| Breed default traits at record +0x24 | Not documented | New finding |
| Password polynomial hash algorithm | Black box | Fully decoded |

---

## Technical Reference

For ROM addresses, field offsets, function locations, and data table formats:
- `analysis/formulas/` -- Python implementations of each formula with ROM data extraction
- `analysis/functions/` -- Annotated disassembly traces of 30+ key functions
- `analysis/game_state_schema.md` -- Complete 154-field game state layout
- `analysis/formulas/technique_data.json` -- Full 275-technique database
- `analysis/formulas/fatigue_stress_food_data.json` -- Growth tables, loyalty drain, item data, breed food preferences
