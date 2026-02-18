; Function at 0x08043C80
; 19 instructions traced

  0x08043C80: adds       r0, r4, r6                    
  0x08043C82: adds       r1, r5, #0                    
  0x08043C84: adds       r1, #0x45                     
  0x08043C86: ldrb       r0, [r0]                      
  0x08043C88: ldrb       r1, [r1]                      
  0x08043C8A: cmp        r0, r1                        
  0x08043C8C: bne        #0x8043ca4                    
  0x08043C8E: adds       r0, r4, #0                    
  0x08043C90: adds       r0, #0x8c                     
  0x08043C92: ldr        r1, [r0]                      
  0x08043C94: ldr        r0, [r5, #0x48]               
  0x08043C96: cmp        r1, r0                        
  0x08043C98: bne        #0x8043ca4                    
  0x08043C9A: movs       r0, #1                        
  0x08043C9C: b          #0x8043ca6                    
  0x08043CA4: movs       r0, #0                        
  0x08043CA6: pop        {r4, r5, r6}                  
  0x08043CA8: pop        {r1}                          
  0x08043CAA: bx         r1                            