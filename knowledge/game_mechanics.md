# MRA2 Game Mechanics (Community Knowledge)

Compiled from the LegendCup / Monster Rancher Metropolis archive and community guides.
This serves as the "ground truth" reference for the LLM agent when analyzing disassembly.

## Monster Stats

Every monster has 6 core stats, each ranging from 1-999:

| Stat | JP Name | Abbrev | Role |
|------|---------|--------|------|
| Life | ライフ | LIF | Hit points in battle |
| Power | ちから | POW | Physical attack damage |
| Intelligence | かしこさ | INT | Intelligence-based attack damage |
| Accuracy | めいちゅう | SKI | Hit rate for attacks |
| Evasion | かいひ | SPD | Dodge rate, turn order |
| Defense | じょうぶさ | DEF | Damage reduction |

## Monster Breeds

There are approximately 50 main breeds, each with multiple sub-breeds created by
combining two breeds. Total monster types exceed 400. Each breed has:

- Base stat aptitudes (growth rates per stat)
- Lifespan range
- Available techniques
- Personality tendencies

### Main Breeds (Partial List)

Golem, Tiger, Hare, Suezo, Mocchi, Naga, Plant, Pixie, Dragon, Durahan,
Arrow Head, Zuum, Ducken, Lesione, Baku, Gitan, Zan, Mogi, Raiden, Ogyo,
Hengar, Gaboo, Jell, Undine, Niton, Mock, Ducken, Bajarl, Jill, Worm,
and more (including secret/unlockable breeds).

## Raising / Training

### Weekly Schedule

Each in-game week, the player assigns one action:
- **Rest**: Recover fatigue, slight stat variation
- **Light Training** (4 types): Small stat gains, low fatigue
- **Heavy Training** (4 types): Larger stat gains, higher fatigue
- **Errantry**: Travel to learn new techniques (costs money, takes 4 weeks)

### Stat Gain Patterns

Stat gains from training are NOT purely random. Each monster has a hidden
"stat gain pattern" that determines a repeating sequence of gains. The pattern
depends on the monster's breed and possibly a seed value at generation.

Key community findings:
- Gains follow a cyclical pattern that repeats over time
- The pattern is determined at monster creation, not per-training
- Different drills affect different stat combinations
- Fatigue and stress reduce gain effectiveness

### Fatigue and Stress

- **Fatigue**: Increases with training, decreases with rest. High fatigue
  reduces training effectiveness and increases injury risk.
- **Stress**: Hidden value. Accumulates from overwork. High stress can
  cause illness or shorten lifespan.
- **Loyalty/Spoil**: Affects training success rate and battle performance.

## Battle System

### Battle Structure

Battles are 1v1 with a time limit (60 seconds typically). Monsters are
positioned on a line and can move closer or farther from the opponent.

### Guts System

- Guts regenerate over time during battle (rate varies by monster)
- Each technique costs a certain amount of guts to use
- Guts regeneration rate is a key hidden stat

### Techniques

Each monster can learn up to 6 techniques (slots: 1 near + 1 far for each
of 3 categories, or similar layout). Techniques have:

- **Damage**: Base damage value
- **Accuracy**: Hit chance modifier (combined with monster's SKI vs opponent SPD)
- **Guts Cost**: How many guts required to use
- **Type**: POW-based or INT-based damage
- **Range**: Close, mid, or far distance requirement
- **Critical chance**: Probability of critical hit
- **Special effects**: Some moves can stun, wither stats, etc.

### Damage Formula (Approximate)

Based on community testing, damage appears to follow roughly:

```
base_damage = technique_damage * (attacker_stat / some_divisor)
reduction = base_damage * (defender_DEF / some_divisor)
final_damage = base_damage - reduction + random_variance
```

Where `attacker_stat` is POW for physical or INT for intelligence techniques.
The exact formula, divisors, and variance ranges are RE targets.

## Lifespan

- Each breed has a base lifespan range (e.g., 3-5 years game time)
- Lifespan is measured in weeks
- Stress and fatigue accumulation shorten lifespan
- Certain items can extend lifespan (e.g., Gold Peach)
- The monster shows aging signs (prime -> old) before death

## Breeding / Combining

- Two monsters can be combined at the Studio to create a new monster
- The result inherits the main breed of one parent and sub-breed of the other
- Stats carry over partially (percentage of parents' stats)
- Techniques may carry over depending on the result breed's tech pool

## Items

Key item categories:
- **Stat boost items**: Permanently raise a stat (e.g., Mint Leaf for INT)
- **Recovery items**: Reduce fatigue/stress
- **Lifespan items**: Extend monster's life (very rare)
- **Training items**: Affect training outcomes
- **Battle items**: Used in battle (if applicable)

## Tournaments

- Ranked by difficulty tier (E through S rank, plus special cups)
- Each tournament has a set roster of opponent monsters
- Prize money and items awarded for winning
- Advancing rank unlocks new training options and areas

## Expeditions

- Unlocked at certain ranks
- Explore areas to find items, including rare ones
- Multiple expedition areas with different item pools

## Sources

- [LegendCup MRA2 Archive](https://legendcup.com/MRM/discus/messages/8670/86702918.php)
- [FAQ](https://legendcup.com/MRM/discus/messages/8670/8840ebc1.php)
- [Beginner's Guide](https://legendcup.com/MRM/discus/messages/8670/9271e142.php)
- [Raising Methods](https://legendcup.com/MRM/discus/messages/8670/97442659.php)
- [Sparring / Learning Techs](https://legendcup.com/MRM/discus/messages/8670/8841d133.php)
- [Battle / Tournaments](https://legendcup.com/MRM/discus/messages/8670/9466abe4.php)
- [Items](https://legendcup.com/MRM/discus/messages/8670/8842f351.php)
- [The Studio / Combining](https://legendcup.com/MRM/discus/messages/8670/96578cae.php)
