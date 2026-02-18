; Function at 0x08018E00
; 29 instructions traced

  0x08018E00: push       {r4, lr}                      
  0x08018E02: sub        sp, #0x20                     
  0x08018E04: ldr        r0, [pc, #0x38]                 ; = 0x0200A398 
  0x08018E06: ldr        r1, [r0]                      
  0x08018E08: adds       r1, #0x30                     
  0x08018E0A: add        r0, sp, #4                    
  0x08018E0C: bl         #0x80036d4                    
  0x08018E10: ldr        r0, [pc, #0x30]                 ; = 0x00100017 
  0x08018E12: str        r0, [sp, #0x1c]               
  0x08018E14: add        r4, sp, #0x1c                 
  0x08018E16: adds       r0, r4, #0                    
  0x08018E18: add        r1, sp, #4                    
  0x08018E1A: movs       r2, #0x58                     
  0x08018E1C: bl         #0x800836c                    
  0x08018E20: movs       r1, #0xc0                     
  0x08018E22: lsls       r1, r1, #0x13                 
  0x08018E24: ldrh       r2, [r4]                      
  0x08018E26: ldrh       r3, [r4, #2]                  
  0x08018E28: adds       r3, #1                        
  0x08018E2A: lsls       r3, r3, #0x10                 
  0x08018E2C: lsrs       r3, r3, #0x10                 
  0x08018E2E: movs       r0, #0x20                     
  0x08018E30: str        r0, [sp]                      
  0x08018E32: add        r0, sp, #4                    
  0x08018E34: bl         #0x8068158                    
  0x08018E38: add        sp, #0x20                     
  0x08018E3A: pop        {r4}                          
  0x08018E3C: pop        {r0}                          
  0x08018E3E: bx         r0                            