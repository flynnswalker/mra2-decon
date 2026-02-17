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

### Key Details for RE

- **EWRAM** (`0x02000000`): Where most game state lives. Monster data, inventory,
  save state, etc. are all here. This is our primary target for data analysis.
  2 wait-state access (slower than IWRAM).

- **IWRAM** (`0x03000000`): Fast RAM used for performance-critical code and data.
  The call stack lives here (grows down from `0x03007F00`). Some game logic may
  run from IWRAM for speed.

- **ROM** (`0x08000000`): The game code and read-only data. When Ghidra loads the
  ROM, the base address should be set to `0x08000000` so all code references
  resolve correctly. Data tables (monster stats, breed info, text strings, etc.)
  live here.

- **I/O** (`0x04000000`): Hardware registers for display, sound, DMA, timers, etc.
  Useful for understanding rendering and audio but not directly relevant to
  game mechanics RE.

## MRA2 Known Memory Addresses

### Global State (EWRAM)

| Address | Size | Name | Description |
|---------|------|------|-------------|
| `0x02002B48` | 4 bytes | Money | Player's funds (max 9,999,999) |

### Active Monster Stats (EWRAM)

The active (raised) monster's stats are stored as contiguous 16-bit unsigned
integers starting at `0x02006DB0`. This block is part of a larger monster struct
whose full layout is TBD.

| Address | Offset | Size | Stat | JP Name | EN Abbrev |
|---------|--------|------|------|---------|-----------|
| `0x02006DB0` | +0x00 | 2 | Power | ちから | POW |
| `0x02006DB2` | +0x02 | 2 | Intelligence | かしこさ | INT |
| `0x02006DB4` | +0x04 | 2 | Accuracy | めいちゅう | SKI |
| `0x02006DB6` | +0x06 | 2 | Evasion | かいひ | SPD |
| `0x02006DB8` | +0x08 | 2 | Defense | じょうぶさ | DEF |
| `0x02006DBA` | +0x0A | 2 | Life | ライフ | LIF |

**Max stat value:** 999 (0x03E7) based on cheat code values.

### Investigation Targets

The monster struct almost certainly extends well beyond the stat block.
Fields we expect to find nearby (addresses TBD):

- **Before stats (< `0x02006DB0`)**: Monster breed/species ID, sub-breed,
  name string, birthday/age, form
- **After stats (> `0x02006DBB`)**: Fatigue/stress, loyalty/spoil,
  nature/personality, techniques learned, battle HP, battle guts

**Strategy**: Dump EWRAM `0x02006D00`-`0x02006E00` in mGBA while playing,
correlate byte changes with in-game actions to map the full struct.

## ROM Data Tables (TBD)

These are expected to be in ROM (`0x08XXXXXX` range) but addresses not yet known:

| Expected Table | Est. Entries | Est. Entry Size | Notes |
|---------------|-------------|-----------------|-------|
| Breed base stats | ~50 breeds | 20-40 bytes | Per-breed stat growth rates, caps |
| Monster type table | ~400+ types | 10-20 bytes | Breed + sub-breed combinations |
| Technique data | ~200+ techs | 10-16 bytes | Damage, accuracy, guts cost, range |
| Item effects | ~50+ items | 8-12 bytes | Stat modifiers, healing amounts |
| Training results | ~20 drills | 8-12 bytes | Which stats affected, gain ranges |
| Tournament data | ~30+ tournaments | varies | Opponent definitions, rewards |
| Text strings | varies | varies | Monster names, item names, dialogue |
| Combination table | varies | varies | Breeding input/output mapping |

## References

- [TONC: GBA Hardware](https://www.coranac.com/tonc/text/hardware.htm)
- [GBATEK: GBA Technical Reference](https://problemkaputt.de/gbatek.htm)
- [ARM7TDMI Data Sheet](https://developer.arm.com/documentation/ddi0210/c/)
