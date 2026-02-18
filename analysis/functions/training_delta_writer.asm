; Function at 0x08022DCC
; 12 instructions traced

  0x08022DCC: push       {lr}                          
  0x08022DCE: movs       r1, #0                        
  0x08022DD0: ldr        r0, [pc, #0x10]                 ; = 0x0200A398 
  0x08022DD2: ldr        r0, [r0]                      
  0x08022DD4: adds       r0, #0x2c                     
  0x08022DD6: ldrb       r0, [r0]                      
  0x08022DD8: cmp        r0, #0                        
  0x08022DDA: bne        #0x8022dde                    
  0x08022DDC: movs       r1, #1                        
  0x08022DDE: adds       r0, r1, #0                    
  0x08022DE0: pop        {r1}                          
  0x08022DE2: bx         r1                            