; Function at 0x08043A00
; 21 instructions traced

  0x08043A00: add        r0, r8                        
  0x08043A02: ldrb       r0, [r0]                      
  0x08043A04: mov        r1, sl                        
  0x08043A06: strb       r0, [r1]                      
  0x08043A08: ldr        r0, [pc, #0x24]                 ; = 0x00000105 
  0x08043A0A: add        r0, r8                        
  0x08043A0C: ldrb       r0, [r0]                      
  0x08043A0E: ldr        r1, [sp, #8]                  
  0x08043A10: strb       r0, [r1]                      
  0x08043A12: mov        r0, sp                        
  0x08043A14: ldrb       r1, [r0]                      
  0x08043A16: ldr        r0, [sp, #4]                  
  0x08043A18: strb       r1, [r0]                      
  0x08043A1A: add        sp, #0xc                      
  0x08043A1C: pop        {r3, r4, r5}                  
  0x08043A1E: mov        r8, r3                        
  0x08043A20: mov        sb, r4                        
  0x08043A22: mov        sl, r5                        
  0x08043A24: pop        {r4, r5, r6, r7}              
  0x08043A26: pop        {r0}                          
  0x08043A28: bx         r0                            