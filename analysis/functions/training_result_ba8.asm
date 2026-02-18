; Function at 0x08020BA8
; 75 instructions traced

  0x08020BA8: ldr        r0, [pc, #0xac]                 ; = 0x0200A398 
  0x08020BAA: ldr        r4, [r0]                      
  0x08020BAC: adds       r5, r4, #0                    
  0x08020BAE: adds       r5, #0x18                     
  0x08020BB0: bl         #0x8002530                    
  0x08020BB4: adds       r6, r0, #0                    
  0x08020BB6: adds       r4, #0x19                     
  0x08020BB8: mov        r0, r8                        
  0x08020BBA: adds       r1, r5, #0                    
  0x08020BBC: adds       r2, r4, #0                    
  0x08020BBE: bl         #0x8002b70                    
  0x08020BC2: adds       r0, r6, #0                    
  0x08020BC4: movs       r1, #0x8e                     
  0x08020BC6: mov        r2, r8                        
  0x08020BC8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020BCC: movs       r4, #0                        
  0x08020BCE: strb       r0, [r5, #2]                  
  0x08020BD0: adds       r0, r6, #0                    
  0x08020BD2: movs       r1, #0x8f                     
  0x08020BD4: mov        r2, r8                        
  0x08020BD6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020BDA: strb       r0, [r5, #3]                  
  0x08020BDC: adds       r0, r6, #0                    
  0x08020BDE: movs       r1, #0x90                     
  0x08020BE0: mov        r2, r8                        
  0x08020BE2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020BE6: strb       r0, [r5, #4]                  
  0x08020BE8: adds       r0, r6, #0                    
  0x08020BEA: movs       r1, #0x91                     
  0x08020BEC: mov        r2, r8                        
  0x08020BEE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020BF2: strb       r0, [r5, #5]                  
  0x08020BF4: adds       r0, r6, #0                    
  0x08020BF6: movs       r1, #0x92                     
  0x08020BF8: mov        r2, r8                        
  0x08020BFA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020BFE: strb       r0, [r5, #6]                  
  0x08020C00: adds       r0, r6, #0                    
  0x08020C02: movs       r1, #0x93                     
  0x08020C04: mov        r2, r8                        
  0x08020C06: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020C0A: strb       r0, [r5, #7]                  
  0x08020C0C: strb       r4, [r5, #8]                  
  0x08020C0E: strb       r4, [r5, #9]                  
  0x08020C10: strb       r4, [r5, #0xa]                
  0x08020C12: strb       r4, [r5, #0xb]                
  0x08020C14: strb       r4, [r5, #0xc]                
  0x08020C16: strb       r4, [r5, #0xd]                
  0x08020C18: adds       r0, r6, #0                    
  0x08020C1A: movs       r1, #0x94                     
  0x08020C1C: mov        r2, r8                        
  0x08020C1E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020C22: strb       r0, [r5, #0xe]                
  0x08020C24: adds       r0, r6, #0                    
  0x08020C26: movs       r1, #0x95                     
  0x08020C28: mov        r2, r8                        
  0x08020C2A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020C2E: strb       r0, [r5, #0x10]               
  0x08020C30: adds       r0, r6, #0                    
  0x08020C32: movs       r1, #0x96                     
  0x08020C34: mov        r2, r8                        
  0x08020C36: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020C3A: strb       r0, [r5, #0x11]               
  0x08020C3C: adds       r0, r6, #0                    
  0x08020C3E: movs       r1, #0x97                     
  0x08020C40: mov        r2, r8                        
  0x08020C42: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020C46: strb       r0, [r5, #0x12]               
  0x08020C48: movs       r0, #0xff                     
  0x08020C4A: strb       r0, [r5, #0x13]               
  0x08020C4C: pop        {r3}                          
  0x08020C4E: mov        r8, r3                        
  0x08020C50: pop        {r4, r5, r6}                  
  0x08020C52: pop        {r0}                          
  0x08020C54: bx         r0                            