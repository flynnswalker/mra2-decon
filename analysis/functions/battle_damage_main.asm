; Function at 0x08043AC8
; 9 instructions traced

  0x08043AC8: push       {r4, lr}                      
  0x08043ACA: lsls       r2, r2, #0x10                 
  0x08043ACC: lsrs       r2, r2, #0x10                 
  0x08043ACE: ldr        r4, [pc, #0xc]                  ; = 0x0200C990 
  0x08043AD0: bl         #0x80432e8                    
  0x08043AD4: strh       r0, [r4]                      
  0x08043AD6: pop        {r4}                          
  0x08043AD8: pop        {r0}                          
  0x08043ADA: bx         r0                            