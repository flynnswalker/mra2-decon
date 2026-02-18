; Function at 0x0804687C
; 117 instructions traced

  0x0804687C: push       {r4, r5, lr}                  
  0x0804687E: sub        sp, #0x10                     
  0x08046880: adds       r4, r0, #0                    
  0x08046882: lsls       r4, r4, #0x18                 
  0x08046884: lsrs       r4, r4, #0x18                 
  0x08046886: ldr        r5, [pc, #0x28]                 ; = 0x0200D540 
  0x08046888: ldr        r0, [pc, #0x28]                 ; = 0x0840AE84 
  0x0804688A: ldr        r1, [pc, #0x2c]                 ; = 0x050003C0 
  0x0804688C: movs       r2, #8                        
  0x0804688E: bl         #0x81c77c4                    
  0x08046892: cmp        r4, #0                        
  0x08046894: bne        #0x8046910                    
  0x08046896: ldr        r1, [r5]                      
  0x08046898: adds       r0, r1, #0                    
  0x0804689A: adds       r0, #0x48                     
  0x0804689C: ldrh       r0, [r0]                      
  0x0804689E: cmp        r0, #0                        
  0x080468A0: bne        #0x80468d2                    
  0x080468A2: adds       r0, r1, #0                    
  0x080468A4: adds       r0, #0x47                     
  0x080468A6: ldrb       r0, [r0]                      
  0x080468A8: cmp        r0, #0                        
  0x080468AA: beq        #0x80468bc                    
  0x080468AC: movs       r0, #0xd                      
  0x080468AE: b          #0x80468d6                    
  0x080468BC: ldr        r2, [pc, #0xc]                  ; = 0x0000028F 
  0x080468BE: adds       r0, r1, r2                    
  0x080468C0: ldrb       r0, [r0]                      
  0x080468C2: cmp        r0, #0                        
  0x080468C4: bne        #0x80468d0                    
  0x080468C6: movs       r0, #0                        
  0x080468C8: b          #0x80468d6                    
  0x080468D0: adds       r0, #2                        
  0x080468D2: lsls       r0, r0, #0x18                 
  0x080468D4: lsrs       r0, r0, #0x18                 
  0x080468D6: adds       r1, r0, #0                    
  0x080468D8: cmp        r1, #0xd                      
  0x080468DA: bhi        #0x8046992                    
  0x080468DC: cmp        r1, #0                        
  0x080468DE: beq        #0x80468e8                    
  0x080468E0: ldr        r0, [pc, #0]                  
  0x080468E2: b          #0x804694e                    
  0x080468E8: movs       r4, #0                        
  0x080468EA: movs       r0, #0                        
  0x080468EC: str        r0, [sp, #0xc]                
  0x080468EE: lsls       r1, r4, #0xa                  
  0x080468F0: ldr        r0, [pc, #0x14]                 ; = 0x06013200 
  0x080468F2: adds       r1, r1, r0                    
  0x080468F4: add        r0, sp, #0xc                  
  0x080468F6: ldr        r2, [pc, #0x14]                 ; = 0x01000040 
  0x080468F8: bl         #0x81c77c4                    
  0x080468FC: adds       r0, r4, #1                    
  0x080468FE: lsls       r0, r0, #0x18                 
  0x08046900: lsrs       r4, r0, #0x18                 
  0x08046902: cmp        r4, #2                        
  0x08046904: bls        #0x80468ea                    
  0x08046906: b          #0x8046992                    
  0x08046910: ldr        r1, [r5, #0x10]               
  0x08046912: adds       r0, r1, #0                    
  0x08046914: adds       r0, #0x48                     
  0x08046916: ldrh       r0, [r0]                      
  0x08046918: cmp        r0, #0                        
  0x0804691A: bne        #0x804693e                    
  0x0804691C: adds       r0, r1, #0                    
  0x0804691E: adds       r0, #0x47                     
  0x08046920: ldrb       r0, [r0]                      
  0x08046922: cmp        r0, #0                        
  0x08046924: beq        #0x804692a                    
  0x08046926: movs       r0, #0xd                      
  0x08046928: b          #0x8046942                    
  0x0804692A: ldr        r2, [pc, #0xc]                  ; = 0x0000028F 
  0x0804692C: adds       r0, r1, r2                    
  0x0804692E: ldrb       r0, [r0]                      
  0x08046930: cmp        r0, #0                        
  0x08046932: bne        #0x804693c                    
  0x08046934: movs       r0, #0                        
  0x08046936: b          #0x8046942                    
  0x0804693C: adds       r0, #2                        
  0x0804693E: lsls       r0, r0, #0x18                 
  0x08046940: lsrs       r0, r0, #0x18                 
  0x08046942: adds       r1, r0, #0                    
  0x08046944: cmp        r1, #0xd                      
  0x08046946: bhi        #0x8046992                    
  0x08046948: cmp        r1, #0                        
  0x0804694A: beq        #0x8046974                    
  0x0804694C: ldr        r0, [pc, #0x1c]                 ; = 0x06013300 
  0x0804694E: ldr        r2, [pc, #0x20]                 ; = 0x083F27C8 
  0x08046950: lsls       r1, r1, #2                    
  0x08046952: adds       r1, r1, r2                    
  0x08046954: ldr        r3, [r1]                      
  0x08046956: movs       r1, #0x40                     
  0x08046958: str        r1, [sp]                      
  0x0804695A: movs       r1, #0x18                     
  0x0804695C: str        r1, [sp, #4]                  
  0x0804695E: movs       r1, #0                        
  0x08046960: str        r1, [sp, #8]                  
  0x08046962: movs       r2, #0                        
  0x08046964: bl         #0x8067414                    
  0x08046968: b          #0x8046992                    
  0x08046974: movs       r4, #0                        
  0x08046976: movs       r0, #0                        
  0x08046978: str        r0, [sp, #0xc]                
  0x0804697A: lsls       r1, r4, #0xa                  
  0x0804697C: ldr        r0, [pc, #0x1c]                 ; = 0x06013300 
  0x0804697E: adds       r1, r1, r0                    
  0x08046980: add        r0, sp, #0xc                  
  0x08046982: ldr        r2, [pc, #0x1c]                 ; = 0x01000040 
  0x08046984: bl         #0x81c77c4                    
  0x08046988: adds       r0, r4, #1                    
  0x0804698A: lsls       r0, r0, #0x18                 
  0x0804698C: lsrs       r4, r0, #0x18                 
  0x0804698E: cmp        r4, #2                        
  0x08046990: bls        #0x8046976                    
  0x08046992: add        sp, #0x10                     
  0x08046994: pop        {r4, r5}                      
  0x08046996: pop        {r0}                          
  0x08046998: bx         r0                            