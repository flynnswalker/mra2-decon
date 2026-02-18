; Function at 0x08020200
; 65 instructions traced

  0x08020200: push       {r4, r5, r6, lr}              
  0x08020202: adds       r4, r0, #0                    
  0x08020204: bl         #0x8002530                    
  0x08020208: adds       r5, r0, #0                    
  0x0802020A: adds       r0, r4, #0                    
  0x0802020C: bl         #0x8000310                    
  0x08020210: cmp        r0, #0                        
  0x08020212: beq        #0x802028e                    
  0x08020214: adds       r0, r5, #0                    
  0x08020216: movs       r1, #0xb5                     
  0x08020218: movs       r2, #0                        
  0x0802021A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[181]
  0x0802021E: adds       r4, r0, #0                    
  0x08020220: subs       r0, r4, #1                    
  0x08020222: cmp        r0, #3                        
  0x08020224: bhi        #0x8020236                    
  0x08020226: adds       r6, r4, #2                    
  0x08020228: adds       r0, r5, #0                    
  0x0802022A: movs       r1, #0xb3                     
  0x0802022C: adds       r2, r6, #0                    
  0x0802022E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[179]
  0x08020232: cmp        r0, #1                        
  0x08020234: bne        #0x8020240                    
  0x08020236: ldr        r0, [pc, #4]                  
  0x08020238: b          #0x80202aa                    
  0x08020240: adds       r0, r5, #0                    
  0x08020242: movs       r1, #0xb3                     
  0x08020244: movs       r2, #1                        
  0x08020246: adds       r3, r6, #0                    
  0x08020248: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[179]
  0x0802024C: cmp        r4, #2                        
  0x0802024E: beq        #0x8020270                    
  0x08020250: cmp        r4, #2                        
  0x08020252: bgt        #0x802025a                    
  0x08020254: cmp        r4, #1                        
  0x08020256: beq        #0x8020264                    
  0x08020258: b          #0x802028e                    
  0x0802025A: cmp        r4, #3                        
  0x0802025C: beq        #0x802027c                    
  0x0802025E: cmp        r4, #4                        
  0x08020260: beq        #0x8020288                    
  0x08020262: b          #0x802028e                    
  0x08020264: ldr        r0, [pc, #4]                  
  0x08020266: bl         #0x80682b4                    
  0x0802026A: b          #0x802028e                    
  0x08020270: ldr        r0, [pc, #4]                  
  0x08020272: bl         #0x80682b4                    
  0x08020276: b          #0x802028e                    
  0x0802027C: ldr        r0, [pc, #4]                  
  0x0802027E: bl         #0x80682b4                    
  0x08020282: b          #0x802028e                    
  0x08020288: ldr        r0, [pc, #0x18]                 ; = 0x0811694A 
  0x0802028A: bl         #0x80682b4                    
  0x0802028E: movs       r0, #1                        
  0x08020290: bl         #0x8022774                    
  0x08020294: bl         #0x80682e0                    
  0x08020298: cmp        r0, #1                        
  0x0802029A: beq        #0x80202a8                    
  0x0802029C: movs       r0, #0x80                     
  0x0802029E: lsls       r0, r0, #0x18                 
  0x080202A0: b          #0x80202aa                    
  0x080202A8: movs       r0, #4                        
  0x080202AA: pop        {r4, r5, r6}                  
  0x080202AC: pop        {r1}                          
  0x080202AE: bx         r1                            