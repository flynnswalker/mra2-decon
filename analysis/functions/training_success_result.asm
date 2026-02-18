; Function at 0x080212E4
; 14 instructions traced

  0x080212E4: push       {lr}                          
  0x080212E6: bl         #0x8002530                    
  0x080212EA: movs       r1, #0x71                     
  0x080212EC: movs       r2, #0                        
  0x080212EE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080212F2: movs       r1, #0x6b                     
  0x080212F4: movs       r2, #0                        
  0x080212F6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080212FA: ldr        r1, [pc, #0xc]                  ; = 0x0840AC94 
  0x080212FC: lsls       r0, r0, #2                    
  0x080212FE: adds       r0, r0, r1                    
  0x08021300: ldr        r0, [r0]                      
  0x08021302: pop        {r1}                          
  0x08021304: bx         r1                            