; Function at 0x0800D3D4
; 16 instructions traced

  0x0800D3D4: push       {r4, lr}                      
  0x0800D3D6: adds       r4, r0, #0                    
  0x0800D3D8: adds       r3, r1, #0                    
  0x0800D3DA: cmp        r3, #5                        
  0x0800D3DC: ble        #0x800d3e0                    
  0x0800D3DE: movs       r3, #0                        
  0x0800D3E0: adds       r0, r4, #0                    
  0x0800D3E2: movs       r1, #0x4b                     
  0x0800D3E4: movs       r2, #0xff                     
  0x0800D3E6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D3EA: adds       r0, r4, #0                    
  0x0800D3EC: bl         #0x800d410                    
  0x0800D3F0: movs       r0, #1                        
  0x0800D3F2: pop        {r4}                          
  0x0800D3F4: pop        {r1}                          
  0x0800D3F6: bx         r1                            