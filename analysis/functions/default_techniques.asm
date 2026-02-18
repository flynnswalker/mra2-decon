; Function at 0x0801E960
; 60 instructions traced

  0x0801E960: push       {r4, r5, r6, r7, lr}          
  0x0801E962: adds       r4, r0, #0                    
  0x0801E964: adds       r6, r2, #0                    
  0x0801E966: lsls       r1, r1, #0x10                 
  0x0801E968: lsrs       r5, r1, #0x10                 
  0x0801E96A: cmp        r5, #2                        
  0x0801E96C: bhi        #0x801e97e                    
  0x0801E96E: movs       r0, #0xff                     
  0x0801E970: strb       r0, [r6, #0x10]               
  0x0801E972: movs       r0, #1                        
  0x0801E974: rsbs       r0, r0, #0                    
  0x0801E976: strb       r0, [r6, #0x11]               
  0x0801E978: strb       r0, [r6, #0x12]               
  0x0801E97A: strb       r0, [r6, #0x13]               
  0x0801E97C: b          #0x801e9d6                    
  0x0801E97E: ldrh       r0, [r4, #4]                  
  0x0801E980: adds       r0, #3                        
  0x0801E982: lsls       r0, r0, #0x10                 
  0x0801E984: lsrs       r2, r0, #0x10                 
  0x0801E986: movs       r3, #3                        
  0x0801E988: ldr        r7, [pc, #0x18]                 ; = 0x081E9AD0 
  0x0801E98A: cmp        r3, r5                        
  0x0801E98C: bhs        #0x801e9c6                    
  0x0801E98E: movs       r0, #1                        
  0x0801E990: ands       r0, r3                        
  0x0801E992: cmp        r0, #0                        
  0x0801E994: beq        #0x801e9a8                    
  0x0801E996: lsls       r0, r3, #1                    
  0x0801E998: adds       r0, r0, r4                    
  0x0801E99A: ldrh       r0, [r0]                      
  0x0801E99C: adds       r0, r0, r3                    
  0x0801E99E: adds       r0, #1                        
  0x0801E9A0: muls       r0, r2, r0                    
  0x0801E9A2: b          #0x801e9b8                    
  0x0801E9A8: lsls       r0, r3, #1                    
  0x0801E9AA: adds       r0, r0, r4                    
  0x0801E9AC: ldrh       r1, [r0]                      
  0x0801E9AE: adds       r1, r3, r1                    
  0x0801E9B0: adds       r1, #1                        
  0x0801E9B2: lsls       r0, r2, #0x10                 
  0x0801E9B4: asrs       r0, r0, #0x10                 
  0x0801E9B6: adds       r0, r0, r1                    
  0x0801E9B8: lsls       r0, r0, #0x10                 
  0x0801E9BA: lsrs       r2, r0, #0x10                 
  0x0801E9BC: adds       r0, r3, #1                    
  0x0801E9BE: lsls       r0, r0, #0x10                 
  0x0801E9C0: lsrs       r3, r0, #0x10                 
  0x0801E9C2: cmp        r3, r5                        
  0x0801E9C4: blo        #0x801e98e                    
  0x0801E9C6: subs       r1, r2, #2                    
  0x0801E9C8: movs       r0, #0xff                     
  0x0801E9CA: ands       r1, r0                        
  0x0801E9CC: ldr        r0, [r7, #0xc]                
  0x0801E9CE: adds       r0, r0, r7                    
  0x0801E9D0: adds       r0, r0, r1                    
  0x0801E9D2: ldrb       r0, [r0]                      
  0x0801E9D4: strb       r0, [r6, #0x10]               
  0x0801E9D6: pop        {r4, r5, r6, r7}              
  0x0801E9D8: pop        {r0}                          
  0x0801E9DA: bx         r0                            