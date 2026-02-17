# MRA2 Extracted Formulas - Master Reference

> All formulas extracted from Monster Rancher Advance 2 (USA) GBA ROM via ARM7TDMI/THUMB disassembly.
> Cross-validated against LegendCup community data. See individual `mechanics_*.md` files for full details.

---

## Quick Reference: Every Formula We Found

### 1. Aging Stage (determines growth/decay rates)

```
stage = clamp((field_0x16 - field_0x17) * 16 / field_0x16, 0, 15)
```

- `field_0x16` = remaining lifespan (uint16 at offset 0x0094)
- `field_0x17` = reference lifespan (int16 at offset 0x0096)
- Result 0-15 indexes into growth curve table at `0x083F3E20`
- Division is signed integer (truncates toward zero)

### 2. Training Stat Gains (per week)

```
new_stat = clamp(current_stat + weekly_delta, 0, 999)
```

- `weekly_delta` = signed byte from coach record at offset +0x1A (one per stat)
- Coach table: 65 records of 56 bytes at ROM `0x0821856C`
- Stats clamped to [0, 999] by Type 10 field handler

### 3. Training Lifespan Cost

```
field_0x16 += fatigue_delta
field_0x17 += fatigue_delta
```

- `fatigue_delta` = signed byte at coach record offset +0x0E
- Range: -3 (beneficial) to +45 (costly)
- Technique-teaching coaches: 27-45 (expensive)
- Regular coaches: -3 or 0 (cheap/free)
- 10 lifespan points = 1 game week

### 4. Growth Rate Lookup

```
rate = rom[0x083F3E20 + growth_curve_type * 16 + aging_stage]
```

- `growth_curve_type` = field 0x13 (breed-specific, 0-5+)
- Rate values: 10 (minimum, near death) to 30 (peak growth)
- 6 curve types: Early Bloomer, Early-Mid, Mid, Mid-Late, Late Bloomer, Flat

### 5. Battle Score (multi-phase accumulation)

```
score = 0
score += type_compatibility_bonus           // Phase 1: -2 to +2 from type chart
score += guts_tier_bonus                    // Phase 2: from avg guts tier (0-4)
score += loyalty_tier_bonus                 // Phase 3: from loyalty tier
for each stat in [POW, INT, SKI, SPD, DEF, LIF]:
    diff = abs(attacker_stat - defender_stat)
    if diff > 100:
        score += 1 + (abs(diff - 100) * 20) >> 8   // Phase 4
score += breed_compatibility_bonus          // Phase 5: from breed chart
if level_diff == 0: score += 10             // Phase 6a
elif abs(level_diff) == 1: score += 5       // Phase 6b
if has_technique: score = score * 3 / 2     // Phase 6c: 1.5x technique bonus
```

### 6. Battle Outcome Tiers

```
score > 99  -> Tier 4 (Overwhelming)
score > 65  -> Tier 3 (Strong)
score > 50  -> Tier 2 (Moderate)
score > 40  -> Tier 1 (Slight)
score <= 40 -> Tier 0 (Fail)
```

### 7. Battle Guts Change

```
Tier 0 (Fail):          guts -= 4
Tier 1 (Slight):        guts -= 1
Tier 2 (Moderate):      guts += 0
Tier 3+ (Strong/Over):  guts += 1
```

### 8. Breeding: Stress Tier

```
avg_stress = (parent1_stress + parent2_stress) / 2
tier = 1 if avg <= 24
     = 2 if avg <= 49
     = 3 if avg <= 69
     = 4 if avg <= 89
     = 5 otherwise
```

### 9. Breeding: Stat Inheritance

```
if base == 0: child_stat = 0
else:
    scaled = (base * 256) / 100
    modifier = breed_bonus + stress_tier
    delta = (scaled * modifier) >> 8
    child_stat = min(base + delta, 255)
```

- Simplified: `child = min(base * (1 + (bonus + tier) / 100), 255)`
- `breed_bonus` = 0 or 10 depending on breed parameter
- `stress_tier` = 1-5 (lower is better)

### 10. Breeding: Child Stress

```
child_stress = (parent1_stress + parent2_stress) / 5
```

### 11. Breeding: Trait Inheritance

```
child_traits |= (parent1_traits & 0x7) | (parent2_traits & 0x7)
```

### 12. Breeding: Technique Inheritance

```
if parent1.field_0x15 > 48 AND parent2.field_0x15 > 48:
    copy techniques to child
```

### 13. PRNG (used in training and battle)

```
if seed == 0: seed = 0x2A6D365A
seed = (seed * 41) & 0xFFFFFFFF
result = ((seed >> 16) + seed) & 0x7FFF
```

- Linear Congruential Generator at `0x0806354C`
- Deterministic / exploitable for TAS play

---

## Key ROM Data Tables

| Table | ROM Address | ROM Offset | Record Size | Count | Description |
|-------|-----------|------------|-------------|-------|-------------|
| Coach/Training Results | `0x0821856C` | `0x0021856C` | 56 bytes | 65 | Training outcome templates |
| Monster Type Defs | `0x081CACC8` | `0x001CACC8` | 72 bytes | 194 | Per-breed base data |
| Stat Growth Display | `0x081C9F80` | `0x001C9F80` | 12 bytes | 70 | Training animation values |
| Type Advantage Grid | `0x081C9A00` | `0x001C9A00` | 1 byte | 225 (15x15) | Battle type matchup chart |
| Breed Advantage Grid | `0x081C9A19` | `0x001C9A19` | 1 byte | 225 (15x15) | Battle breed matchup chart |
| Guts Tier Lookup 1 | `0x081C9B10` | `0x001C9B10` | 4 bytes | 5 | Score bonus by guts tier |
| Guts Tier Lookup 2 | `0x081C9B24` | `0x001C9B24` | 4 bytes | 5 | Score bonus by guts tier |
| Aging Lookup Table | `0x083F3E20` | `0x003F3E20` | 16 bytes/row | 6+ rows | Growth rate by age stage |
| Field Descriptor Table | `0x083EE428` | `0x003EE428` | variable | 154 fields | Game state field definitions |

---

## Key Functions

| Function | Address | Purpose |
|----------|---------|---------|
| `core_state_accessor` | `0x08002240` | Generic field read/write/modify |
| `field_read` | `0x080035BC` | Read a monster field |
| `field_write` | `0x080035D0` | Write a monster field |
| `field_modify` | `0x080035E4` | Add delta to a monster field |
| `aging_stage` | `0x080027AC` | Calculate 0-15 aging stage |
| `weekly_training_step` | `0x08020328` | Apply one week of training |
| `apply_stat_delta` | `0x08020AB0` | Apply stat/fatigue/personality deltas |
| `battle_turn_resolve` | `0x080432E8` | Compute battle turn outcome |
| `breeding_main` | `0x0805FB5C` | Core breeding logic |
| `breeding_entry` | `0x0805B09C` | Breeding entry point |
| `stress_tier_calc` | `0x0805FF28` | Map stress to breeding tier |
| `monster_init` | `0x08020774` | Initialize new monster from type table |
| `prng` | `0x0806354C` | Random number generator |
| `signed_divide` | `0x081C79D4` | Signed integer division |

---

## Monster Struct Layout (Key Fields)

| Field ID | Offset | Type | Max | Description |
|----------|--------|------|-----|-------------|
| 0x00-0x05 | 0x0000-0x000A | Type 10 | 999 | POW/INT/SKI/SPD/DEF/LIF |
| 0x0C | -- | -- | -- | Breed ID |
| 0x12 | -- | -- | -- | Level |
| 0x13 | -- | -- | -- | Growth curve type |
| 0x15 | -- | -- | -- | Technique proficiency |
| 0x16 | 0x0094 | uint16 | 9999 | Lifespan A (remaining) |
| 0x17 | 0x0096 | int16 | 9999 | Lifespan B (reference) |
| 0x18 | -- | -- | -- | Active technique |
| 0x1E | 0x00A3 | uint16 | 100 | Stress (%) |
| 0x20-0x25 | -- | -- | -- | Personality/trait values |
| 0x2F | -- | -- | -- | Guts |
| 0x32 | -- | -- | -- | Loyalty/mood |

---

## Cross-Validation Results

| Finding | ROM Data | Community Data | Match? |
|---------|----------|---------------|--------|
| Lifespan units | 10 pts/week (raw 2370-2800) | 10 pts/week confirmed | Yes |
| Monster lifespan range | 237-280 weeks | ~250-400 weeks (community approximation) | Partial (community estimates were broader) |
| Coach records = named coaches | 65 records with breed-specific stats | Coaches like "Scarlet" in community data | Yes (stat patterns match) |
| Stat cap in training | 999 (Type 10 handler) | 999 confirmed by community | Yes |
| Breeding stat cap | 255 | Not widely documented | New finding |
| Technique lifespan cost | 27-45 points/week | "Techniques shorten lifespan" (qualitative) | Confirmed (now quantified) |
| Growth curves | 6 types, peak 30, base 10 | "Early/late bloomers" acknowledged | Confirmed (now exact values) |
| PRNG algorithm | seed * 41 LCG | Not documented | New finding |
| Battle score thresholds | 40/50/65/99 | Not documented | New finding |
| Miss guts penalty | -4 | Not documented | New finding |

---

## Detailed Documentation

For in-depth analysis with worked examples, modding guides, and gameplay implications:

- **[Training Mechanics](mechanics_training.md)** -- Coach system, stat gains, training cycle, PRNG
- **[Battle Mechanics](mechanics_battle.md)** -- 8-phase scoring, type matchups, guts system
- **[Lifespan & Aging](mechanics_lifespan.md)** -- Aging stages, growth curves, lifespan budgeting
- **[Breeding Mechanics](mechanics_breeding.md)** -- Stat inheritance, stress tiers, trait/technique carryover
