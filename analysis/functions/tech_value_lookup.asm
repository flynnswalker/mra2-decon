; Function at 0x08068714
; 22 instructions traced

  0x08068714: push       {r4, r5, lr}                  
  0x08068716: movs       r2, #0                        
  0x08068718: ldr        r3, [pc, #0x14]                 ; = 0x083F316C 
  0x0806871A: ldrh       r4, [r0]                      
  0x0806871C: adds       r5, r3, #1                    
  0x0806871E: lsls       r1, r2, #1                    
  0x08068720: adds       r0, r1, r3                    
  0x08068722: ldrb       r0, [r0]                      
  0x08068724: cmp        r0, r4                        
  0x08068726: bne        #0x8068734                    
  0x08068728: adds       r0, r1, r5                    
  0x0806872A: ldrb       r0, [r0]                      
  0x0806872C: b          #0x8068740                    
  0x08068734: adds       r0, r2, #1                    
  0x08068736: lsls       r0, r0, #0x18                 
  0x08068738: lsrs       r2, r0, #0x18                 
  0x0806873A: cmp        r2, #8                        
  0x0806873C: bls        #0x806871e                    
  0x0806873E: movs       r0, #8                        
  0x08068740: pop        {r4, r5}                      
  0x08068742: pop        {r1}                          
  0x08068744: bx         r1                            