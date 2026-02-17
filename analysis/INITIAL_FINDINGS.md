# MRA2 Analysis Results

Generated from ROM analysis on the USA ROM (CRC32: 1D695B1B).
Updated with Phase 2 deep analysis findings.

## ROM Header

| Field | Value |
|-------|-------|
| Internal Title | `MONSTERRANC2` |
| Game Code | `A2QE` |
| Maker Code | `9B` (Tecmo) |
| Entry Point | `0x080000C0` |
| ROM Size | 8,388,608 bytes (8 MB) |

## Code vs Data Regions

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

The game is overwhelmingly THUMB code.

## Phase 2: Cross-Reference Analysis

### Key Functions Discovered

| Address | Name | Purpose |
|---------|------|---------|
| `0x08020C5C` | `get_monster_record` | Takes record index, returns pointer to 72-byte monster record |
| `0x08002B28` | `combine_breed_ids` | Combines main breed + sub breed into record index via 2D lookup table |
| `0x080035BC` | `field_accessor` | Generic game state property read (wrapper for `0x08002240`) |
| `0x080035D0` | `field_writer` | Generic game state property write |
| `0x08002240` | `core_state_accessor` | Core accessor with switch on 12 field types |
| `0x08002B88` | `resolve_string_16` | Resolves index to ROM pointer via 16-bit offset table |
| `0x08002B9C` | `resolve_data_32` | Resolves index to ROM pointer via 32-bit offset table |

### Monster Type Table (CONFIRMED)

- **Table base**: `0x081CACC8` (4-byte header, records start at `0x081CACCC`)
- **Record size**: 72 bytes (confirmed in code: `index * 9 * 8`)
- **Total records**: **512** (not 194 as initially estimated)
- **26 breed groups**, each with 17-27 sub-breed variants
- **Index function**: `0x08020C5C` (called by 11 functions throughout the codebase)
- Full struct definition in `analysis/structs/monster_type_record.md`

### Breed Combination Table (NEW)

- **Address**: `0x081E88C0`
- **Structure**: 30x40 matrix of 16-bit entries (row stride = 80 bytes)
- **Purpose**: Maps (main_breed, sub_breed) -> monster record index
- **Main breed range**: 0-29 (30 breeds including "???" placeholder)
- **Sub-breed range**: 0-39
- **Zero entries** = invalid combination (game defaults to pure-breed)

### WRAM Structure Discovery

The game uses **two main WRAM structs** accessed via base pointers:

| Base Address | References | Purpose |
|-------------|-----------|---------|
| `0x02006D48` | 273 refs | Active monster data struct |
| `0x02002B24` | 457 refs | Player/game state struct |

The field accessor system (`0x080035BC` -> `0x08002240`) uses a descriptor
table to define each field's offset, type, and validation. Fields are
accessed by index number (e.g., field 0x6B = monster type, field 0x9A = breed).

Known offsets from the `0x02006D48` monster struct base:
- `+0x68` (= `0x02006DB0`): POW stat (confirmed via cheat codes)
- `+0x6A`: INT stat
- `+0x6C`: SKI stat
- `+0x6E`: SPD stat
- `+0x70`: DEF stat
- `+0x72` (= `0x02006DBA`): LIF stat

### Stat Growth Table (0x081C9F80)

- 70 entries, 12 bytes each (originally identified in Phase 1)
- **3 confirmed xrefs** -- all in the training/ranch system (`0x08068810`, `0x0806B06C`, `0x0806B264`)
- Functions multiply a parameter by `0x98` (152), suggesting a 152-byte per-monster
  WRAM structure for active ranch state
- The table is loaded as 8 bytes at function start, used alongside training cycle counters
- **Likely purpose**: Stat growth multipliers per training type per breed

### Data Resolver Tables (NEW)

Two generic data resolver functions found:

1. **16-bit offset table** at `0x082006F8` (via `resolve_string_16`)
   - Entries are length-prefixed data blocks
   - First byte = length, followed by `length` bytes of structured data
   - Contains 2-byte aligned values (likely formatted game text or UI data)

2. **32-bit offset table** at `0x081D3CCC` (via `resolve_data_32`)
   - Immediately follows the monster type table
   - Contains per-variant extended data (sprite references, abilities?)
   - Each entry has 8 uint16 values followed by `0xFFFF` separator

## Text Encoding (Ongoing Investigation)

### What We Know

- Internal strings (save data header, ROM header) use standard ASCII
- Player-visible text uses a **custom encoding with bytes in 0x80-0xFF range**
- A **tile index remap table** found at `0x0844386C` maps bytes 0x80-0xFF to
  VRAM tile indices (0x00-0x7F) in a scattered pattern
- Font data candidates found at `0x0819DCA0` (4bpp, 93+ tiles)
- 45,251 potential encoded text strings found (0x80-0xFE bytes, null-terminated)
- Neither simple offset mapping (byte-0x80+0x20) nor tile-order assumptions
  produced recognizable monster names

### What Remains

- The font tile ordering needs to be determined (which tile = which character)
- The text system may use control codes within strings
- A dynamic trace in mGBA is the most reliable path to cracking the encoding:
  set a breakpoint on the text rendering function and log the byte->character mapping

## Strings

- **45,853** ASCII strings found (min 5 chars)
- Key string: `"Monster Farm Advance2 Save Data"` at `0x081CACA8`
  (referenced from `0x08073110` and `0x08073198`)

## Pointer Tables

- **255** pointer tables found (min 8 entries)
- Notable tables identified via Phase 2 xref analysis

## Next Steps (Phase 3)

1. **Crack text encoding via mGBA dynamic trace** -- set breakpoint on text render,
   log byte->tile->character mapping during gameplay
2. **Map the descriptor table for `0x08002240`** -- this reveals ALL game state field
   definitions (hundreds of fields)
3. **Analyze the breed combo table at `0x081E88C0`** -- dump all valid combinations
4. **Trace the training functions** (`0x08068810` et al.) to understand stat gain formulas
5. **Map the 152-byte per-monster WRAM struct** used by ranch/training functions
