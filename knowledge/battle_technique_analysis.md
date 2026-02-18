# MRA2 Battle Technique Data — Complete ROM Analysis
*Updated 2026-02-18 from disassembly of battle functions 0x080432E8–0x08044C14*

## 1. Technique Data Table

### Location
- **Index Table**: `0x08208CB0` — 300 entries (30 breeds × 10 slots), each a `uint16` offset from table base
- **Record Data**: Starts at `0x08208F08` (offset `0x0258` from base)
- **Record Size**: 56 bytes (`0x38`)
- **Sentinel**: Slot value `0xFFFF` = empty/no technique
- **Total Techniques**: 275 (across 30 breed types)
- **JSON Dump**: `analysis/formulas/technique_data.json`

### Index Computation (from `0x08044C70`)
```
entry_offset = (breed_id * 5 + breed_id) * 2   // breed_id * 10
entry_offset = (entry_offset + tech_slot) * 2   // * sizeof(uint16)
tech_ptr = TABLE_BASE + *(uint16*)(TABLE_BASE + entry_offset)
```

### Record Structure (56 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 32 | `name_tiles[16]` | uint16 array, tile indices for technique name display. Terminated by `0xFFF4`. |
| 0x20 | 4 | `reserved` | Always zero (padding) |
| 0x24 | 1 | `range_flag` | 0 = Close/Mid, 1 = Mid/Far |
| 0x25 | 1 | `force_type` | 0 = POW, 1 = INT, 2 = Both |
| 0x26 | 1 | `element_flags` | Bitfield: element type (1=Fire?, 2=Water?, 4=Wind?, 8=Earth?, 16=Electric?, 32=Ice?, 64=Dark?, 128=Light?) |
| 0x27 | 1 | `hit_class` | 0–6: hit style/animation class |
| 0x28 | 1 | `target_flags` | Bitfield: targeting properties |
| 0x29 | 1 | `aoe_flags` | Bitfield: area-of-effect properties |
| 0x2A | 1 | `multi_hit` | 0 = single, 1 = double, 2 = triple |
| 0x2B | 1 | `_pad` | Always 0 |
| 0x2C | 1 | `errantry_rank` | 0–4: minimum errantry rank to learn |
| 0x2D | 1 | `slot_tier` | 0–5: technique slot tier |
| 0x2E | 2 | `guts_cost` | uint16 — stored as `actual_cost * 10` (values: 300/400/500/600 → 30/40/50/60 guts) |
| 0x30 | 1 | `damage` | 9–56: base damage rating |
| 0x31 | 1 | `accuracy` | 24–80: base accuracy rating |
| 0x32 | 1 | `sharpness` | 0–45: critical hit modifier (higher = more crits) |
| 0x33 | 1 | `withering` | 0–54: stat drain effectiveness |
| 0x34 | 1 | `mystery_mod` | 0–40: additional combat modifier (possibly hit chance variance or GxB bonus) |
| 0x35 | 1 | `status_chance` | Status application rate: 0 = none, 20–99 = percentage chance |
| 0x36 | 1 | `effect_type` | Effect ID (see tables below) |
| 0x37 | 1 | `effect_param` | Effect power/duration (0–35) |

### Effect Type IDs

**Primary Status Effects** (applied when `status_chance > 0`):
| ID | Name (estimated) | Count | Chance Range |
|----|-------------------|-------|-------------|
| 7 | Paralyze? | 8 | 20–40% |
| 8 | Poison? | 5 | 20–35% |
| 9 | Stagger/Dizzy | 31 | 20–45% |
| 11 | Instant KO? | 1 | 99% (Breed 22 Slot 8, 12 dmg, 80 acc) |

**Passive/Secondary Effects** (when `status_chance == 0`, `effect_type > 0`):
| ID | Name (estimated) | Count | Param Range |
|----|-------------------|-------|-------------|
| 1 | Self-Buff/Heal? | 5 | 25–35 |
| 2 | Barrier/Shield? | 1 | 25 |
| 4 | Lifesteal? | 1 | 30 |
| 5 | Guts Drain? | 5 | 10–30 |
| 6 | HP Drain? | 3 | 10–27 |
| 10 | Special proc | 1 | 0 |


## 2. Damage Calculation Formula

### Battle Turn Resolution (`0x080432E8`)

The scoring function computes an integer `score` from multiple phases:

#### Phase 1: Type Compatibility
```
attacker_compat = TYPE_INDEX[0x081E9224 + attacker_struct[0x104]]
defender_compat = TYPE_INDEX[0x081E9224 + defender_struct[0x104]]
combined = attacker_compat * 5 + defender_compat
advantage = TYPE_ADVANTAGE_TABLE[0x081C9A00 + combined]  // signed byte, -2..+2
score += switch_bonus[advantage + 2]  // indexed into switch table
```

#### Phase 2: Guts Modifier (field `0x2F`)
```
avg_guts = (attacker_guts + defender_guts) / 2
tier = lookup_tier(avg_guts, [24, 49, 69, 89])
score += GUTS_TIER_TABLE_1[0x081C9B10 + tier * 4]
```

#### Phase 3: Loyalty/Mood Modifier (field `0x32`)
Same tiered lookup as Phase 2 using `GUTS_TIER_TABLE_2[0x081C9B24]`.

#### Phase 4: Stat Differences (fields 0–5: POW/INT/SKI/SPD/DEF/LIF)
```
for each stat:
    diff = abs(attacker_stat - defender_stat)
    if diff > 100:
        adjusted = abs(diff - 100)
        modifier = (adjusted * 5 * 4) >> 8   // = adjusted * 20 / 256
        score += 1 + modifier
```

#### Phase 5: Breed Compatibility (field `0x0C`)
```
index = defender_breed * 15 + attacker_breed
advantage = BREED_COMPAT_TABLE[0x081C9A19 + index]  // -2..+2
score += switch_bonus[advantage + 2]
```

#### Phase 6: Level Modifier (field `0x12`)
```
level_diff = attacker_level - defender_level
if level_diff == 0:  score += 10
elif abs(level_diff) == 1:  score += 5
```

#### Phase 7: Technique Multiplier (field `0x18`)
```
if attacker_has_technique OR defender_has_technique:
    score = score * 3 / 2
```

#### Phase 8: Score → Outcome Tier
```
if score > 99:  tier = 4  (Overwhelming)
elif score > 65: tier = 3  (Strong)
elif score > 50: tier = 2  (Moderate)
elif score > 40: tier = 1  (Slight)
else:            tier = 0  (Miss)
```

**Level cap**: If `min(attacker_level, defender_level) <= 1`, tier is capped at 3.


## 3. Result Application (`0x0804370C`)

After scoring, the result handler stores these to the battle state:

| Field | Contents |
|-------|----------|
| 0x8B | Turn counter (incremented) |
| 0xB2 | If counter reaches 20: set to 2 (with value 0x13) |
| 0x4D, 0x4E | Attack record pointers |
| 0x50 | Attacker type byte (from struct+0x104) |
| 0x51 | Attacker breed sub-byte (from struct+0x105) |
| 0x52 | Attacker technique slot (field 0x14) |
| 0x53 | Attacker level (field 0x12) |
| 0x54 | Outcome tier (0–4) |
| 0x55 | Attacker breed ID (field 0x0C) |
| 0x56 | Best attack stat index (0=A, 1=B, 2=C based on POW/SPD/SKI averages) |
| 0x57 | Dominant side tiebreak (PRNG-based when equal) |
| 0x58 | Total raw stat sum (SKI component) |
| 0x59 | Total stat sum (all 6 position stats) |
| 0x4F | Monster base data (field 0x64) |
| 0x11 | Round marker |

### Best Attack Stat Computation
```
stat_A = (struct[0x68] + struct[0x6A] + signed(struct[0xAB]) + signed(struct[0xAC])) / 2
stat_B = (struct[0x70] + struct[0x6E] + signed(struct[0xAF]) + signed(struct[0xAE])) / 2
stat_C = (struct[0x6C] + struct[0x72] + signed(struct[0xAD]) + signed(struct[0xB0])) / 2

if stat_A > stat_B:
    best = 0 if stat_A > stat_C else 2
elif stat_B > stat_C:
    best = 1
else:
    best = 2
```


## 4. Guts Regeneration System

### Timer Setup (`0x080430DC`)
- Installs callback via `0x0800039C` with timer data at `0x083F2794`
- The callback address is loaded from the literal pool

### Guts Tick (`0x080430B4`)
- Checks timer via `0x08000324`
- If timer expired: returns `0xF0` (240 — likely a "full regen" pulse)
- Otherwise: returns `struct[0x9C]` (current partial guts value)

### Guts Regen Timer Values (`0x081C9BEC`)
| SPD Tier | Timer (frames) | Seconds (60fps) |
|----------|---------------|-----------------|
| 0 (lowest) | 1751 | 29.2s |
| 1 | 1501 | 25.0s |
| 2 | 1251 | 20.9s |
| 3 | 1001 | 16.7s |
| 4 | 751 | 12.5s |
| 5 (highest) | 501 | 8.4s |
| 6 (disabled) | 0xFFFF | Never |

### Guts Change on Attack Outcome
| Tier | Outcome | Guts Change |
|------|---------|-------------|
| 0 | Miss | −4 |
| 1 | Slight | −1 |
| 2 | Moderate | 0 |
| 3 | Strong | +1 |
| 4 | Overwhelming | +1 |


## 5. Guts Cost
Techniques cost **30, 40, 50, or 60 guts** to use (stored as `cost * 10` in the ROM).

| Stored Value | Actual Cost | Count |
|-------------|-------------|-------|
| 300 | 30 guts | 89 techniques |
| 400 | 40 guts | 81 techniques |
| 500 | 50 guts | 65 techniques |
| 600 | 60 guts | 40 techniques |


## 6. Critical Hit / Sharpness

The `sharpness` field (byte 0x32 of technique record, range 0–45) modifies the effective outcome tier. From analysis of the scoring function:

- Sharpness likely contributes to the score computation within the technique presence check phase
- Combined with the `mystery_mod` field (byte 0x34), these feed into the accuracy/evasion sub-system
- The PRNG at `0x0806354C` (same LCG as training) is used for random tiebreaks

No dedicated "crit multiplier" function was found — the sharpness value appears to **increase the probability of higher outcome tiers** rather than applying a separate damage multiplier.


## 7. Key ROM Addresses

| Address | Description |
|---------|-------------|
| `0x08208CB0` | Technique index table (30 breeds × 10 slots × uint16) |
| `0x08208F08` | First technique record data |
| `0x081C9A00` | Type advantage table (15×15 signed bytes) |
| `0x081C9A19` | Breed compatibility table |
| `0x081C9B10` | Guts tier lookup table 1 (5 × uint32) |
| `0x081C9B24` | Guts tier lookup table 2 (5 × uint32) |
| `0x081C9BD4` | Battle config parameters |
| `0x081C9BEC` | Guts regen timer table (7 × uint16) |
| `0x081E9224` | Type index translation table |
| `0x0821A144` | Font/character tile data (56 bytes per char) |
| `0x083F316C` | Character width table (9 entries × 2 bytes) |
| `0x0200C990` | WRAM: current battle outcome tier |
| `0x0200C994` | WRAM: battle side indicator |
| `0x0200C998` | WRAM: battle HP/damage state |
| `0x0200D540` | WRAM: battle visual state pointer |

### Key Functions

| Address | Name | Purpose |
|---------|------|---------|
| `0x080432E8` | `battle_scoring_main` | Computes battle outcome score from all modifiers |
| `0x0804370C` | `battle_result_handler` | Stores outcome data to battle state fields |
| `0x08043934` | `battle_apply_technique` | Copies technique data into battle record |
| `0x08043AC8` | `battle_damage_main` | Entry point: calls scoring, stores tier to WRAM |
| `0x08043AE0` | `battle_apply_result` | Reads stored tier, calls result handler |
| `0x08043C34` | `abs_value` | Integer absolute value helper |
| `0x08044C14` | `battle_technique_render` | Looks up technique, renders name/animation |
| `0x0806862C` | `text_width_calc` | Computes pixel width of technique name |
| `0x080681EC` | `text_render` | Renders technique name tiles to VRAM |
| `0x08068714` | `char_width_lookup` | Gets character width from table |
| `0x080430B4` | `guts_tick` | Guts regeneration tick (timer-based) |
| `0x080430DC` | `guts_timer_setup` | Installs guts regen timer callback |
| `0x0804687C` | `battle_effect_visual` | Loads status effect palettes/sprites |
