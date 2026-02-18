; Function at 0x08020D92
; 31 instructions traced

  0x08020D92: ldr        r0, [pc, #0x2c]                 ; = 0x0200A398 
  0x08020D94: ldr        r1, [r0]                      
  0x08020D96: ldr        r0, [pc, #0x2c]                 ; = 0x0000FFFD 
  0x08020D98: strh       r0, [r1, #0x30]               
  0x08020D9A: movs       r0, #0                        
  0x08020D9C: bl         #0x80095b8                    
  0x08020DA0: bl         #0x8002530                    
  0x08020DA4: movs       r1, #0xb3                     
  0x08020DA6: movs       r2, #1                        
  0x08020DA8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020DAC: cmp        r0, #0                        
  0x08020DAE: bne        #0x8020dc8                    
  0x08020DB0: bl         #0x8002530                    
  0x08020DB4: movs       r1, #0xb3                     
  0x08020DB6: movs       r2, #1                        
  0x08020DB8: movs       r3, #1                        
  0x08020DBA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08020DBE: b          #0x8020de8                    
  0x08020DC8: ldr        r0, [pc, #0x18]                 ; = 0x081164A0 
  0x08020DCA: bl         #0x80682b4                    
  0x08020DCE: movs       r0, #1                        
  0x08020DD0: bl         #0x8022774                    
  0x08020DD4: bl         #0x80682e0                    
  0x08020DD8: cmp        r0, #1                        
  0x08020DDA: beq        #0x8020de8                    
  0x08020DDC: movs       r0, #0x80                     
  0x08020DDE: lsls       r0, r0, #0x18                 
  0x08020DE0: b          #0x8020dea                    
  0x08020DE8: movs       r0, #6                        
  0x08020DEA: pop        {r1}                          
  0x08020DEC: bx         r1                            