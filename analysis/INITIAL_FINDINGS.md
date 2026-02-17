# MRA2 Initial Analysis Results

Generated from first-pass ROM analysis on the USA ROM (CRC32: 1D695B1B).

## ROM Header

| Field | Value |
|-------|-------|
| Internal Title | `MONSTERRANC2` |
| Game Code | `A2QE` |
| Maker Code | `9B` (Tecmo) |
| Entry Point | `0x080000C0` |
| ROM Size | 8,388,608 bytes (8 MB) |

## Code vs Data Regions

The ROM is primarily THUMB code with some ARM. Code density analysis:

| Region | Code Density | Notes |
|--------|-------------|-------|
| `0x08000000-0x081BFFFF` | 80-98% | Main game code |
| `0x081C0000-0x081DFFFF` | Variable | **Data tables region** |
| `0x081E0000-0x083BFFFF` | 60-80% | Mixed code/data (likely graphics, audio) |
| `0x083C0000-0x087FFFFF` | 58-100% | Asset data, padding |

## Function Detection

- **6,895** THUMB function prologues (PUSH {*, lr})
- **4** ARM function prologues (STMDB SP!, {*, lr})
- **29,964** THUMB BL call targets
- **21,702** ARM BL call targets
- **41,250** total unique functions identified

The game is overwhelmingly THUMB code. ARM mode is used sparingly (likely
for BIOS calls and performance-critical inner loops).

## Strings

- **45,853** ASCII strings found (min 5 chars)
- Key string: `"Monster Farm Advance2 Save Data"` at `0x081CACA8`
  - Note: The game's internal name is "Monster Farm" (Japanese title),
    even in the USA version
- Monster breed names (Golem, Tiger, etc.) are NOT stored in ASCII
  - The game uses a **custom text encoding** for player-visible text
  - Text may be stored as tile indices into a font bitmap
  - Decoding the character table is a priority RE target

## Pointer Tables

- **255** pointer tables found (min 8 entries)
- Notable tables for further investigation:
  - `0x08002D74`: 41 pointers (likely a jump table for game state machine)
  - `0x0800DA60`: 36 pointers
  - `0x08002BCC`: 24 pointers (targets in `0x081E9244` -- data region)

## Major Discovery: Monster Definition Table

Found at **ROM offset `0x001CADC4`** (address **`0x081CADC4`**).

- **194 records** of **72 bytes each** (13,968 bytes total)
- Ends approximately at `0x081D1134`

### Record Structure (72 bytes)

Preliminary field mapping (confidence: medium):

| Offset | Size | Values Seen | Hypothesis |
|--------|------|-------------|------------|
| +0x00 | 4 | `01 00 00 00` or `20 00 00 00` | Record type flag |
| +0x04 | 1 | varies widely | Monster/breed ID |
| +0x05 | 3 | `FF FF FF` | Separator/padding |
| +0x08 | 4 | small numbers (3-8) | Category or stat count |
| +0x0C | 24 | ASCII-range digits/letters | **Stat growth grades** (uses chars 1-6, A-F) |
| +0x24 | 8 | digits + `35 33 33 33 33 33` | Continuation of grades + padding |
| +0x2C | 1 | `00` or `01` | Separator or flag |
| +0x2D | 1 | small number | Table index |
| +0x2E | 6 | hex values | **Base stat values** (encoded) |
| +0x34 | 4 | small numbers | Training/growth modifiers |
| +0x38 | 4 | varies | Additional properties |
| +0x3C | 2 | `09 XX` pattern | Lifespan or age-related |
| +0x3E | 2 | `04 00` or `05 00` | Type flags |
| +0x40 | 8 | `FB/FE/FC` patterns | Personality/trait modifiers |

### Evidence This Is Monster Data

1. **194 entries** -- plausible for total monster types (main breeds x sub-breeds)
2. **72-byte fixed records** -- consistent with RPG creature definition structs
3. **Stat-grade characters** -- the ASCII-range bytes (0x31-0x36 = "1"-"6",
   0x41-0x46 = "A"-"F") match a letter-grade stat system
4. **Located in data region** -- immediately follows the save data identifier
5. **Signed small values** (`FB` = -5, `FE` = -2) suggest growth modifiers

## Text Encoding

The game does NOT use ASCII for player-visible text. Known facts:

- Internal identifiers (save data header, ROM header) use standard ASCII
- Monster names, menu text, dialogue use a custom encoding
- No breed names found via ASCII, shifted-ASCII, or 16-bit encoding searches
- Some text may be compressed (LZ77 headers found: 11,093 candidates)
- **Next step**: Find the text rendering function in code, trace what character
  table it uses, and build a decoder

## Stat Table at 0x081C9F80

A separate table was found with 70 entries of 12 bytes each (6 x uint16):

- Values are all multiples of 8, ranging from 0 to 216
- Could be: stat growth rate multipliers, graphical coordinates, or
  training result tables
- Needs cross-reference with code to confirm purpose

## Next Steps

1. **Decode text encoding** -- find the font/character map to read monster names
2. **Map the 72-byte monster record fully** -- use mGBA memory watch to correlate
   in-game values with record fields
3. **Cross-reference the monster table** -- find code that reads from `0x081CADC4`
   to understand field semantics
4. **Investigate pointer tables** -- especially those pointing into the data region
5. **Map the save data format** -- starting from the "Save Data" marker
