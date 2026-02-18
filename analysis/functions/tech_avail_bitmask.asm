; Function at 0x0800DF80
; 52 instructions traced

  0x0800DF80: push       {r4, r5, r6, r7, lr}          
  0x0800DF82: adds       r7, r0, #0                    
  0x0800DF84: adds       r5, r1, #0                    
  0x0800DF86: movs       r6, #0                        
  0x0800DF88: movs       r4, #0                        
  0x0800DF8A: adds       r0, r7, #0                    
  0x0800DF8C: movs       r1, #0x4b                     
  0x0800DF8E: adds       r2, r4, #0                    
  0x0800DF90: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800DF94: lsls       r0, r0, #0x18                 
  0x0800DF96: lsrs       r3, r0, #0x18                 
  0x0800DF98: adds       r2, r4, #1                    
  0x0800DF9A: cmp        r3, #0xff                     
  0x0800DF9C: beq        #0x800dfda                    
  0x0800DF9E: ldrh       r0, [r5]                      
  0x0800DFA0: cmp        r0, r3                        
  0x0800DFA2: bls        #0x800dfda                    
  0x0800DFA4: adds       r1, r5, #2                    
  0x0800DFA6: lsls       r0, r3, #1                    
  0x0800DFA8: adds       r0, r0, r1                    
  0x0800DFAA: ldrh       r0, [r0]                      
  0x0800DFAC: adds       r1, r5, r0                    
  0x0800DFAE: adds       r1, #0x18                     
  0x0800DFB0: movs       r3, #1                        
  0x0800DFB2: ldrh       r0, [r1]                      
  0x0800DFB4: cmp        r0, #1                        
  0x0800DFB6: beq        #0x800dfd0                    
  0x0800DFB8: cmp        r0, #1                        
  0x0800DFBA: bgt        #0x800dfc2                    
  0x0800DFBC: cmp        r0, #0                        
  0x0800DFBE: beq        #0x800dfcc                    
  0x0800DFC0: b          #0x800dfd4                    
  0x0800DFC2: cmp        r0, #6                        
  0x0800DFC4: bgt        #0x800dfd4                    
  0x0800DFC6: cmp        r0, #3                        
  0x0800DFC8: blt        #0x800dfd4                    
  0x0800DFCA: b          #0x800dfd0                    
  0x0800DFCC: ldr        r0, [r1, #4]                  
  0x0800DFCE: orrs       r6, r0                        
  0x0800DFD0: adds       r1, #8                        
  0x0800DFD2: b          #0x800dfd6                    
  0x0800DFD4: movs       r3, #0                        
  0x0800DFD6: cmp        r3, #0                        
  0x0800DFD8: bne        #0x800dfb2                    
  0x0800DFDA: lsls       r0, r2, #0x18                 
  0x0800DFDC: lsrs       r4, r0, #0x18                 
  0x0800DFDE: cmp        r4, #5                        
  0x0800DFE0: bls        #0x800df8a                    
  0x0800DFE2: adds       r0, r6, #0                    
  0x0800DFE4: pop        {r4, r5, r6, r7}              
  0x0800DFE6: pop        {r1}                          
  0x0800DFE8: bx         r1                            