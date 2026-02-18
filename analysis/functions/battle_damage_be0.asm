; Function at 0x08043BE0
; 31 instructions traced

  0x08043BE0: adds       r4, r1, #0                    
  0x08043BE2: lsls       r0, r0, #0x10                 
  0x08043BE4: ldr        r1, [pc, #0x38]                 ; = 0x081C9B4C 
  0x08043BE6: ldr        r2, [r1, #4]                  
  0x08043BE8: ldr        r1, [r1]                      
  0x08043BEA: str        r1, [sp]                      
  0x08043BEC: str        r2, [sp, #4]                  
  0x08043BEE: lsrs       r0, r0, #0xe                  
  0x08043BF0: add        r0, sp, r0                    
  0x08043BF2: ldr        r2, [r0]                      
  0x08043BF4: movs       r3, #0                        
  0x08043BF6: ldrh       r0, [r2]                      
  0x08043BF8: strh       r0, [r4]                      
  0x08043BFA: ldr        r1, [pc, #0x28]                 ; = 0x0000FFFD 
  0x08043BFC: cmp        r0, r1                        
  0x08043BFE: beq        #0x8043c16                    
  0x08043C00: adds       r5, r1, #0                    
  0x08043C02: adds       r1, r4, #0                    
  0x08043C04: adds       r1, #2                        
  0x08043C06: adds       r2, #2                        
  0x08043C08: adds       r3, #1                        
  0x08043C0A: cmp        r3, #0xf                      
  0x08043C0C: bgt        #0x8043c16                    
  0x08043C0E: ldrh       r0, [r2]                      
  0x08043C10: strh       r0, [r1]                      
  0x08043C12: cmp        r0, r5                        
  0x08043C14: bne        #0x8043c04                    
  0x08043C16: add        sp, #8                        
  0x08043C18: pop        {r4, r5}                      
  0x08043C1A: pop        {r0}                          
  0x08043C1C: bx         r0                            