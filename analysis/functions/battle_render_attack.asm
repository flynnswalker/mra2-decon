; Function at 0x080681EC
; 76 instructions traced

  0x080681EC: push       {r4, r5, r6, r7, lr}          
  0x080681EE: mov        r7, sb                        
  0x080681F0: mov        r6, r8                        
  0x080681F2: push       {r6, r7}                      
  0x080681F4: sub        sp, #8                        
  0x080681F6: adds       r5, r0, #0                    
  0x080681F8: mov        sb, r2                        
  0x080681FA: ldr        r2, [sp, #0x24]               
  0x080681FC: lsls       r1, r1, #0x18                 
  0x080681FE: lsrs       r1, r1, #0x18                 
  0x08068200: mov        r8, r1                        
  0x08068202: lsls       r3, r3, #0x10                 
  0x08068204: lsrs       r7, r3, #0x10                 
  0x08068206: lsls       r2, r2, #0x10                 
  0x08068208: lsrs       r2, r2, #0x10                 
  0x0806820A: ldr        r1, [pc, #0x3c]                 ; = 0xFFFF0000 
  0x0806820C: ldr        r0, [sp]                      
  0x0806820E: ands       r0, r1                        
  0x08068210: orrs       r0, r7                        
  0x08068212: str        r0, [sp]                      
  0x08068214: mov        r1, sp                        
  0x08068216: strh       r2, [r1, #2]                  
  0x08068218: movs       r0, #8                        
  0x0806821A: strh       r0, [r1, #4]                  
  0x0806821C: movs       r0, #0xe                      
  0x0806821E: strh       r0, [r1, #6]                  
  0x08068220: movs       r6, #0                        
  0x08068222: cmp        r6, r8                        
  0x08068224: bhs        #0x8068286                    
  0x08068226: mov        r4, sp                        
  0x08068228: ldrh       r1, [r5]                      
  0x0806822A: adds       r5, #2                        
  0x0806822C: ldr        r0, [pc, #0x1c]                 ; = 0x0000FFFD 
  0x0806822E: cmp        r1, r0                        
  0x08068230: beq        #0x8068286                    
  0x08068232: cmp        r1, r0                        
  0x08068234: ble        #0x8068254                    
  0x08068236: ldr        r0, [pc, #0x18]                 ; = 0x0000FFFF 
  0x08068238: cmp        r1, r0                        
  0x0806823A: bne        #0x806825a                    
  0x0806823C: strh       r7, [r4]                      
  0x0806823E: ldrh       r0, [r4, #2]                  
  0x08068240: adds       r0, #0xe                      
  0x08068242: strh       r0, [r4, #2]                  
  0x08068244: b          #0x806827c                    
  0x08068254: subs       r0, #9                        
  0x08068256: cmp        r1, r0                        
  0x08068258: beq        #0x8068286                    
  0x0806825A: lsls       r0, r1, #3                    
  0x0806825C: subs       r0, r0, r1                    
  0x0806825E: lsls       r0, r0, #3                    
  0x08068260: ldr        r1, [pc, #0x34]                 ; = 0x0821A144 
  0x08068262: adds       r0, r0, r1                    
  0x08068264: mov        r1, sb                        
  0x08068266: mov        r2, sp                        
  0x08068268: bl         #0x80671b4                    
  0x0806826C: subs       r0, r5, #2                    
  0x0806826E: bl         #0x8068714                    
  0x08068272: lsls       r0, r0, #0x18                 
  0x08068274: lsrs       r0, r0, #0x18                 
  0x08068276: ldrh       r1, [r4]                      
  0x08068278: adds       r0, r0, r1                    
  0x0806827A: strh       r0, [r4]                      
  0x0806827C: adds       r0, r6, #1                    
  0x0806827E: lsls       r0, r0, #0x18                 
  0x08068280: lsrs       r6, r0, #0x18                 
  0x08068282: cmp        r6, r8                        
  0x08068284: blo        #0x8068228                    
  0x08068286: adds       r0, r5, #0                    
  0x08068288: add        sp, #8                        
  0x0806828A: pop        {r3, r4}                      
  0x0806828C: mov        r8, r3                        
  0x0806828E: mov        sb, r4                        
  0x08068290: pop        {r4, r5, r6, r7}              
  0x08068292: pop        {r1}                          
  0x08068294: bx         r1                            