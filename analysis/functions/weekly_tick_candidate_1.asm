; Function at 0x0801F800
; 23 instructions traced

  0x0801F800: cmp        r0, #0                        
  0x0801F802: beq        #0x801f820                    
  0x0801F804: ldr        r2, [pc, #0x28]                 ; = 0x081C7F04 
  0x0801F806: adds       r0, r5, #0                    
  0x0801F808: movs       r1, #0xa7                     
  0x0801F80A: movs       r3, #0xa                      
  0x0801F80C: bl         #0x8003608                    
  0x0801F810: adds       r0, r5, #0                    
  0x0801F812: movs       r1, #0xa7                     
  0x0801F814: bl         #0x80035f8                    
  0x0801F818: movs       r1, #0                        
  0x0801F81A: movs       r2, #0                        
  0x0801F81C: bl         #0x801eaf4                    
  0x0801F820: bl         #0x801f470                    
  0x0801F824: cmp        r0, #0                        
  0x0801F826: beq        #0x801f834                    
  0x0801F828: movs       r0, #0x80                     
  0x0801F82A: lsls       r0, r0, #0x18                 
  0x0801F82C: b          #0x801f836                    
  0x0801F834: ldr        r0, [pc, #4]                  
  0x0801F836: pop        {r4, r5}                      
  0x0801F838: pop        {r1}                          
  0x0801F83A: bx         r1                            