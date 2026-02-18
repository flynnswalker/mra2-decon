; Function at 0x080020A0
; 129 instructions traced

  0x080020A0: push       {r4, r5, r6, r7, lr}          
  0x080020A2: mov        r7, r8                        
  0x080020A4: push       {r7}                          
  0x080020A6: sub        sp, #8                        
  0x080020A8: lsls       r0, r0, #0x18                 
  0x080020AA: lsrs       r5, r0, #0x18                 
  0x080020AC: lsls       r1, r1, #0x18                 
  0x080020AE: lsrs       r4, r1, #0x18                 
  0x080020B0: cmp        r4, #0x1d                     
  0x080020B2: bls        #0x80020b6                    
  0x080020B4: adds       r4, r5, #0                    
  0x080020B6: mov        r0, sp                        
  0x080020B8: strb       r5, [r0]                      
  0x080020BA: strb       r4, [r0, #1]                  
  0x080020BC: movs       r0, #0x64                     
  0x080020BE: bl         #0x8053564                    
  0x080020C2: lsls       r0, r0, #0x18                 
  0x080020C4: lsrs       r6, r0, #0x18                 
  0x080020C6: movs       r0, #0                        
  0x080020C8: mov        ip, r0                        
  0x080020CA: movs       r3, #0                        
  0x080020CC: ldr        r2, [pc, #0xa4]                 ; = 0x081E927C 
  0x080020CE: lsls       r1, r5, #3                    
  0x080020D0: subs       r0, r1, r5                    
  0x080020D2: lsls       r0, r0, #1                    
  0x080020D4: adds       r0, r0, r2                    
  0x080020D6: ldrb       r0, [r0]                      
  0x080020D8: adds       r2, r1, #0                    
  0x080020DA: add        r7, sp, #4                    
  0x080020DC: lsls       r1, r4, #3                    
  0x080020DE: mov        r8, r1                        
  0x080020E0: cmp        r0, #0                        
  0x080020E2: beq        #0x80020e8                    
  0x080020E4: cmp        r6, r0                        
  0x080020E6: blo        #0x8002108                    
  0x080020E8: adds       r0, r3, #1                    
  0x080020EA: lsls       r0, r0, #0x18                 
  0x080020EC: lsrs       r3, r0, #0x18                 
  0x080020EE: cmp        r3, #0xe                      
  0x080020F0: bhi        #0x8002108                    
  0x080020F2: ldr        r1, [pc, #0x80]                 ; = 0x081E927C 
  0x080020F4: subs       r0, r2, r5                    
  0x080020F6: lsls       r0, r0, #1                    
  0x080020F8: adds       r0, r0, r3                    
  0x080020FA: adds       r0, r0, r1                    
  0x080020FC: ldrb       r0, [r0]                      
  0x080020FE: cmp        r0, #0                        
  0x08002100: beq        #0x80020e8                    
  0x08002102: cmp        r6, r0                        
  0x08002104: bhs        #0x80020e8                    
  0x08002106: mov        ip, r3                        
  0x08002108: mov        r6, ip                        
  0x0800210A: strb       r6, [r7]                      
  0x0800210C: movs       r0, #0x64                     
  0x0800210E: bl         #0x8053564                    
  0x08002112: lsls       r0, r0, #0x18                 
  0x08002114: lsrs       r3, r0, #0x18                 
  0x08002116: movs       r5, #0                        
  0x08002118: movs       r2, #0                        
  0x0800211A: ldr        r1, [pc, #0x58]                 ; = 0x081E927C 
  0x0800211C: mov        r6, r8                        
  0x0800211E: subs       r0, r6, r4                    
  0x08002120: lsls       r0, r0, #1                    
  0x08002122: adds       r0, r0, r1                    
  0x08002124: ldrb       r0, [r0]                      
  0x08002126: cmp        r0, #0                        
  0x08002128: beq        #0x800212e                    
  0x0800212A: cmp        r3, r0                        
  0x0800212C: blo        #0x8002150                    
  0x0800212E: adds       r0, r2, #1                    
  0x08002130: lsls       r0, r0, #0x18                 
  0x08002132: lsrs       r2, r0, #0x18                 
  0x08002134: cmp        r2, #0xe                      
  0x08002136: bhi        #0x8002150                    
  0x08002138: ldr        r1, [pc, #0x38]                 ; = 0x081E927C 
  0x0800213A: mov        r6, r8                        
  0x0800213C: subs       r0, r6, r4                    
  0x0800213E: lsls       r0, r0, #1                    
  0x08002140: adds       r0, r0, r2                    
  0x08002142: adds       r0, r0, r1                    
  0x08002144: ldrb       r0, [r0]                      
  0x08002146: cmp        r0, #0                        
  0x08002148: beq        #0x800212e                    
  0x0800214A: cmp        r3, r0                        
  0x0800214C: bhs        #0x800212e                    
  0x0800214E: adds       r5, r2, #0                    
  0x08002150: strb       r5, [r7, #1]                  
  0x08002152: mov        r2, sp                        
  0x08002154: adds       r4, r7, #0                    
  0x08002156: ldrb       r1, [r2, #1]                  
  0x08002158: ldrb       r0, [r2]                      
  0x0800215A: cmp        r0, r1                        
  0x0800215C: beq        #0x800219c                    
  0x0800215E: movs       r1, #0                        
  0x08002160: adds       r0, r2, r1                    
  0x08002162: ldrb       r0, [r0]                      
  0x08002164: cmp        r0, #0xf                      
  0x08002166: beq        #0x8002180                    
  0x08002168: cmp        r0, #0xf                      
  0x0800216A: bgt        #0x8002178                    
  0x0800216C: cmp        r0, #4                        
  0x0800216E: beq        #0x8002180                    
  0x08002170: b          #0x8002186                    
  0x08002178: cmp        r0, #0x19                     
  0x0800217A: beq        #0x8002180                    
  0x0800217C: cmp        r0, #0x1c                     
  0x0800217E: bne        #0x8002186                    
  0x08002180: adds       r0, r4, r1                    
  0x08002182: ldrb       r0, [r0]                      
  0x08002184: b          #0x80021a2                    
  0x08002186: adds       r0, r1, #1                    
  0x08002188: lsls       r0, r0, #0x18                 
  0x0800218A: lsrs       r1, r0, #0x18                 
  0x0800218C: cmp        r1, #1                        
  0x0800218E: bls        #0x8002160                    
  0x08002190: movs       r0, #3                        
  0x08002192: bl         #0x8053564                    
  0x08002196: lsls       r0, r0, #0x18                 
  0x08002198: cmp        r0, #0                        
  0x0800219A: beq        #0x80021a0                    
  0x0800219C: ldrb       r0, [r4]                      
  0x0800219E: b          #0x80021a2                    
  0x080021A0: ldrb       r0, [r4, #1]                  
  0x080021A2: add        sp, #8                        
  0x080021A4: pop        {r3}                          
  0x080021A6: mov        r8, r3                        
  0x080021A8: pop        {r4, r5, r6, r7}              
  0x080021AA: pop        {r1}                          
  0x080021AC: bx         r1                            