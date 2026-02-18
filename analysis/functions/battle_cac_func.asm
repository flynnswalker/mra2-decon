; Function at 0x08043CAC
; 38 instructions traced

  0x08043CAC: push       {r4, r5, r6, r7, lr}          
  0x08043CAE: sub        sp, #0xc                      
  0x08043CB0: adds       r7, r0, #0                    
  0x08043CB2: ldr        r1, [pc, #0x14]                 ; = 0x081C9B54 
  0x08043CB4: mov        r0, sp                        
  0x08043CB6: movs       r2, #6                        
  0x08043CB8: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x08043CBC: ldr        r3, [pc, #0xc]                  ; = 0x0000FFFF 
  0x08043CBE: movs       r5, #0                        
  0x08043CC0: movs       r4, #0                        
  0x08043CC2: adds       r6, r5, #1                    
  0x08043CC4: b          #0x8043cd2                    
  0x08043CD0: adds       r4, #1                        
  0x08043CD2: cmp        r4, #2                        
  0x08043CD4: bgt        #0x8043cf6                    
  0x08043CD6: lsls       r0, r4, #1                    
  0x08043CD8: add        r0, sp, r0                    
  0x08043CDA: ldrh       r1, [r0]                      
  0x08043CDC: adds       r0, r7, #0                    
  0x08043CDE: adds       r2, r5, #0                    
  0x08043CE0: str        r3, [sp, #8]                  
  0x08043CE2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043CE6: ldr        r3, [sp, #8]                  
  0x08043CE8: cmp        r0, #0xff                     
  0x08043CEA: beq        #0x8043cd0                    
  0x08043CEC: cmp        r0, #9                        
  0x08043CEE: ble        #0x8043cd0                    
  0x08043CF0: subs       r0, #0xa                      
  0x08043CF2: lsls       r0, r0, #0x10                 
  0x08043CF4: lsrs       r3, r0, #0x10                 
  0x08043CF6: adds       r5, r6, #0                    
  0x08043CF8: cmp        r5, #1                        
  0x08043CFA: ble        #0x8043cc0                    
  0x08043CFC: adds       r0, r3, #0                    
  0x08043CFE: add        sp, #0xc                      
  0x08043D00: pop        {r4, r5, r6, r7}              
  0x08043D02: pop        {r1}                          
  0x08043D04: bx         r1                            