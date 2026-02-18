# MRA2 Combining (Breeding) Mechanics -- Deep Dive

> How offspring breed is determined, stat inheritance, Legendary recipes, and combining items.

---

## Breed Combination Table

### The Lookup

The breed combination table at ROM `0x081E88C0` is a **30×40 matrix** of int16 entries (80-byte row stride). The function `combine_breed_ids` at `0x08002B28` works as:

```
result = table[main_breed][sub_breed]   // main clamped to 0-29, sub clamped to 0-39
if result == 0:
    result = table[sub_breed][main_breed]   // try transposed (asymmetric table)
```

Returns a 1-indexed monster species ID.

### Candidate Building

The breed candidate dispatcher at `0x080603D4` builds up to **6 offspring breed choices**:

1. **Slot 1**: `combine(parentA.main, parentA.sub)` -- same breed as Parent A
2. **Slot 2**: `combine(parentB.main, parentB.sub)` -- same breed as Parent B (if different)
3. **Slot 3+**: Cross-breed lookups with swapped main/sub between parents
4. **Slot 4+**: Legendary recipe matches (see below)

The player selects from the available options at the Studio.

---

## Stat Inheritance -- Corrected Formula

**Important correction from earlier analysis**: Stats are NOT directly inherited from parents' actual stats. The process is:

### Step 1: Determine Offspring Breed
`combine_breed_ids` determines the offspring's breed species.

### Step 2: Initialize Base Stats
`monster_init(offspring, breed_id)` sets the offspring's stats to the **breed-default base values** (bytes 2-7 of the monster type record, typically 40-175 range).

### Step 3: Apply Compatibility Bonus
Each base stat is modified:
```
new_stat = base_stat * (100 + item_bonus + compatibility_pct) / 100
```
Clamped to 255 maximum.

Where:
- `base_stat` = the offspring breed's default stat (NOT a parent's stat)
- `item_bonus` = from combining items (Fureria/Gadamon/Buragma give +10% to 2 stats each)
- `compatibility_pct` = a 5-phase compatibility score (2-50%) calculated from parent properties

### Compatibility Score

The compatibility percentage is derived from a multi-phase calculation considering:
- Parent stress tiers (lower stress = higher compatibility)
- Breed-specific bonuses (certain breed combinations get extra percentage)
- Parent personality traits alignment
- Item bonuses

The fixed-point arithmetic uses `(stat << 8) / 100 * bonus >> 8` for precision.

---

## Stress Tiers

Parent stress directly affects the compatibility bonus:

| Stress Range | Tier | Quality | Compatibility Bonus |
|:------------:|:----:|---------|-------------------|
| 0-19 | 1 | Excellent | Highest % |
| 20-39 | 2 | Good | High % |
| 40-59 | 3 | Average | Medium % |
| 60-79 | 4 | Poor | Low % |
| 80-100 | 5 | Terrible | Lowest % |

### Offspring Stress
```
offspring_stress = (parent1_stress + parent2_stress) * 5
```

---

## Legendary Combination System

**27 Legendary recipes** at ROM `0x081F188C`, in three categories:

### Category 1: Item-Triggered (Recipes 1-11, 21)

Any parents + specific item = forced pure breed. The item overrides clear the entire candidate list.

| Recipe | Item | Forces Breed |
|--------|------|-------------|
| 1 | Item 0x2C | Jill |
| 2 | Item 0x2D | Durahan |
| 3 | Item 0x2E | Jell |
| 4 | Item 0x2F | Ducken |
| 5 | Item 0x30 | Mocchi |
| 6 | Item 0x31 | Ape |
| 7 | Item 0x32 | Ghost |
| 8 | Item 0x33 | Naga |
| 9 | Item 0x34 | Worm |
| 10 | Item 0x35 | Monol |
| 11 | Item 0x36 | Plant |

### Category 2: Breed-Pair + Unlock (Recipes 12-20)

Specific parent combination + `field[263][breed_index] == 1` (unlock flag) = legendary sub-breed variant. These are appended as extra choices.

| Recipe | Parent A | Parent B | Legendary Result |
|--------|----------|----------|-----------------|
| 12 | Golem | Jill | Legendary variant |
| 13 | Zuum | Ducken | Legendary variant |
| 14 | Pixie | Niton | Legendary variant |
| 15 | Dragon | Jell | Legendary variant |
| 16 | Durahan | Naga | Legendary variant |
| 17 | ArrowHead | Mocchi | Legendary variant |
| 18 | Baku | Ape | Legendary variant |
| 19 | Mocchi | Ape | Legendary variant |
| 20 | Mock | Monol | Legendary variant |

### Category 3: Advanced Condition (Recipes 22-27)

Require specific conditions:
- **Technique lineage purity**: `field[93]` (breed origin per technique slot) must all match
- **Proficiency threshold**: `field[95] > 3`
- **Nature requirement**: `field[18] > 2`

Each pair has two recipes (one per parent ordering).

---

## Combining Items

### Stat Boost Items

| Item | Effect |
|------|--------|
| **Fureria** | DEF +10%, LIF +10% |
| **Gadamon** | POW +10%, INT +10% |
| **Buragma** | SPD +10%, ACC +10% |
| PowStone | POW +10 |
| IntStone | INT +10 |
| SkiStone | ACC +10 |
| SpdStone | SPD +10 |
| DefStone | DEF +10 |
| LifStone | LIF +10 |

The fusion materials (Fureria/Gadamon/Buragma) are hardcoded dual-stat bonuses in `breeding_main`. The single-stat stones each give a flat +10 to one stat.

### Technique-Teaching Items

| Item | Effect |
|------|--------|
| LuckFrag | Force-teaches specific technique |
| SeeScrol | Force-teaches specific technique |
| DefCharm | Force-teaches specific technique |
| VicCharm | Force-teaches specific technique |
| EaglMask | Force-teaches specific technique |

These override the normal technique inheritance and force-teach a specific technique to the offspring.

---

## Trait Inheritance

- Traits use **OR on lower 3 bits** between parents
- Technique inheritance requires proficiency **>48** in the parent

---

## Practical Combining Strategy

1. **Minimize stress** -- get both parents below 20 stress for Excellent tier (best compatibility bonus)
2. **Use the right fusion material** -- Fureria/Gadamon/Buragma give +10% to two stats each, which is a massive boost to base values
3. **Stat stones for targeted boosts** -- +10 flat to a specific stat stacks with percentage bonuses
4. **Parent stats don't directly transfer** -- offspring starts from breed base stats, modified by compatibility. Pick breeds with high base stats.
5. **Legendary recipes require unlock flags** -- complete specific in-game achievements to unlock the 4th slot options
6. **Technique-teaching items in combining** -- the only way to guarantee a specific technique on offspring
