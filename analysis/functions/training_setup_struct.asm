; Function at 0x080226F4
; 43 instructions traced

  0x080226F4: push       {r4, r5, lr}                  
  0x080226F6: sub        sp, #4                        
  0x080226F8: movs       r0, #0                        
  0x080226FA: str        r0, [sp]                      
  0x080226FC: ldr        r4, [pc, #0x54]                 ; = 0x040000D4 
  0x080226FE: mov        r0, sp                        
  0x08022700: str        r0, [r4]                      
  0x08022702: movs       r0, #0xc0                     
  0x08022704: lsls       r0, r0, #0x13                 
  0x08022706: str        r0, [r4, #4]                  
  0x08022708: ldr        r0, [pc, #0x4c]                 ; = 0x85001400 
  0x0802270A: str        r0, [r4, #8]                  
  0x0802270C: ldr        r0, [r4, #8]                  
  0x0802270E: movs       r1, #0x80                     
  0x08022710: lsls       r1, r1, #0x13                 
  0x08022712: movs       r2, #0xa8                     
  0x08022714: lsls       r2, r2, #5                    
  0x08022716: adds       r0, r2, #0                    
  0x08022718: strh       r0, [r1]                      
  0x0802271A: movs       r0, #1                        
  0x0802271C: bl         #0x8022768                    
  0x08022720: movs       r0, #0x13                     
  0x08022722: bl         #0x80226e4                    
  0x08022726: str        r0, [r4]                      
  0x08022728: ldr        r0, [pc, #0x30]                 ; = 0x050002E0 
  0x0802272A: str        r0, [r4, #4]                  
  0x0802272C: ldr        r5, [pc, #0x30]                 ; = 0x84000008 
  0x0802272E: str        r5, [r4, #8]                  
  0x08022730: ldr        r0, [r4, #8]                  
  0x08022732: movs       r0, #0x15                     
  0x08022734: bl         #0x80226e4                    
  0x08022738: str        r0, [r4]                      
  0x0802273A: ldr        r0, [pc, #0x28]                 ; = 0x05000300 
  0x0802273C: str        r0, [r4, #4]                  
  0x0802273E: str        r5, [r4, #8]                  
  0x08022740: ldr        r0, [r4, #8]                  
  0x08022742: bl         #0x80227c4                    
  0x08022746: movs       r0, #0                        
  0x08022748: bl         #0x80095b8                    
  0x0802274C: add        sp, #4                        
  0x0802274E: pop        {r4, r5}                      
  0x08022750: pop        {r0}                          
  0x08022752: bx         r0                            