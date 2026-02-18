; Function at 0x08041A2C
; 46 instructions traced

  0x08041A2C: push       {r4, lr}                      
  0x08041A2E: bl         #0x8000310                    
  0x08041A32: cmp        r0, #0                        
  0x08041A34: beq        #0x8041a6c                    
  0x08041A36: ldr        r4, [pc, #0x50]                 ; = 0x0200C8D4 
  0x08041A38: ldrb       r0, [r4, #1]                  
  0x08041A3A: movs       r1, #0                        
  0x08041A3C: bl         #0x8031324                    
  0x08041A40: lsls       r0, r0, #0x18                 
  0x08041A42: lsrs       r0, r0, #0x14                 
  0x08041A44: adds       r1, r4, #0                    
  0x08041A46: adds       r1, #0x1c                     
  0x08041A48: adds       r0, r0, r1                    
  0x08041A4A: ldr        r2, [r0]                      
  0x08041A4C: ldrb       r0, [r4, #1]                  
  0x08041A4E: movs       r1, #0                        
  0x08041A50: cmp        r0, #0                        
  0x08041A52: bne        #0x8041a56                    
  0x08041A54: movs       r1, #4                        
  0x08041A56: lsls       r0, r1, #4                    
  0x08041A58: adds       r1, r4, #0                    
  0x08041A5A: adds       r1, #0x14                     
  0x08041A5C: adds       r0, r0, r1                    
  0x08041A5E: ldr        r1, [r0]                      
  0x08041A60: adds       r0, r2, #0                    
  0x08041A62: bl         #0x8043148                    
  0x08041A66: adds       r0, r4, #0                    
  0x08041A68: bl         #0x8043098                    
  0x08041A6C: ldr        r0, [pc, #0x18]                 ; = 0x0200C8D4 
  0x08041A6E: bl         #0x80430b4                    
  0x08041A72: lsls       r0, r0, #0x18                 
  0x08041A74: lsrs       r0, r0, #0x18                 
  0x08041A76: cmp        r0, #0xf1                     
  0x08041A78: bne        #0x8041a94                    
  0x08041A7A: bl         #0x8043c28                    
  0x08041A7E: cmp        r0, #0                        
  0x08041A80: beq        #0x8041a90                    
  0x08041A82: ldr        r0, [pc, #8]                  
  0x08041A84: b          #0x8041a98                    
  0x08041A90: movs       r0, #0xd                      
  0x08041A92: b          #0x8041a98                    
  0x08041A94: movs       r0, #0x80                     
  0x08041A96: lsls       r0, r0, #0x18                 
  0x08041A98: pop        {r4}                          
  0x08041A9A: pop        {r1}                          
  0x08041A9C: bx         r1                            