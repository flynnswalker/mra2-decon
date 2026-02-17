; Function at 0x0805B09C
; 25 instructions traced

  0x0805B09C: push       {r4, r5, r6, lr}              
  0x0805B09E: sub        sp, #8                        
  0x0805B0A0: adds       r4, r0, #0                    
  0x0805B0A2: lsls       r1, r1, #0x18                 
  0x0805B0A4: lsrs       r6, r1, #0x18                 
  0x0805B0A6: ldr        r5, [r4, #8]                  
  0x0805B0A8: cmp        r5, #0                        
  0x0805B0AA: beq        #0x805b0cc                    
  0x0805B0AC: ldr        r0, [r4]                      
  0x0805B0AE: ldr        r1, [r4, #4]                  
  0x0805B0B0: ldrh       r2, [r4, #0x20]               
  0x0805B0B2: ldr        r3, [pc, #0x20]                 ; = 0x08208CB0 
  0x0805B0B4: str        r3, [sp]                      
  0x0805B0B6: str        r6, [sp, #4]                  
  0x0805B0B8: adds       r3, r5, #0                    
  0x0805B0BA: bl         #0x805fb5c                    
  0x0805B0BE: str        r0, [r4, #0x24]               
  0x0805B0C0: adds       r0, r5, #0                    
  0x0805B0C2: bl         #0x8002648                    
  0x0805B0C6: adds       r0, r5, #0                    
  0x0805B0C8: bl         #0x800d410                    
  0x0805B0CC: add        sp, #8                        
  0x0805B0CE: pop        {r4, r5, r6}                  
  0x0805B0D0: pop        {r0}                          
  0x0805B0D2: bx         r0                            