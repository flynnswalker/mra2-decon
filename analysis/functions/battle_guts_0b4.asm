; Function at 0x080430B4
; 15 instructions traced

  0x080430B4: push       {r4, lr}                      
  0x080430B6: adds       r4, r0, #0                    
  0x080430B8: adds       r0, #0xa0                     
  0x080430BA: bl         #0x8000324                    
  0x080430BE: cmp        r0, #0                        
  0x080430C0: beq        #0x80430c6                    
  0x080430C2: movs       r0, #0xf0                     
  0x080430C4: b          #0x80430d0                    
  0x080430C6: bl         #0x80430d8                    
  0x080430CA: adds       r0, r4, #0                    
  0x080430CC: adds       r0, #0x9c                     
  0x080430CE: ldrb       r0, [r0]                      
  0x080430D0: pop        {r4}                          
  0x080430D2: pop        {r1}                          
  0x080430D4: bx         r1                            