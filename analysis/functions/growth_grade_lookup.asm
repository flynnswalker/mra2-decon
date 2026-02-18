; Function at 0x08002A5C
; 19 instructions traced

  0x08002A5C: push       {r4, lr}                      
  0x08002A5E: adds       r4, r0, #0                    
  0x08002A60: adds       r0, r1, r2                    
  0x08002A62: subs       r0, #0x64                     
  0x08002A64: movs       r1, #0x28                     
  0x08002A66: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08002A6A: adds       r0, r0, r4                    
  0x08002A6C: subs       r0, #3                        
  0x08002A6E: movs       r1, #5                        
  0x08002A70: rsbs       r1, r1, #0                    
  0x08002A72: cmp        r0, r1                        
  0x08002A74: bge        #0x8002a78                    
  0x08002A76: adds       r0, r1, #0                    
  0x08002A78: cmp        r0, #5                        
  0x08002A7A: ble        #0x8002a7e                    
  0x08002A7C: movs       r0, #5                        
  0x08002A7E: pop        {r4}                          
  0x08002A80: pop        {r1}                          
  0x08002A82: bx         r1                            