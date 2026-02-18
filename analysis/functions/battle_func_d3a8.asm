; Function at 0x0800D3A8
; 20 instructions traced

  0x0800D3A8: push       {r4, r5, r6, lr}              
  0x0800D3AA: adds       r6, r0, #0                    
  0x0800D3AC: adds       r5, r1, #0                    
  0x0800D3AE: movs       r4, #0                        
  0x0800D3B0: adds       r0, r6, #0                    
  0x0800D3B2: movs       r1, #0x4b                     
  0x0800D3B4: adds       r2, r4, #0                    
  0x0800D3B6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D3BA: cmp        r0, r5                        
  0x0800D3BC: bne        #0x800d3c2                    
  0x0800D3BE: adds       r0, r4, #0                    
  0x0800D3C0: b          #0x800d3cc                    
  0x0800D3C2: adds       r4, #1                        
  0x0800D3C4: cmp        r4, #5                        
  0x0800D3C6: ble        #0x800d3b0                    
  0x0800D3C8: movs       r0, #1                        
  0x0800D3CA: rsbs       r0, r0, #0                    
  0x0800D3CC: pop        {r4, r5, r6}                  
  0x0800D3CE: pop        {r1}                          
  0x0800D3D0: bx         r1                            