; Function at 0x08024DF0
; 47 instructions traced

  0x08024DF0: push       {r4, lr}                      
  0x08024DF2: adds       r1, r0, #0                    
  0x08024DF4: movs       r0, #0x50                     
  0x08024DF6: rsbs       r0, r0, #0                    
  0x08024DF8: cmp        r1, r0                        
  0x08024DFA: bge        #0x8024e00                    
  0x08024DFC: movs       r4, #0                        
  0x08024DFE: b          #0x8024e2a                    
  0x08024E00: movs       r0, #0x28                     
  0x08024E02: rsbs       r0, r0, #0                    
  0x08024E04: cmp        r1, r0                        
  0x08024E06: bge        #0x8024e0c                    
  0x08024E08: movs       r4, #1                        
  0x08024E0A: b          #0x8024e2a                    
  0x08024E0C: movs       r0, #0xa                      
  0x08024E0E: rsbs       r0, r0, #0                    
  0x08024E10: movs       r4, #2                        
  0x08024E12: cmp        r1, r0                        
  0x08024E14: blt        #0x8024e2a                    
  0x08024E16: movs       r4, #3                        
  0x08024E18: cmp        r1, #0xa                      
  0x08024E1A: ble        #0x8024e2a                    
  0x08024E1C: movs       r4, #4                        
  0x08024E1E: cmp        r1, #0x28                     
  0x08024E20: ble        #0x8024e2a                    
  0x08024E22: movs       r4, #6                        
  0x08024E24: cmp        r1, #0x50                     
  0x08024E26: bgt        #0x8024e2a                    
  0x08024E28: movs       r4, #5                        
  0x08024E2A: bl         #0x806354c                      ; -> prng()
  0x08024E2E: ldr        r2, [pc, #0x24]                 ; = 0x083F3ED8 
  0x08024E30: lsls       r3, r4, #1                    
  0x08024E32: adds       r1, r3, r2                    
  0x08024E34: ldrb       r4, [r1]                      
  0x08024E36: lsls       r0, r0, #0x10                 
  0x08024E38: lsrs       r0, r0, #0x10                 
  0x08024E3A: adds       r2, #1                        
  0x08024E3C: adds       r3, r3, r2                    
  0x08024E3E: ldrb       r1, [r3]                      
  0x08024E40: subs       r1, r1, r4                    
  0x08024E42: adds       r1, #1                        
  0x08024E44: bl         #0x81c7a6c                    
  0x08024E48: adds       r4, r4, r0                    
  0x08024E4A: adds       r0, r4, #0                    
  0x08024E4C: pop        {r4}                          
  0x08024E4E: pop        {r1}                          
  0x08024E50: bx         r1                            