; Function at 0x08020700
; 46 instructions traced

  0x08020700: bl         #0x80682e0                    
  0x08020704: adds       r4, r0, #0                    
  0x08020706: ldr        r6, [pc, #0x50]                 ; = 0x0200A398 
  0x08020708: ldr        r0, [r6]                      
  0x0802070A: adds       r1, r0, #0                    
  0x0802070C: adds       r1, #0x46                     
  0x0802070E: ldrh       r1, [r1]                      
  0x08020710: adds       r0, #0x4c                     
  0x08020712: ldrb       r2, [r0]                      
  0x08020714: adds       r0, r5, #0                    
  0x08020716: bl         #0x8018788                    
  0x0802071A: cmp        r4, #1                        
  0x0802071C: bne        #0x8020768                    
  0x0802071E: movs       r0, #0                        
  0x08020720: str        r0, [sp]                      
  0x08020722: ldr        r1, [pc, #0x38]                 ; = 0x040000D4 
  0x08020724: mov        r0, sp                        
  0x08020726: str        r0, [r1]                      
  0x08020728: movs       r0, #0xc0                     
  0x0802072A: lsls       r0, r0, #0x13                 
  0x0802072C: str        r0, [r1, #4]                  
  0x0802072E: ldr        r0, [pc, #0x30]                 ; = 0x85001400 
  0x08020730: str        r0, [r1, #8]                  
  0x08020732: ldr        r0, [r1, #8]                  
  0x08020734: bl         #0x8068748                    
  0x08020738: cmp        r0, #0                        
  0x0802073A: bne        #0x8020764                    
  0x0802073C: ldr        r1, [r6]                      
  0x0802073E: adds       r0, r1, #0                    
  0x08020740: adds       r0, #0x46                     
  0x08020742: ldrh       r0, [r0]                      
  0x08020744: cmp        r0, #0                        
  0x08020746: bne        #0x8020750                    
  0x08020748: adds       r1, #0x30                     
  0x0802074A: adds       r0, r5, #0                    
  0x0802074C: bl         #0x800048c                    
  0x08020750: movs       r0, #9                        
  0x08020752: b          #0x802076c                    
  0x08020764: movs       r0, #0x19                     
  0x08020766: b          #0x802076c                    
  0x08020768: movs       r0, #0x80                     
  0x0802076A: lsls       r0, r0, #0x18                 
  0x0802076C: add        sp, #4                        
  0x0802076E: pop        {r4, r5, r6}                  
  0x08020770: pop        {r1}                          
  0x08020772: bx         r1                            