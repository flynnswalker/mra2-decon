; Function at 0x080213B8
; 16 instructions traced

  0x080213B8: push       {lr}                          
  0x080213BA: ldr        r0, [pc, #0x18]                 ; = 0x0200A398 
  0x080213BC: ldr        r3, [r0]                      
  0x080213BE: adds       r0, r3, #0                    
  0x080213C0: adds       r0, #0x30                     
  0x080213C2: ldr        r1, [pc, #0x14]                 ; = 0x08217368 
  0x080213C4: ldr        r2, [pc, #0x14]                 ; = 0x081E9AD0 
  0x080213C6: adds       r3, #0x18                     
  0x080213C8: bl         #0x801e560                    
  0x080213CC: cmp        r0, #1                        
  0x080213CE: beq        #0x80213e0                    
  0x080213D0: movs       r0, #0x11                     
  0x080213D2: b          #0x80213e2                    
  0x080213E0: movs       r0, #7                        
  0x080213E2: pop        {r1}                          
  0x080213E4: bx         r1                            