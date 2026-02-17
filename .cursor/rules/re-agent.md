# MRA2 Reverse Engineering Agent Rules

## Project Context

You are assisting with the reverse engineering of **Monster Rancher Advance 2** (GBA, 2002, Tecmo).
The goal is to deconstruct the ROM to understand game mechanics, data structures, and formulas
so that balance changes and mods can be created.

- **CPU**: ARM7TDMI (ARMv4T architecture, predominantly THUMB instruction set)
- **ROM base address**: `0x08000000`
- **EWRAM**: `0x02000000-0x0203FFFF` (256 KB -- game state lives here)
- **IWRAM**: `0x03000000-0x03007FFF` (32 KB -- fast RAM, stack)
- **ROM serial**: AGB-A2OE-USA

## Knowledge Base First

Before analyzing any code or data, always check the existing knowledge base:

1. **`knowledge/known_addresses.json`** -- confirmed memory addresses from cheat codes
2. **`knowledge/memory_map.md`** -- GBA memory layout and known MRA2 regions
3. **`knowledge/game_mechanics.md`** -- community-documented game mechanics
4. **`knowledge/monster_data.md`** -- breed info, stats, lifespans
5. **`analysis/`** -- previous analysis results (functions, data tables, structs)

If the knowledge base already has relevant information, build on it rather than starting fresh.

## Work From Known Addresses Outward

The most productive RE strategy is to start from **confirmed addresses** and trace outward:

- Known stat addresses at `0x02006DB0-0x02006DBA` tell us where the monster struct lives
- Trace ROM code that reads/writes these addresses to find game logic
- Use Ghidra cross-references or capstone disassembly to follow call chains
- Each confirmed address is a seed that can reveal surrounding struct fields

## Naming Conventions

Use game terminology from the community knowledge base:

- **Functions**: `calc_battle_damage`, `apply_stat_gain`, `check_lifespan`, `process_training`
- **Structs**: `MonsterData`, `BreedInfo`, `TechniqueData`, `ItemEffect`
- **Constants**: `MAX_STAT_VALUE`, `NUM_BREEDS`, `STAT_POWER`, `STAT_INTELLIGENCE`
- **Data tables**: `breed_stat_table`, `technique_table`, `item_effect_table`

Prefix speculative names with `maybe_` (e.g., `maybe_calc_crit_chance`).

## Confidence Levels

Always document confidence in annotations:

| Level | Meaning | Criteria |
|-------|---------|----------|
| **confirmed** | Verified by testing | Cheat codes, mGBA memory watch, or patch testing |
| **high** | Strong evidence | Multiple cross-references, matches known mechanics |
| **medium** | Reasonable inference | Structural pattern match, plausible interpretation |
| **speculative** | Educated guess | Based on context clues, naming patterns, or analogy |

## Analysis Workflow

When asked to analyze a function or memory region:

1. **Read the bytes** -- use capstone or Ghidra output to get disassembly
2. **Identify the function boundary** -- PUSH {lr} prologue to POP {pc}/BX LR epilogue
3. **Annotate registers** -- track what r0-r3 hold (arguments), what memory is accessed
4. **Produce pseudocode** -- write C-like pseudocode with meaningful variable names
5. **Cross-reference** -- what calls this function? What does it call?
6. **Hypothesize** -- state what you think the function does and why
7. **Suggest validation** -- how to confirm (mGBA breakpoint, memory watch, etc.)

## Output Format for Annotations

When documenting a function, use this format:

```
## FUN_080XXXXX -- [descriptive_name]

**Address**: 0x080XXXXX
**Size**: XX bytes
**Confidence**: [confirmed|high|medium|speculative]
**Called by**: [list of callers]
**Calls**: [list of callees]

### Pseudocode
\`\`\`c
// C-like pseudocode
int descriptive_name(MonsterData* monster, int param) {
    // annotated logic
}
\`\`\`

### Evidence
- [why you think this is what it does]

### Validation
- [how to confirm: breakpoint address, memory watch, etc.]
```

## Struct Documentation Format

When mapping a struct, use this format:

```
## MonsterData (at EWRAM 0x02006DXX)

| Offset | Size | Type   | Name         | Confidence  | Notes |
|--------|------|--------|--------------|-------------|-------|
| +0x00  | 2    | uint16 | breed_id     | speculative | TBD   |
| ...    |      |        |              |             |       |
| +0xB0  | 2    | uint16 | power        | confirmed   | POW   |
```

## Generating Hypotheses

When you encounter unknown code, generate **testable hypotheses**:

- "Function at 0x080XXXXX reads monster POW (0x02006DB0) and opponent DEF, multiplies them,
  and stores the result. **Hypothesis**: this is the physical damage calculator."
- "The table at 0x08YYYYYY has 50 entries of 16 bytes each, with uint16 values in stat range.
  **Hypothesis**: this is the per-breed base stat table."

Each hypothesis should include a concrete way to test it.

## Patch Generation

When asked to create a mod/patch:

1. Identify the exact ROM offset(s) to change
2. Document the original bytes and the replacement bytes
3. Explain the expected gameplay effect
4. Provide the patch in IPS format or as a simple hex edit list
5. Always note potential side effects

## Tools Available

- **`tools/memory_map.py`** -- GBA/MRA2 address constants, address conversion
- **`tools/rom_analyzer.py`** -- first-pass disassembly, function detection, string/pointer search
- **`tools/data_extractor.py`** -- data table extraction (names, stats, items)
- **`tools/ghidra_setup.py`** -- Ghidra headless import configuration
- **capstone** -- Python disassembly (use for quick inline analysis)
- **Ghidra exports** in `analysis/` -- function catalogs, cross-references

## Key Targets

Priority areas for reverse engineering (in order):

1. **Monster struct layout** -- map all fields around the known stat addresses
2. **Stat growth formulas** -- how training modifies stats
3. **Battle damage formula** -- the core combat math
4. **Breed stat tables** -- base stats and growth rates per breed in ROM
5. **Lifespan mechanics** -- aging, death conditions
6. **Technique data** -- per-tech damage, cost, accuracy
7. **Item effects** -- what items do numerically
8. **Breeding table** -- combination inputs and outputs
