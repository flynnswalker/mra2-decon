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
print("\nCreating GBA memory regions...")
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
print("\nExporting analysis to: %s" % output_dir)

export_functions(os.path.join(output_dir, "ghidra_functions.json"))
export_strings(os.path.join(output_dir, "ghidra_strings.json"))

print("\n=== Post-import script complete ===")
