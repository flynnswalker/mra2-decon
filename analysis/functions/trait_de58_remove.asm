; Function at 0x0800DE58
; 68 instructions traced

  0x0800DE58: push       {r4, r5, r6, r7, lr}          
  0x0800DE5A: mov        r7, r8                        
  0x0800DE5C: push       {r7}                          
  0x0800DE5E: sub        sp, #8                        
  0x0800DE60: adds       r7, r0, #0                    
  0x0800DE62: lsls       r1, r1, #0x18                 
  0x0800DE64: lsrs       r6, r1, #0x18                 
  0x0800DE66: ldr        r5, [pc, #0x70]                 ; = 0x08202C00 
  0x0800DE68: movs       r4, #0                        
  0x0800DE6A: adds       r0, r7, #0                    
  0x0800DE6C: movs       r1, #0x4b                     
  0x0800DE6E: adds       r2, r4, #0                    
  0x0800DE70: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800DE74: mov        r2, sp                        
  0x0800DE76: adds       r1, r2, r4                    
  0x0800DE78: strb       r0, [r1]                      
  0x0800DE7A: adds       r4, #1                        
  0x0800DE7C: cmp        r4, #5                        
  0x0800DE7E: ble        #0x800de6a                    
  0x0800DE80: ldrh       r0, [r5]                      
  0x0800DE82: cmp        r0, r6                        
  0x0800DE84: bls        #0x800dedc                    
  0x0800DE86: adds       r0, r5, #2                    
  0x0800DE88: lsls       r1, r6, #1                    
  0x0800DE8A: adds       r1, r1, r0                    
  0x0800DE8C: ldrh       r0, [r1]                      
  0x0800DE8E: adds       r0, r5, r0                    
  0x0800DE90: movs       r3, #0                        
  0x0800DE92: movs       r2, #0                        
  0x0800DE94: adds       r0, #0xd                      
  0x0800DE96: mov        r8, r0                        
  0x0800DE98: mov        r0, r8                        
  0x0800DE9A: adds       r1, r0, r2                    
  0x0800DE9C: ldrb       r0, [r1]                      
  0x0800DE9E: adds       r6, r2, #1                    
  0x0800DEA0: cmp        r0, #0xff                     
  0x0800DEA2: beq        #0x800dec4                    
  0x0800DEA4: movs       r4, #0                        
  0x0800DEA6: adds       r5, r1, #0                    
  0x0800DEA8: mov        r2, sp                        
  0x0800DEAA: adds       r1, r2, r4                    
  0x0800DEAC: ldrb       r0, [r5]                      
  0x0800DEAE: ldrb       r1, [r1]                      
  0x0800DEB0: cmp        r0, r1                        
  0x0800DEB2: bne        #0x800debe                    
  0x0800DEB4: adds       r0, r7, #0                    
  0x0800DEB6: adds       r1, r4, #0                    
  0x0800DEB8: bl         #0x800d3d4                    
  0x0800DEBC: movs       r3, #0xff                     
  0x0800DEBE: adds       r4, #1                        
  0x0800DEC0: cmp        r4, #5                        
  0x0800DEC2: ble        #0x800dea8                    
  0x0800DEC4: lsls       r0, r6, #0x18                 
  0x0800DEC6: lsrs       r2, r0, #0x18                 
  0x0800DEC8: cmp        r2, #6                        
  0x0800DECA: bls        #0x800de98                    
  0x0800DECC: cmp        r3, #0                        
  0x0800DECE: beq        #0x800dedc                    
  0x0800DED0: movs       r0, #1                        
  0x0800DED2: rsbs       r0, r0, #0                    
  0x0800DED4: b          #0x800dede                    
  0x0800DEDC: movs       r0, #0                        
  0x0800DEDE: add        sp, #8                        
  0x0800DEE0: pop        {r3}                          
  0x0800DEE2: mov        r8, r3                        
  0x0800DEE4: pop        {r4, r5, r6, r7}              
  0x0800DEE6: pop        {r1}                          
  0x0800DEE8: bx         r1                            