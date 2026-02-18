; Function at 0x0800D45C
; 45 instructions traced

  0x0800D45C: push       {r4, r5, r6, lr}              
  0x0800D45E: adds       r4, r0, #0                    
  0x0800D460: ldr        r2, [pc, #0x54]                 ; = 0x08202C00 
  0x0800D462: ldrh       r0, [r2]                      
  0x0800D464: cmp        r1, r0                        
  0x0800D466: blt        #0x800d46a                    
  0x0800D468: movs       r1, #0                        
  0x0800D46A: lsls       r0, r1, #1                    
  0x0800D46C: adds       r0, r0, r2                    
  0x0800D46E: ldrh       r0, [r0, #2]                  
  0x0800D470: adds       r3, r0, r2                    
  0x0800D472: ldr        r0, [r3]                      
  0x0800D474: str        r0, [r4]                      
  0x0800D476: ldr        r0, [r3, #4]                  
  0x0800D478: str        r0, [r4, #4]                  
  0x0800D47A: ldrh       r0, [r3, #8]                  
  0x0800D47C: strh       r0, [r4, #8]                  
  0x0800D47E: ldrh       r0, [r3, #0xa]                
  0x0800D480: strh       r0, [r4, #0xa]                
  0x0800D482: ldrb       r0, [r3, #0xc]                
  0x0800D484: strb       r0, [r4, #0xc]                
  0x0800D486: movs       r2, #0                        
  0x0800D488: adds       r6, r4, #0                    
  0x0800D48A: adds       r6, #0xd                      
  0x0800D48C: adds       r5, r3, #0                    
  0x0800D48E: adds       r5, #0xd                      
  0x0800D490: adds       r0, r6, r2                    
  0x0800D492: adds       r1, r5, r2                    
  0x0800D494: ldrb       r1, [r1]                      
  0x0800D496: strb       r1, [r0]                      
  0x0800D498: adds       r2, #1                        
  0x0800D49A: cmp        r2, #6                        
  0x0800D49C: bls        #0x800d490                    
  0x0800D49E: ldrh       r0, [r3, #0x14]               
  0x0800D4A0: adds       r0, r3, r0                    
  0x0800D4A2: str        r0, [r4, #0x18]               
  0x0800D4A4: ldrh       r0, [r3, #0x16]               
  0x0800D4A6: adds       r0, r3, r0                    
  0x0800D4A8: str        r0, [r4, #0x1c]               
  0x0800D4AA: adds       r0, r3, #0                    
  0x0800D4AC: adds       r0, #0x18                     
  0x0800D4AE: str        r0, [r4, #0x14]               
  0x0800D4B0: pop        {r4, r5, r6}                  
  0x0800D4B2: pop        {r0}                          
  0x0800D4B4: bx         r0                            