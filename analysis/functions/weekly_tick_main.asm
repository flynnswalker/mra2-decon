; Function at 0x080200BC
; 46 instructions traced

  0x080200BC: push       {r4, r5, lr}                  
  0x080200BE: sub        sp, #8                        
  0x080200C0: adds       r4, r0, #0                    
  0x080200C2: bl         #0x8002530                    
  0x080200C6: movs       r1, #0x71                     
  0x080200C8: movs       r2, #0                        
  0x080200CA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_113 (offset None)
  0x080200CE: adds       r5, r0, #0                    
  0x080200D0: adds       r0, r4, #0                    
  0x080200D2: bl         #0x8000310                    
  0x080200D6: cmp        r0, #0                        
  0x080200D8: beq        #0x8020112                    
  0x080200DA: movs       r0, #0xc8                     
  0x080200DC: movs       r1, #0                        
  0x080200DE: movs       r2, #1                        
  0x080200E0: bl         #0x806df38                    
  0x080200E4: bl         #0x8063260                    
  0x080200E8: adds       r0, r5, #0                    
  0x080200EA: movs       r1, #0x6b                     
  0x080200EC: movs       r2, #0                        
  0x080200EE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_107 (offset 0x0104)
  0x080200F2: adds       r4, r0, #0                    
  0x080200F4: adds       r0, r5, #0                    
  0x080200F6: movs       r1, #0x6c                     
  0x080200F8: movs       r2, #0                        
  0x080200FA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_108 (offset 0x0105)
  0x080200FE: adds       r3, r0, #0                    
  0x08020100: movs       r0, #1                        
  0x08020102: rsbs       r0, r0, #0                    
  0x08020104: str        r0, [sp]                      
  0x08020106: str        r0, [sp, #4]                  
  0x08020108: movs       r0, #0x12                     
  0x0802010A: movs       r1, #0                        
  0x0802010C: adds       r2, r4, #0                    
  0x0802010E: bl         #0x80700cc                    
  0x08020112: bl         #0x80701f0                    
  0x08020116: cmp        r0, #1                        
  0x08020118: beq        #0x8020120                    
  0x0802011A: movs       r0, #0x80                     
  0x0802011C: lsls       r0, r0, #0x18                 
  0x0802011E: b          #0x8020122                    
  0x08020120: movs       r0, #4                        
  0x08020122: add        sp, #8                        
  0x08020124: pop        {r4, r5}                      
  0x08020126: pop        {r1}                          
  0x08020128: bx         r1                            