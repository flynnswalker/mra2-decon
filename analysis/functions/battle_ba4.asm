; Function at 0x08043BA4
; 10 instructions traced

  0x08043BA4: push       {lr}                          
  0x08043BA6: ldr        r0, [pc, #0xc]                  ; = 0x0200C990 
  0x08043BA8: ldrh       r0, [r0]                      
  0x08043BAA: cmp        r0, #2                        
  0x08043BAC: bls        #0x8043bb8                    
  0x08043BAE: movs       r0, #1                        
  0x08043BB0: b          #0x8043bba                    
  0x08043BB8: movs       r0, #0                        
  0x08043BBA: pop        {r1}                          
  0x08043BBC: bx         r1                            