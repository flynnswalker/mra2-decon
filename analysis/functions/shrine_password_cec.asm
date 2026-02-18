; Function at 0x08000CEC
; 156 instructions traced

  0x08000CEC: push       {r4, r5, r6, r7, lr}          
  0x08000CEE: mov        r7, sl                        
  0x08000CF0: mov        r6, sb                        
  0x08000CF2: mov        r5, r8                        
  0x08000CF4: push       {r5, r6, r7}                  
  0x08000CF6: sub        sp, #0x48                     
  0x08000CF8: adds       r5, r0, #0                    
  0x08000CFA: mov        sb, r1                        
  0x08000CFC: adds       r7, r2, #0                    
  0x08000CFE: ldr        r4, [pc, #0x9c]                 ; = 0x082184D8 
  0x08000D00: movs       r2, #0                        
  0x08000D02: add        r0, sp, #0x20                 
  0x08000D04: mov        r8, r0                        
  0x08000D06: movs       r3, #0                        
  0x08000D08: mov        sl, r8                        
  0x08000D0A: lsls       r1, r2, #1                    
  0x08000D0C: mov        r6, sp                        
  0x08000D0E: adds       r0, r6, r1                    
  0x08000D10: strh       r3, [r0]                      
  0x08000D12: add        r1, sl                        
  0x08000D14: strh       r3, [r1]                      
  0x08000D16: adds       r0, r2, #1                    
  0x08000D18: lsls       r0, r0, #0x10                 
  0x08000D1A: lsrs       r2, r0, #0x10                 
  0x08000D1C: cmp        r2, #0xf                      
  0x08000D1E: bls        #0x8000d0a                    
  0x08000D20: movs       r2, #0                        
  0x08000D22: movs       r1, #0                        
  0x08000D24: lsls       r0, r2, #1                    
  0x08000D26: adds       r0, r0, r7                    
  0x08000D28: strh       r1, [r0]                      
  0x08000D2A: adds       r0, r2, #1                    
  0x08000D2C: lsls       r0, r0, #0x10                 
  0x08000D2E: lsrs       r2, r0, #0x10                 
  0x08000D30: cmp        r2, #0xb                      
  0x08000D32: bls        #0x8000d24                    
  0x08000D34: adds       r0, r5, #0                    
  0x08000D36: movs       r1, #0x63                     
  0x08000D38: movs       r2, #0                        
  0x08000D3A: bl         #0x8003624                    
  0x08000D3E: adds       r1, r0, #0                    
  0x08000D40: mov        r0, sp                        
  0x08000D42: bl         #0x80036d4                    
  0x08000D46: adds       r0, r5, #0                    
  0x08000D48: movs       r1, #0x4e                     
  0x08000D4A: mov        r2, sb                        
  0x08000D4C: bl         #0x8003624                    
  0x08000D50: adds       r1, r0, #0                    
  0x08000D52: mov        r0, r8                        
  0x08000D54: bl         #0x80036d4                    
  0x08000D58: adds       r0, r5, #0                    
  0x08000D5A: movs       r1, #0x54                     
  0x08000D5C: mov        r2, sb                        
  0x08000D5E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000D62: mov        sl, r0                        
  0x08000D64: ldrh       r1, [r4]                      
  0x08000D66: ldr        r0, [pc, #0x38]                 ; = 0x0000FFFF 
  0x08000D68: cmp        r1, r0                        
  0x08000D6A: beq        #0x8000e32                    
  0x08000D6C: add        r6, sp, #0x40                 
  0x08000D6E: mov        sb, r8                        
  0x08000D70: add        r0, sp, #0x44                 
  0x08000D72: mov        r8, r0                        
  0x08000D74: ldr        r0, [pc, #0x2c]                 ; = 0x0000FFFE 
  0x08000D76: cmp        r1, r0                        
  0x08000D78: bne        #0x8000dac                    
  0x08000D7A: adds       r4, #2                        
  0x08000D7C: ldrh       r1, [r4]                      
  0x08000D7E: cmp        r1, sl                        
  0x08000D80: bne        #0x8000da8                    
  0x08000D82: adds       r4, #2                        
  0x08000D84: movs       r2, #0                        
  0x08000D86: lsls       r0, r2, #1                    
  0x08000D88: adds       r0, r0, r7                    
  0x08000D8A: ldrh       r1, [r4]                      
  0x08000D8C: strh       r1, [r0]                      
  0x08000D8E: adds       r4, #2                        
  0x08000D90: adds       r0, r2, #1                    
  0x08000D92: lsls       r0, r0, #0x10                 
  0x08000D94: lsrs       r2, r0, #0x10                 
  0x08000D96: cmp        r2, #0xb                      
  0x08000D98: bls        #0x8000d86                    
  0x08000D9A: b          #0x8000e32                    
  0x08000DA8: adds       r4, #0x1a                     
  0x08000DAA: b          #0x8000e2a                    
  0x08000DAC: mov        r1, sl                        
  0x08000DAE: cmp        r1, #2                        
  0x08000DB0: bgt        #0x8000db6                    
  0x08000DB2: adds       r4, #0x38                     
  0x08000DB4: b          #0x8000e2a                    
  0x08000DB6: adds       r0, r4, #0                    
  0x08000DB8: mov        r1, sp                        
  0x08000DBA: bl         #0x80038a0                    
  0x08000DBE: strb       r0, [r6]                      
  0x08000DC0: adds       r0, r4, #0                    
  0x08000DC2: mov        r1, sb                        
  0x08000DC4: bl         #0x80038a0                    
  0x08000DC8: mov        r1, r8                        
  0x08000DCA: strb       r0, [r1]                      
  0x08000DCC: adds       r4, #0x10                     
  0x08000DCE: adds       r0, r4, #0                    
  0x08000DD0: mov        r1, sp                        
  0x08000DD2: bl         #0x80038a0                    
  0x08000DD6: strb       r0, [r6, #1]                  
  0x08000DD8: adds       r0, r4, #0                    
  0x08000DDA: mov        r1, sb                        
  0x08000DDC: bl         #0x80038a0                    
  0x08000DE0: adds       r1, r0, #0                    
  0x08000DE2: mov        r0, r8                        
  0x08000DE4: strb       r1, [r0, #1]                  
  0x08000DE6: adds       r4, #0x10                     
  0x08000DE8: movs       r5, #0                        
  0x08000DEA: ldrb       r0, [r6]                      
  0x08000DEC: add        r3, sp, #0x40                 
  0x08000DEE: add        r2, sp, #0x44                 
  0x08000DF0: cmp        r0, #1                        
  0x08000DF2: bne        #0x8000dfe                    
  0x08000DF4: lsls       r0, r1, #0x18                 
  0x08000DF6: lsrs       r0, r0, #0x18                 
  0x08000DF8: cmp        r0, #1                        
  0x08000DFA: bne        #0x8000dfe                    
  0x08000DFC: movs       r5, #1                        
  0x08000DFE: ldrb       r0, [r2]                      
  0x08000E00: cmp        r0, #1                        
  0x08000E02: bne        #0x8000e0c                    
  0x08000E04: ldrb       r0, [r3, #1]                  
  0x08000E06: cmp        r0, #1                        
  0x08000E08: bne        #0x8000e0c                    
  0x08000E0A: movs       r5, #1                        
  0x08000E0C: cmp        r5, #1                        
  0x08000E0E: bne        #0x8000e28                    
  0x08000E10: movs       r2, #0                        
  0x08000E12: lsls       r0, r2, #1                    
  0x08000E14: adds       r0, r0, r7                    
  0x08000E16: ldrh       r1, [r4]                      
  0x08000E18: strh       r1, [r0]                      
  0x08000E1A: adds       r4, #2                        
  0x08000E1C: adds       r0, r2, #1                    
  0x08000E1E: lsls       r0, r0, #0x10                 
  0x08000E20: lsrs       r2, r0, #0x10                 
  0x08000E22: cmp        r2, #0xb                      
  0x08000E24: bls        #0x8000e12                    
  0x08000E26: b          #0x8000e32                    
  0x08000E28: adds       r4, #0x18                     
  0x08000E2A: ldrh       r1, [r4]                      
  0x08000E2C: ldr        r0, [pc, #0x14]                 ; = 0x0000FFFF 
  0x08000E2E: cmp        r1, r0                        
  0x08000E30: bne        #0x8000d74                    
  0x08000E32: add        sp, #0x48                     
  0x08000E34: pop        {r3, r4, r5}                  
  0x08000E36: mov        r8, r3                        
  0x08000E38: mov        sb, r4                        
  0x08000E3A: mov        sl, r5                        
  0x08000E3C: pop        {r4, r5, r6, r7}              
  0x08000E3E: pop        {r0}                          
  0x08000E40: bx         r0                            