; Function at 0x08043280
; 99 instructions traced

  0x08043208: movs       r0, #0x58                     
  0x0804320A: adds       r4, r6, #0                    
  0x0804320C: muls       r4, r0, r4                    
  0x0804320E: add        r4, sb                        
  0x08043210: bl         #0x8002530                    
  0x08043214: movs       r3, #0                        
  0x08043216: adds       r2, r4, #0                    
  0x08043218: adds       r2, #0x20                     
  0x0804321A: ldr        r1, [sp, #4]                  
  0x0804321C: ldrh       r0, [r1]                      
  0x0804321E: ldrh       r5, [r2]                      
  0x08043220: cmp        r0, r5                        
  0x08043222: bne        #0x8043280                    
  0x08043224: adds       r2, #2                        
  0x08043226: adds       r1, #2                        
  0x08043228: adds       r3, #1                        
  0x0804322A: cmp        r3, #0xf                      
  0x0804322C: ble        #0x804321c                    
  0x0804322E: ldr        r7, [sp, #4]                  
  0x08043230: ldr        r1, [r7, #0x20]               
  0x08043232: ldr        r0, [r4, #0x40]               
  0x08043234: cmp        r1, r0                        
  0x08043236: bne        #0x8043280                    
  0x08043238: ldr        r1, [sp, #4]                  
  0x0804323A: movs       r2, #0x82                     
  0x0804323C: lsls       r2, r2, #1                    
  0x0804323E: adds       r0, r1, r2                    
  0x08043240: adds       r1, r4, #0                    
  0x08043242: adds       r1, #0x44                     
  0x08043244: ldrb       r0, [r0]                      
  0x08043246: ldrb       r1, [r1]                      
  0x08043248: cmp        r0, r1                        
  0x0804324A: bne        #0x8043280                    
  0x0804324C: ldr        r5, [sp, #4]                  
  0x0804324E: ldr        r7, [pc, #0x2c]                 ; = 0x00000105 
  0x08043250: adds       r0, r5, r7                    
  0x08043252: adds       r1, r4, #0                    
  0x08043254: adds       r1, #0x45                     
  0x08043256: ldrb       r0, [r0]                      
  0x08043258: ldrb       r1, [r1]                      
  0x0804325A: cmp        r0, r1                        
  0x0804325C: bne        #0x8043280                    
  0x0804325E: ldr        r0, [sp, #4]                  
  0x08043260: adds       r0, #0x8c                     
  0x08043262: ldr        r1, [r0]                      
  0x08043264: ldr        r0, [r4, #0x48]               
  0x08043266: movs       r2, #1                        
  0x08043268: cmp        r1, r0                        
  0x0804326A: beq        #0x804326e                    
  0x0804326C: movs       r2, #0                        
  0x0804326E: cmp        r2, #0                        
  0x08043270: beq        #0x8043280                    
  0x08043272: movs       r0, #0x58                     
  0x08043274: muls       r0, r6, r0                    
  0x08043276: add        r0, sb                        
  0x08043278: str        r0, [sp]                      
  0x0804327A: b          #0x8043286                    
  0x08043280: adds       r6, #1                        
  0x08043282: cmp        r6, #9                        
  0x08043284: ble        #0x8043208                    
  0x08043286: mov        r0, sl                        
  0x08043288: cmp        r0, #0                        
  0x0804328A: beq        #0x80432b0                    
  0x0804328C: mov        r1, sl                        
  0x0804328E: adds       r1, #0x4d                     
  0x08043290: ldrb       r0, [r1]                      
  0x08043292: cmp        r0, #3                        
  0x08043294: bls        #0x804329a                    
  0x08043296: adds       r1, r0, #0                    
  0x08043298: b          #0x804329c                    
  0x0804329A: movs       r1, #3                        
  0x0804329C: ldr        r0, [pc, #8]                  
  0x0804329E: strh       r1, [r0]                      
  0x080432A0: ldr        r1, [pc, #8]                  
  0x080432A2: movs       r0, #1                        
  0x080432A4: b          #0x80432cc                    
  0x080432B0: ldr        r1, [sp]                      
  0x080432B2: cmp        r1, #0                        
  0x080432B4: beq        #0x80432c2                    
  0x080432B6: adds       r1, #0x4d                     
  0x080432B8: ldrb       r0, [r1]                      
  0x080432BA: cmp        r0, #3                        
  0x080432BC: bls        #0x80432c2                    
  0x080432BE: adds       r1, r0, #0                    
  0x080432C0: b          #0x80432c4                    
  0x080432C2: movs       r1, #3                        
  0x080432C4: ldr        r0, [pc, #0x18]                 ; = 0x0200C990 
  0x080432C6: strh       r1, [r0]                      
  0x080432C8: ldr        r1, [pc, #0x18]                 ; = 0x0200C994 
  0x080432CA: movs       r0, #0                        
  0x080432CC: str        r0, [r1]                      
  0x080432CE: add        sp, #8                        
  0x080432D0: pop        {r3, r4, r5}                  
  0x080432D2: mov        r8, r3                        
  0x080432D4: mov        sb, r4                        
  0x080432D6: mov        sl, r5                        
  0x080432D8: pop        {r4, r5, r6, r7}              
  0x080432DA: pop        {r1}                          
  0x080432DC: bx         r1                            