# MRA2 Shrine/Password Monster Generation

> How the Shrine (password entry) system converts a text input into a monster with specific breed, stats, and techniques.

---

## Overview

The Shrine system takes a player-entered text string (up to 8 characters) and deterministically generates a monster. The process has four main stages:

1. **Dictionary lookup** -- try to match the password against a hardcoded word table for special monsters
2. **Hash-based breed determination** -- compute main breed and sub breed from a polynomial hash of the character codes
3. **Stat delta computation** -- compute stat modifiers from a separate hash of the characters
4. **Trait assignment** -- assign a starting trait from a hash-indexed table (23 possible traits)

The password is stored as halfword (16-bit) character codes. The sentinel `0xFFFD` marks the end of the string. All computation is purely deterministic -- the same password always produces the same monster.

---

## Function Map

| Address | Name | Purpose |
|---------|------|---------|
| `0x0801E560` | `password_to_breed` | Main entry: password text → breed struct |
| `0x0801E9DC` | `dict_lookup` | Dictionary table substring matcher |
| `0x0801EA6C` | `hash_main_breed` | Polynomial hash → main breed ID |
| `0x0801E7C8` | `hash_sub_breed` | Polynomial hash → sub breed ID + stat entry index |
| `0x0801E86C` | `hash_stat_deltas` | Polynomial hash → stat override entry |
| `0x0801E960` | `hash_traits` | Polynomial hash → starting trait (named `hash_techniques` in code for compat) |
| `0x08020328` | `shrine_create_monster` | State machine handler: init monster from breed struct |
| `0x08020774` | `monster_init` | Initialize monster from breed record index |
| `0x08020AB0` | `apply_stat_delta` | Apply stat deltas + trait from breed struct |

---

## Stage 1: Dictionary Lookup (`0x0801E9DC`)

Before hashing, the game tries to match the password against a **hardcoded dictionary table** at `0x08217368`. This table contains specific words that map to predetermined monsters.

The lookup tries substrings of decreasing length. Starting from `len = password_length`, the function iterates down to `len = 2`. For each length, it slides a window across the password checking for matches.

A dictionary entry consists of:
- **Type byte** (0, 1, 2, 3, or 0xFF):
  - `0` → Sets the **main breed ID** directly
  - `1` → Sets the **sub breed ID** directly
  - `2` → Sets **starting technique slots** (up to 3 techniques)
  - `3` → Sets the full **stat override** (13 bytes: 6 stat deltas + 7 growth/trait values)
  - `0xFF` → End-of-chain marker; stop iterating
- **Data byte(s)** following the type

If a dictionary match is found, the matched characters are replaced with `0xFFFF` so they won't be used in the hash computation. Multiple dictionary matches can occur for a single password (one match for main breed, another for sub breed, etc.).

If NO dictionary match was found for main breed, sub breed, stats, or techniques, the corresponding hash-based fallback is used.

---

## Stage 2: The Polynomial Hash Algorithm

Four separate hash functions compute main breed, sub breed, stat deltas, and techniques. They all share the same core algorithm but with different initialization and indexing.

### Core Hash: Alternating Multiply/Add

```python
def polynomial_hash(char_codes, start_index, length):
    """
    Core hash used by all four breed/stat computations.
    char_codes: list of 16-bit character code values
    start_index: which character position to start seeding from (1, 2, 2, or 3)
    length: number of characters in the password
    """
    accum = char_codes[start_index] + (start_index + 1)  # seed from one character
    
    for i in range(start_index + 1, length):
        char_val = char_codes[i]
        if i & 1:  # odd index: multiply
            accum = (accum * (char_val + i + 1)) & 0xFFFF
        else:       # even index: add (sign-extended)
            accum = (sign_extend_16(accum) + (char_val + i + 1)) & 0xFFFF
    
    return accum
```

The hash alternates between multiplication and addition at each character position, creating a polynomial-like mixing of all character codes. The `i + 1` offset prevents null characters from being transparent.

### Main Breed Hash (`0x0801EA6C`)

```python
def compute_main_breed(char_codes, length):
    accum = (char_codes[0] + 1) & 0xFFFF  # seed = first char + 1
    for i in range(1, length):
        if i & 1:  # odd: multiply
            accum = (accum * (char_codes[i] + i + 1)) & 0xFFFF
        else:       # even: add
            accum = (sign_extend_16(accum) + (char_codes[i] + i + 1)) & 0xFFFF
    
    index = (accum - 1) & 0xFF  # low byte, wraps to 0-255
    return MAIN_BREED_TABLE[index]  # lookup in 256-entry table at 0x081E9AE0
```

### Sub Breed Hash (`0x0801E7C8`)

For passwords of length 1: sub breed is always **40** (0x28), which typically maps to a pure breed.

For passwords of length >= 2:
```python
def compute_sub_breed(char_codes, length, main_breed_id):
    accum = (char_codes[1] + 2) & 0xFFFF  # seed = second char + 2
    for i in range(2, length):
        if i & 1:  # odd: add
            accum = (sign_extend_16(accum) + (char_codes[i] + i + 1)) & 0xFFFF
        else:       # even: multiply
            accum = (accum * (char_codes[i] + i + 1)) & 0xFFFF
    
    raw_index = (accum - 2) & 0xFFFF
    
    # Extract 6-bit value for stat table index
    bit_value = 0
    for bit in range(6):
        bit_value |= (raw_index & 1) << bit  # using LSB extraction, not simple mask
        raw_index >>= 1
    
    stat_entry_index = bit_value * 13  # index into 13-byte stat override table
    
    # Use stat table at 0x081E9CE0 to get stat overrides
    # ...
    
    # Sub breed from byte lookup
    sub_index = (accum - 2) & 0xFF
    sub_breed = SUB_BREED_TABLE[sub_index]  # 256-entry table at 0x081E9BE0
    
    # Clamp: if sub_breed > 0x27 (39), set sub = main
    if sub_breed > 39:
        sub_breed = main_breed_id
    
    return sub_breed
```

Note the **parity flip**: sub breed uses `add` on odd indices and `multiply` on even indices -- the opposite of main breed. This ensures different characters have different impact on main vs sub breed.

### Stat Override Hash (`0x0801E86C`)

For passwords of length 1: all stat deltas are set to **0** (no modification).

For passwords of length >= 2:
```python
def compute_stat_deltas(char_codes, length):
    accum = (char_codes[1] + 2) & 0xFFFF  # same seed as sub breed
    for i in range(2, length):
        if i & 1:  # same parity as sub breed hash
            accum = (sign_extend_16(accum) + (char_codes[i] + i + 1)) & 0xFFFF
        else:
            accum = (accum * (char_codes[i] + i + 1)) & 0xFFFF
    
    raw = (accum - 2) & 0xFFFF
    
    # Extract a 6-bit index from the low bits
    index_6bit = 0
    temp = raw
    shift = 1
    for bit in range(6):
        index_6bit |= (temp & 1) * shift
        temp >>= 1
        shift <<= 1
    
    # Look up 13-byte stat entry at 0x081E9CE0 + (index_6bit * 13)
    stat_entry = STAT_TABLE[index_6bit]
    
    return stat_entry  # 13 signed bytes
```

The 13-byte stat entry contains:
- Bytes 0-5: **Signed deltas for POW, INT, SKI, SPD, DEF, LIF** (added to base breed stats via `field_modify`)
- Bytes 6-11: **Growth/trait modifiers** (written to fields 0x26-0x2B)
- Byte 12: **Lifespan modifier** (applied to fields 0x16 and 0x17)

### Technique Hash (`0x0801E960`)

> **CORRECTION**: Despite the name in early analysis, this function assigns a **trait** (not technique). The function name `hash_techniques` is retained for backward compatibility, but it determines the monster's shrine-assigned trait.

For passwords of length <= 2: all trait slots set to `0xFF` (no trait).

For passwords of length >= 3:
```python
def compute_trait(char_codes, length):
    accum = (char_codes[2] + 3) & 0xFFFF  # seed = third char + 3
    for i in range(3, length):
        if i & 1:  # odd: multiply
            accum = (accum * (char_codes[i] + i + 1)) & 0xFFFF
        else:       # even: add
            accum = (sign_extend_16(accum) + (char_codes[i] + i + 1)) & 0xFFFF
    
    index = (accum - 2) & 0xFF  # low byte
    trait_id = TRAIT_TABLE[index]  # at 0x081EA020
    
    # Written to struct offset 0x10 (only slot 0; slots 1-3 are 0xFF)
    return trait_id
```

### Password-Assignable Traits

The TRAIT_TABLE at `0x081EA020` (256 bytes) maps hash indices to trait IDs. Only **23 distinct traits** can be assigned by passwords. Many trait IDs (including some of the most desirable ones) never appear in this table and can only come from breed defaults.

| Trait ID | Name | Hash Slots | Notes |
|----------|------|:----------:|-------|
| 0x00 | RockSkin | 1 | Physical defense |
| 0x02 | Tuf Skin | 2 | Physical defense |
| 0x04 | TufScale | 2 | Physical defense |
| 0x07 | Up Tail | 2 | Technique boost |
| 0x08 | Up Claws | 2 | Technique boost |
| 0x09 | Up Fangs | 2 | Technique boost |
| 0x0A | Up Hands | 2 | Technique boost |
| 0x10 | SwtVoice | 2 | Charm/Voice |
| 0x11 | SwtSmell | 2 | Charm/Voice |
| 0x12 | Up Charm | 2 | Charm/Voice |
| 0x13 | BigVoice | 2 | Charm/Voice |
| 0x23 | UpBreath | 1 | Technique boost |
| 0x40 | Expert | 1 | Battle performance (rare) |
| 0x41 | Success | 1 | Battle performance (rare) |
| 0x42 | Failure | 1 | Battle performance (negative!) |
| 0x43 | Up Fire | 5 | Elemental |
| 0x46 | Up Ice | 5 | Elemental |
| 0x48 | UpLtning | 5 | Elemental |
| 0x4A | Up Water | 5 | Elemental |
| 0x4C | Up Wind | 3 | Elemental |
| 0x4E | Up Earth | 1 | Elemental |
| 0x50 | Up Mind | 2 | Elemental |
| 0x52 | Up Magic | 3 | Elemental |

**Notable traits that CANNOT be assigned by passwords:**
- **IronHart** (0x2C) -- only available as breed default on Zuum/Special
- **Hi IQ** (0x1F), **Hi Power** (0x1B), **Hi Speed** (0x1E), **Hi Aim** (0x1D) -- stat boost traits
- **EagleEye** (0x29), **Foresee** (0x28), **Charisma** (0x2E), **Observer** (0x2D)
- **Satori** (0x2F), **Macho** (0x2B), **Elite** (0x54), **StatKing** (0x56)
- All "+" elemental variants (UpFire+, UpIce+, etc.)

### Trait Assignment Flow

A shrine monster's final traits come from **two sources**:

1. **Breed defaults** (from monster type record at offset +0x24, up to 4 traits)
2. **Password trait** (single trait from the hash, added on top)

The `apply_stat_delta` function (`0x08020AB0`) loops through struct offsets `+0x10` to `+0x13`, calling trait assignment (`0x0800D2B0`) for each non-0xFF byte. The password only sets `+0x10`; the breed defaults are set during `monster_init`.

---

## Stage 3: Breed Validation

After computing main and sub breed:

1. **Sub breed clamped**: if `sub_breed > 39`, set `sub_breed = main_breed`
2. **Combo table check**: look up `BREED_COMBO_TABLE[main_breed * 80 + sub_breed * 2]` at `0x081E88C0`
3. If the combo table returns 0 (invalid combination), set `sub_breed = main_breed` (pure breed)

This guarantees every password produces a valid monster.

---

## Stage 4: Monster Creation (`0x08020328`)

The shrine state machine handler:

1. **Reads breed bytes** at offsets `+0x18` (main) and `+0x19` (sub) from the shrine struct
2. Calls `combine_breed_ids(main, sub)` → breed record index
3. Calls `monster_init(monster_struct, record_index)` → copies base stats from the 72-byte monster type record
4. Calls `apply_stat_delta(monster_struct, shrine_struct+0x18)` → applies the 13 signed-byte stat/trait deltas:
   - `struct[2]` → `field_modify(field[0], delta)` → **POW += delta**
   - `struct[3]` → `field_modify(field[1], delta)` → **INT += delta**
   - `struct[4]` → `field_modify(field[2], delta)` → **SKI += delta**
   - `struct[5]` → `field_modify(field[3], delta)` → **SPD += delta**
   - `struct[6]` → `field_modify(field[4], delta)` → **DEF += delta**
   - `struct[7]` → `field_modify(field[5], delta)` → **LIF += delta**
   - `struct[8-13]` → written to fields 0x26-0x2B (growth/trait values)
   - `struct[14]` → `field_modify(field[0x16], delta)` and `field_modify(field[0x17], delta)` (lifespan modifiers)
5. Assigns up to 4 traits: first from password hash (struct `0x10`), rest from breed defaults. Slots `0x11-0x13` are typically `0xFF` for password monsters, leaving room for breed-default traits only.

---

## How Password Length Affects Monster Quality

| Length | Main Breed | Sub Breed | Stat Deltas | Techniques | Quality |
|--------|-----------|-----------|-------------|------------|---------|
| 0 chars | Returns 0 (failure) | - | - | - | Invalid |
| 1 char | Hash of 1 char | Fixed: 40 (pure) | All zeros | None | Minimal |
| 2 chars | Hash of 2 chars | Hash of 1 char | Hash of 1 char | None | Basic |
| 3 chars | Hash of 3 chars | Hash of 2 chars | Hash of 2 chars | Hash of 1 char | Moderate |
| 4+ chars | Full hash | Full hash | Full hash | Full hash | Full |

**Longer passwords produce better monsters because:**
1. With only 1 character, sub breed is locked to pure breed (40) and stats get no modification
2. With only 2 characters, no trait is assigned
3. With 3+ characters, all four hashes are fully active
4. More characters = more mixing in the polynomial hash = wider distribution across the 256-entry breed tables and 64-entry stat table
5. The stat delta table has entries ranging from **-23 to +25** per stat, so passwords that hash to favorable entries can give significant stat boosts
6. Entry 55 is the "jackpot" entry: `+11 +10 +11 +21 +5 +8` (all positive, +66 total stats)

---

## Stat Delta Table Summary (64 Entries at `0x081E9CE0`)

Each entry is 13 signed bytes. The first 6 are stat deltas applied to the breed's base stats:

| Entry | POW | INT | SKI | SPD | DEF | LIF | Net | Notable |
|-------|-----|-----|-----|-----|-----|-----|-----|---------|
| 0 | -1 | -5 | +15 | +6 | +11 | -5 | +21 | SKI/DEF focused |
| 4 | +8 | -1 | +25 | +21 | -2 | +5 | +56 | Huge SKI/SPD boost |
| 5 | +1 | -13 | +12 | +10 | +4 | -13 | +1 | Mixed |
| 15 | +14 | +7 | +10 | +10 | +3 | +18 | +62 | All positive |
| 22 | -19 | -9 | +3 | +11 | +18 | -8 | -4 | DEF focused |
| 41 | +18 | +5 | +13 | +5 | -3 | -10 | +28 | POW/SKI |
| 45 | +8 | -1 | +25 | +21 | -2 | +5 | +56 | Same as entry 4 |
| **55** | **+11** | **+10** | **+11** | **+21** | **+5** | **+8** | **+66** | **Best overall** |
| 58 | +22 | -6 | +24 | +3 | -12 | +12 | +43 | POW/SKI/LIF |

Stat deltas range from **-23** to **+25** per individual stat. Net totals range from **-29** to **+66**.

---

## Data Tables

### Main Breed Mapping Table (`0x081E9AE0`, 256 bytes)

Maps the low byte of the main breed hash to one of 30 main breed IDs (0-29). The distribution is roughly uniform with some breeds appearing more frequently:

- Most common: breeds 3, 6, 29, 19 (12-15 entries each)
- Least common: breeds 26, 28 (1 entry each), breeds 4, 14, 15, 18, 25 (3 entries each)

### Sub Breed Mapping Table (`0x081E9BE0`, 256 bytes)

Maps the low byte of the sub breed hash to one of 39 sub breed IDs (0-40). Notable:
- Value 40 (0x28) appears **55 times** -- this is the "pure breed" fallback
- Most sub breeds appear 3-10 times

### Breed Combo Validation (`0x081E88C0`)

30×40 matrix that validates main+sub breed combinations. Invalid combos (table entry = 0) force sub_breed = main_breed.

### Dictionary Table (`0x08217368`)

Special word entries that bypass the hash for specific monsters. Structure is complex with halfword character matching and type-coded data blocks.

---

## Starting Stat Ranges Per Breed (from Monster Type Table at `0x081CACC8`)

These are the **base stats** set by `monster_init()` before password stat deltas are applied. Each breed has one pure form and multiple sub-breed variants.

| Breed ID | Name (approx) | POW | INT | SKI | SPD | DEF | LIF | Total |
|----------|---------------|-----|-----|-----|-----|-----|-----|-------|
| 0 (Pixie) | Pure | 80 | 170 | 130 | 150 | 65 | 80 | 675 |
| 0 (Pixie) | Range | 40-130 | 165-185 | 120-140 | 125-170 | 65-110 | 70-100 | 640-755 |
| 1 (Golem) | Pure | 170 | 80 | 65 | 50 | 150 | 110 | 625 |
| 1 (Golem) | Range | 165-195 | 65-135 | 65-90 | 40-70 | 145-220 | 100-115 | 620-780 |
| 2 (Mew) | Pure | 115 | 110 | 130 | 130 | 85 | 100 | 670 |
| 2 (Mew) | Range | 110-165 | 100-175 | 125-155 | 115-170 | 80-125 | 95-170 | 670-850 |
| 3 (Mocchi) | Pure | 100 | 110 | 140 | 130 | 130 | 120 | 730 |
| 3 (Mocchi) | Range | 95-120 | 100-140 | 130-165 | 120-155 | 120-150 | 110-130 | 730-795 |
| 4 (Dragon) | Pure | 155 | 150 | 115 | 85 | 130 | 120 | 755 |
| 4 (Dragon) | Range | 155-195 | 125-165 | 110-155 | 75-100 | 110-155 | 100-125 | 720-850 |

(Stat ranges shown for the first 5 breeds; the pattern continues for all 30.)

After the base stats are set, the password's stat delta entry (range -23 to +25 per stat) is **added** to each stat. For example, a Pixie (pure) getting stat entry 55 would start with:

```
POW = 80 + 11 = 91
INT = 170 + 10 = 180
SKI = 130 + 11 = 141
SPD = 150 + 21 = 171
DEF = 65 + 5 = 70
LIF = 80 + 8 = 88
```

---

## Implementation Notes

- The shrine struct lives at the address pointed to by `[0x0200A398]`
- Breed bytes are at struct offsets `+0x18` (main) and `+0x19` (sub)
- Stat/trait/technique data at offsets `+0x1A` through `+0x2B`
- Password text at offset `+0x30` (halfword encoded, max 8 chars, terminated by `0xFFFD`)
- The state machine table at `0x083F1974` has 35 entries; state 20 calls `password_to_breed`, state 21 calls `shrine_create_monster`
- The dictionary table at `0x08217368` and breed data table at `0x081E9AD0` are both referenced by state 20

---

## Summary: Password → Monster Pipeline

```
Password Text (up to 8 chars)
    ↓
[1] Dictionary Lookup (0x08217368)
    → May set main breed, sub breed, stats, trait directly
    → Matched chars replaced with 0xFFFF
    ↓
[2] Hash Main Breed (if not set by dict)
    → polynomial_hash(chars, start=0) → index & 0xFF
    → MAIN_BREED_TABLE[index] → main_breed_id (0-29)
    ↓
[3] Hash Sub Breed (if not set by dict)
    → polynomial_hash(chars, start=1, parity_flip) → index & 0xFF
    → SUB_BREED_TABLE[index] → sub_breed_id (0-40)
    → Clamp to 39, validate combo
    ↓
[4] Hash Stat Deltas (if not set by dict)
    → Same hash as sub breed → extract 6-bit index
    → STAT_TABLE[6bit_index] → 13 signed bytes
    ↓
[5] Hash Trait (if not set by dict, needs len >= 3)
    → polynomial_hash(chars, start=2) → index & 0xFF
    → TRAIT_TABLE[index] → 1 trait ID (23 possible, or 0xFF)
    ↓
[6] combine_breed_ids(main, sub) → breed record index
    ↓
[7] monster_init(monster, record_index)
    → memset(monster, 0, 0x594)
    → Copy base stats from 72-byte type record
    → Breed default traits set (from record +0x24, up to 4)
    ↓
[8] apply_stat_delta(monster, shrine_struct)
    → Add signed deltas to POW/INT/SKI/SPD/DEF/LIF
    → Set growth/trait modifiers
    → Set lifespan modifier
    → Add password trait (from struct +0x10) on top of breed defaults
    ↓
Monster Ready! (has breed default traits + 1 password trait)
```
