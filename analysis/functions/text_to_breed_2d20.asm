; Function at 0x08002D20
; 23 instructions traced

  0x08002D20: push       {lr}                          
  0x08002D22: lsls       r0, r0, #0x18                 
  0x08002D24: lsrs       r0, r0, #0x18                 
  0x08002D26: adds       r2, r0, #0                    
  0x08002D28: lsls       r1, r1, #0x18                 
  0x08002D2A: lsrs       r0, r1, #0x18                 
  0x08002D2C: cmp        r2, #2                        
  0x08002D2E: bls        #0x8002d4c                    
  0x08002D30: cmp        r0, #2                        
  0x08002D32: bhi        #0x8002d4c                    
  0x08002D34: lsls       r0, r0, #1                    
  0x08002D36: adds       r0, #0xfd                     
  0x08002D38: adds       r0, r2, r0                    
  0x08002D3A: lsls       r0, r0, #0x18                 
  0x08002D3C: ldr        r1, [pc, #8]                  
  0x08002D3E: lsrs       r0, r0, #0x16                 
  0x08002D40: adds       r0, r0, r1                    
  0x08002D42: ldr        r0, [r0]                      
  0x08002D44: adds       r0, r0, r1                    
  0x08002D46: b          #0x8002d4e                    
  0x08002D4C: movs       r0, #0                        
  0x08002D4E: pop        {r1}                          
  0x08002D50: bx         r1                            