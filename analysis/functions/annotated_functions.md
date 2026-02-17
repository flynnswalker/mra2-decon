# Annotated Functions -- MRA2 Phase 2 Analysis

## get_monster_record (0x08020C5C)

Called by 11 functions. Takes a monster record index and returns a pointer
to the corresponding 72-byte record in the monster type table.

```
; Input:  r0 = record index (from combine_breed_ids)
; Output: r0 = pointer to 72-byte monster record
; Table:  0x081CACC8 (512 records, 72 bytes each)

  0x08020C5C: adds  r2, r0, #0         ; r2 = index
  0x08020C5E: ldr   r1, [pc, #0x10]    ; r1 = 0x081CACC8 (table base)
  0x08020C60: ldr   r0, [r1]           ; r0 = [table_base] = 4 (header offset)
  0x08020C62: adds  r0, r0, r1         ; r0 = table_base + 4 (skip header)
  0x08020C64: lsls  r1, r2, #3         ; r1 = index * 8
  0x08020C66: adds  r1, r1, r2         ; r1 = index * 8 + index = index * 9
  0x08020C68: lsls  r1, r1, #3         ; r1 = index * 9 * 8 = index * 72
  0x08020C6A: adds  r0, r0, r1         ; r0 = base + 4 + index * 72
  0x08020C6C: bx    lr
```

**Key insight**: Record size is confirmed as 72 bytes (9 * 8).
First record is at `table_base + 4`, confirming a 4-byte header.


## combine_breed_ids (0x08002B28)

Combines a main breed ID and sub-breed ID into a single record index.
Uses a 2D lookup table at `0x081E88C0`.

```
; Input:  r0 = main breed (capped at 29 = 0x1D)
;         r1 = sub-breed (capped at 39 = 0x27)
; Output: r0 = monster record index (used by get_monster_record)

  0x08002B28: push  {r4, r5, lr}
  0x08002B2A: adds  r2, r0, #0         ; r2 = main_breed
  0x08002B2C: cmp   r2, #0x1d          ; cap at 29
  0x08002B2E: ble   +2
  0x08002B30: movs  r2, #0             ; invalid -> default to 0
  0x08002B32: cmp   r1, #0x27          ; cap sub at 39
  0x08002B34: ble   +2
  0x08002B36: movs  r1, #0
  0x08002B38: ldr   r4, [pc, #0x2c]    ; r4 = 0x081E88C0 (breed combo table)
  0x08002B3A: lsls  r0, r1, #1         ; r0 = sub * 2 (16-bit entries)
  0x08002B3C: lsls  r1, r2, #2         ;
  0x08002B3E: adds  r1, r1, r2         ; r1 = main * 5
  0x08002B40: lsls  r3, r1, #4         ; r3 = main * 80 (row stride)
  0x08002B42: adds  r0, r0, r3         ; r0 = sub*2 + main*80
  0x08002B44: adds  r0, r0, r4         ; r0 = &table[main][sub]
  0x08002B46: ldrh  r1, [r0]           ; r1 = table value (16-bit)
  0x08002B48: movs  r5, #0
  0x08002B4A: ldrsh r0, [r0, r5]       ; r0 = signed table value
  0x08002B4C: cmp   r0, #0             ; if entry == 0 (invalid combo)
  0x08002B4E: bne   +8
  0x08002B50: lsls  r0, r2, #1         ;   use pure-breed entry:
  0x08002B52: adds  r0, r0, r3         ;   table[main][main]
  0x08002B54: adds  r0, r0, r4
  0x08002B56: ldrh  r1, [r0]
  0x08002B58: lsls  r0, r1, #0x10
  0x08002B5A: ldr   r1, [pc, #0x10]    ; r1 = 0xFFFF0000
  0x08002B5C: adds  r0, r0, r1         ; sign-extend: r0 = (val<<16) + 0xFFFF0000
  0x08002B5E: asrs  r0, r0, #0x10      ; r0 = signed 16-bit result
  0x08002B60: pop   {r4, r5}
  0x08002B62: pop   {r1}
  0x08002B64: bx    r1
```

**Key insight**: The breed combination table at `0x081E88C0` is a 30x40 matrix
of 16-bit entries (row stride = 80 bytes). Main breed can be 0-29 (30 breeds
including "???" type), sub-breed can be 0-39. If a combo doesn't exist (value 0),
the game falls back to the pure-breed entry.


## field_accessor (0x080035BC)

Thin wrapper that calls the core game state accessor `0x08002240`.
This is the most-called function in the game -- used for all game state reads.

```
; Input:  r0 = game state base pointer (e.g., 0x02002B24 or 0x02006D48)
;         r1 = field index (e.g., 0x6B for monster type, 0x9A for breed)
;         r2 = array element index
; Output: r0 = field value

  0x080035BC: push  {lr}
  0x080035BE: sub   sp, #4
  0x080035C0: str   r2, [sp]           ; save array index to stack
  0x080035C2: movs  r2, #0             ; set "direction" = read (0)
  0x080035C4: movs  r3, #1             ; set "active" = 1
  0x080035C6: bl    0x08002240         ; call core accessor
  0x080035CA: add   sp, #4
  0x080035CC: pop   {r1}
  0x080035CE: bx    r1
```

The related function `0x080035D0` is the write version (sets r2 = write value).


## core_state_accessor (0x08002240)

The core game state accessor. Uses a descriptor table (at `[pc, #0x34]`)
that describes the layout of game state fields. Each descriptor is 16 bytes:

```
+0x00: 4 bytes - base offset into state struct
+0x04: 2 bytes - field type code (0-11: byte, short, word, string, etc.)
+0x06: 2 bytes - array stride (for array fields)
+0x08: 4 bytes - pointer to validation function
+0x0C: 4 bytes - pointer to secondary data
```

The function uses a switch on field type (0-11) to handle different
data sizes and read/write behaviors. This is a generic property
access system -- every game state field is accessed by index through
this mechanism.


## stat_table_users (0x08068810, 0x0806B06C, 0x0806B264)

These three functions reference the 70-entry stat table at `0x081C9F80`.
They are part of the **ranch/training/tournament** system based on their
structure:

- All take a byte parameter (monster index 0-N)
- All multiply by 0x98 (152) to index into a large WRAM structure
- They read/write fields at offsets like +0x8D (flag byte), +0x90 (state),
  +0x92 (counter), comparing against 0xC0 (192) cycles
- The stat table is loaded as 8 bytes (two 32-bit words) at the start

These likely handle **weekly training/stat gain calculations**, where
the stat table at 0x081C9F80 contains the growth multipliers that
determine how much each stat increases per training cycle.


## resolve_string_16 (0x08002B88)

Resolves a string/data index to a ROM pointer using a 16-bit offset table.
Base table at `0x082006F8`. Each entry is a 16-bit offset relative to the base.

```
; Input:  r0 = index
; Output: r0 = pointer to data at base + offset_table[index]
```


## resolve_data_32 (0x08002B9C)

Same pattern as resolve_string_16 but uses 32-bit offsets.
Base table at `0x081D3CCC` (immediately after the monster type table).
This table contains per-monster variant data (sprite info, etc.).

```
; Input:  r0 = index
; Output: r0 = pointer to data at base + offset_table[index]
```
