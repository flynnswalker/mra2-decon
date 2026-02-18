# MRA2 Trait/Characteristic System -- Full Decode

## Overview

The trait system in Monster Rancher Advance 2 uses **87 traits** (IDs 0x00-0x56). Each monster has **6 trait slots** stored at field `0x4B` (array indices 0-5). Empty slots contain `0xFF`.

## Key Functions

| Address | Name | Description |
|---------|------|-------------|
| `0x0800D3A8` | `trait_check` | Linear search through 6 trait slots. Returns slot index if trait found, -1 otherwise. |
| `0x0800D3D4` | `trait_remove_by_slot` | Removes trait at given slot (writes 0xFF), recalculates flags. |
| `0x0800D410` | `trait_recalc_flags` | Rebuilds field 0x4C bitmask from current traits via `0x0800DF80`. |
| `0x0800D0F8` | `trait_compact_slots` | Compacts trait slots (bubbles 0xFF entries to end). |
| `0x0800D928` | `trait_assign_slot` | Finds empty slot, handles replacement of conflicting traits. |
| `0x0800DE58` | `trait_remove_by_id` | Finds and removes a trait by ID. |
| `0x0800DF80` | `trait_compute_flags` | Iterates trait slots, reads effect table, ORs type-0 bitmasks into result. |
| `0x0800D36C` | `trait_add_with_recalc` | Adds trait and recalculates everything. |

## Trait Table

**Location:** `0x08202C00` (ROM offset `0x00202C00`)

### Table Structure

```
+0x0000: uint16 entry_count (87)
+0x0002: uint16[87] offset_table  -- per-trait offsets relative to table start
```

### Per-Trait Record Structure

Each trait record starts at `table_base + offset_table[trait_id]`:

```c
struct TraitRecord {
    // Header (0x18 bytes)
    uint16_t category;           // +0x00: category/group ID (0xFF = standalone)
    uint16_t padding_02;         // +0x02: zero
    uint32_t acquisition_mask;   // +0x04: bitmask for community trait acquisition
    uint8_t  related_idx_1;      // +0x08: related trait index
    uint8_t  padding_09;         // +0x09
    uint8_t  related_idx_2;      // +0x0A: related trait index
    uint8_t  padding_0B;         // +0x0B
    uint8_t  effect_count;       // +0x0C: count hint (may not match actual)
    uint8_t  conflicting[7];     // +0x0D: conflicting trait IDs (0xFF = none)
    uint16_t name_offset;        // +0x14: offset to name string (relative to record)
    uint16_t desc_offset;        // +0x16: offset to description string (relative to record)

    // Effect entries (at +0x18, variable count, terminated by 0xFFFF type)
    struct EffectEntry {
        uint16_t type;     // effect type (see below)
        uint16_t param1;   // category/target index
        int16_t  param2;   // sub-type or modifier
        int16_t  param3;   // value (+/-)
    } effects[];           // 8 bytes each

    // Text data (uint16 per character, game-specific encoding)
    // Name string at name_offset
    // Description string at desc_offset
};
```

### Effect Entry Types

| Type | Meaning | param1 | param2 | param3 |
|------|---------|--------|--------|--------|
| 0 | **Flag bitmask** | 0 | bitmask_lo (uint16) | bitmask_hi (uint16) | Sets bits in field 0x4C for runtime checks |
| 1 | **Battle flag** | 0 | bitmask_lo | bitmask_hi | Sets bits for battle-specific checks |
| 2 | **Battle stat modifier** | 0 | stat_index (0-5) | bonus value | Flat stat bonus/penalty in battle |
| 3 | **Technique damage modifier** | tech_category | damage_context | value (+/-) | Modifies technique damage by element/category |
| 4 | **Technique type modifier** | body_part/type | damage_context | value (+/-) | Modifies specific technique types |
| 5 | **Range modifier** | 0 | range_param | value | Modifies effectiveness by distance |
| 6 | **Special modifier** | sub_type | param | value | Special effects (guts rate, IQ bonus, etc.) |

#### param2 values for types 3/4 (damage context):
- 0 = power when attacking
- 1 = damage received (defense)
- 2 = power when attacking (alternate)
- 3 = damage received (alternate)
- 4 = special power bonus
- 5 = resistance
- 6 = luck modifier
- 7 = healing power
- 8 = counter-element

## Flag Bitmask (Field 0x4C)

Computed by `trait_compute_flags` (0x0800DF80), stored in field 0x4C, used for fast runtime trait checks.

| Bit | Hex | Trait | ID |
|-----|-----|-------|-----|
| 0 | 0x00000001 | Glutton | 0x30 |
| 1 | 0x00000002 | IronHart | 0x2C |
| 2 | 0x00000004 | Observer | 0x2D |
| 3 | 0x00000008 | Charisma | 0x2E |
| 4 | 0x00000010 | Hi Power | 0x1B |
| 5 | 0x00000020 | Hi IQ | 0x1F |
| 6 | 0x00000040 | Hi Aim | 0x1D |
| 7 | 0x00000080 | Hi Speed | 0x1E |
| 8 | 0x00000100 | HiStamna | 0x1C |
| 9 | 0x00000200 | HiStamna (2nd) | 0x1C |
| 10 | 0x00000400 | Sunshine | 0x15 |
| 11 | 0x00000800 | Rain | 0x16 |
| 12 | 0x00001000 | Popular | 0x18 |
| 13 | 0x00002000 | GlssHart | 0x19 |
| 14 | 0x00004000 | Listless | 0x33 |
| 15 | 0x00008000 | Merchant | 0x34 |
| 16 | 0x00010000 | Undauntd | 0x35 |
| 17 | 0x00020000 | Lazy | 0x3D |
| 18 | 0x00040000 | Worn Out | 0x3E |
| 19 | 0x00080000 | Expert | 0x40 |
| 20 | 0x00100000 | Slump | 0x55 |
| 21 | 0x00200000 | Elite | 0x54 |
| 22 | 0x00400000 | StatKing | 0x56 |
| 23 | 0x00800000 | Charm | 0x1A |

## Complete Trait Catalog

### Body/Defense Traits (0x00-0x05)

Reduce damage taken from physical attacks. All share identical effects: -5 to attack (body part categories 1,2) and -5 to charm (category 11).

| ID | Name | Category | Notes |
|----|------|----------|-------|
| 0x00 | RockSkin | 3 (Golem) | Stone-type damage reduction |
| 0x01 | TufArmor | 5 (Durahan) | Armor damage reduction |
| 0x02 | Tuf Skin | 0 (default) | Generic damage reduction |
| 0x03 | TufShell | 1 (shell) | Shell damage reduction |
| 0x04 | TufScale | 2 (scale) | Scale damage reduction |
| 0x05 | SoftBody | 4 (soft) | Different: reduces categories 0,1 instead |

### Magic Guard (0x06)

**MagicGrd**: Reduces ALL technique categories (0-10) attack and defense by -5. Universal resistance.

### Body Part Technique Traits (0x07-0x0F, 0x20-0x26)

Boost specific technique types. Pattern: +5 power, +5 alt power, -3 defense, -3 alt defense.

| ID | Name | Tech Category | Body Part |
|----|------|---------------|-----------|
| 0x07 | Up Tail | 5 | Tail attacks |
| 0x08 | Up Claws | 0 | Claw attacks |
| 0x09 | Up Fangs | 1 | Bite attacks |
| 0x0A | Up Horns | 8 | Horn attacks |
| 0x0B | Up Sword | 4 | Sword attacks (flags: 0x4000) |
| 0x0C | UpScythe | 4 | Scythe attacks (flags: 0x8000) |
| 0x0D | Up Spear | 4 | Spear attacks (flags: 0x01000000) |
| 0x0E | Up Wings | 17 | Wing attacks |
| 0x0F | UpTongue | 9 | Tongue attacks |
| 0x20 | Up Fists | 6 | Fist attacks (+5/+5 only, no defense penalty) |
| 0x21 | Up Feet | 2 | Kick attacks (+5/+5 only) |
| 0x22 | Up Beams | 14 | Beam attacks (+5/+5 only) |
| 0x23 | UpBreath | 10 | Breath attacks (+5 special only) |
| 0x24 | Up Head | 8 | Head attacks (+5 special only) |
| 0x25 | Up Dance | 15 | Dance attacks (+5 special only) |
| 0x26 | Up Shot | 13 | Shot attacks (+5 special only) |
| 0x37 | Up Hands | 6 | Hand attacks (+3/+3, weaker) |
| 0x38 | UpHands+ | 6 | Hand attacks (+5/+5/+5, stronger, includes special) |

### Charm/Voice Traits (0x10-0x14)

Boost special technique subtypes with -3 defense penalty.

| ID | Name | Tech Category | Effect |
|----|------|---------------|--------|
| 0x10 | SwtVoice | 3 (voice) | +5 special, -3/-3 defense |
| 0x11 | SwtSmell | 11 (charm) | +5 special, -1/-1 defense (mild) |
| 0x12 | Up Charm | 11 (charm) | +5 special, -3/-3 defense |
| 0x13 | BigVoice | 3 (voice) | +5 special, -3/-3 defense |
| 0x14 | Swt Hips | 18 (dance) | +5 special, -3/-3 defense |

### Weather Traits (0x15-0x16)

| ID | Name | Effect |
|----|------|--------|
| 0x15 | Sunshine | Flag bit 10. Increases effect of training in sunny weather. Acquisition blocked by 0x3FDFFFFE mask (very restricted). |
| 0x16 | Rain | Flag bit 11. Increases effect of training in rainy weather. Same restriction mask. |

### Luck & Social Traits (0x17-0x1A)

| ID | Name | Effects |
|----|------|---------|
| 0x17 | LuckStar | Tech type 11 (charm): +5 luck modifier |
| 0x18 | Popular | Flag bit 12, also bit 8. Easier to acquire fans. Checked at `0x08043628`/`0x0804363A`. |
| 0x19 | GlssHart | Flag bit 13. "Glass Heart" - great power but fragile. Checked extensively in training/battle for stress/mood penalties. |
| 0x1A | Charm | Flag bit 23. Gets items from adventures. |

### Hi-Stat Traits (0x1B-0x1F)

Set flag bits that are checked at runtime for stat-related bonuses.

| ID | Name | Flag Bit | Stat |
|----|------|----------|------|
| 0x1B | Hi Power | 4 | POW |
| 0x1C | HiStamna | 8+9 | DEF+LIF (two bits) |
| 0x1D | Hi Aim | 6 | SKI |
| 0x1E | Hi Speed | 7 | SPD |
| 0x1F | Hi IQ | 5 | INT |

### Battle Utility Traits (0x27-0x29)

| ID | Name | Effects |
|----|------|---------|
| 0x27 | SureHeal | Tech type 12 (heal): +5 healing power. Also sets flag bit 9 (0x200). |
| 0x28 | Foresee | Battle stat 3 (evasion/anticipation): +80. Battle stat 4 (accuracy): -50. |
| 0x29 | EagleEye | Battle stat 2 (accuracy): +50. Related to trait 0x31 (NearSght). |

### Armor & Power Traits (0x2A-0x2B)

| ID | Name | Effects |
|----|------|---------|
| 0x2A | FullArmr | Battle stat 4 (defense): +50. Tech categories 0,1,2: -5 attack. Battle stat 3: -50. Full armor at cost of mobility. |
| 0x2B | Macho | Type 6 special: +20 (likely guts regen rate). Tech type 11 (charm): +3 defense. |

### Personality/Status Traits (0x2C-0x35)

| ID | Name | Flag Bit | Gameplay Effect |
|----|------|----------|-----------------|
| 0x2C | IronHart | 1 | Training resilience. Checked at `0x0800DC94` and `0x08024374`: prevents stress/fatigue gain. |
| 0x2D | Observer | 2 | Learning advantage. Checked at `0x08010D30`. |
| 0x2E | Charisma | 3 | Bonus trait. Checked at `0x080015EE`: affects event/NPC interactions. |
| 0x2F | Satori | -- | Battle stat 1 (INT?): +20. Enlightenment bonus. |
| 0x30 | Glutton | 0 | Always hungry. Checked in food/feeding system. Multiple sub-effects (15 entries). |
| 0x31 | NearSght | -- | Range mod: close range +3, far range -5. Related to 0x29, 0x32. |
| 0x32 | FarSight | -- | Range mod: close range -5, far range +3. Opposite of NearSght. Related to 0x31. |
| 0x33 | Listless | 14 | **Lifespan penalty**: drain * 150/100 (50% more weekly lifespan drain). Checked at `0x0801FDD0`, `0x0801FE8C`, `0x08023DEA`, `0x080273D0`, `0x0802DC10`. Training stat gain halved. |
| 0x34 | Merchant | 15 | Has business sense. Affects shop/item prices. |
| 0x35 | Undauntd | 16 | Doesn't flee. Flag prevents retreat in battle. |

### IQ & Technique Traits (0x36)

| ID | Name | Effects |
|----|------|---------|
| 0x36 | Up IQ | Type 6 special: +20 IQ related bonus (sub_type 1), applied in two contexts. |

### Dignity (0x39)

**Dignity**: All 6 battle stats (0-5) get +30 bonus. A universally powerful battle trait.

### Counter Traits (0x3A-0x3C)

| ID | Name | Effects |
|----|------|---------|
| 0x3A | UpCountr | Battle flag type 1: bit 0 set. Increases counter-attack rate. |
| 0x3B | SlamBack | No stat effects (pure flag). Hunter's slam counter ability. |
| 0x3C | SlamBack | Duplicate of 0x3B. |

### Negative Traits (0x3D-0x3E)

| ID | Name | Flag Bit | Effect |
|----|------|----------|--------|
| 0x3D | Lazy | 17 | Absolutely refuses extra work. Training stat gain forced to -25. Checked at `0x08023E00`, `0x08024236`. |
| 0x3E | Worn Out | 18 | Forces aging_stage to 1 in growth lookup (stunted growth). Checked at `0x08024DBC`. |

### Battle Performance Traits (0x3F-0x42)

| ID | Name | Effects |
|----|------|---------|
| 0x3F | ReekFeet | Tech type 2 (feet): +50 power, -20 defense. Stinky feet are powerful! |
| 0x40 | Expert | Flag bit 19. Gets good results from battle. Checked at `0x08023F2E`, `0x08024120`, `0x08024408`. |
| 0x41 | Success | Battle flag type 1: bit 3. Gives success bonus. |
| 0x42 | Failure | Battle flag type 1: bit 4. Gives failure penalty. |

### Elemental Traits (0x43-0x53)

Paired elemental traits with "Up" (moderate) and "Up+" (strong) variants. Each boosts one element while penalizing its opposite.

Pattern for "Up" variants (type 3): +3 to 9 sub-parameters for the element, -3 for opposite element.
Pattern for "Up+" variants (type 3): +5 to 9 sub-parameters for the element, -5 for opposite element.

| ID | Name | Element | Opposite Element | Strength |
|----|------|---------|------------------|----------|
| 0x43 | Up Fire | Fire (5) | Ice (8) | Moderate (+3/-3) |
| 0x44 | Up Fire+ | Fire (5) | Ice (8) | Strong (+5/-5) |
| 0x45 | Inferno | Fire | -- | Ultimate (no stat effects, pure flag) |
| 0x46 | Up Ice | Ice (8) | Fire (5) | Moderate (+3/-3) |
| 0x47 | Up Ice+ | Ice (8) | Fire (5) | Strong (+5/-5) |
| 0x48 | UpLtning | Lightning (7) | Water (4) | Moderate (+3/-3) |
| 0x49 | UpLtnng+ | Lightning (7) | Water (4) | Strong (+5/-5) |
| 0x4A | Up Water | Water (4) | Lightning (7) | Moderate (+3/-3) |
| 0x4B | UpWater+ | Water (4) | Lightning (7) | Strong (+5/-5) |
| 0x4C | Up Wind | Wind (6) | Earth (3) | Moderate (+3/-3) |
| 0x4D | Up Wind+ | Wind (6) | Earth (3) | Strong (+5/-5) |
| 0x4E | Up Earth | Earth (3) | Wind (6) | Moderate (+3/-3) |
| 0x4F | UpEarth+ | Earth (3) | Wind (6) | Strong (+5/-5) |
| 0x50 | Up Mind | Mind (9) | Magic (10) | Moderate (+3/-3) |
| 0x51 | Up Mind+ | Mind (9) | Magic (10) | Strong (+5/-5) |
| 0x52 | Up Magic | Magic (10) | Mind (9) | Moderate (+3/-3) |
| 0x53 | UpMagic+ | Magic (10) | Mind (9) | Strong (+5/-5) |

Elemental oppositions:
- Fire (5) <-> Ice (8)
- Lightning (7) <-> Water (4)
- Wind (6) <-> Earth (3)
- Mind (9) <-> Magic (10)

### Meta/Status Traits (0x54-0x56)

| ID | Name | Flag Bit | Effects |
|----|------|----------|---------|
| 0x54 | Elite | 21 | A warrior trait. No direct stat effects (flag only). Related: Slump, StatKing. |
| 0x55 | Slump | 20 | Can't get motivated. Flag checked at `0x0800DC3A`, `0x08023E10`, `0x0802A306`, etc. Forces training gain to -25 (same as Lazy). |
| 0x56 | StatKing | 22 | The ultimate trait. Flag bit 22 + all 6 battle stats +50, charm tech +1/+1/+1/-1/+1/+1. Related: Elite, Slump. |

## Hardcoded Trait Checks (43 Call Sites)

All locations where `trait_check` (0x0800D3A8) is called with a specific trait ID:

### Trait 0x15 (Sunshine) -- 1 check
- `0x0800CD74`: Weather-dependent training multiplier. If present, base threshold becomes 0x50 (80).

### Trait 0x16 (Rain) -- 1 check
- `0x0800CD86`: Weather-dependent training multiplier. If present, base threshold becomes 0x14 (20).

### Trait 0x18 (Popular) -- 2 checks
- `0x08043628`, `0x0804363A`: Fan acquisition system, doubles/modifies fan gain.

### Trait 0x19 (GlssHart) -- 5 checks
- `0x0800DCA6`, `0x08023F1A`, `0x08023F5C`, `0x0802410E`, `0x08024146`: Stress/mood penalty in training and battle. Glass Heart monsters take more emotional damage.

### Trait 0x2C (IronHart) -- 2 checks
- `0x0800DC94`, `0x08024374`: Prevents or reduces stress accumulation during training.

### Trait 0x2D (Observer) -- 1 check
- `0x08010D30`: Learning system -- Observer trait gives bonus when watching other monsters.

### Trait 0x2E (Charisma) -- 1 check
- `0x080015EE`: Event/interaction system -- affects NPC/town interactions.

### Trait 0x30 (Glutton) -- 1 check
- `0x0802430E`: Food consumption system -- eats more.

### Trait 0x32 (FarSight) -- 1 check
- `0x0800DC5C`: Battle range calculation modifier.

### Trait 0x33 (Listless) -- 7 checks
- `0x0801FDD0`, `0x0801FE8C`: **Weekly lifespan drain: multiply by 150/100 (0x96/0x64)**. This is the 50% increased drain.
- `0x08023DEA`, `0x0802421A`, `0x080273D0`, `0x0802DC10`: Training gain halved (gain / 2).

### Trait 0x3D (Lazy) -- 2 checks
- `0x08023E00`, `0x08024236`: Forces training stat gain to -25 (fixed penalty regardless of normal gain).

### Trait 0x3E (Worn Out) -- 1 check
- `0x08024DBC`: Growth system -- forces aging_stage = 1 in growth rate lookup. Effectively caps growth.

### Trait 0x40 (Expert) -- 3 checks
- `0x08023F2E`, `0x08024120`, `0x08024408`: Battle result bonuses -- better rewards from victories.

### Trait 0x54 (Elite) -- 2 checks
- `0x0802409E`, `0x08027336`: Battle/training context -- Elite status check.

### Trait 0x55 (Slump) -- 5 checks
- `0x0800DC3A`, `0x08023E10`, `0x08024244`, `0x0802A306`, `0x0802DD28`, `0x0802DDE0`: Training gain forced to -25 (like Lazy). Also affects battle morale.

### Trait 0x56 (StatKing) -- 4 checks
- `0x08023F48`, `0x080240B0`, `0x08024134`, `0x08027348`: Super trait check in training/battle for stat king bonuses.

## Trait Acquisition & Removal

### Removal Functions (D5A4, D604, D668, D7FC)

Several functions try to remove specific traits based on conditions:

- **0x0800D5A4**: Removes trait 0x25 ("Up Dance") if field 0x1F (loyalty) > 0x32 (50).
- **0x0800D604**: Removes trait 0x2B ("Macho") if not in loyalty tier {0, 2, 4} (from function 0x08002830).
- **0x0800D668**: Removes trait 0x30 ("Glutton") if field 0x1F (loyalty) <= 0x31 (49).
- **0x0800D7FC**: Removes trait 0x36 ("Up IQ") if function 0x08000FA4 returns 1 (condition check).

### Conflicting Traits

Traits store up to 7 conflicting trait IDs in header bytes 0x0D-0x13. When a new trait is assigned, conflicting traits are removed. Notable conflicts:

- EagleEye (0x29) conflicts with NearSght (0x31)
- NearSght (0x31) conflicts with EagleEye (0x29) and FarSight (0x32)
- FarSight (0x32) conflicts with NearSght (0x31)
- Elite (0x54) conflicts with Slump (0x55) and StatKing (0x56)
- Slump (0x55) conflicts with Elite (0x54) and StatKing (0x56)
- StatKing (0x56) conflicts with Elite (0x54) and Slump (0x55)
- Elemental trait pairs conflict with each other (e.g., Up Fire conflicts with Up Ice)
- Up Fire/Ice/Lightning/Water/Wind/Earth/Mind/Magic variants all conflict within element groups

## Technique Categories (param1 for types 3/4)

| ID | Category |
|----|----------|
| 0 | Claw |
| 1 | Bite/Fang |
| 2 | Kick/Feet |
| 3 | Voice/Sound |
| 4 | Blade/Sword/Scythe/Spear |
| 5 | Tail |
| 6 | Fist/Hands |
| 7 | Lightning element |
| 8 | Horn/Head |
| 9 | Tongue |
| 10 | Breath |
| 11 | Charm |
| 12 | Healing |
| 13 | Shot |
| 14 | Beam |
| 15 | Dance |
| 17 | Wings |
| 18 | Hip/Dance (alternate) |

## Elemental Category Pairs (for type 3 effects)

| Category | Element | Opposite |
|----------|---------|----------|
| 3 | Earth | Wind (6) |
| 4 | Water | Lightning (7) |
| 5 | Fire | Ice (8) |
| 6 | Wind | Earth (3) |
| 7 | Lightning | Water (4) |
| 8 | Ice | Fire (5) |
| 9 | Mind | Magic (10) |
| 10 | Magic | Mind (9) |

## Lifespan Impact (Confirmed)

Trait 0x33 (Listless) at `0x0801FDD0` and `0x0801FE8C`:
```
if has_trait(monster, 0x33):
    drain = drain * 0x96 / 0x64   // drain * 150 / 100 = 50% more
```

Trait 0x3E (Worn Out) at `0x08024DBC`:
```
if has_trait(monster, 0x3E):
    aging_stage = 1   // forces early aging bracket
```

## Training Impact (Confirmed)

At `0x08023DEA` (training stat calculation):
```
if has_trait(monster, 0x33):   // Listless
    stat_gain = stat_gain / 2
if has_trait(monster, 0x3D):   // Lazy
    stat_gain = -25
if has_trait(monster, 0x55):   // Slump
    stat_gain = -25
```

## Text Encoding

Trait names and descriptions use uint16 (little-endian) per character:
- 0x0001-0x001A: A-Z
- 0x001B-0x0034: a-z
- 0x0035-0x003E: 0-9
- 0x0000: space
- 0xFFFF: terminator
- 0xFFF4: newline
- 0x003F: !
- 0x0040: ?
- 0x0041: -
- 0x0042: +
- 0x0044: .
- 0x0045: ,
- 0x0048: (
- 0x004E: '
- 0x0051: '  (apostrophe variant)
