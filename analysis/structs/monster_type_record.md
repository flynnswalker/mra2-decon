# MRA2 Monster Record Structure (Preliminary)

Located at ROM address **0x081CADC4** (file offset 0x001CADC4).
194 records, 72 bytes each.

## Status: PRELIMINARY -- needs validation via mGBA

## Struct Definition (speculative)

```c
// Confidence: medium -- field boundaries identified, semantics TBD
struct MonsterTypeRecord {
    uint32_t record_type;       // +0x00: 0x01 or 0x20 (flags?)
    uint8_t  type_id;           // +0x04: monster type identifier
    uint8_t  padding[3];        // +0x05: FF FF FF
    uint32_t category;          // +0x08: category or stat count

    // +0x0C to +0x2B: 32 bytes of stat growth data
    // Uses ASCII-like encoding: '1'-'6' (0x31-0x36) and 'A'-'F' (0x41-0x46)
    // Likely represents stat growth grades per training type
    uint8_t  growth_grades[32]; // +0x0C: stat growth grade table

    uint8_t  separator;         // +0x2C: 0x00 or 0x01
    uint8_t  table_index;       // +0x2D: sequential index
    uint8_t  base_stats[6];     // +0x2E: base stat values (encoded)
    uint8_t  modifiers[4];      // +0x34: training/growth modifiers
    uint8_t  properties[4];     // +0x38: additional properties
    uint16_t lifespan_data;     // +0x3C: lifespan-related (0x09XX pattern)
    uint16_t type_flags;        // +0x3E: type flags
    int8_t   traits[8];         // +0x40: personality/trait modifiers (signed)
};
```

## Sample Records

### Record 0 (at 0x081CADC4)
```
01 00 00 00  02 FF FF FF  06 00 00 00
36 25 32 33  33 44 53 34  32 33 33 33
32 33 24 45  54 16 41 46  34 23 35 33
33 33 33 33  00 08 55 AA  87 96 41 50
03 08 06 08  02 03 02 00  E2 09 05 00
0D FB FE 05  03 FB 05 02  01 02 03 FE
```

### Record 5 (at 0x081CB04C)
```
01 00 00 00  27 FF FF FF  06 00 00 00
34 33 31 33  13 51 63 43  31 33 33 33
45 45 04 26  43 33 54 41  13 15 35 33
33 33 33 33  00 1B 50 AA  82 96 41 50
03 08 06 08  03 03 00 00  EC 09 05 00
0D FB FE 00  02 FB 05 02  01 02 05 FB
```

## Observations

1. The `+0x2D` byte increments (0x08, 0x0A, 0x15, 0x18, 0x19, 0x1B, 0x1E, 0x20...)
   suggesting a table index
2. The signed bytes at `+0x40` to `+0x47` (values like 0xFB=-5, 0xFE=-2, 0x05=+5)
   look like personality/nature modifiers
3. The growth grades at `+0x0C` to `+0x2B` use a mix of numeric ('1'-'6') and
   alphabetic ('A'-'F') characters suggesting a letter-grade system
4. Records with `record_type = 0x20` instead of `0x01` may be special/secret breeds
