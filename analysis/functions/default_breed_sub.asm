; Function at 0x0801E7C8
; 78 instructions traced

  0x0801E7C8: push       {r4, r5, r6, r7, lr}          
  0x0801E7CA: adds       r4, r0, #0                    
  0x0801E7CC: adds       r6, r2, #0                    
  0x0801E7CE: lsls       r1, r1, #0x10                 
  0x0801E7D0: lsrs       r5, r1, #0x10                 
  0x0801E7D2: cmp        r5, #1                        
  0x0801E7D4: bne        #0x801e7da                    
  0x0801E7D6: movs       r0, #0x28                     
  0x0801E7D8: b          #0x801e862                    
  0x0801E7DA: ldrh       r0, [r4, #2]                  
  0x0801E7DC: adds       r0, #2                        
  0x0801E7DE: lsls       r0, r0, #0x10                 
  0x0801E7E0: lsrs       r2, r0, #0x10                 
  0x0801E7E2: movs       r3, #2                        
  0x0801E7E4: ldr        r0, [pc, #0x20]                 ; = 0x081E9AD0 
  0x0801E7E6: mov        ip, r0                        
  0x0801E7E8: ldrb       r7, [r6]                      
  0x0801E7EA: cmp        r3, r5                        
  0x0801E7EC: bhs        #0x801e826                    
  0x0801E7EE: movs       r0, #1                        
  0x0801E7F0: ands       r0, r3                        
  0x0801E7F2: cmp        r0, #0                        
  0x0801E7F4: beq        #0x801e80c                    
  0x0801E7F6: lsls       r0, r3, #1                    
  0x0801E7F8: adds       r0, r0, r4                    
  0x0801E7FA: ldrh       r1, [r0]                      
  0x0801E7FC: adds       r1, r3, r1                    
  0x0801E7FE: adds       r1, #1                        
  0x0801E800: lsls       r0, r2, #0x10                 
  0x0801E802: asrs       r0, r0, #0x10                 
  0x0801E804: adds       r0, r0, r1                    
  0x0801E806: b          #0x801e818                    
  0x0801E80C: lsls       r0, r3, #1                    
  0x0801E80E: adds       r0, r0, r4                    
  0x0801E810: ldrh       r0, [r0]                      
  0x0801E812: adds       r0, r0, r3                    
  0x0801E814: adds       r0, #1                        
  0x0801E816: muls       r0, r2, r0                    
  0x0801E818: lsls       r0, r0, #0x10                 
  0x0801E81A: lsrs       r2, r0, #0x10                 
  0x0801E81C: adds       r0, r3, #1                    
  0x0801E81E: lsls       r0, r0, #0x10                 
  0x0801E820: lsrs       r3, r0, #0x10                 
  0x0801E822: cmp        r3, r5                        
  0x0801E824: blo        #0x801e7ee                    
  0x0801E826: subs       r0, r2, #2                    
  0x0801E828: lsls       r0, r0, #0x10                 
  0x0801E82A: lsrs       r2, r0, #0x10                 
  0x0801E82C: movs       r4, #0                        
  0x0801E82E: movs       r1, #1                        
  0x0801E830: movs       r3, #0                        
  0x0801E832: lsrs       r2, r2, #1                    
  0x0801E834: adds       r0, r2, #0                    
  0x0801E836: ands       r0, r1                        
  0x0801E838: orrs       r4, r0                        
  0x0801E83A: lsls       r0, r1, #0x11                 
  0x0801E83C: lsrs       r1, r0, #0x10                 
  0x0801E83E: adds       r0, r3, #1                    
  0x0801E840: lsls       r0, r0, #0x10                 
  0x0801E842: lsrs       r3, r0, #0x10                 
  0x0801E844: cmp        r3, #7                        
  0x0801E846: bls        #0x801e832                    
  0x0801E848: mov        r1, ip                        
  0x0801E84A: ldr        r0, [r1, #4]                  
  0x0801E84C: add        r0, ip                        
  0x0801E84E: adds       r0, r0, r4                    
  0x0801E850: ldrb       r0, [r0]                      
  0x0801E852: strb       r0, [r6, #1]                  
  0x0801E854: ldrb       r1, [r6, #1]                  
  0x0801E856: adds       r0, r7, #0                    
  0x0801E858: bl         #0x801ead4                    
  0x0801E85C: cmp        r0, #0                        
  0x0801E85E: bne        #0x801e864                    
  0x0801E860: ldrb       r0, [r6]                      
  0x0801E862: strb       r0, [r6, #1]                  
  0x0801E864: pop        {r4, r5, r6, r7}              
  0x0801E866: pop        {r0}                          
  0x0801E868: bx         r0                            