; Function at 0x08043AE0
; 8 instructions traced

  0x08043AE0: push       {lr}                          
  0x08043AE2: lsls       r3, r2, #0x10                 
  0x08043AE4: lsrs       r3, r3, #0x10                 
  0x08043AE6: ldr        r2, [pc, #0xc]                  ; = 0x0200C990 
  0x08043AE8: ldrh       r2, [r2]                      
  0x08043AEA: bl         #0x804370c                    
  0x08043AEE: pop        {r0}                          
  0x08043AF0: bx         r0                            