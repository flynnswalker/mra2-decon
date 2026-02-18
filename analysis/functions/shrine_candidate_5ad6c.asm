; Function at 0x0805AD6C
; 30 instructions traced

  0x0805AD6C: push       {r4, r5, lr}                  
  0x0805AD6E: bl         #0x8002530                    
  0x0805AD72: movs       r1, #0x71                     
  0x0805AD74: movs       r2, #0                        
  0x0805AD76: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0805AD7A: adds       r4, r0, #0                    
  0x0805AD7C: movs       r1, #0x6b                     
  0x0805AD7E: movs       r2, #0                        
  0x0805AD80: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0805AD84: adds       r5, r0, #0                    
  0x0805AD86: adds       r0, r4, #0                    
  0x0805AD88: movs       r1, #0x6c                     
  0x0805AD8A: movs       r2, #0                        
  0x0805AD8C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0805AD90: adds       r1, r0, #0                    
  0x0805AD92: adds       r0, r5, #0                    
  0x0805AD94: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x0805AD98: adds       r4, r0, #0                    
  0x0805AD9A: bl         #0x8002530                    
  0x0805AD9E: movs       r1, #0x8d                     
  0x0805ADA0: adds       r2, r4, #0                    
  0x0805ADA2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0805ADA6: cmp        r0, #0                        
  0x0805ADA8: bne        #0x805adae                    
  0x0805ADAA: movs       r0, #1                        
  0x0805ADAC: b          #0x805adb0                    
  0x0805ADAE: movs       r0, #0                        
  0x0805ADB0: pop        {r4, r5}                      
  0x0805ADB2: pop        {r1}                          
  0x0805ADB4: bx         r1                            