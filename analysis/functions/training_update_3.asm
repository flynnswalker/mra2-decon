; Function at 0x0806B264
; 269 instructions traced

  0x0806B264: push       {r4, r5, r6, r7, lr}          
  0x0806B266: mov        r7, sl                        
  0x0806B268: mov        r6, sb                        
  0x0806B26A: mov        r5, r8                        
  0x0806B26C: push       {r5, r6, r7}                  
  0x0806B26E: sub        sp, #0xe4                     
  0x0806B270: adds       r4, r0, #0                    
  0x0806B272: lsls       r4, r4, #0x18                 
  0x0806B274: lsrs       r4, r4, #0x18                 
  0x0806B276: ldr        r0, [pc, #0xdc]                 ; = 0x081C9F80 STAT_GROWTH_TABLE
  0x0806B278: ldr        r1, [r0, #4]                  
  0x0806B27A: ldr        r0, [r0]                      
  0x0806B27C: add        r2, sp, #0xcc                 
  0x0806B27E: mov        r8, r2                        
  0x0806B280: mov        r3, r8                        
  0x0806B282: str        r0, [r3]                      
  0x0806B284: str        r1, [r3, #4]                  
  0x0806B286: ldr        r1, [pc, #0xd0]                 ; = 0x081CA700 
  0x0806B288: add        r0, sp, #0xc                  
  0x0806B28A: movs       r2, #0x68                     
  0x0806B28C: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x0806B290: add        r5, sp, #0x74                 
  0x0806B292: ldr        r1, [pc, #0xc8]                 ; = 0x081CA768 
  0x0806B294: adds       r0, r5, #0                    
  0x0806B296: movs       r2, #0x58                     
  0x0806B298: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x0806B29C: movs       r0, #0x98                     
  0x0806B29E: adds       r1, r4, #0                    
  0x0806B2A0: muls       r1, r0, r1                    
  0x0806B2A2: ldr        r0, [pc, #0xbc]                 ; = 0x0201E558 
  0x0806B2A4: adds       r6, r1, r0                    
  0x0806B2A6: lsls       r4, r4, #2                    
  0x0806B2A8: ldr        r0, [pc, #0xb8]                 ; = 0x083F31F4 
  0x0806B2AA: adds       r0, r0, r4                    
  0x0806B2AC: mov        ip, r0                        
  0x0806B2AE: ldr        r0, [pc, #0xb8]                 ; = 0x083F32BC 
  0x0806B2B0: adds       r0, r4, r0                    
  0x0806B2B2: str        r0, [sp, #0xdc]               
  0x0806B2B4: ldr        r0, [pc, #0xb4]                 ; = 0x083F33A4 
  0x0806B2B6: adds       r4, r4, r0                    
  0x0806B2B8: str        r4, [sp, #0xe0]               
  0x0806B2BA: adds       r1, r6, #0                    
  0x0806B2BC: adds       r1, #0x8d                     
  0x0806B2BE: ldrb       r0, [r1]                      
  0x0806B2C0: mov        sb, r5                        
  0x0806B2C2: add        r7, sp, #0xd4                 
  0x0806B2C4: cmp        r0, #0                        
  0x0806B2C6: beq        #0x806b30a                    
  0x0806B2C8: movs       r0, #0                        
  0x0806B2CA: strb       r0, [r1]                      
  0x0806B2CC: adds       r3, r6, #0                    
  0x0806B2CE: adds       r3, #0x8f                     
  0x0806B2D0: ldrb       r0, [r3]                      
  0x0806B2D2: lsls       r0, r0, #2                    
  0x0806B2D4: add        r0, r8                        
  0x0806B2D6: ldrh       r2, [r0]                      
  0x0806B2D8: ldr        r1, [pc, #0x94]                 ; = 0xFFFF0000 
  0x0806B2DA: ldr        r0, [r7]                      
  0x0806B2DC: ands       r0, r1                        
  0x0806B2DE: orrs       r0, r2                        
  0x0806B2E0: str        r0, [r7]                      
  0x0806B2E2: ldrb       r0, [r3]                      
  0x0806B2E4: lsls       r0, r0, #2                    
  0x0806B2E6: add        r0, r8                        
  0x0806B2E8: ldrh       r0, [r0, #2]                  
  0x0806B2EA: strh       r0, [r7, #2]                  
  0x0806B2EC: movs       r0, #0x30                     
  0x0806B2EE: strh       r0, [r7, #4]                  
  0x0806B2F0: strh       r0, [r7, #6]                  
  0x0806B2F2: ldr        r0, [pc, #0x80]                 ; = 0x06010000 
  0x0806B2F4: mov        r2, ip                        
  0x0806B2F6: ldrh       r1, [r2]                      
  0x0806B2F8: ldrh       r2, [r2, #2]                  
  0x0806B2FA: ldr        r3, [pc, #0x7c]                 ; = 0x08775D0C 
  0x0806B2FC: movs       r4, #0xf0                     
  0x0806B2FE: str        r4, [sp]                      
  0x0806B300: movs       r4, #0x60                     
  0x0806B302: str        r4, [sp, #4]                  
  0x0806B304: str        r7, [sp, #8]                  
  0x0806B306: bl         #0x8065f6c                    
  0x0806B30A: movs       r3, #0                        
  0x0806B30C: adds       r0, r6, #0                    
  0x0806B30E: adds       r0, #0x90                     
  0x0806B310: ldrb       r1, [r0]                      
  0x0806B312: adds       r2, r0, #0                    
  0x0806B314: cmp        r1, #0                        
  0x0806B316: beq        #0x806b334                    
  0x0806B318: cmp        r1, #3                        
  0x0806B31A: beq        #0x806b334                    
  0x0806B31C: cmp        r1, #6                        
  0x0806B31E: beq        #0x806b334                    
  0x0806B320: cmp        r1, #9                        
  0x0806B322: beq        #0x806b334                    
  0x0806B324: cmp        r1, #0xd                      
  0x0806B326: beq        #0x806b334                    
  0x0806B328: cmp        r1, #0x10                     
  0x0806B32A: beq        #0x806b334                    
  0x0806B32C: cmp        r1, #0x13                     
  0x0806B32E: beq        #0x806b334                    
  0x0806B330: cmp        r1, #0x16                     
  0x0806B332: bne        #0x806b38e                    
  0x0806B334: adds       r1, r6, #0                    
  0x0806B336: adds       r1, #0x92                     
  0x0806B338: ldrh       r0, [r1]                      
  0x0806B33A: adds       r0, #1                        
  0x0806B33C: strh       r0, [r1]                      
  0x0806B33E: lsls       r0, r0, #0x10                 
  0x0806B340: lsrs       r0, r0, #0x10                 
  0x0806B342: cmp        r0, #0x39                     
  0x0806B344: bne        #0x806b34a                    
  0x0806B346: movs       r0, #0                        
  0x0806B348: strh       r0, [r1]                      
  0x0806B34A: ldrh       r0, [r1]                      
  0x0806B34C: cmp        r0, #0x31                     
  0x0806B34E: bhi        #0x806b37c                    
  0x0806B350: movs       r3, #0                        
  0x0806B352: b          #0x806b38e                    
  0x0806B37C: cmp        r0, #0x33                     
  0x0806B37E: bls        #0x806b38c                    
  0x0806B380: cmp        r0, #0x36                     
  0x0806B382: bhi        #0x806b388                    
  0x0806B384: movs       r3, #2                        
  0x0806B386: b          #0x806b38e                    
  0x0806B388: cmp        r0, #0x38                     
  0x0806B38A: bhi        #0x806b38e                    
  0x0806B38C: movs       r3, #1                        
  0x0806B38E: adds       r0, r6, #0                    
  0x0806B390: adds       r0, #0x8f                     
  0x0806B392: ldrb       r1, [r0]                      
  0x0806B394: mov        r8, r0                        
  0x0806B396: cmp        r1, #1                        
  0x0806B398: bne        #0x806b3a8                    
  0x0806B39A: ldrb       r0, [r2]                      
  0x0806B39C: cmp        r0, #0xc                      
  0x0806B39E: bhi        #0x806b3a8                    
  0x0806B3A0: adds       r0, r3, #0                    
  0x0806B3A2: adds       r0, #0xd                      
  0x0806B3A4: lsls       r0, r0, #0x18                 
  0x0806B3A6: lsrs       r3, r0, #0x18                 
  0x0806B3A8: ldrb       r0, [r2]                      
  0x0806B3AA: adds       r0, r0, r3                    
  0x0806B3AC: lsls       r0, r0, #2                    
  0x0806B3AE: add        r0, sp, r0                    
  0x0806B3B0: adds       r0, #0xc                      
  0x0806B3B2: ldrh       r0, [r0]                      
  0x0806B3B4: strh       r0, [r7]                      
  0x0806B3B6: ldrb       r0, [r2]                      
  0x0806B3B8: adds       r0, r0, r3                    
  0x0806B3BA: lsls       r0, r0, #2                    
  0x0806B3BC: add        r0, sp, r0                    
  0x0806B3BE: adds       r0, #0xc                      
  0x0806B3C0: ldrh       r0, [r0, #2]                  
  0x0806B3C2: add        r5, sp, #0xd4                 
  0x0806B3C4: strh       r0, [r5, #2]                  
  0x0806B3C6: movs       r3, #0x18                     
  0x0806B3C8: mov        sl, r3                        
  0x0806B3CA: mov        r0, sl                        
  0x0806B3CC: strh       r0, [r5, #4]                  
  0x0806B3CE: movs       r1, #0x10                     
  0x0806B3D0: strh       r1, [r5, #6]                  
  0x0806B3D2: ldr        r0, [pc, #0x60]                 ; = 0x06010000 
  0x0806B3D4: ldr        r2, [sp, #0xdc]               
  0x0806B3D6: ldrh       r1, [r2]                      
  0x0806B3D8: ldrh       r2, [r2, #2]                  
  0x0806B3DA: ldr        r3, [pc, #0x5c]                 ; = 0x08775D0C 
  0x0806B3DC: movs       r4, #0xf0                     
  0x0806B3DE: str        r4, [sp]                      
  0x0806B3E0: movs       r4, #0x60                     
  0x0806B3E2: str        r4, [sp, #4]                  
  0x0806B3E4: str        r5, [sp, #8]                  
  0x0806B3E6: bl         #0x8065f6c                    
  0x0806B3EA: adds       r0, r6, #0                    
  0x0806B3EC: adds       r0, #0x8a                     
  0x0806B3EE: ldrb       r0, [r0]                      
  0x0806B3F0: cmp        r0, #0                        
  0x0806B3F2: beq        #0x806b43c                    
  0x0806B3F4: adds       r0, r6, #0                    
  0x0806B3F6: bl         #0x80687c4                    
  0x0806B3FA: adds       r1, r6, #0                    
  0x0806B3FC: adds       r1, #0x96                     
  0x0806B3FE: strb       r0, [r1]                      
  0x0806B400: mov        r3, r8                        
  0x0806B402: ldrb       r0, [r3]                      
  0x0806B404: cmp        r0, #1                        
  0x0806B406: bne        #0x806b474                    
  0x0806B408: adds       r0, r6, #0                    
  0x0806B40A: adds       r0, #0x91                     
  0x0806B40C: ldrb       r0, [r0]                      
  0x0806B40E: cmp        r0, #0xa                      
  0x0806B410: bhi        #0x806b474                    
  0x0806B412: ldrb       r0, [r1]                      
  0x0806B414: adds       r0, #0xb                      
  0x0806B416: lsls       r0, r0, #2                    
  0x0806B418: add        r0, sb                        
  0x0806B41A: ldrh       r0, [r0]                      
  0x0806B41C: strh       r0, [r7]                      
  0x0806B41E: ldrb       r0, [r1]                      
  0x0806B420: adds       r0, #0xb                      
  0x0806B422: lsls       r0, r0, #2                    
  0x0806B424: add        r0, sb                        
  0x0806B426: ldrh       r0, [r0, #2]                  
  0x0806B428: strh       r0, [r5, #2]                  
  0x0806B42A: mov        r0, sl                        
  0x0806B42C: strh       r0, [r5, #4]                  
  0x0806B42E: movs       r1, #0x10                     
  0x0806B430: strh       r1, [r5, #6]                  
  0x0806B432: b          #0x806b492                    
  0x0806B43C: adds       r1, r6, #0                    
  0x0806B43E: adds       r1, #0x96                     
  0x0806B440: movs       r0, #0                        
  0x0806B442: strb       r0, [r1]                      
  0x0806B444: mov        r2, r8                        
  0x0806B446: ldrb       r0, [r2]                      
  0x0806B448: subs       r1, #5                        
  0x0806B44A: cmp        r0, #1                        
  0x0806B44C: bne        #0x806b474                    
  0x0806B44E: ldrb       r0, [r1]                      
  0x0806B450: cmp        r0, #0xa                      
  0x0806B452: bhi        #0x806b474                    
  0x0806B454: adds       r0, #0xb                      
  0x0806B456: lsls       r0, r0, #2                    
  0x0806B458: add        r0, sb                        
  0x0806B45A: ldrh       r0, [r0]                      
  0x0806B45C: strh       r0, [r7]                      
  0x0806B45E: ldrb       r0, [r1]                      
  0x0806B460: adds       r0, #0xb                      
  0x0806B462: lsls       r0, r0, #2                    
  0x0806B464: add        r0, sb                        
  0x0806B466: ldrh       r0, [r0, #2]                  
  0x0806B468: strh       r0, [r5, #2]                  
  0x0806B46A: mov        r3, sl                        
  0x0806B46C: strh       r3, [r5, #4]                  
  0x0806B46E: movs       r0, #0x10                     
  0x0806B470: strh       r0, [r5, #6]                  
  0x0806B472: b          #0x806b492                    
  0x0806B474: ldrb       r0, [r1]                      
  0x0806B476: lsls       r0, r0, #2                    
  0x0806B478: add        r0, sb                        
  0x0806B47A: ldrh       r0, [r0]                      
  0x0806B47C: strh       r0, [r7]                      
  0x0806B47E: ldrb       r0, [r1]                      
  0x0806B480: lsls       r0, r0, #2                    
  0x0806B482: add        r0, sb                        
  0x0806B484: ldrh       r0, [r0, #2]                  
  0x0806B486: add        r1, sp, #0xd4                 
  0x0806B488: strh       r0, [r1, #2]                  
  0x0806B48A: movs       r0, #0x18                     
  0x0806B48C: strh       r0, [r1, #4]                  
  0x0806B48E: movs       r0, #0x10                     
  0x0806B490: strh       r0, [r1, #6]                  
  0x0806B492: ldr        r0, [pc, #0x28]                 ; = 0x06010000 
  0x0806B494: ldr        r2, [sp, #0xe0]               
  0x0806B496: ldrh       r1, [r2]                      
  0x0806B498: ldrh       r2, [r2, #2]                  
  0x0806B49A: ldr        r3, [pc, #0x24]                 ; = 0x08775D0C 
  0x0806B49C: movs       r4, #0xf0                     
  0x0806B49E: str        r4, [sp]                      
  0x0806B4A0: movs       r4, #0x60                     
  0x0806B4A2: str        r4, [sp, #4]                  
  0x0806B4A4: str        r7, [sp, #8]                  
  0x0806B4A6: bl         #0x8065f6c                    
  0x0806B4AA: add        sp, #0xe4                     
  0x0806B4AC: pop        {r3, r4, r5}                  
  0x0806B4AE: mov        r8, r3                        
  0x0806B4B0: mov        sb, r4                        
  0x0806B4B2: mov        sl, r5                        
  0x0806B4B4: pop        {r4, r5, r6, r7}              
  0x0806B4B6: pop        {r0}                          
  0x0806B4B8: bx         r0                            