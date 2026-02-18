; Function at 0x08000310
; 9 instructions traced

  0x08000310: push       {lr}                          
  0x08000312: ldr        r0, [r0, #8]                  
  0x08000314: cmp        r0, #0                        
  0x08000316: beq        #0x800031c                    
  0x08000318: movs       r0, #0                        
  0x0800031A: b          #0x800031e                    
  0x0800031C: movs       r0, #1                        
  0x0800031E: pop        {r1}                          
  0x08000320: bx         r1                            