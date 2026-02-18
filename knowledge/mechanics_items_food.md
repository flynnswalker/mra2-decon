# MRA2 Items, Food & Expedition Mechanics

> How items affect your monster, the food system, and what expeditions actually do.

---

## Item Categories and Effects

The game has **76 items** in total (38 main + 38 sub-table). Items are stored in a descriptor table at ROM `0x082067AC`.

### Food Items (Type 0x02/0x03)

Food items reduce fatigue and/or stress when fed to a monster.

| Item | Buy | Sell | Effect |
|------|-----|------|--------|
| HonCandy | 200g | 100g | Fatigue -30 |
| Oily Oil | 1,000g | 500g | Fatigue -128 (massive reduction) |
| NitroBerry | 300g | 150g | Stress -50 |
| MintLeaf | 500g | 250g | Stress -80 |
| MntCandy | 800g | 400g | Fatigue -50, Stress -100 |
| Newt | 500g | 250g | Special single modifier |

### Feed/Supplement Items (Type 0x0B)

Supplements modify monster stats through a breed-type-indexed formula.

| Item | Buy | Sell | Primary Effect | Secondary |
|------|-----|------|---------------|-----------|
| StarPrune | N/A | 500g | +7 to stat999_0x9E | +1 to stat999_0x9A |
| Gelatin | 500g | 250g | -3 (mild stat reduction) | -- |
| DietWeed | 1,000g | 500g | -7 (weight loss) | -- |
| Dodorin | 500g | 250g | +7 (stat boost) | -- |
| MeatSlab | 1,000g | 500g | +10 (large boost) | -- |
| Grapes | 500g | 250g | +3 (mild boost) | -- |
| Cheese | 600g | 300g | +5 (moderate boost) | -- |
| Wine | 1,200g | 600g | +2 (small boost) | -- |

### Supplement Application Formula

When a supplement is used, the game applies **7 field modifications** in sequence, using breed-type-indexed lookup tables:

1. **Fatigue adjustment 1**: `table_0x083F412B[breed_type] / 8` (rounded)
2. **Fatigue adjustment 2**: `item_effect_byte + table_0x083F4178[breed_type]`
3. **Condition/Nature**: `table_0x083F4180[breed_type]`
4. **Stat 0x9E**: Item's primary effect byte
5. **Stat 0x9A**: Item's secondary effect byte
6. **Loyalty**: From item data byte 3
7. **Stress**: `table_0x083F4188[breed_type]`

This means the same item has different effects on different breeds due to the breed-indexed tables.

### Gem Items (Type 0x08)

| Item | Buy | Sell | Passive Effect |
|------|-----|------|---------------|
| ShinyGem | 10,000g | 5,000g | Passive weekly stress/fatigue reduction |
| GlimrGem | 25,000g | 12,500g | Better passive reduction |
| BrghtGem | 65,000g | 32,500g | Best passive reduction |

Gems work through the weekly food bonus lookup system:
- Gem bonus type 7: Reduces happiness drain by `-(gem_bonus * 5 + 5)`
- Gem bonus type 8: Reduces stat drain by `-(gem_bonus * 10 + 3)`
- Gem bonus type 9: Adds +1 fatigue per week (slight cost for the gem's aura)

### Fusion Materials (Type 0x0C)

Used during combining (see Combining mechanics):

| Item | Sell | Effect in Combining |
|------|------|-------------------|
| Fureria | 15,000g | DEF +10%, LIF +10% |
| Gadamon | 15,000g | POW +10%, INT +10% |
| Buragma | 15,000g | SPD +10%, ACC +10% |

### Equipment/Treasure Items

| Item | Sell | Notes |
|------|------|-------|
| Gold Bar | 15,000g | Treasure only |
| SilvrBar | 10,000g | Treasure only |
| Emerald | 8,000g | Treasure only |
| Diamond | 12,000g | Treasure only |
| PowStone-LifStone | 2,500-3,000g | +10 to one stat in combining |
| Various Masks/Scrolls | 2,000-3,000g | Force-teach technique to offspring |

### Loot Boxes

| Box Type | Sell | Contents |
|----------|------|----------|
| Wood Box | 50g | Basic items |
| Iron Box | 100g | Standard items |
| Silvr Box | 250g | Good items |
| Gold Box | 500g | Rare items |
| Black Box | 1,000g | Best items |

---

## Food Preference System

### Per-Breed Food Preferences

Each of the 194 monster breeds has a **food preference** (1-5) stored at byte 0x12 in the monster type record. The 5 food types are evenly distributed (~39 breeds each).

### Food Bonus Calculation

When the correct food matches the monster's preference:
1. The game reads the food bonus map table at `0x081E9514` (5 entries, one per preference level)
2. Each entry contains multi-row bonus values indexed by a growth parameter
3. Preference levels 1-3 give uniform bonuses (10-25)
4. Preference levels 4-5 have varied per-food bonuses (1-15)
5. The bonus offsets the weekly lifespan drain (see Lifespan document)

**Wrong food = no bonus.** Always feed the correct food type.

---

## Expedition / Errantry System

### Expedition Table

16 expedition areas at ROM `0x081E96FC`:

| Area | Cost | Max Reward | Tier |
|------|------|-----------|------|
| Areas 0-5 | 4,000g | 8,000g | Standard |
| Area 6 | 2,000g | 4,000g | Budget |
| Area 7 | 5,000g | 10,000g | Special |
| Area 8-10 | 3,000-4,000g | 6,000-8,000g | Mid-tier |
| Area 11 | 2,000g | 4,000g | Budget |
| Areas 12-13 | 32,500g | 65,000g | Premium |
| Area 14 | 12,000g | 24,000g | High-tier |
| Area 15 | 5,000g | 10,000g | Special |

### Expedition Duration

Duration depends on the monster's **INT stat**:

| INT Range | Duration |
|-----------|----------|
| ≤ 200 | 24 weeks |
| 201-400 | 24 weeks |
| 401-600 | 16 weeks |
| > 600 | 8 weeks |

Higher INT = shorter expeditions = less time away from training.

### Weekly Processing During Expeditions

Each week during an expedition:
- Activity state is set to 6
- The weekly stat update function skips the normal fatigue/stress increment
- Stress decreases by 2 per week
- Happiness decreases by `loyalty * 2 / 3`
- Gem bonuses still apply

### Expedition Loot Formula

At expedition end, loot is calculated:

1. Check stat thresholds: `stat_0x9E > 699` AND `stat_0x9A > 499`
2. If thresholds met, compute score:
   ```
   score = (rng1 & 7) * 10 + stat_0x9E - 1200 + stat_0x9A + (rng2 & 3) * 10
   ```
3. Loot tier by score: ≤99 = nothing, 100-119 = basic, 120-139 = good, >139 = best

### Expedition Encounter Check

Battle encounters during expeditions:
1. Thresholds: `stat_0x9E > 499` AND `stat_0x9A > 699`
2. Score computation with PRNG variation
3. Encounters at score > 1000, special events at score > 1400 (1-in-3 chance)

---

## Activity State Weekly Processing

The weekly activity dispatcher at `0x0802C570` processes differently based on current activity:

| State | Activity | Fatigue | Stress | Happiness | Special |
|:-----:|----------|---------|--------|-----------|---------|
| 1 | Rest | +1/week | +1/week | Drain by loyalty | -- |
| 3 | Training | Per coach | -2/week | Per training type | -- |
| 4 | Tournament | Per battle | -2/week | -(loyalty×2/3) | -- |
| 6 | Expedition | Gem bonus | -2/week | -(loyalty×2/3) | Loot at end |
