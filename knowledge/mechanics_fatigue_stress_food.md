# MRA2 Fatigue, Stress, Food & Happiness Mechanics

> How fatigue and stress accumulate, what food does, and how happiness/loyalty interact.

---

## Fatigue (Field 0x1D)

Fatigue is stored as a percentage value (0-100) at monster offset 0xA2. It represents physical tiredness and affects training effectiveness and illness risk.

### How Fatigue Accumulates

**Every week during rest (activity = 1):**
- Base: +1 fatigue per week (always)
- Extra fatigue based on lifespan thresholds (older monsters tire faster):

| Monster's Lifespan B | Extra Weekly Fatigue |
|----------------------|---------------------|
| ≤ 99 | +2 additional |
| 100-199 | +1 additional |
| 200-299 | +1 (50% chance each week) |
| 300-399 | +1 (25% chance each week) |
| ≥ 400 | No extra |

This means young monsters gain only +1 fatigue/week from resting, while elderly monsters can gain +3/week, making them tire much faster.

**From training (via apply_stat_delta):**
- Light drills: fatigue delta of 0 or -3 (no cost or slight recovery)
- Sparring/technique training: fatigue delta of +27 to +45

**From tournaments and expeditions:**
- These set activity state to 4 or 6, which skips the normal weekly fatigue tick
- However, they have their own fatigue costs applied through different code paths

### How Fatigue Recovers

Fatigue decreases during rest weeks through a mechanism separate from the weekly tick. The weekly update function does NOT decrease fatigue -- it only increases it. Fatigue recovery likely occurs through:
- Food effects (correct food type reduces fatigue)
- Item usage (Cups, Gems)
- Rest week processing in a separate handler

---

## Stress (Field 0x1E)

Stress is stored as a value (0-100) at monster offset 0xA3. It's less visible than fatigue but critically important for breeding.

### How Stress Accumulates

**Every rest week (activity = 1):**
- +1 stress per week

This is counterintuitive -- resting adds stress. The game treats "idle weeks" as a form of boredom stress. Active weeks (training, tournament, expedition) skip this stress increment because the activity state check skips the rest-week block.

**From breeding:**
- Offspring stress = (parent1_stress + parent2_stress) * 5
- This is the initial stress value for newly combined monsters

### Stress Tiers for Breeding

Stress directly determines offspring quality (see Combining document):
- 0-19: Excellent tier (best stat inheritance)
- 20-39: Good tier
- 40-59: Average tier
- 60-79: Poor tier
- 80-100: Terrible tier

### Managing Stress

Since stress goes UP by 1 each rest week, the key to low stress is:
- Keep monsters active (training/tournaments don't add stress through this path)
- Use items (Cups, Gems) that reduce stress directly
- Don't leave monsters idle for extended periods before combining

---

## Food System

### Food Preferences

Each of the 194 monster breeds has a **food preference** value (1-5) stored at byte 0x12 in the monster type record. This maps to one of 5 food types:

| Food Pref Value | Count of Breeds | Approximate % |
|-----------------|-----------------|---------------|
| 1 | ~39 | 20% |
| 2 | ~39 | 20% |
| 3 | ~39 | 20% |
| 4 | ~39 | 20% |
| 5 | ~38 | 20% |

Food preferences are evenly distributed across all breeds.

### Food Items (Type 0x02/0x03)

From the item descriptor table at `0x082067AC`:

| Item | Type | Buy Price | Effect |
|------|------|-----------|--------|
| HonCandy (Honey Candy) | Food (0x02) | 200g | Basic food |
| Oily Oil | Food (0x02) | 1000g | Premium food |
| NitroBerry | Food (0x02) | 300g | Energy food |
| MintLeaf | Food (0x02) | 500g | Calming food |
| MntCandy (Mint Candy) | Food (0x02) | 800g | Stat food |
| Newt | Food (0x03) | 500g | Special food |

### How Food Affects Weekly Drain

The food bonus lookup function (0x08002538) scans your inventory for food items. When the correct food matches the monster's food preference:
- A **food bonus** value is read from the item descriptor
- This bonus is scaled: `food_bonus * 10 + 10` for Lifespan A, `food_bonus * 10 + 5` for Lifespan B
- The scaled value is added to the weekly drain calculation, partially offsetting the base drain

Feeding the **wrong** food (preference mismatch) provides no bonus. Feeding nothing also provides no bonus. The food bonus is only checked during active weeks (not during tournaments or expeditions).

---

## Happiness / Condition (Field 0x1C)

Happiness/condition is tracked at monster offset 0xA0, with a max of 999.

### Weekly Happiness Drain

Every week, happiness decreases based on the monster's **loyalty/mood** (field 0x1F, range -100 to +100). The game uses a 7-bracket lookup table at ROM `0x083F3ED8`:

| Loyalty Range | Drain per Week |
|---------------|---------------|
| Below -80 (Very Disloyal) | 30-50 (random) |
| -80 to -40 (Disloyal) | 50-70 |
| -40 to -10 (Slightly Disloyal) | 70-90 |
| -10 to +10 (Neutral) | 90-110 |
| +10 to +40 (Loyal) | 110-130 |
| +40 to +80 (Very Loyal) | 130-150 |
| Above +80 (Extremely Loyal) | 150-200 |

**Counter-intuitive finding:** Higher loyalty = MORE happiness drain per week. This means high-loyalty monsters are more "needy" -- they require more attention (feeding, items, praise) to maintain happiness. Low-loyalty monsters drain happiness slowly but have other penalties (confusion in battle, disobedience).

The drain formula:
```
drain = table[bracket].min + (prng_byte() % (table[bracket].max - table[bracket].min + 1))
happiness -= drain
```

### What Happiness Affects

Field 0x1C (happiness/condition) likely influences:
- Monster's willingness to obey in battle
- Training success rates
- Visual mood indicators shown by Holly

---

## Figure / Body Type

Each monster breed has a **figure_type** value (byte 0x14 in the type record). There are 10 distinct values across 194 breeds:

| Figure Type | Number of Breeds | Likely Meaning |
|-------------|-----------------|----------------|
| 1 | ~20 | Small/Lean |
| 2 | ~20 | Small/Normal |
| 3 | ~20 | Medium |
| 6 | ~15 | Large/Lean |
| 7 | ~15 | Large/Normal |
| 8 | ~20 | Large/Heavy |
| 9 | ~20 | Very Large |
| 10 | ~20 | Massive |
| 11 | ~20 | Special |
| 13 | ~24 | Special (breed family groups) |

Figure type likely determines:
- The visual model used for the monster
- Food consumption rate
- Possibly fatigue accumulation rate modifiers

### Stat Modifiers per Breed (Bytes 0x15-0x1F)

Each monster type record contains 11 signed byte values at offsets 0x15-0x1F. These are per-breed modifiers (range approximately -9 to +10). They likely represent:
- Base personality/nature adjustments
- Per-breed food effectiveness modifiers
- Starting condition adjustments

---

## Item Effects

### Item Categories

| Type Code | Category | Examples |
|-----------|----------|----------|
| 0x00 | Equipment/Consumable | Gold Bar, stones, charms, masks, scrolls |
| 0x02 | Food | HonCandy, Oily Oil, NitroBerry, MintLeaf, MntCandy |
| 0x03 | Special Food | Newt |
| 0x08 | Gems | Shiny Gem, Glimmer Gem, Bright Gem |
| 0x0B | Feed/Supplements | Star Prune, Gelatin, DietWeed, Dodorin, MeatSlab |
| 0x0C | Fusion Materials | Fureria, Gadamon, Buragma |
| 0x06 | Incense | Various |
| 0x07 | Trophies | Various |
| 0x09 | Wind Instruments | Various |
| 0x0A | Drums | Various |

Total items: 76 (38 main + 38 in sub-table for trophies/special items).

### Key Item Mechanics

- **Gems** (type 0x08): Reduce stress and/or fatigue. The food_bonus_lookup function (0x08002538) can find these in inventory and apply their bonus values.
- **Feed/Supplements** (type 0x0B): Stat boost items like Star Prune, MeatSlab. Applied through item use functions.
- **Food items** (type 0x02): Provide weekly food bonus if they match the monster's food preference.
- **Fusion materials** (type 0x0C): Used during combining to modify offspring.

---

## Summary: Weekly Update Flow

Each week, the game's weekly stat update (0x0801FCFC) processes:

1. **Growth rate lookup** → determines stat gain effectiveness (10-30)
2. **Lifespan drain** → base 400-500 points + random component + food offset + trait modifier
3. **Money drain** → 7-10 gold per active week
4. **Fatigue increment** → +1 base, +1-2 extra for older monsters
5. **Stress increment** → +1 during rest weeks only
6. **Happiness drain** → 30-200 based on loyalty bracket
7. **Death/retirement check** → when both lifespan fields reach 0

This happens every single week regardless of what activity the monster is doing, though some steps are skipped during tournaments (activity=4) and expeditions (activity=6).
