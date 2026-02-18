; Function at 0x08021F98
; 48 instructions traced

  0x08021F98: push       {r6}                          
  0x08021F9A: ldr        r0, [r0]                      
  0x08021F9C: cmp        r0, #0                        
  0x08021F9E: bne        #0x8021fda                    
  0x08021FA0: ldr        r0, [pc, #0x64]                 ; = 0x083F18B8 
  0x08021FA2: movs       r1, #0                        
  0x08021FA4: ldrsh      r6, [r0, r1]                  
  0x08021FA6: movs       r1, #2                        
  0x08021FA8: ldrsh      r2, [r0, r1]                  
  0x08021FAA: mov        r8, r2                        
  0x08021FAC: ldr        r0, [pc, #0x5c]                 ; = 0x0200A398 
  0x08021FAE: ldr        r5, [r0]                      
  0x08021FB0: adds       r5, #0x30                     
  0x08021FB2: bl         #0x80228dc                    
  0x08021FB6: adds       r4, r0, #0                    
  0x08021FB8: ldr        r1, [pc, #0x54]                 ; = 0x083F1C08 
  0x08021FBA: bl         #0x800039c                    
  0x08021FBE: bl         #0x80217a8                    
  0x08021FC2: adds       r0, r5, #0                    
  0x08021FC4: adds       r1, r6, #0                    
  0x08021FC6: mov        r2, r8                        
  0x08021FC8: bl         #0x8022958                    
  0x08021FCC: adds       r0, r4, #0                    
  0x08021FCE: adds       r0, #0x38                     
  0x08021FD0: adds       r4, #0x48                     
  0x08021FD2: adds       r1, r4, #0                    
  0x08021FD4: movs       r2, #0x20                     
  0x08021FD6: bl         #0x8065d7c                    
  0x08021FDA: bl         #0x80228dc                    
  0x08021FDE: adds       r4, r0, #0                    
  0x08021FE0: bl         #0x8000324                    
  0x08021FE4: adds       r5, r0, #0                    
  0x08021FE6: ldrh       r0, [r4, #0x14]               
  0x08021FE8: subs       r0, #1                        
  0x08021FEA: strh       r0, [r4, #0x14]               
  0x08021FEC: adds       r1, r0, #0                    
  0x08021FEE: lsls       r0, r0, #0x10                 
  0x08021FF0: cmp        r0, #0                        
  0x08021FF2: bge        #0x8021ff6                    
  0x08021FF4: movs       r1, #0                        
  0x08021FF6: strh       r1, [r4, #0x14]               
  0x08021FF8: bl         #0x80228e4                    
  0x08021FFC: adds       r0, r5, #0                    
  0x08021FFE: pop        {r3}                          
  0x08022000: mov        r8, r3                        
  0x08022002: pop        {r4, r5, r6}                  
  0x08022004: pop        {r1}                          
  0x08022006: bx         r1                            