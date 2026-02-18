; Function at 0x0800DC28
; 58 instructions traced

  0x0800DC28: b          #0x800dc94                    
  0x0800DC94: bl         #0x800d3a8                    
  0x0800DC98: movs       r1, #1                        
  0x0800DC9A: rsbs       r1, r1, #0                    
  0x0800DC9C: cmp        r0, r1                        
  0x0800DC9E: beq        #0x800dcb6                    
  0x0800DCA0: b          #0x800dd04                    
  0x0800DCB6: ldr        r2, [sp, #0xc]                
  0x0800DCB8: cmp        r2, #0                        
  0x0800DCBA: beq        #0x800dd04                    
  0x0800DCBC: movs       r2, #0                        
  0x0800DCBE: ldr        r1, [sp, #8]                  
  0x0800DCC0: adds       r1, #0xd                      
  0x0800DCC2: adds       r3, r1, r2                    
  0x0800DCC4: ldrb       r0, [r3]                      
  0x0800DCC6: adds       r6, r2, #1                    
  0x0800DCC8: cmp        r0, #0xff                     
  0x0800DCCA: beq        #0x800dcea                    
  0x0800DCCC: movs       r4, #0                        
  0x0800DCCE: adds       r5, r3, #0                    
  0x0800DCD0: movs       r7, #0xff                     
  0x0800DCD2: mov        r0, sp                        
  0x0800DCD4: adds       r3, r0, r4                    
  0x0800DCD6: ldrb       r2, [r3]                      
  0x0800DCD8: ldrb       r0, [r5]                      
  0x0800DCDA: cmp        r0, r2                        
  0x0800DCDC: bne        #0x800dce4                    
  0x0800DCDE: adds       r0, r2, #0                    
  0x0800DCE0: orrs       r0, r7                        
  0x0800DCE2: strb       r0, [r3]                      
  0x0800DCE4: adds       r4, #1                        
  0x0800DCE6: cmp        r4, #5                        
  0x0800DCE8: ble        #0x800dcd2                    
  0x0800DCEA: lsls       r0, r6, #0x18                 
  0x0800DCEC: lsrs       r2, r0, #0x18                 
  0x0800DCEE: cmp        r2, #6                        
  0x0800DCF0: bls        #0x800dcc2                    
  0x0800DCF2: movs       r4, #0                        
  0x0800DCF4: mov        r1, sp                        
  0x0800DCF6: adds       r0, r1, r4                    
  0x0800DCF8: ldrb       r0, [r0]                      
  0x0800DCFA: cmp        r0, #0xff                     
  0x0800DCFC: beq        #0x800dd0a                    
  0x0800DCFE: adds       r4, #1                        
  0x0800DD00: cmp        r4, #5                        
  0x0800DD02: ble        #0x800dcf4                    
  0x0800DD04: movs       r0, #1                        
  0x0800DD06: rsbs       r0, r0, #0                    
  0x0800DD08: b          #0x800dd0c                    
  0x0800DD0A: adds       r0, r4, #0                    
  0x0800DD0C: add        sp, #0x10                     
  0x0800DD0E: pop        {r3, r4, r5}                  
  0x0800DD10: mov        r8, r3                        
  0x0800DD12: mov        sb, r4                        
  0x0800DD14: mov        sl, r5                        
  0x0800DD16: pop        {r4, r5, r6, r7}              
  0x0800DD18: pop        {r1}                          
  0x0800DD1A: bx         r1                            