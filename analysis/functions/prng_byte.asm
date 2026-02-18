; Function at 0x08063588
; 25 instructions traced

  0x08063588: push       {lr}                          
  0x0806358A: sub        sp, #4                        
  0x0806358C: ldr        r3, [pc, #0x2c]                 ; = 0x0201E15C 
  0x0806358E: ldrh       r0, [r3]                      
  0x08063590: str        r0, [sp]                      
  0x08063592: cmp        r0, #0                        
  0x08063594: bne        #0x806359a                    
  0x08063596: ldr        r0, [pc, #0x28]                 ; = 0x2A6D365A 
  0x08063598: str        r0, [sp]                      
  0x0806359A: ldr        r0, [sp]                      
  0x0806359C: lsls       r1, r0, #2                    
  0x0806359E: adds       r1, r1, r0                    
  0x080635A0: lsls       r1, r1, #3                    
  0x080635A2: adds       r1, r1, r0                    
  0x080635A4: str        r1, [sp]                      
  0x080635A6: mov        r2, sp                        
  0x080635A8: ldrh       r0, [r2, #2]                  
  0x080635AA: adds       r0, r0, r1                    
  0x080635AC: strh       r0, [r2, #2]                  
  0x080635AE: strh       r1, [r3]                      
  0x080635B0: lsls       r0, r0, #0x18                 
  0x080635B2: lsrs       r0, r0, #0x18                 
  0x080635B4: add        sp, #4                        
  0x080635B6: pop        {r1}                          
  0x080635B8: bx         r1                            