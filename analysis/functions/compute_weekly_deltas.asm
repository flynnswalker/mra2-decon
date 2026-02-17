; Function at 0x080028E8
; 27 instructions traced

  0x080028E8: push       {r4, r5, lr}                  
  0x080028EA: adds       r5, r0, #0                    
  0x080028EC: movs       r1, #0x6b                     
  0x080028EE: movs       r2, #0                        
  0x080028F0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_107 (offset 0x0104)
  0x080028F4: adds       r4, r0, #0                    
  0x080028F6: adds       r0, r5, #0                    
  0x080028F8: movs       r1, #0x6c                     
  0x080028FA: movs       r2, #0                        
  0x080028FC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_108 (offset 0x0105)
  0x08002900: adds       r1, r0, #0                    
  0x08002902: lsls       r4, r4, #0x18                 
  0x08002904: lsrs       r4, r4, #0x18                 
  0x08002906: lsls       r1, r1, #0x18                 
  0x08002908: lsrs       r1, r1, #0x18                 
  0x0800290A: adds       r0, r4, #0                    
  0x0800290C: bl         #0x80020a0                    
  0x08002910: adds       r2, r0, #0                    
  0x08002912: lsls       r2, r2, #0x18                 
  0x08002914: lsrs       r2, r2, #0x18                 
  0x08002916: adds       r0, r5, #0                    
  0x08002918: movs       r1, #0xc                      
  0x0800291A: movs       r3, #0                        
  0x0800291C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_12 (offset 0x007A)
  0x08002920: pop        {r4, r5}                      
  0x08002922: pop        {r0}                          
  0x08002924: bx         r0                            