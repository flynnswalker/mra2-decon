; Function at 0x0800D350
; 12 instructions traced

  0x0800D350: adds       r3, r6, #0                    
  0x0800D352: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D356: adds       r0, r5, #0                    
  0x0800D358: bl         #0x800d17c                    
  0x0800D35C: movs       r0, #1                        
  0x0800D35E: mov        r8, r0                        
  0x0800D360: mov        r0, r8                        
  0x0800D362: pop        {r3}                          
  0x0800D364: mov        r8, r3                        
  0x0800D366: pop        {r4, r5, r6, r7}              
  0x0800D368: pop        {r1}                          
  0x0800D36A: bx         r1                            