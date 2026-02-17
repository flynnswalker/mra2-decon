# MRA2 Monster Record Structure (Phase 2 -- Code-Confirmed)

## Table Location

- **Table base address**: `0x081CACC8` (file offset `0x001CACC8`)
- **Header**: 4 bytes at base (value = 4, offset to first record)
- **First record**: `0x081CACCC`
- **Record size**: 72 bytes (confirmed via `get_monster_record` function at `0x08020C5C`)
- **Total records**: 512 (26 breed groups, 17-27 variants each)
- **Index function**: `0x08020C5C` -- computes `base + [base] + index * 72`
- **Breed combiner**: `0x08002B28` -- combines main breed (0-29) + sub breed (0-39)
- **Breed combo table**: `0x081E88C0` -- 30x40 matrix of 16-bit record indices

## Status: PARTIALLY CONFIRMED via code analysis

## Struct Definition

```c
// Record size: 72 bytes (confirmed: index * 9 * 8 in code)
// Records start at table_base + 4
struct MonsterTypeRecord {
    // --- Byte 0x00-0x01: Identity ---
    uint8_t  separator;         // +0x00: always 0x00
    uint8_t  sub_breed_idx;     // +0x01: sub-breed index within main breed group (0-39)

    // --- Bytes 0x02-0x07: Base Stat Values ---
    uint8_t  base_stats[6];     // +0x02: 6 base stat values
                                //   [0] POW range: 0x28-0xD7 (40-215)
                                //   [1] INT range: 0x23-0xC8 (35-200)
                                //   [2] SKI range: 0x41-0xC8 (65-200)
                                //   [3] SPD range: 0x1E-0xC8 (30-200)
                                //   [4] DEF range: 0x32-0xDC (50-220)
                                //   [5] LIF range: 0x3C-0xDC (60-220)
                                // Code at 0x08000C28 reads [r4,#2] and [r4,#3]
                                // then averages them: (stat0+stat1)/2

    // --- Bytes 0x08-0x0B: Training Properties ---
    uint8_t  training_props[4]; // +0x08: training-related properties

    // --- Bytes 0x0C-0x0F: Extra Modifiers ---
    uint8_t  extra_mods[4];     // +0x0C: additional modifier values

    // --- Bytes 0x10-0x13: Lifespan and Type ---
    uint16_t lifespan_raw;      // +0x10: lifespan value (range: 2300-2860, likely weeks)
    uint16_t type_flags;        // +0x12: type category (values 1-5 observed)

    // --- Bytes 0x14-0x1B: Trait Modifiers ---
    int8_t   traits[8];         // +0x14: signed personality/trait modifiers
                                //   [0]: always positive (1-13), breed quality indicator?
                                //   [1-7]: centered around 0 (-9 to +10)

    // --- Bytes 0x1C-0x1F: Breed Flags ---
    uint32_t breed_flags;       // +0x1C: breed classification flags
                                //   Most common: 0x01010000, 0x0000FB00, 0x00000000

    // --- Bytes 0x20-0x27: Type Identity ---
    uint8_t  type_id;           // +0x20: type identifier
    uint8_t  padding_21[3];     // +0x21: FF FF FF padding
    uint32_t stat_count;        // +0x24: stat/category count

    // --- Bytes 0x28-0x47: Growth Grade Data ---
    uint8_t  growth_data[32];   // +0x28: stat growth grade table
                                // Uses mixed encoding:
                                //   '1'-'5' (0x31-0x35): numeric grades
                                //   '#','$','%' (0x23-0x25): symbol grades
                                //   'B'-'E' (0x42-0x45): letter grades
                                //   'S','T' (0x53-0x54): special grades
                                //   0x13, 0x14: non-printable values
                                // Most common byte: 0x33 ('3')
};
```

## Breed Groups

26 breed groups detected via sub_breed_idx resets:

| Group | Variants | Sub-IDs  | Likely Breed |
|-------|----------|----------|-------------|
| 0     | 22       | 0-39     | Golem?      |
| 1     | 19       | 1-38     | Tiger?      |
| 2     | 22       | 0-38     | Pixie?      |
| 3     | 22       | 1-39     | Suezo?      |
| 4     | 21       | 1-38     | Hare?       |
| 5     | 22       | 0-38     | Zuum?       |
| 6     | 18       | 0-31     | Mocchi?     |
| 7     | 19       | 0-32     | Naga?       |
| 8     | 17       | 4-32     | Gali?       |
| 9     | 21       | 1-37     | Jill?       |
| 10    | 18       | 2-31     | Undine?     |
| 11    | 19       | 0-32     | Niton?      |
| 12    | 19       | 0-32     | Mock?       |
| 13    | 18       | 0-32     | Ducken?     |
| 14    | 27       | 0-37     | Plant?      |
| 15    | 18       | 1-31     | Monol?      |
| 16    | 18       | 0-31     | Ape?        |
| 17    | 18       | 0-32     | Worm?       |
| 18    | 17       | 0-31     | Durahan?    |
| 19    | 17       | 0-31     | Arrow Head? |
| 20    | 20       | 1-37     | Suzurin?    |
| 21    | 18       | 0-32     | Hengar?     |
| 22    | 17       | 2-32     | Pancho?     |
| 23    | 27       | 2-33     | Raiden?     |
| 24    | 20       | 1-31     | Lesione?    |
| 25    | 18       | 0-33     | Phoenix?    |

(Breed names are speculative -- text decoder needed to confirm.)

## Breed Combination Table

Located at `0x081E88C0`, this is a 30x40 matrix of 16-bit entries.
- Row = main breed (0-29, stride = 80 bytes)
- Column = sub-breed (0-39)
- Value = record index for `get_monster_record`
- Zero entries indicate invalid combinations (game defaults to pure breed)

## Related Tables

- **Stat growth table**: `0x081C9F80` (70 entries, 12 bytes) -- referenced by
  training functions at `0x08068810`, `0x0806B06C`, `0x0806B264`
- **Variant data table**: `0x081D3CCC` (32-bit offset table, accessed via `0x08002B9C`)
- **String/data table**: `0x082006F8` (16-bit offset table, accessed via `0x08002B88`)
