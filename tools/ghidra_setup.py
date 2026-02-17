#!/usr/bin/env python3
"""
Ghidra Headless Setup for MRA2 ROM Analysis.

This script automates the Ghidra headless import and analysis of the
Monster Rancher Advance 2 GBA ROM with proper memory mapping.

There are two modes:
  1. Generate a Ghidra headless command (default) -- prints the command to run
  2. Generate a Ghidra post-analysis script -- exports function/data catalogs

Prerequisites:
  - Ghidra installed (https://ghidra-sre.org/)
  - GHIDRA_INSTALL_DIR environment variable set, OR pass --ghidra-path

Usage:
    # Print the headless import command
    python tools/ghidra_setup.py rom/mra2.gba

    # Generate and print the post-analysis export script
    python tools/ghidra_setup.py rom/mra2.gba --export-script

    # Specify Ghidra installation path
    python tools/ghidra_setup.py rom/mra2.gba --ghidra-path /opt/ghidra
"""

import argparse
import os
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from memory_map import (
    ROM_START, EWRAM_START, EWRAM_END, EWRAM_SIZE,
    IWRAM_START, IWRAM_END, IWRAM_SIZE,
    IO_START, IO_END,
    PALETTE_START, PALETTE_END, PALETTE_SIZE,
    VRAM_START, VRAM_END, VRAM_SIZE,
    OAM_START, OAM_END, OAM_SIZE,
    SRAM_START, SRAM_END, SRAM_SIZE,
)


# =============================================================================
# Ghidra Post-Import Script (Jython / Java)
# =============================================================================
# This script runs inside Ghidra after ROM import. It:
# 1. Creates memory blocks for GBA RAM regions
# 2. Runs auto-analysis
# 3. Exports function list and cross-references

GHIDRA_POST_SCRIPT = '''\
# MRA2 Ghidra Post-Import Script
# Run via: analyzeHeadless ... -postScript mra2_post_import.py
#
# This script configures GBA memory regions and exports analysis data.

import json
from ghidra.program.model.mem import MemoryBlockType
from ghidra.program.model.symbol import SourceType

def create_ram_block(name, start, size, read=True, write=True, execute=False):
    """Create an uninitialized memory block for a RAM region."""
    mem = currentProgram.getMemory()
    addr = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(start)
    try:
        block = mem.createUninitializedBlock(name, addr, size, False)
        block.setRead(read)
        block.setWrite(write)
        block.setExecute(execute)
        block.setComment("GBA %s region" % name)
        print("Created memory block: %s at 0x%08X (%d bytes)" % (name, start, size))
    except Exception as e:
        print("Block %s may already exist: %s" % (name, str(e)))

def export_functions(output_path):
    """Export all detected functions to a JSON file."""
    fm = currentProgram.getFunctionManager()
    funcs = []
    for func in fm.getFunctions(True):
        entry = func.getEntryPoint()
        body = func.getBody()
        funcs.append({
            "name": func.getName(),
            "address": "0x%08X" % entry.getOffset(),
            "address_int": entry.getOffset(),
            "size": body.getNumAddresses() if body else 0,
            "calling_convention": str(func.getCallingConventionName()),
            "is_thunk": func.isThunk(),
            "parameter_count": func.getParameterCount(),
        })
    
    with open(output_path, 'w') as f:
        json.dump({
            "program": currentProgram.getName(),
            "total_functions": len(funcs),
            "functions": sorted(funcs, key=lambda x: x["address_int"]),
        }, f, indent=2)
    print("Exported %d functions to %s" % (len(funcs), output_path))

def export_strings(output_path):
    """Export defined string data to a JSON file."""
    listing = currentProgram.getListing()
    mem = currentProgram.getMemory()
    strings = []
    
    data_iter = listing.getDefinedData(True)
    while data_iter.hasNext():
        data = data_iter.next()
        dt = data.getDataType()
        if "string" in dt.getName().lower():
            try:
                val = data.getValue()
                if val and len(str(val)) > 2:
                    strings.append({
                        "address": "0x%08X" % data.getAddress().getOffset(),
                        "type": dt.getName(),
                        "value": str(val),
                        "length": data.getLength(),
                    })
            except:
                pass
    
    with open(output_path, 'w') as f:
        json.dump({
            "total_strings": len(strings),
            "strings": strings,
        }, f, indent=2)
    print("Exported %d strings to %s" % (len(strings), output_path))

# --- Main ---
print("=== MRA2 Ghidra Post-Import Script ===")
print("Program: %s" % currentProgram.getName())

# Step 1: Create GBA memory regions
print("\\nCreating GBA memory regions...")
create_ram_block("EWRAM",   0x02000000, 0x40000,  True, True, True)
create_ram_block("IWRAM",   0x03000000, 0x8000,   True, True, True)
create_ram_block("IO_REG",  0x04000000, 0x400,    True, True, False)
create_ram_block("PALETTE", 0x05000000, 0x400,    True, True, False)
create_ram_block("VRAM",    0x06000000, 0x18000,  True, True, False)
create_ram_block("OAM",     0x07000000, 0x400,    True, True, False)
create_ram_block("SRAM",    0x0E000000, 0x10000,  True, True, False)

# Step 2: Export analysis results
import os
output_dir = os.environ.get("MRA2_OUTPUT_DIR", ".")
print("\\nExporting analysis to: %s" % output_dir)

export_functions(os.path.join(output_dir, "ghidra_functions.json"))
export_strings(os.path.join(output_dir, "ghidra_strings.json"))

print("\\n=== Post-import script complete ===")
'''


# =============================================================================
# Command Generation
# =============================================================================

def get_ghidra_path(cli_path: str = None) -> str:
    """Resolve the Ghidra installation directory."""
    if cli_path:
        return cli_path
    env_path = os.environ.get("GHIDRA_INSTALL_DIR")
    if env_path:
        return env_path
    # Common default locations
    for candidate in [
        "/opt/ghidra",
        os.path.expanduser("~/ghidra"),
        "/usr/local/share/ghidra",
    ]:
        if os.path.isdir(candidate):
            return candidate
    return "<GHIDRA_INSTALL_DIR>"


def generate_headless_command(
    rom_path: str,
    ghidra_path: str,
    project_dir: str = "ghidra_projects",
    project_name: str = "MRA2",
    output_dir: str = "analysis",
) -> str:
    """Generate the Ghidra headless analyzer command."""
    headless = os.path.join(ghidra_path, "support", "analyzeHeadless")

    cmd_parts = [
        headless,
        project_dir,
        project_name,
        "-import", rom_path,
        "-processor", '"ARM:LE:32:v4t"',
        "-cspec", '"default"',
        "-loader", "BinaryLoader",
        "-loader-baseAddr", f"0x{ROM_START:08X}",
        "-postScript", "mra2_post_import.py",
        "-scriptPath", "tools/ghidra_scripts",
        "-analysisTimeoutPerFile", "600",
    ]

    return " \\\n  ".join(cmd_parts)


def main():
    parser = argparse.ArgumentParser(
        description="Ghidra headless setup for MRA2 ROM analysis"
    )
    parser.add_argument("rom", help="Path to the MRA2 GBA ROM file")
    parser.add_argument(
        "--ghidra-path",
        help="Path to Ghidra installation directory",
    )
    parser.add_argument(
        "--export-script",
        action="store_true",
        help="Generate the Ghidra post-analysis script instead of the command",
    )
    parser.add_argument(
        "--project-dir",
        default="ghidra_projects",
        help="Ghidra project directory (default: ghidra_projects/)",
    )
    parser.add_argument(
        "--output-dir",
        default="analysis",
        help="Analysis output directory (default: analysis/)",
    )
    args = parser.parse_args()

    if args.export_script:
        # Write the post-import Ghidra script
        script_dir = Path("tools/ghidra_scripts")
        script_dir.mkdir(parents=True, exist_ok=True)
        script_path = script_dir / "mra2_post_import.py"
        script_path.write_text(GHIDRA_POST_SCRIPT)
        print(f"Wrote Ghidra post-import script: {script_path}")
        print(f"\nThis script will run inside Ghidra after ROM import.")
        print(f"It creates GBA memory regions and exports function/string data.")
        return

    ghidra_path = get_ghidra_path(args.ghidra_path)

    # Create project directory
    Path(args.project_dir).mkdir(parents=True, exist_ok=True)

    print("=== Ghidra Headless Setup for MRA2 ===\n")
    print("GBA ROM Configuration:")
    print(f"  ROM file:     {args.rom}")
    print(f"  Base address: 0x{ROM_START:08X}")
    print(f"  Processor:    ARM:LE:32:v4t (ARMv4T, Little Endian)")
    print(f"  Project dir:  {args.project_dir}")
    print(f"  Output dir:   {args.output_dir}")
    print(f"  Ghidra path:  {ghidra_path}")

    print("\n--- Step 1: Generate post-import script ---\n")
    script_dir = Path("tools/ghidra_scripts")
    script_dir.mkdir(parents=True, exist_ok=True)
    script_path = script_dir / "mra2_post_import.py"
    script_path.write_text(GHIDRA_POST_SCRIPT)
    print(f"  Wrote: {script_path}")

    print("\n--- Step 2: Run this command to import and analyze ---\n")
    cmd = generate_headless_command(
        rom_path=args.rom,
        ghidra_path=ghidra_path,
        project_dir=args.project_dir,
        output_dir=args.output_dir,
    )
    print(cmd)

    print("\n--- Notes ---\n")
    print("  1. Set GHIDRA_INSTALL_DIR or use --ghidra-path if the path is wrong")
    print("  2. Set MRA2_OUTPUT_DIR env var to control where exports go")
    print(f"  3. Exports will be written to: {args.output_dir}/")
    print("  4. First run may take 2-5 minutes for full analysis")
    print("  5. After import, open the .gpr project in Ghidra GUI for interactive RE")


if __name__ == "__main__":
    main()
