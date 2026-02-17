"""
GBA and MRA2-specific memory map constants.

This module defines the Game Boy Advance hardware memory layout and known
Monster Rancher Advance 2 memory addresses derived from cheat codes and
reverse engineering.

GBA Memory Map Reference:
    https://www.coranac.com/tonc/text/hardware.htm
    https://problemkaputt.de/gbatek.htm

MRA2 addresses sourced from:
    - Japanese cheat codes (srwmxcords.nobody.jp)
    - English GameShark/CodeBreaker codes (gamehacking.org)
"""

from dataclasses import dataclass, field
from typing import Optional


# =============================================================================
# GBA Hardware Memory Regions
# =============================================================================

# System ROM (BIOS) -- 16 KB, read-only, protected
BIOS_START = 0x00000000
BIOS_END = 0x00003FFF
BIOS_SIZE = 0x4000  # 16 KB

# External Work RAM (EWRAM) -- 256 KB, general purpose
EWRAM_START = 0x02000000
EWRAM_END = 0x0203FFFF
EWRAM_SIZE = 0x40000  # 256 KB

# Internal Work RAM (IWRAM) -- 32 KB, fast access
IWRAM_START = 0x03000000
IWRAM_END = 0x03007FFF
IWRAM_SIZE = 0x8000  # 32 KB

# I/O Registers -- hardware control
IO_START = 0x04000000
IO_END = 0x040003FE

# Palette RAM -- 1 KB (256 BG colors + 256 OBJ colors)
PALETTE_START = 0x05000000
PALETTE_END = 0x050003FF
PALETTE_SIZE = 0x400  # 1 KB

# Video RAM (VRAM) -- 96 KB
VRAM_START = 0x06000000
VRAM_END = 0x06017FFF
VRAM_SIZE = 0x18000  # 96 KB

# Object Attribute Memory (OAM) -- 1 KB (128 sprites)
OAM_START = 0x07000000
OAM_END = 0x070003FF
OAM_SIZE = 0x400  # 1 KB

# Game Pak ROM -- up to 32 MB, three mirror regions
ROM_START = 0x08000000
ROM_END = 0x09FFFFFF
ROM_MIRROR_1 = 0x0A000000  # Wait State 1
ROM_MIRROR_2 = 0x0C000000  # Wait State 2

# Game Pak SRAM -- up to 64 KB (save data)
SRAM_START = 0x0E000000
SRAM_END = 0x0E00FFFF
SRAM_SIZE = 0x10000  # 64 KB

# Stack top (typical) -- grows downward from top of IWRAM
STACK_TOP = 0x03007F00


# =============================================================================
# MRA2 ROM Info
# =============================================================================

MRA2_ROM_SIZE = 0x800000  # 8 MB (8,388,608 bytes)
MRA2_CRC32 = 0x1D695B1B
MRA2_SERIAL = "AGB-A2OE-USA"
MRA2_TITLE = "MONSTER RANCHER"  # internal ROM title (12 chars)


# =============================================================================
# MRA2 Known WRAM Addresses
# =============================================================================
# Sourced from Japanese and English cheat codes.
# These are EWRAM addresses (0x0200XXXX range).
# The CodeBreaker format uses raw addresses; GameShark/AR uses encrypted ones.

@dataclass
class MemoryEntry:
    """A known memory address with metadata."""
    address: int
    name: str
    size: int  # in bytes
    description: str
    source: str
    confidence: str = "confirmed"  # confirmed | high | speculative
    notes: str = ""

    @property
    def address_hex(self) -> str:
        return f"0x{self.address:08X}"


# --- Save / Global State ---

MONEY = MemoryEntry(
    address=0x02002B48,
    name="money",
    size=4,  # 2 halfwords: 0x02002B48 (low) + 0x02002B4A (high)
    description="Player's current funds (gold)",
    source="JP CodeBreaker: 82002B48967F / 82002B4A0098",
    notes="Stored as two 16-bit writes; max value = 0x0098967F = 9,999,999",
)

# --- Active Monster Stat Block ---
# Stats are stored as 16-bit (2-byte) values in a contiguous block.
# The tight spacing (2 bytes apart) strongly suggests these are fields
# within a larger monster struct.

MONSTER_STAT_BASE = 0x02006DB0  # Start of known stat fields

MONSTER_POWER = MemoryEntry(
    address=0x02006DB0,
    name="monster_power",
    size=2,
    description="Active monster's Power stat (ちから / POW)",
    source="JP CodeBreaker: 82006DB003E7",
    notes="Max cheat value 0x03E7 = 999",
)

MONSTER_INTELLIGENCE = MemoryEntry(
    address=0x02006DB2,
    name="monster_intelligence",
    size=2,
    description="Active monster's Intelligence stat (かしこさ / INT)",
    source="JP CodeBreaker: 82006DB203E7",
)

MONSTER_ACCURACY = MemoryEntry(
    address=0x02006DB4,
    name="monster_accuracy",
    size=2,
    description="Active monster's Accuracy stat (めいちゅう / ACC/SKI)",
    source="JP CodeBreaker: 82006DB403E7",
)

MONSTER_EVASION = MemoryEntry(
    address=0x02006DB6,
    name="monster_evasion",
    size=2,
    description="Active monster's Evasion stat (かいひ / SPD)",
    source="JP CodeBreaker: 82006DB603E7",
)

MONSTER_DEFENSE = MemoryEntry(
    address=0x02006DB8,
    name="monster_defense",
    size=2,
    description="Active monster's Defense stat (じょうぶさ / DEF)",
    source="JP CodeBreaker: 82006DB803E7",
)

MONSTER_LIFE = MemoryEntry(
    address=0x02006DBA,
    name="monster_life",
    size=2,
    description="Active monster's Life stat (ライフ / LIF)",
    source="JP CodeBreaker: 82006DBA03E7",
)


# Convenience: all known stat entries in order
MONSTER_STATS = [
    MONSTER_POWER,
    MONSTER_INTELLIGENCE,
    MONSTER_ACCURACY,
    MONSTER_EVASION,
    MONSTER_DEFENSE,
    MONSTER_LIFE,
]

# All known addresses for iteration
ALL_KNOWN_ADDRESSES = [
    MONEY,
    *MONSTER_STATS,
]


# =============================================================================
# Monster Struct Speculation
# =============================================================================
# Based on the stat addresses, we can infer the monster struct layout.
# Stats occupy 0x02006DB0 - 0x02006DBB (12 bytes for 6 stats).
# The struct almost certainly extends before and after this range.
#
# Common fields we expect to find nearby (offsets TBD via analysis):
#   - Monster breed/species ID (likely 1-2 bytes)
#   - Monster sub-breed ID
#   - Monster name (likely 8-10 bytes, text encoded)
#   - Age / lifespan counter
#   - Fatigue / stress level
#   - Loyalty / spoil level
#   - Current HP (battle)
#   - Guts (battle)
#   - Techniques learned (bitmask or array)
#   - Form / appearance data
#
# Investigation strategy: In mGBA, dump memory around 0x02006D00-0x02006E00
# and correlate with in-game values to map the full struct.

MONSTER_STRUCT_REGION_GUESS = (0x02006D00, 0x02006E00)


# =============================================================================
# GBA Memory Map Helper
# =============================================================================

GBA_MEMORY_REGIONS = {
    "BIOS":    (BIOS_START,    BIOS_END,    "System ROM (protected)"),
    "EWRAM":   (EWRAM_START,   EWRAM_END,   "External Work RAM (256 KB)"),
    "IWRAM":   (IWRAM_START,   IWRAM_END,   "Internal Work RAM (32 KB, fast)"),
    "IO":      (IO_START,      IO_END,      "I/O Registers"),
    "PALETTE": (PALETTE_START, PALETTE_END, "Palette RAM (1 KB)"),
    "VRAM":    (VRAM_START,    VRAM_END,    "Video RAM (96 KB)"),
    "OAM":     (OAM_START,     OAM_END,     "Object Attribute Memory (1 KB)"),
    "ROM":     (ROM_START,     ROM_END,     "Game Pak ROM (up to 32 MB)"),
    "SRAM":    (SRAM_START,    SRAM_END,    "Game Pak SRAM (up to 64 KB)"),
}


def classify_address(addr: int) -> Optional[str]:
    """Return the memory region name for a given address, or None."""
    for name, (start, end, _desc) in GBA_MEMORY_REGIONS.items():
        if start <= addr <= end:
            return name
    return None


def rom_offset_to_address(offset: int) -> int:
    """Convert a ROM file offset to the in-memory address."""
    return ROM_START + offset


def address_to_rom_offset(addr: int) -> int:
    """Convert an in-memory ROM address to the file offset."""
    if not (ROM_START <= addr <= ROM_END):
        raise ValueError(f"Address 0x{addr:08X} is not in ROM range")
    return addr - ROM_START


def print_known_addresses():
    """Print all known MRA2 addresses in a readable table."""
    print(f"{'Address':<14} {'Name':<25} {'Size':>4}  {'Description'}")
    print("-" * 80)
    for entry in ALL_KNOWN_ADDRESSES:
        print(
            f"{entry.address_hex:<14} {entry.name:<25} {entry.size:>4}  "
            f"{entry.description}"
        )


if __name__ == "__main__":
    print("=== GBA Memory Regions ===\n")
    for name, (start, end, desc) in GBA_MEMORY_REGIONS.items():
        size = end - start + 1
        print(f"  {name:<8}  0x{start:08X} - 0x{end:08X}  ({size:>10,} bytes)  {desc}")

    print("\n=== Known MRA2 Addresses ===\n")
    print_known_addresses()

    print(f"\n=== Monster Stat Block ===\n")
    print(f"  Base address: 0x{MONSTER_STAT_BASE:08X}")
    print(f"  Stat region:  0x{MONSTER_STATS[0].address:08X} - "
          f"0x{MONSTER_STATS[-1].address + MONSTER_STATS[-1].size - 1:08X}")
    print(f"  Total size:   {MONSTER_STATS[-1].address + MONSTER_STATS[-1].size - MONSTER_STATS[0].address} bytes "
          f"({len(MONSTER_STATS)} stats x 2 bytes)")
    print(f"\n  Struct search region: 0x{MONSTER_STRUCT_REGION_GUESS[0]:08X} - "
          f"0x{MONSTER_STRUCT_REGION_GUESS[1]:08X}")
