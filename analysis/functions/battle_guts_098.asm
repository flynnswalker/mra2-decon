; Function at 0x08043098
; 13 instructions traced

  0x08043098: push       {r4, lr}                      
  0x0804309A: adds       r4, r0, #0                    
  0x0804309C: adds       r0, #0xa0                     
  0x0804309E: bl         #0x80430dc                    
  0x080430A2: adds       r0, r4, #0                    
  0x080430A4: adds       r0, #0xac                     
  0x080430A6: str        r4, [r0]                      
  0x080430A8: movs       r0, #0                        
  0x080430AA: strb       r0, [r4, #2]                  
  0x080430AC: strb       r0, [r4, #3]                  
  0x080430AE: pop        {r4}                          
  0x080430B0: pop        {r0}                          
  0x080430B2: bx         r0                            