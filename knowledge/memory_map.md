# GBA + MRA2 Memory Map

## GBA Hardware Memory Layout

The Game Boy Advance uses a flat 32-bit address space with memory-mapped I/O.
The CPU is an ARM7TDMI running at 16.78 MHz, using the ARMv4T instruction set
(both ARM and THUMB modes, with THUMB being predominant in game code).

| Region | Start | End | Size | Description |
|--------|-------|-----|------|-------------|
| BIOS | `0x00000000` | `0x00003FFF` | 16 KB | System ROM (read-protected) |
| EWRAM | `0x02000000` | `0x0203FFFF` | 256 KB | External Work RAM |
| IWRAM | `0x03000000` | `0x03007FFF` | 32 KB | Internal Work RAM (fast) |
| I/O | `0x04000000` | `0x040003FE` | ~1 KB | Hardware I/O Registers |
| Palette | `0x05000000` | `0x050003FF` | 1 KB | Color palettes (BG + OBJ) |
| VRAM | `0x06000000` | `0x06017FFF` | 96 KB | Video RAM (tiles/maps) |
| OAM | `0x07000000` | `0x070003FF` | 1 KB | Sprite attributes |
| ROM | `0x08000000` | `0x09FFFFFF` | 32 MB max | Game Pak ROM |
| SRAM | `0x0E000000` | `0x0E00FFFF` | 64 KB max | Game Pak SRAM (saves) |

## MRA2 ROM Data Tables (Confirmed)

| Table | Address | Structure | Entries | Access Function |
|-------|---------|-----------|---------|-----------------|
| Monster type defs | `0x081CACC8` | 72 bytes/rec | 512 | `0x08020C5C` |
| Breed combo matrix | `0x081E88C0` | 16-bit entries | 30x40 | `0x08002B28` |
| Stat growth table | `0x081C9F80` | 12 bytes/entry | 70 | used by `0x08068810` |
| Variant data | `0x081D3CCC` | 32-bit offsets | per-monster | `0x08002B9C` |
| Indexed data | `0x082006F8` | 16-bit offsets | variable | `0x08002B88` |
| Tile remap | `0x0844386C` | 256 bytes | 1 | text renderer |
| Save string | `0x081CACA8` | ASCII | 1 | `0x08073110` |

## MRA2 WRAM Structures

### Player State Struct (base: `0x02002B24`, 457 references)

The player/game state is the most-referenced WRAM structure. Fields are
accessed via the generic `field_accessor` at `0x080035BC` with field indices.

| Offset | Address | Size | Name | Description |
|--------|---------|------|------|-------------|
| +0x24 | `0x02002B48` | 4 | Money | Player's funds (max 9,999,999) |

### Monster Struct (base: `0x02006D48`, 273 references)

The active monster's data structure. Stats are at a fixed offset from base.

| Offset | Address | Size | Stat | Description |
|--------|---------|------|------|-------------|
| +0x68 | `0x02006DB0` | 2 | POW | Power / physical attack |
| +0x6A | `0x02006DB2` | 2 | INT | Intelligence / magic attack |
| +0x6C | `0x02006DB4` | 2 | SKI | Accuracy / skill |
| +0x6E | `0x02006DB6` | 2 | SPD | Evasion / speed |
| +0x70 | `0x02006DB8` | 2 | DEF | Defense |
| +0x72 | `0x02006DBA` | 2 | LIF | Life / HP |

**Max stat value:** 999 (0x03E7) based on cheat code values.

### Ranch Monster State (per-monster, 152 bytes each)

Discovered via training function analysis. Each active monster in the ranch
system has a 152-byte state block accessed by functions at `0x08068810`,
`0x0806B06C`, and `0x0806B264`.

| Offset | Size | Description |
|--------|------|-------------|
| +0x8D | 1 | Training flag (0/1) |
| +0x8F | 1 | Sub-state selector |
| +0x90 | 1 | Training state type |
| +0x92 | 2 | Cycle counter (max 0xC0 = 192) |

## MRA2 Key Functions (Confirmed)

| Address | Name | Description |
|---------|------|-------------|
| `0x08020C5C` | `get_monster_record` | Index -> 72-byte record pointer |
| `0x08002B28` | `combine_breed_ids` | (main, sub) -> record index via 2D table |
| `0x080035BC` | `field_accessor_read` | Generic game state field read |
| `0x080035D0` | `field_accessor_write` | Generic game state field write |
| `0x08002240` | `core_state_accessor` | Core accessor (12 field types, switch-based) |
| `0x08002B88` | `resolve_string_16` | Index -> ROM pointer via 16-bit offset table |
| `0x08002B9C` | `resolve_data_32` | Index -> ROM pointer via 32-bit offset table |
| `0x08068810` | `training_update_1` | Training/ranch system update (uses stat growth table) |
| `0x0806B06C` | `training_update_2` | Training/ranch system update (uses stat growth table) |
| `0x0806B264` | `training_update_3` | Training/ranch system update (uses stat growth table) |

## Investigation Targets

The monster struct almost certainly extends well beyond the stat block.
Fields we expect to find at offsets from `0x02006D48`:

- **Before stats (< +0x68)**: Monster breed/species ID, sub-breed,
  name string, birthday/age, form
- **After stats (> +0x73)**: Fatigue/stress, loyalty/spoil,
  nature/personality, techniques learned, battle HP, battle guts

**Strategy**: Use mGBA memory dump of `0x02006D00`-`0x02006E00` while
playing to correlate byte changes with in-game actions.

## References

- [TONC: GBA Hardware](https://www.coranac.com/tonc/text/hardware.htm)
- [GBATEK: GBA Technical Reference](https://problemkaputt.de/gbatek.htm)
- [ARM7TDMI Data Sheet](https://developer.arm.com/documentation/ddi0210/c/)
