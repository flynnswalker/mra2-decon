; Function at 0x08002658
; 23 instructions traced

  0x08002658: push       {lr}                          
  0x0800265A: adds       r3, r0, #0                    
  0x0800265C: adds       r2, r1, #0                    
  0x0800265E: movs       r0, #0                        
  0x08002660: cmp        r2, #0xff                     
  0x08002662: beq        #0x8002682                    
  0x08002664: cmp        r2, #9                        
  0x08002666: bgt        #0x8002682                    
  0x08002668: ldr        r1, [pc, #0x1c]                 ; = 0x08208CB0 
  0x0800266A: lsls       r0, r3, #2                    
  0x0800266C: adds       r0, r0, r3                    
  0x0800266E: lsls       r0, r0, #1                    
  0x08002670: adds       r0, r0, r2                    
  0x08002672: lsls       r0, r0, #1                    
  0x08002674: adds       r0, r0, r1                    
  0x08002676: ldrh       r1, [r0]                      
  0x08002678: ldr        r0, [pc, #0x10]                 ; = 0x0000FFFF 
  0x0800267A: eors       r1, r0                        
  0x0800267C: rsbs       r0, r1, #0                    
  0x0800267E: orrs       r0, r1                        
  0x08002680: lsrs       r0, r0, #0x1f                 
  0x08002682: pop        {r1}                          
  0x08002684: bx         r1                            