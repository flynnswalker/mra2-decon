; Function at 0x0800D400
; 7 instructions traced

  0x0800D400: movs       r3, #0                        
  0x0800D402: movs       r1, #0xe0                     
  0x0800D404: movs       r2, #0xff                     
  0x0800D406: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D40A: movs       r0, #1                        
  0x0800D40C: pop        {r1}                          
  0x0800D40E: bx         r1                            