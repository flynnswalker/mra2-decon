; Function at 0x08020C5C
; 9 instructions traced

  0x08020C5C: adds       r2, r0, #0                    
  0x08020C5E: ldr        r1, [pc, #0x10]                 ; = 0x081CACC8 MONSTER_TYPE_TABLE
  0x08020C60: ldr        r0, [r1]                      
  0x08020C62: adds       r0, r0, r1                    
  0x08020C64: lsls       r1, r2, #3                    
  0x08020C66: adds       r1, r1, r2                    
  0x08020C68: lsls       r1, r1, #3                    
  0x08020C6A: adds       r0, r0, r1                    
  0x08020C6C: bx         lr                            