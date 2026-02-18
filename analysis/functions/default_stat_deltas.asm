; Function at 0x0801E86C
; 119 instructions traced

  0x0801E86C: push       {r4, r5, r6, r7, lr}          
  0x0801E86E: adds       r5, r0, #0                    
  0x0801E870: adds       r4, r2, #0                    
  0x0801E872: lsls       r1, r1, #0x10                 
  0x0801E874: lsrs       r6, r1, #0x10                 
  0x0801E876: cmp        r6, #1                        
  0x0801E878: bne        #0x801e896                    
  0x0801E87A: movs       r0, #0                        
  0x0801E87C: strb       r0, [r4, #2]                  
  0x0801E87E: strb       r0, [r4, #3]                  
  0x0801E880: strb       r0, [r4, #4]                  
  0x0801E882: strb       r0, [r4, #5]                  
  0x0801E884: strb       r0, [r4, #6]                  
  0x0801E886: strb       r0, [r4, #7]                  
  0x0801E888: strb       r0, [r4, #8]                  
  0x0801E88A: strb       r0, [r4, #9]                  
  0x0801E88C: strb       r0, [r4, #0xa]                
  0x0801E88E: strb       r0, [r4, #0xb]                
  0x0801E890: strb       r0, [r4, #0xc]                
  0x0801E892: strb       r0, [r4, #0xd]                
  0x0801E894: b          #0x801e956                    
  0x0801E896: ldrh       r0, [r5, #2]                  
  0x0801E898: adds       r0, #2                        
  0x0801E89A: lsls       r0, r0, #0x10                 
  0x0801E89C: lsrs       r3, r0, #0x10                 
  0x0801E89E: movs       r2, #2                        
  0x0801E8A0: ldr        r7, [pc, #0x1c]                 ; = 0x081E9AD0 
  0x0801E8A2: cmp        r2, r6                        
  0x0801E8A4: bhs        #0x801e8de                    
  0x0801E8A6: movs       r0, #1                        
  0x0801E8A8: ands       r0, r2                        
  0x0801E8AA: cmp        r0, #0                        
  0x0801E8AC: beq        #0x801e8c4                    
  0x0801E8AE: lsls       r0, r2, #1                    
  0x0801E8B0: adds       r0, r0, r5                    
  0x0801E8B2: ldrh       r1, [r0]                      
  0x0801E8B4: adds       r1, r2, r1                    
  0x0801E8B6: adds       r1, #1                        
  0x0801E8B8: lsls       r0, r3, #0x10                 
  0x0801E8BA: asrs       r0, r0, #0x10                 
  0x0801E8BC: adds       r0, r0, r1                    
  0x0801E8BE: b          #0x801e8d0                    
  0x0801E8C4: lsls       r0, r2, #1                    
  0x0801E8C6: adds       r0, r0, r5                    
  0x0801E8C8: ldrh       r0, [r0]                      
  0x0801E8CA: adds       r0, r0, r2                    
  0x0801E8CC: adds       r0, #1                        
  0x0801E8CE: muls       r0, r3, r0                    
  0x0801E8D0: lsls       r0, r0, #0x10                 
  0x0801E8D2: lsrs       r3, r0, #0x10                 
  0x0801E8D4: adds       r0, r2, #1                    
  0x0801E8D6: lsls       r0, r0, #0x10                 
  0x0801E8D8: lsrs       r2, r0, #0x10                 
  0x0801E8DA: cmp        r2, r6                        
  0x0801E8DC: blo        #0x801e8a6                    
  0x0801E8DE: subs       r0, r3, #2                    
  0x0801E8E0: lsls       r0, r0, #0x10                 
  0x0801E8E2: lsrs       r3, r0, #0x10                 
  0x0801E8E4: movs       r1, #0                        
  0x0801E8E6: movs       r5, #1                        
  0x0801E8E8: movs       r2, #0                        
  0x0801E8EA: adds       r0, r3, #0                    
  0x0801E8EC: ands       r0, r5                        
  0x0801E8EE: orrs       r1, r0                        
  0x0801E8F0: lsrs       r3, r3, #1                    
  0x0801E8F2: lsls       r0, r5, #0x11                 
  0x0801E8F4: lsrs       r5, r0, #0x10                 
  0x0801E8F6: adds       r0, r2, #1                    
  0x0801E8F8: lsls       r0, r0, #0x10                 
  0x0801E8FA: lsrs       r2, r0, #0x10                 
  0x0801E8FC: cmp        r2, #5                        
  0x0801E8FE: bls        #0x801e8ea                    
  0x0801E900: movs       r0, #0xd                      
  0x0801E902: muls       r0, r1, r0                    
  0x0801E904: lsls       r0, r0, #0x10                 
  0x0801E906: lsrs       r1, r0, #0x10                 
  0x0801E908: ldr        r0, [r7, #8]                  
  0x0801E90A: adds       r0, r0, r7                    
  0x0801E90C: adds       r0, r0, r1                    
  0x0801E90E: ldrb       r1, [r0]                      
  0x0801E910: strb       r1, [r4, #2]                  
  0x0801E912: adds       r0, #1                        
  0x0801E914: ldrb       r1, [r0]                      
  0x0801E916: strb       r1, [r4, #3]                  
  0x0801E918: adds       r0, #1                        
  0x0801E91A: ldrb       r1, [r0]                      
  0x0801E91C: strb       r1, [r4, #4]                  
  0x0801E91E: adds       r0, #1                        
  0x0801E920: ldrb       r1, [r0]                      
  0x0801E922: strb       r1, [r4, #5]                  
  0x0801E924: adds       r0, #1                        
  0x0801E926: ldrb       r1, [r0]                      
  0x0801E928: strb       r1, [r4, #6]                  
  0x0801E92A: adds       r0, #1                        
  0x0801E92C: ldrb       r1, [r0]                      
  0x0801E92E: strb       r1, [r4, #7]                  
  0x0801E930: adds       r0, #1                        
  0x0801E932: ldrb       r1, [r0]                      
  0x0801E934: strb       r1, [r4, #8]                  
  0x0801E936: adds       r0, #1                        
  0x0801E938: ldrb       r1, [r0]                      
  0x0801E93A: strb       r1, [r4, #9]                  
  0x0801E93C: adds       r0, #1                        
  0x0801E93E: ldrb       r1, [r0]                      
  0x0801E940: strb       r1, [r4, #0xa]                
  0x0801E942: adds       r0, #1                        
  0x0801E944: ldrb       r1, [r0]                      
  0x0801E946: strb       r1, [r4, #0xb]                
  0x0801E948: adds       r0, #1                        
  0x0801E94A: ldrb       r1, [r0]                      
  0x0801E94C: strb       r1, [r4, #0xc]                
  0x0801E94E: adds       r0, #1                        
  0x0801E950: ldrb       r1, [r0]                      
  0x0801E952: strb       r1, [r4, #0xd]                
  0x0801E954: ldrb       r0, [r0, #1]                  
  0x0801E956: strb       r0, [r4, #0xe]                
  0x0801E958: pop        {r4, r5, r6, r7}              
  0x0801E95A: pop        {r0}                          
  0x0801E95C: bx         r0                            