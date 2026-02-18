; Function at 0x08020EBC
; 49 instructions traced

  0x08020EBC: push       {lr}                          
  0x08020EBE: bl         #0x8000310                    
  0x08020EC2: cmp        r0, #0                        
  0x08020EC4: beq        #0x8020ecc                    
  0x08020EC6: ldr        r0, [pc, #0x2c]                 ; = 0x08116F7C 
  0x08020EC8: bl         #0x80682b4                    
  0x08020ECC: movs       r0, #0                        
  0x08020ECE: bl         #0x8022774                    
  0x08020ED2: bl         #0x80682e0                    
  0x08020ED6: cmp        r0, #1                        
  0x08020ED8: bne        #0x8020f34                    
  0x08020EDA: bl         #0x8068748                    
  0x08020EDE: cmp        r0, #0                        
  0x08020EE0: bne        #0x8020ef8                    
  0x08020EE2: bl         #0x8002530                    
  0x08020EE6: movs       r1, #0x78                     
  0x08020EE8: movs       r2, #1                        
  0x08020EEA: movs       r3, #0                        
  0x08020EEC: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08020EF0: movs       r0, #0xa                      
  0x08020EF2: b          #0x8020f38                    
  0x08020EF8: cmp        r0, #0                        
  0x08020EFA: blt        #0x8020f34                    
  0x08020EFC: cmp        r0, #2                        
  0x08020EFE: bgt        #0x8020f34                    
  0x08020F00: movs       r0, #0                        
  0x08020F02: bl         #0x806439c                    
  0x08020F06: bl         #0x8002530                    
  0x08020F0A: movs       r1, #0x71                     
  0x08020F0C: movs       r2, #0                        
  0x08020F0E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020F12: movs       r1, #0x18                     
  0x08020F14: movs       r2, #0                        
  0x08020F16: movs       r3, #0                        
  0x08020F18: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08020F1C: ldr        r0, [pc, #0xc]                  ; = 0x0200A398 
  0x08020F1E: ldr        r0, [r0]                      
  0x08020F20: adds       r0, #0x2c                     
  0x08020F22: ldrb       r0, [r0]                      
  0x08020F24: cmp        r0, #0                        
  0x08020F26: bne        #0x8020f30                    
  0x08020F28: movs       r0, #0x1b                     
  0x08020F2A: b          #0x8020f38                    
  0x08020F30: movs       r0, #0x1f                     
  0x08020F32: b          #0x8020f38                    
  0x08020F34: movs       r0, #0x80                     
  0x08020F36: lsls       r0, r0, #0x18                 
  0x08020F38: pop        {r1}                          
  0x08020F3A: bx         r1                            