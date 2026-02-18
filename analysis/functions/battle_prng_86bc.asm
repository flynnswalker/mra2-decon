; Function at 0x080486BC
; 24 instructions traced

  0x080486BC: push       {r4, lr}                      
  0x080486BE: bl         #0x806354c                      ; -> prng()
  0x080486C2: ldr        r4, [pc, #0x30]                 ; = 0x0200C9F4 
  0x080486C4: ldrb       r0, [r4, #2]                  
  0x080486C6: cmp        r0, #1                        
  0x080486C8: bls        #0x80486ea                    
  0x080486CA: ldr        r0, [pc, #0x2c]                 ; = 0x0200C9D0 
  0x080486CC: ldrb       r1, [r0]                      
  0x080486CE: cmp        r1, #0                        
  0x080486D0: beq        #0x80486e0                    
  0x080486D2: bl         #0x806ef9c                    
  0x080486D6: bl         #0x806ef8c                    
  0x080486DA: adds       r1, r0, #0                    
  0x080486DC: cmp        r1, #0                        
  0x080486DE: bne        #0x80486ea                    
  0x080486E0: ldrb       r0, [r4]                      
  0x080486E2: strb       r0, [r4, #3]                  
  0x080486E4: movs       r0, #9                        
  0x080486E6: strb       r0, [r4]                      
  0x080486E8: strb       r1, [r4, #2]                  
  0x080486EA: movs       r0, #1                        
  0x080486EC: pop        {r4}                          
  0x080486EE: pop        {r1}                          
  0x080486F0: bx         r1                            