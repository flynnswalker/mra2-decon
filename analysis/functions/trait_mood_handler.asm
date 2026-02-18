; Function at 0x0800D668
; 42 instructions traced

  0x0800D668: push       {r4, r5, lr}                  
  0x0800D66A: adds       r5, r0, #0                    
  0x0800D66C: movs       r4, #0                        
  0x0800D66E: adds       r0, r5, #0                    
  0x0800D670: movs       r1, #0x4b                     
  0x0800D672: adds       r2, r4, #0                    
  0x0800D674: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D678: cmp        r0, #0x30                     
  0x0800D67A: beq        #0x800d686                    
  0x0800D67C: adds       r4, #1                        
  0x0800D67E: cmp        r4, #5                        
  0x0800D680: ble        #0x800d66e                    
  0x0800D682: movs       r4, #1                        
  0x0800D684: rsbs       r4, r4, #0                    
  0x0800D686: movs       r0, #1                        
  0x0800D688: rsbs       r0, r0, #0                    
  0x0800D68A: cmp        r4, r0                        
  0x0800D68C: beq        #0x800d69c                    
  0x0800D68E: adds       r0, r5, #0                    
  0x0800D690: movs       r1, #0x1f                     
  0x0800D692: movs       r2, #0                        
  0x0800D694: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D698: cmp        r0, #0x31                     
  0x0800D69A: ble        #0x800d6a0                    
  0x0800D69C: movs       r0, #0                        
  0x0800D69E: b          #0x800d6c0                    
  0x0800D6A0: adds       r3, r4, #0                    
  0x0800D6A2: cmp        r3, #5                        
  0x0800D6A4: ble        #0x800d6a8                    
  0x0800D6A6: movs       r3, #0                        
  0x0800D6A8: adds       r0, r5, #0                    
  0x0800D6AA: movs       r1, #0x4b                     
  0x0800D6AC: movs       r2, #0xff                     
  0x0800D6AE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D6B2: adds       r0, r5, #0                    
  0x0800D6B4: bl         #0x800d410                    
  0x0800D6B8: adds       r0, r5, #0                    
  0x0800D6BA: bl         #0x800d0f8                    
  0x0800D6BE: movs       r0, #1                        
  0x0800D6C0: pop        {r4, r5}                      
  0x0800D6C2: pop        {r1}                          
  0x0800D6C4: bx         r1                            