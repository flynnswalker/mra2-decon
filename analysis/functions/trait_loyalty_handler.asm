; Function at 0x0800D5A4
; 42 instructions traced

  0x0800D5A4: push       {r4, r5, lr}                  
  0x0800D5A6: adds       r5, r0, #0                    
  0x0800D5A8: movs       r4, #0                        
  0x0800D5AA: adds       r0, r5, #0                    
  0x0800D5AC: movs       r1, #0x4b                     
  0x0800D5AE: adds       r2, r4, #0                    
  0x0800D5B0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D5B4: cmp        r0, #0x25                     
  0x0800D5B6: beq        #0x800d5c2                    
  0x0800D5B8: adds       r4, #1                        
  0x0800D5BA: cmp        r4, #5                        
  0x0800D5BC: ble        #0x800d5aa                    
  0x0800D5BE: movs       r4, #1                        
  0x0800D5C0: rsbs       r4, r4, #0                    
  0x0800D5C2: movs       r0, #1                        
  0x0800D5C4: rsbs       r0, r0, #0                    
  0x0800D5C6: cmp        r4, r0                        
  0x0800D5C8: beq        #0x800d5d8                    
  0x0800D5CA: adds       r0, r5, #0                    
  0x0800D5CC: movs       r1, #0x1f                     
  0x0800D5CE: movs       r2, #0                        
  0x0800D5D0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D5D4: cmp        r0, #0x32                     
  0x0800D5D6: bgt        #0x800d5dc                    
  0x0800D5D8: movs       r0, #0                        
  0x0800D5DA: b          #0x800d5fc                    
  0x0800D5DC: adds       r3, r4, #0                    
  0x0800D5DE: cmp        r3, #5                        
  0x0800D5E0: ble        #0x800d5e4                    
  0x0800D5E2: movs       r3, #0                        
  0x0800D5E4: adds       r0, r5, #0                    
  0x0800D5E6: movs       r1, #0x4b                     
  0x0800D5E8: movs       r2, #0xff                     
  0x0800D5EA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D5EE: adds       r0, r5, #0                    
  0x0800D5F0: bl         #0x800d410                    
  0x0800D5F4: adds       r0, r5, #0                    
  0x0800D5F6: bl         #0x800d0f8                    
  0x0800D5FA: movs       r0, #1                        
  0x0800D5FC: pop        {r4, r5}                      
  0x0800D5FE: pop        {r1}                          
  0x0800D600: bx         r1                            