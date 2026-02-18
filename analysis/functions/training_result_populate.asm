; Function at 0x08018DC0
; 31 instructions traced

  0x08018DC0: adds       r4, r0, #0                    
  0x08018DC2: movs       r0, #1                        
  0x08018DC4: str        r0, [sp]                      
  0x08018DC6: movs       r0, #0                        
  0x08018DC8: str        r0, [sp, #0x10]               
  0x08018DCA: movs       r0, #0xc0                     
  0x08018DCC: lsls       r0, r0, #0x13                 
  0x08018DCE: str        r0, [sp, #4]                  
  0x08018DD0: mov        r3, sp                        
  0x08018DD2: lsls       r0, r4, #0x10                 
  0x08018DD4: asrs       r0, r0, #0x10                 
  0x08018DD6: cmp        r0, #0                        
  0x08018DD8: bge        #0x8018ddc                    
  0x08018DDA: adds       r0, #7                        
  0x08018DDC: asrs       r0, r0, #3                    
  0x08018DDE: strh       r0, [r3, #8]                  
  0x08018DE0: mov        r3, sp                        
  0x08018DE2: asrs       r0, r4, #0x10                 
  0x08018DE4: cmp        r0, #0                        
  0x08018DE6: bge        #0x8018dea                    
  0x08018DE8: adds       r0, #7                        
  0x08018DEA: asrs       r0, r0, #3                    
  0x08018DEC: strh       r0, [r3, #0xa]                
  0x08018DEE: mov        r0, sp                        
  0x08018DF0: strh       r1, [r0, #0xc]                
  0x08018DF2: strh       r2, [r0, #0xe]                
  0x08018DF4: bl         #0x8066618                    
  0x08018DF8: add        sp, #0x20                     
  0x08018DFA: pop        {r4}                          
  0x08018DFC: pop        {r0}                          
  0x08018DFE: bx         r0                            