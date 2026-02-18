; Function at 0x080004D4
; 63 instructions traced

  0x080004D4: movs       r1, #0x8e                     
  0x080004D6: movs       r2, #0                        
  0x080004D8: adds       r3, r6, #0                    
  0x080004DA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004DE: adds       r0, r7, #0                    
  0x080004E0: movs       r1, #0x8f                     
  0x080004E2: movs       r2, #0                        
  0x080004E4: adds       r3, r6, #0                    
  0x080004E6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004EA: adds       r0, r7, #0                    
  0x080004EC: movs       r1, #0x90                     
  0x080004EE: movs       r2, #0                        
  0x080004F0: adds       r3, r6, #0                    
  0x080004F2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004F6: adds       r0, r7, #0                    
  0x080004F8: movs       r1, #0x91                     
  0x080004FA: movs       r2, #0                        
  0x080004FC: adds       r3, r6, #0                    
  0x080004FE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000502: adds       r0, r7, #0                    
  0x08000504: movs       r1, #0x92                     
  0x08000506: movs       r2, #0                        
  0x08000508: adds       r3, r6, #0                    
  0x0800050A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800050E: adds       r0, r7, #0                    
  0x08000510: movs       r1, #0x93                     
  0x08000512: movs       r2, #0                        
  0x08000514: adds       r3, r6, #0                    
  0x08000516: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800051A: adds       r0, r7, #0                    
  0x0800051C: movs       r1, #0x94                     
  0x0800051E: movs       r2, #0                        
  0x08000520: adds       r3, r6, #0                    
  0x08000522: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000526: movs       r5, #0                        
  0x08000528: adds       r4, r5, #0                    
  0x0800052A: adds       r4, #0x95                     
  0x0800052C: mov        r0, r8                        
  0x0800052E: movs       r1, #0x4b                     
  0x08000530: adds       r2, r5, #0                    
  0x08000532: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000536: adds       r2, r0, #0                    
  0x08000538: adds       r0, r7, #0                    
  0x0800053A: adds       r1, r4, #0                    
  0x0800053C: adds       r3, r6, #0                    
  0x0800053E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000542: adds       r5, #1                        
  0x08000544: cmp        r5, #3                        
  0x08000546: ble        #0x8000528                    
  0x08000548: ldr        r2, [pc, #0x10]                 ; = 0x081C7F06 
  0x0800054A: str        r6, [sp]                      
  0x0800054C: adds       r0, r7, #0                    
  0x0800054E: movs       r1, #0x99                     
  0x08000550: movs       r3, #8                        
  0x08000552: bl         #0x800363c                    
  0x08000556: b          #0x8000646                    
  0x08000646: add        sp, #4                        
  0x08000648: pop        {r3, r4}                      
  0x0800064A: mov        r8, r3                        
  0x0800064C: mov        sb, r4                        
  0x0800064E: pop        {r4, r5, r6, r7}              
  0x08000650: pop        {r0}                          
  0x08000652: bx         r0                            