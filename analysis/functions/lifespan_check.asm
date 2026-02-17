; Function at 0x080027AC
; 23 instructions traced

  0x080027AC: push       {r4, r5, lr}                  
  0x080027AE: adds       r4, r0, #0                    
  0x080027B0: movs       r1, #0x16                     
  0x080027B2: movs       r2, #0                        
  0x080027B4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> amount_0x94 (offset 0x0094)
  0x080027B8: adds       r5, r0, #0                    
  0x080027BA: adds       r0, r4, #0                    
  0x080027BC: movs       r1, #0x17                     
  0x080027BE: movs       r2, #0                        
  0x080027C0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> amount_0x96 (offset 0x0096)
  0x080027C4: subs       r0, r5, r0                    
  0x080027C6: lsls       r0, r0, #4                    
  0x080027C8: adds       r1, r5, #0                    
  0x080027CA: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x080027CE: cmp        r0, #0                        
  0x080027D0: bge        #0x80027d4                    
  0x080027D2: movs       r0, #0                        
  0x080027D4: cmp        r0, #0xf                      
  0x080027D6: ble        #0x80027da                    
  0x080027D8: movs       r0, #0xf                      
  0x080027DA: pop        {r4, r5}                      
  0x080027DC: pop        {r1}                          
  0x080027DE: bx         r1                            