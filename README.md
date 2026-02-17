# MRA2-DECON: LLM-Assisted GBA Game Deconstruction

Reverse engineering **Monster Rancher Advance 2** (GBA, 2002, Tecmo) with the help of
Cursor/LLM agents to systematically deconstruct the ROM and enable modding.

## Why This Exists

Monster Rancher Advance 2 is a beloved monster-raising game with deep but opaque
mechanics. Unlike Pokemon (which has the [pret](https://github.com/pret) decompilation
projects), no one has done source-level reverse engineering on MRA2. The MR community
has modded the PS1/DX versions via runtime patching
([mrdx_reloaded](https://github.com/ranchercommunity/mrdx_reloaded)), but the GBA
title is untouched.

This project aims to change that by combining traditional RE tools (Ghidra, mGBA) with
LLM-assisted analysis to accelerate the deconstruction process.

## Project Structure

```
mra2-decon/
  rom/                  # Place your ROM here (not committed to git)
  tools/                # Analysis scripts and tooling
    memory_map.py       # GBA + MRA2 memory map constants
    rom_analyzer.py     # First-pass disassembly and function identification
    data_extractor.py   # Data table extraction from ROM
    ghidra_setup.py     # Headless Ghidra import with GBA memory mapping
  knowledge/            # Curated knowledge base (seed data + discoveries)
    known_addresses.json
    memory_map.md
    game_mechanics.md
    monster_data.md
  analysis/             # Output from analysis passes
    functions/          # Annotated function dumps
    data_tables/        # Extracted and decoded data tables
    structs/            # Identified C struct definitions
  patches/              # Future: IPS/UPS patches for mods
  .cursor/rules/        # Cursor agent rules for RE workflow
```

## Getting Started

### Prerequisites

- Python 3.10+
- [Ghidra](https://ghidra-sre.org/) (for static analysis)
- [mGBA](https://mgba.io/) (for dynamic analysis / debugging)

### Setup

```bash
# Clone the repo
git clone <repo-url> && cd mra2-decon

# Install Python dependencies
pip install -r requirements.txt

# Place your MRA2 ROM in the rom/ directory
# Expected: Monster Rancher Advance 2 (USA).gba
# CRC32: 1D695B1B | Serial: AGB-A2OE-USA
cp /path/to/your/rom.gba rom/mra2.gba
```

### Quick Start

```bash
# Run the first-pass ROM analyzer
python tools/rom_analyzer.py rom/mra2.gba

# Extract known data tables
python tools/data_extractor.py rom/mra2.gba

# Set up a Ghidra project (requires Ghidra installation)
python tools/ghidra_setup.py rom/mra2.gba
```

## How the Agent-Assisted RE Loop Works

1. **Seed** the knowledge base with known memory addresses (from cheat codes) and
   community-documented game mechanics (from LegendCup/MRM archive)
2. **Analyze** the ROM using Ghidra headless analysis and capstone disassembly
3. **Reason** about functions and data using the LLM agent, connecting disassembly
   to known game mechanics
4. **Validate** hypotheses using mGBA debugging (breakpoints, memory watches)
5. **Annotate** confirmed findings back into the knowledge base
6. **Repeat** -- each cycle expands understanding and reveals new modding targets

## Priority Modding Targets

- Stat growth formulas (training/drill gains and caps)
- Battle damage calculation
- Lifespan and aging mechanics
- Breed stat tables (base stats, growth rates per breed)
- Tournament difficulty scaling
- Item effect tables
- Tech/move data (damage, accuracy, guts cost)
- Breeding combination table

## Community Resources

- [LegendCup / Monster Rancher Metropolis Archive](https://legendcup.com/MRM/discus/messages/8670/86702918.php) -- comprehensive MRA2 guides
- [GameHacking.org MRA2](https://gamehacking.org/game/5395) -- cheat codes with memory addresses
- [Starcube Labs GBA RE Tutorial](https://www.starcubelabs.com/reverse-engineering-gba/) -- GBA reverse engineering walkthrough
- [TONC GBA Programming](https://www.coranac.com/tonc/text/toc.htm) -- GBA hardware documentation

## ROM Information

| Field | Value |
|-------|-------|
| Title | Monster Rancher Advance 2 |
| Platform | Game Boy Advance |
| Developer | Tecmo |
| Region | USA |
| Serial | AGB-A2OE-USA |
| CRC32 | 1D695B1B |
| ROM Size | ~8 MB |
| CPU | ARM7TDMI (ARMv4T) |
| Instruction Set | ARM + THUMB (predominantly THUMB) |

## License

This project contains no copyrighted game data. You must provide your own legally
obtained ROM. All tools and documentation in this repository are provided for
educational and research purposes.
