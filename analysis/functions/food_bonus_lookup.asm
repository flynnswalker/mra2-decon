; Function at 0x08002538
; 10 instructions traced

  0x08002538: push       {lr}                          
  0x0800253A: ldr        r1, [pc, #0x14]                 ; = 0x02002B24 WRAM_PLAYER_STATE
  0x0800253C: lsls       r0, r0, #0x18                 
  0x0800253E: lsrs       r0, r0, #0x18                 
  0x08002540: ldr        r2, [pc, #0x10]                 ; = 0x0000415C 
  0x08002542: adds       r1, r1, r2                    
  0x08002544: ldr        r2, [pc, #0x10]                 ; = 0x082067AC 
  0x08002546: bl         #0x801e388                    
  0x0800254A: pop        {r1}                          
  0x0800254C: bx         r1                            