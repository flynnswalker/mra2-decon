; Function at 0x08022490
; 9 instructions traced

  0x08022490: subs       r1, r1, r2                    
  0x08022492: lsls       r0, r0, #0x10                 
  0x08022494: lsrs       r0, r0, #0x10                 
  0x08022496: adds       r1, r1, r0                    
  0x08022498: asrs       r1, r1, #0xb                  
  0x0802249A: str        r1, [r4, #0x20]               
  0x0802249C: pop        {r4, r5}                      
  0x0802249E: pop        {r0}                          
  0x080224A0: bx         r0                            