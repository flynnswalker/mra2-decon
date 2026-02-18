; Function at 0x08003944
; 44 instructions traced

  0x08003944: push       {r4, r5, r6, lr}              
  0x08003946: adds       r5, r0, #0                    
  0x08003948: adds       r4, r1, #0                    
  0x0800394A: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x0800394E: adds       r6, r0, #0                    
  0x08003950: cmp        r4, #0x19                     
  0x08003952: beq        #0x800397c                    
  0x08003954: cmp        r4, #0x19                     
  0x08003956: ble        #0x800395e                    
  0x08003958: cmp        r4, #0x1f                     
  0x0800395A: beq        #0x8003984                    
  0x0800395C: b          #0x80039a4                    
  0x0800395E: cmp        r4, #5                        
  0x08003960: bgt        #0x80039a4                    
  0x08003962: cmp        r4, #0                        
  0x08003964: blt        #0x80039a4                    
  0x08003966: adds       r0, r5, #0                    
  0x08003968: bl         #0x800d7fc                    
  0x0800396C: cmp        r0, #0                        
  0x0800396E: bne        #0x80039a4                    
  0x08003970: adds       r0, r5, #0                    
  0x08003972: movs       r1, #0x36                     
  0x08003974: movs       r2, #8                        
  0x08003976: bl         #0x800d2b0                    
  0x0800397A: b          #0x80039a4                    
  0x0800397C: adds       r0, r5, #0                    
  0x0800397E: bl         #0x800d8c8                    
  0x08003982: b          #0x80039a4                    
  0x08003984: adds       r0, r5, #0                    
  0x08003986: bl         #0x800d5a4                    
  0x0800398A: adds       r0, r5, #0                    
  0x0800398C: bl         #0x800d604                    
  0x08003990: adds       r0, r5, #0                    
  0x08003992: bl         #0x800d668                    
  0x08003996: cmp        r0, #0                        
  0x08003998: bne        #0x80039a4                    
  0x0800399A: adds       r0, r5, #0                    
  0x0800399C: movs       r1, #0x30                     
  0x0800399E: movs       r2, #8                        
  0x080039A0: bl         #0x800d2b0                    
  0x080039A4: adds       r0, r6, #0                    
  0x080039A6: pop        {r4, r5, r6}                  
  0x080039A8: pop        {r1}                          
  0x080039AA: bx         r1                            