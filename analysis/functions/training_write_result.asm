; Function at 0x08022958
; 33 instructions traced

  0x08022958: push       {r4, r5, r6, lr}              
  0x0802295A: lsls       r1, r1, #0x10                 
  0x0802295C: lsrs       r5, r1, #0x10                 
  0x0802295E: lsls       r2, r2, #0x10                 
  0x08022960: lsrs       r6, r2, #0x10                 
  0x08022962: ldr        r4, [pc, #0x3c]                 ; = 0x0200A3A0 
  0x08022964: ldr        r2, [pc, #0x3c]                 ; = 0x00001F84 
  0x08022966: adds       r1, r4, r2                    
  0x08022968: str        r0, [r1]                      
  0x0802296A: bl         #0x8003814                    
  0x0802296E: ldr        r1, [pc, #0x38]                 ; = 0x00001F88 
  0x08022970: adds       r2, r4, r1                    
  0x08022972: str        r0, [r2]                      
  0x08022974: adds       r1, r0, #0                    
  0x08022976: cmp        r1, #8                        
  0x08022978: bls        #0x802297c                    
  0x0802297A: movs       r1, #8                        
  0x0802297C: str        r1, [r2]                      
  0x0802297E: ldr        r2, [pc, #0x2c]                 ; = 0x00001F8C 
  0x08022980: adds       r0, r4, r2                    
  0x08022982: strh       r5, [r0]                      
  0x08022984: adds       r2, #2                        
  0x08022986: adds       r0, r4, r2                    
  0x08022988: strh       r6, [r0]                      
  0x0802298A: movs       r0, #0xd6                     
  0x0802298C: lsls       r0, r0, #2                    
  0x0802298E: adds       r4, r4, r0                    
  0x08022990: movs       r0, #0x1c                     
  0x08022992: bl         #0x81c7bac                    
  0x08022996: str        r0, [r4]                      
  0x08022998: pop        {r4, r5, r6}                  
  0x0802299A: pop        {r0}                          
  0x0802299C: bx         r0                            