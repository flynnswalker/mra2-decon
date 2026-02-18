; Function at 0x08043BC0
; 10 instructions traced

  0x08043BC0: push       {lr}                          
  0x08043BC2: bl         #0x8002884                    
  0x08043BC6: cmp        r0, #9                        
  0x08043BC8: ble        #0x8043bd4                    
  0x08043BCA: ldr        r0, [pc, #4]                  
  0x08043BCC: b          #0x8043bd8                    
  0x08043BD4: lsls       r0, r0, #0x10                 
  0x08043BD6: lsrs       r0, r0, #0x10                 
  0x08043BD8: pop        {r1}                          
  0x08043BDA: bx         r1                            