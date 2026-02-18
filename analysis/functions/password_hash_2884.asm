; Function at 0x08002884
; 19 instructions traced

  0x08002884: push       {r4, r5, r6, lr}              
  0x08002886: adds       r6, r0, #0                    
  0x08002888: movs       r5, #0                        
  0x0800288A: movs       r4, #0                        
  0x0800288C: b          #0x8002892                    
  0x0800288E: adds       r5, #1                        
  0x08002890: adds       r4, #1                        
  0x08002892: cmp        r4, #9                        
  0x08002894: bgt        #0x80028a4                    
  0x08002896: adds       r0, r6, #0                    
  0x08002898: movs       r1, #0x50                     
  0x0800289A: adds       r2, r4, #0                    
  0x0800289C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080028A0: cmp        r0, #0x1e                     
  0x080028A2: bne        #0x800288e                    
  0x080028A4: adds       r0, r5, #0                    
  0x080028A6: pop        {r4, r5, r6}                  
  0x080028A8: pop        {r1}                          
  0x080028AA: bx         r1                            