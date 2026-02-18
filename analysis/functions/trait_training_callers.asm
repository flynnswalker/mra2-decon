; Function at 0x08023DD0
; 75 instructions traced

  0x08023DD0: lsrs       r0, r0, #0x10                 
  0x08023DD2: movs       r1, #0x65                     
  0x08023DD4: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x08023DD8: lsls       r0, r0, #0x10                 
  0x08023DDA: lsrs       r0, r0, #0x10                 
  0x08023DDC: mov        sl, r0                        
  0x08023DDE: adds       r0, r4, #0                    
  0x08023DE0: bl         #0x8000654                    
  0x08023DE4: mov        r8, r0                        
  0x08023DE6: adds       r0, r4, #0                    
  0x08023DE8: movs       r1, #0x33                     
  0x08023DEA: bl         #0x800d3a8                    
  0x08023DEE: movs       r6, #1                        
  0x08023DF0: rsbs       r6, r6, #0                    
  0x08023DF2: cmp        r0, r6                        
  0x08023DF4: beq        #0x8023dfc                    
  0x08023DF6: lsrs       r0, r5, #0x1f                 
  0x08023DF8: adds       r0, r5, r0                    
  0x08023DFA: asrs       r5, r0, #1                    
  0x08023DFC: adds       r0, r4, #0                    
  0x08023DFE: movs       r1, #0x3d                     
  0x08023E00: bl         #0x800d3a8                    
  0x08023E04: cmp        r0, r6                        
  0x08023E06: beq        #0x8023e0c                    
  0x08023E08: movs       r5, #0x19                     
  0x08023E0A: rsbs       r5, r5, #0                    
  0x08023E0C: adds       r0, r4, #0                    
  0x08023E0E: movs       r1, #0x55                     
  0x08023E10: bl         #0x800d3a8                    
  0x08023E14: cmp        r0, r6                        
  0x08023E16: beq        #0x8023e1c                    
  0x08023E18: movs       r5, #0x19                     
  0x08023E1A: rsbs       r5, r5, #0                    
  0x08023E1C: mov        r1, sb                        
  0x08023E1E: adds       r1, #0x19                     
  0x08023E20: lsls       r0, r7, #2                    
  0x08023E22: adds       r0, r0, r7                    
  0x08023E24: adds       r1, r1, r0                    
  0x08023E26: adds       r0, r5, #0                    
  0x08023E28: adds       r0, #0x32                     
  0x08023E2A: muls       r0, r1, r0                    
  0x08023E2C: movs       r1, #0x19                     
  0x08023E2E: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08023E32: adds       r3, r0, #0                    
  0x08023E34: ldr        r1, [sp]                      
  0x08023E36: movs       r0, #0                        
  0x08023E38: ldrsb      r0, [r1, r0]                  
  0x08023E3A: cmp        r0, #0                        
  0x08023E3C: beq        #0x8023e44                    
  0x08023E3E: cmp        r0, #1                        
  0x08023E40: bne        #0x8023e44                    
  0x08023E42: subs       r3, #0xa                      
  0x08023E44: ldr        r0, [pc, #0x2c]                 ; = 0x083F3E12 
  0x08023E46: mov        r1, r8                        
  0x08023E48: lsls       r2, r1, #1                    
  0x08023E4A: adds       r1, r2, r0                    
  0x08023E4C: ldrb       r1, [r1]                      
  0x08023E4E: adds       r0, #1                        
  0x08023E50: adds       r2, r2, r0                    
  0x08023E52: ldrb       r2, [r2]                      
  0x08023E54: adds       r0, r3, #0                    
  0x08023E56: bl         #0x800368c                    
  0x08023E5A: adds       r3, r0, #0                    
  0x08023E5C: mov        r0, sl                        
  0x08023E5E: subs       r3, r3, r0                    
  0x08023E60: lsls       r0, r3, #0x10                 
  0x08023E62: asrs       r0, r0, #0x10                 
  0x08023E64: add        sp, #4                        
  0x08023E66: pop        {r3, r4, r5}                  
  0x08023E68: mov        r8, r3                        
  0x08023E6A: mov        sb, r4                        
  0x08023E6C: mov        sl, r5                        
  0x08023E6E: pop        {r4, r5, r6, r7}              
  0x08023E70: pop        {r1}                          
  0x08023E72: bx         r1                            