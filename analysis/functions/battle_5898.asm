; Function at 0x08045898
; 140 instructions traced

  0x08045898: push       {r4, r5, r6, lr}              
  0x0804589A: sub        sp, #0xc                      
  0x0804589C: lsls       r0, r0, #0x18                 
  0x0804589E: lsrs       r5, r0, #0x18                 
  0x080458A0: lsls       r1, r1, #0x18                 
  0x080458A2: lsrs       r6, r1, #0x18                 
  0x080458A4: lsls       r2, r2, #0x18                 
  0x080458A6: lsrs       r4, r2, #0x18                 
  0x080458A8: lsls       r3, r3, #0x18                 
  0x080458AA: lsrs       r2, r3, #0x18                 
  0x080458AC: cmp        r2, #0xff                     
  0x080458AE: beq        #0x80458fc                    
  0x080458B0: cmp        r2, #9                        
  0x080458B2: bhi        #0x80458d0                    
  0x080458B4: ldr        r0, [pc, #0x10]                 ; = 0x06010000 
  0x080458B6: ldr        r3, [pc, #0x14]                 ; = 0x0842A090 
  0x080458B8: lsls       r2, r2, #2                    
  0x080458BA: lsls       r1, r5, #2                    
  0x080458BC: adds       r1, r1, r5                    
  0x080458BE: lsls       r1, r1, #3                    
  0x080458C0: adds       r2, r2, r1                    
  0x080458C2: adds       r2, r2, r3                    
  0x080458C4: ldr        r3, [r2]                      
  0x080458C6: b          #0x80458da                    
  0x080458D0: ldr        r0, [pc, #0x1c]                 ; = 0x06010000 
  0x080458D2: ldr        r1, [pc, #0x20]                 ; = 0x0842A090 
  0x080458D4: ldr        r2, [pc, #0x20]                 ; = 0x000004B4 
  0x080458D6: adds       r1, r1, r2                    
  0x080458D8: ldr        r3, [r1]                      
  0x080458DA: movs       r1, #0x10                     
  0x080458DC: str        r1, [sp]                      
  0x080458DE: str        r1, [sp, #4]                  
  0x080458E0: movs       r1, #0                        
  0x080458E2: str        r1, [sp, #8]                  
  0x080458E4: movs       r1, #0x38                     
  0x080458E6: movs       r2, #0xd0                     
  0x080458E8: bl         #0x8067414                    
  0x080458EC: b          #0x804591a                    
  0x080458FC: ldr        r0, [pc, #0x38]                 ; = 0x06010000 
  0x080458FE: ldr        r1, [pc, #0x3c]                 ; = 0x0842A090 
  0x08045900: movs       r2, #0x96                     
  0x08045902: lsls       r2, r2, #3                    
  0x08045904: adds       r1, r1, r2                    
  0x08045906: ldr        r3, [r1]                      
  0x08045908: movs       r1, #0x10                     
  0x0804590A: str        r1, [sp]                      
  0x0804590C: str        r1, [sp, #4]                  
  0x0804590E: movs       r1, #0                        
  0x08045910: str        r1, [sp, #8]                  
  0x08045912: movs       r1, #0x38                     
  0x08045914: movs       r2, #0xd0                     
  0x08045916: bl         #0x8067414                    
  0x0804591A: cmp        r4, #0xff                     
  0x0804591C: beq        #0x804596c                    
  0x0804591E: cmp        r4, #9                        
  0x08045920: bhi        #0x8045940                    
  0x08045922: ldr        r0, [pc, #0x14]                 ; = 0x06010000 
  0x08045924: ldr        r3, [pc, #0x14]                 ; = 0x0842A090 
  0x08045926: lsls       r2, r4, #2                    
  0x08045928: lsls       r1, r5, #2                    
  0x0804592A: adds       r1, r1, r5                    
  0x0804592C: lsls       r1, r1, #3                    
  0x0804592E: adds       r2, r2, r1                    
  0x08045930: adds       r2, r2, r3                    
  0x08045932: ldr        r3, [r2]                      
  0x08045934: b          #0x804594a                    
  0x08045940: ldr        r0, [pc, #0x1c]                 ; = 0x06010000 
  0x08045942: ldr        r1, [pc, #0x20]                 ; = 0x0842A090 
  0x08045944: ldr        r2, [pc, #0x20]                 ; = 0x000004B4 
  0x08045946: adds       r1, r1, r2                    
  0x08045948: ldr        r3, [r1]                      
  0x0804594A: movs       r1, #0x10                     
  0x0804594C: str        r1, [sp]                      
  0x0804594E: str        r1, [sp, #4]                  
  0x08045950: movs       r1, #0                        
  0x08045952: str        r1, [sp, #8]                  
  0x08045954: movs       r1, #0x48                     
  0x08045956: movs       r2, #0xd0                     
  0x08045958: bl         #0x8067414                    
  0x0804595C: b          #0x804598a                    
  0x0804596C: ldr        r0, [pc, #0x38]                 ; = 0x06010000 
  0x0804596E: ldr        r1, [pc, #0x3c]                 ; = 0x0842A090 
  0x08045970: movs       r2, #0x96                     
  0x08045972: lsls       r2, r2, #3                    
  0x08045974: adds       r1, r1, r2                    
  0x08045976: ldr        r3, [r1]                      
  0x08045978: movs       r1, #0x10                     
  0x0804597A: str        r1, [sp]                      
  0x0804597C: str        r1, [sp, #4]                  
  0x0804597E: movs       r1, #0                        
  0x08045980: str        r1, [sp, #8]                  
  0x08045982: movs       r1, #0x48                     
  0x08045984: movs       r2, #0xd0                     
  0x08045986: bl         #0x8067414                    
  0x0804598A: cmp        r6, #0xff                     
  0x0804598C: beq        #0x80459dc                    
  0x0804598E: cmp        r6, #9                        
  0x08045990: bhi        #0x80459b0                    
  0x08045992: ldr        r0, [pc, #0x14]                 ; = 0x06010000 
  0x08045994: ldr        r3, [pc, #0x14]                 ; = 0x0842A090 
  0x08045996: lsls       r2, r6, #2                    
  0x08045998: lsls       r1, r5, #2                    
  0x0804599A: adds       r1, r1, r5                    
  0x0804599C: lsls       r1, r1, #3                    
  0x0804599E: adds       r2, r2, r1                    
  0x080459A0: adds       r2, r2, r3                    
  0x080459A2: ldr        r3, [r2]                      
  0x080459A4: b          #0x80459ba                    
  0x080459B0: ldr        r0, [pc, #0x1c]                 ; = 0x06010000 
  0x080459B2: ldr        r1, [pc, #0x20]                 ; = 0x0842A090 
  0x080459B4: ldr        r2, [pc, #0x20]                 ; = 0x000004B4 
  0x080459B6: adds       r1, r1, r2                    
  0x080459B8: ldr        r3, [r1]                      
  0x080459BA: movs       r1, #0x10                     
  0x080459BC: str        r1, [sp]                      
  0x080459BE: str        r1, [sp, #4]                  
  0x080459C0: movs       r1, #0                        
  0x080459C2: str        r1, [sp, #8]                  
  0x080459C4: movs       r1, #0x58                     
  0x080459C6: movs       r2, #0xd0                     
  0x080459C8: bl         #0x8067414                    
  0x080459CC: b          #0x80459fa                    
  0x080459DC: ldr        r0, [pc, #0x24]                 ; = 0x06010000 
  0x080459DE: ldr        r1, [pc, #0x28]                 ; = 0x0842A090 
  0x080459E0: movs       r2, #0x96                     
  0x080459E2: lsls       r2, r2, #3                    
  0x080459E4: adds       r1, r1, r2                    
  0x080459E6: ldr        r3, [r1]                      
  0x080459E8: movs       r1, #0x10                     
  0x080459EA: str        r1, [sp]                      
  0x080459EC: str        r1, [sp, #4]                  
  0x080459EE: movs       r1, #0                        
  0x080459F0: str        r1, [sp, #8]                  
  0x080459F2: movs       r1, #0x58                     
  0x080459F4: movs       r2, #0xd0                     
  0x080459F6: bl         #0x8067414                    
  0x080459FA: add        sp, #0xc                      
  0x080459FC: pop        {r4, r5, r6}                  
  0x080459FE: pop        {r0}                          
  0x08045A00: bx         r0                            