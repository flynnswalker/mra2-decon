; Function at 0x08020E64
; 31 instructions traced

  0x08020E64: push       {lr}                          
  0x08020E66: bl         #0x8000310                    
  0x08020E6A: cmp        r0, #0                        
  0x08020E6C: beq        #0x8020e7e                    
  0x08020E6E: ldr        r0, [pc, #0x24]                 ; = 0x0200A398 
  0x08020E70: ldr        r0, [r0]                      
  0x08020E72: adds       r0, #0x46                     
  0x08020E74: movs       r1, #0                        
  0x08020E76: strh       r1, [r0]                      
  0x08020E78: ldr        r0, [pc, #0x1c]                 ; = 0x08117270 
  0x08020E7A: bl         #0x80682b4                    
  0x08020E7E: movs       r0, #0                        
  0x08020E80: bl         #0x8022774                    
  0x08020E84: bl         #0x80682e0                    
  0x08020E88: adds       r3, r0, #0                    
  0x08020E8A: cmp        r3, #1                        
  0x08020E8C: beq        #0x8020e9c                    
  0x08020E8E: movs       r0, #0x80                     
  0x08020E90: lsls       r0, r0, #0x18                 
  0x08020E92: b          #0x8020eae                    
  0x08020E9C: ldr        r2, [pc, #0x14]                 ; = 0x0200A398 
  0x08020E9E: ldr        r0, [r2]                      
  0x08020EA0: adds       r0, #0x4c                     
  0x08020EA2: movs       r1, #0                        
  0x08020EA4: strb       r1, [r0]                      
  0x08020EA6: ldr        r0, [r2]                      
  0x08020EA8: adds       r0, #0x4d                     
  0x08020EAA: strb       r3, [r0]                      
  0x08020EAC: ldr        r0, [pc, #8]                  
  0x08020EAE: pop        {r1}                          
  0x08020EB0: bx         r1                            