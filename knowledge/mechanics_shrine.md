# MRA2 Shrine / Password Monster Generation

> How the password system generates monsters, the hashing algorithm, and what determines starting stats.

---

## How Password Generation Works

The Shrine takes a text password and deterministically generates a monster. The system uses a **polynomial hash** algorithm that processes each character to produce breed and stat values.

### The Hashing Algorithm

The game computes **four separate hashes** from the same password, each starting at a different character position and with different operation parity:

| Hash | Starting Index | Operation on Odd Chars | Purpose |
|------|:-------------:|:---------------------:|---------|
| Hash 1 | char[0] | Multiply | Main breed determination |
| Hash 2 | char[1] | Add (flipped parity) | Sub breed determination |
| Hash 3 | char[1] | Same as Hash 2 | Stat delta selection |
| Hash 4 | char[2] | Multiply | Trait selection (1 of 23 possible traits) |

The algorithm alternates between multiplication and addition at each character position:
- On **multiply** steps: `accumulator *= (char_value + index + 1)`
- On **add** steps: `accumulator += (char_value + index + 1)`
- Final value: `hash = accumulator & 0xFF` (low byte only, giving 256 possible outcomes)

### Hash → Breed Mapping

Each hash's low byte indexes into a 256-entry lookup table:

| Table | Address | Maps To |
|-------|---------|---------|
| Main breed table | `0x081E9AE0` | 30 main breed IDs (0-29) |
| Sub breed table | `0x081E9BE0` | 39 sub breed IDs + value 40 = "pure breed" |

Invalid breed combinations fall back to pure breed via the combination table at `0x081E88C0`.

---

## Stat Computation

A 6-bit value extracted from the sub breed hash indexes into a **64-entry stat delta table** at `0x081E9CE0`.

### Stat Delta Table Structure

Each entry is **13 signed bytes**:
- Bytes 0-5: Stat deltas (POW, INT, ACC, SPD, DEF, LIF)
- Bytes 6-11: Growth/trait modifiers
- Byte 12: Lifespan modifier

**Stat delta ranges**: -23 to +25 per stat

These deltas are **added** to the breed's base stats via `field_modify`. The best possible stat entry (#55) adds +66 total stats.

### Starting Stat Formula

```
final_stat = breed_base_stat + password_delta
```

Where:
- `breed_base_stat` = from the 72-byte monster type record at `0x081CACC8` (bytes 2-7, typical range 40-175)
- `password_delta` = from the 64-entry stat delta table (-23 to +25)

---

## Password Length and Monster Quality

| Password Length | What's Active | Quality |
|:--------------:|---------------|---------|
| 1 character | Pure breed only, zero stat deltas, no techniques | Worst |
| 2 characters | Breed determination + stat deltas active | Better |
| 3+ characters | Full system: breed + stats + techniques | Best |

More characters produce more polynomial mixing, which means better hash distribution across the 256-entry tables. With only 1 character, the hash has very limited range, producing only a handful of possible monsters.

### Longer Passwords and Rank Unlocks

At higher ranks, the game unlocks longer password input. Longer passwords:
- Access more of the 256-entry breed tables
- Produce better-distributed stat delta selections
- Can trigger technique hash entries that shorter passwords miss

---

## Dictionary System

A **dictionary table** at `0x08217368` provides **hardcoded word-to-monster mappings** that bypass the hash entirely. Specific predetermined words produce specific monsters with fixed stats and techniques. This is how "known good passwords" from community guides work -- they're dictionary entries, not hash collision findings.

---

## Starting Stat Ranges by Breed

Base stats come from the monster type records. Here are representative ranges:

### Breed Base Stat Totals

The 194 monster types have base stat totals (sum of all 6 stats as uint8 values) ranging from roughly **200 to 800**. Each breed's sub-breeds have slightly different distributions.

After password delta application (±23-25 per stat, up to ±66 total), the final starting stats cluster around:

| Category | Total Starting Stats | Notes |
|----------|---------------------|-------|
| Weak start | 200-350 | Poor password delta |
| Average start | 350-500 | Neutral delta |
| Strong start | 500-650 | Good password delta |
| Best possible | 650-800+ | Best breed base + best delta |

---

## Practical Password Strategy

1. **Longer passwords are better** -- they access more of the hash space
2. **Community password databases are dictionary entries** -- they give known-good results
3. **Random passwords are a lottery** -- with only 256 possible breed outcomes and 64 stat delta entries, you're selecting from a limited pool
4. **Breed base stats matter most** -- the password delta (±25 per stat) is small compared to breed differences (40-175 per stat)
5. **At higher ranks, unlock longer passwords** -- this is a genuine quality improvement, not just cosmetic
