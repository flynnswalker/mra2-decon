; Function at 0x0800D7FC
; 40 instructions traced

  0x0800D7FC: push       {r4, r5, lr}                  
  0x0800D7FE: adds       r5, r0, #0                    
  0x0800D800: movs       r4, #0                        
  0x0800D802: adds       r0, r5, #0                    
  0x0800D804: movs       r1, #0x4b                     
  0x0800D806: adds       r2, r4, #0                    
  0x0800D808: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D80C: cmp        r0, #0x36                     
  0x0800D80E: beq        #0x800d81a                    
  0x0800D810: adds       r4, #1                        
  0x0800D812: cmp        r4, #5                        
  0x0800D814: ble        #0x800d802                    
  0x0800D816: movs       r4, #1                        
  0x0800D818: rsbs       r4, r4, #0                    
  0x0800D81A: movs       r0, #1                        
  0x0800D81C: rsbs       r0, r0, #0                    
  0x0800D81E: cmp        r4, r0                        
  0x0800D820: beq        #0x800d82c                    
  0x0800D822: adds       r0, r5, #0                    
  0x0800D824: bl         #0x8000fa4                    
  0x0800D828: cmp        r0, #1                        
  0x0800D82A: bne        #0x800d830                    
  0x0800D82C: movs       r0, #0                        
  0x0800D82E: b          #0x800d850                    
  0x0800D830: adds       r3, r4, #0                    
  0x0800D832: cmp        r3, #5                        
  0x0800D834: ble        #0x800d838                    
  0x0800D836: movs       r3, #0                        
  0x0800D838: adds       r0, r5, #0                    
  0x0800D83A: movs       r1, #0x4b                     
  0x0800D83C: movs       r2, #0xff                     
  0x0800D83E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D842: adds       r0, r5, #0                    
  0x0800D844: bl         #0x800d410                    
  0x0800D848: adds       r0, r5, #0                    
  0x0800D84A: bl         #0x800d0f8                    
  0x0800D84E: movs       r0, #1                        
  0x0800D850: pop        {r4, r5}                      
  0x0800D852: pop        {r1}                          
  0x0800D854: bx         r1                            