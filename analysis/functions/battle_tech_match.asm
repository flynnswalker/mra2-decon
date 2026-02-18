; Function at 0x08043C40
; 50 instructions traced

  0x08043C40: push       {r4, r5, r6, lr}              
  0x08043C42: adds       r4, r0, #0                    
  0x08043C44: adds       r5, r1, #0                    
  0x08043C46: bl         #0x8002530                    
  0x08043C4A: movs       r3, #0                        
  0x08043C4C: adds       r2, r5, #0                    
  0x08043C4E: adds       r2, #0x20                     
  0x08043C50: adds       r1, r4, #0                    
  0x08043C52: ldrh       r0, [r1]                      
  0x08043C54: ldrh       r6, [r2]                      
  0x08043C56: cmp        r0, r6                        
  0x08043C58: bne        #0x8043ca4                    
  0x08043C5A: adds       r2, #2                        
  0x08043C5C: adds       r1, #2                        
  0x08043C5E: adds       r3, #1                        
  0x08043C60: cmp        r3, #0xf                      
  0x08043C62: ble        #0x8043c52                    
  0x08043C64: ldr        r1, [r4, #0x20]               
  0x08043C66: ldr        r0, [r5, #0x40]               
  0x08043C68: cmp        r1, r0                        
  0x08043C6A: bne        #0x8043ca4                    
  0x08043C6C: movs       r1, #0x82                     
  0x08043C6E: lsls       r1, r1, #1                    
  0x08043C70: adds       r0, r4, r1                    
  0x08043C72: adds       r1, r5, #0                    
  0x08043C74: adds       r1, #0x44                     
  0x08043C76: ldrb       r0, [r0]                      
  0x08043C78: ldrb       r1, [r1]                      
  0x08043C7A: cmp        r0, r1                        
  0x08043C7C: bne        #0x8043ca4                    
  0x08043C7E: ldr        r6, [pc, #0x20]                 ; = 0x00000105 
  0x08043C80: adds       r0, r4, r6                    
  0x08043C82: adds       r1, r5, #0                    
  0x08043C84: adds       r1, #0x45                     
  0x08043C86: ldrb       r0, [r0]                      
  0x08043C88: ldrb       r1, [r1]                      
  0x08043C8A: cmp        r0, r1                        
  0x08043C8C: bne        #0x8043ca4                    
  0x08043C8E: adds       r0, r4, #0                    
  0x08043C90: adds       r0, #0x8c                     
  0x08043C92: ldr        r1, [r0]                      
  0x08043C94: ldr        r0, [r5, #0x48]               
  0x08043C96: cmp        r1, r0                        
  0x08043C98: bne        #0x8043ca4                    
  0x08043C9A: movs       r0, #1                        
  0x08043C9C: b          #0x8043ca6                    
  0x08043CA4: movs       r0, #0                        
  0x08043CA6: pop        {r4, r5, r6}                  
  0x08043CA8: pop        {r1}                          
  0x08043CAA: bx         r1                            