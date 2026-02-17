# MRA2 Monster Data

Reference data on monster breeds, lifespans, and stat tendencies.
This data is compiled from community sources and will be cross-referenced
with data extracted from the ROM during analysis.

## Breed Count

- **Main breeds**: ~50
- **Sub-breed combinations**: 400+ total monster types
- Some breeds are locked and require specific unlock conditions

## Stat Aptitude Tiers

Each breed has inherent aptitudes that affect stat growth rates.
Community has categorized these roughly as:

| Tier | Growth Rate | Description |
|------|------------|-------------|
| A | High | Breed excels at this stat |
| B | Medium | Average growth |
| C | Low | Breed struggles with this stat |
| D | Very Low | Minimal growth potential |

## Known Breed Profiles (Partial)

Data below is approximate, from community observation. Exact values are RE targets.

### Golem
- **Strengths**: POW, DEF, LIF
- **Weaknesses**: SPD, INT, SKI
- **Lifespan**: Long (~400+ weeks)
- **Guts regen**: Slow
- **Notes**: Tank archetype, high HP and physical stats

### Tiger
- **Strengths**: SPD, SKI, INT
- **Weaknesses**: LIF, DEF
- **Lifespan**: Medium (~350 weeks)
- **Guts regen**: Fast
- **Notes**: Speed-based attacker

### Hare
- **Strengths**: SPD, SKI
- **Weaknesses**: POW, DEF, LIF
- **Lifespan**: Medium (~300 weeks)
- **Guts regen**: Very fast
- **Notes**: Hit-and-run style, many techniques

### Suezo
- **Strengths**: INT, SKI
- **Weaknesses**: DEF, SPD
- **Lifespan**: Medium (~350 weeks)
- **Notes**: Ranged INT attacker

### Mocchi
- **Strengths**: INT, DEF, LIF
- **Weaknesses**: SPD
- **Lifespan**: Medium-Long (~380 weeks)
- **Notes**: Balanced with good INT

### Dragon
- **Strengths**: POW, LIF, DEF
- **Weaknesses**: SKI
- **Lifespan**: Medium (~350 weeks)
- **Notes**: High raw power, hard to raise effectively

### Pixie
- **Strengths**: INT, SPD
- **Weaknesses**: LIF, DEF, POW
- **Lifespan**: Short-Medium (~280 weeks)
- **Notes**: Glass cannon INT type

### Durahan
- **Strengths**: POW, DEF, SKI
- **Weaknesses**: INT, SPD
- **Lifespan**: Long (~400 weeks)
- **Notes**: Armored physical fighter

## Lifespan Ranges

Approximate lifespan categories (in game weeks):

| Category | Range | Example Breeds |
|----------|-------|---------------|
| Short | 250-300 | Pixie, Jell |
| Medium | 300-380 | Tiger, Hare, Suezo, Dragon |
| Long | 380-430 | Golem, Durahan, Mocchi |
| Very Long | 430+ | Special/rare breeds |

## Unlockable Breeds

Some breeds require specific actions to unlock:
- Winning certain tournaments
- Finding items on expeditions
- Entering specific passwords at the Shrine
- Combining specific breed combinations

## Data To Extract From ROM

Priority data tables to locate and decode:

1. **Breed base stat table**: Per-breed growth aptitudes (A/B/C/D or numeric)
2. **Breed lifespan table**: Min/max lifespan per breed
3. **Technique assignment table**: Which techs each breed can learn
4. **Sub-breed combination table**: Main breed + sub-breed = result type
5. **Breed name string table**: Internal names for all breeds/types
