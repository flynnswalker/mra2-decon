; Function at 0x08000A84
; 92 instructions traced

  0x08000A84: push       {r4, r5, r6, r7, lr}          
  0x08000A86: mov        r7, sb                        
  0x08000A88: mov        r6, r8                        
  0x08000A8A: push       {r6, r7}                      
  0x08000A8C: mov        r8, r0                        
  0x08000A8E: mov        sb, r1                        
  0x08000A90: adds       r4, r2, #0                    
  0x08000A92: movs       r7, #0                        
  0x08000A94: movs       r6, #0                        
  0x08000A96: ldrh       r2, [r3]                      
  0x08000A98: adds       r0, r2, #0                    
  0x08000A9A: ldr        r5, [pc, #0x60]                 ; = 0x0000FFFD 
  0x08000A9C: cmp        r0, r5                        
  0x08000A9E: beq        #0x8000ad2                    
  0x08000AA0: ldr        r1, [pc, #0x5c]                 ; = 0x0000FFF4 
  0x08000AA2: cmp        r0, r1                        
  0x08000AA4: beq        #0x8000ad2                    
  0x08000AA6: mov        ip, r5                        
  0x08000AA8: adds       r5, r1, #0                    
  0x08000AAA: strh       r2, [r4]                      
  0x08000AAC: adds       r3, #2                        
  0x08000AAE: adds       r4, #2                        
  0x08000AB0: lsls       r0, r7, #0x10                 
  0x08000AB2: movs       r1, #0x80                     
  0x08000AB4: lsls       r1, r1, #9                    
  0x08000AB6: adds       r0, r0, r1                    
  0x08000AB8: lsrs       r7, r0, #0x10                 
  0x08000ABA: lsls       r0, r6, #0x10                 
  0x08000ABC: adds       r0, r0, r1                    
  0x08000ABE: lsrs       r6, r0, #0x10                 
  0x08000AC0: asrs       r0, r0, #0x10                 
  0x08000AC2: cmp        r0, #9                        
  0x08000AC4: bgt        #0x8000ad2                    
  0x08000AC6: ldrh       r2, [r3]                      
  0x08000AC8: adds       r0, r2, #0                    
  0x08000ACA: cmp        r0, ip                        
  0x08000ACC: beq        #0x8000ad2                    
  0x08000ACE: cmp        r0, r5                        
  0x08000AD0: bne        #0x8000aaa                    
  0x08000AD2: mov        r2, r8                        
  0x08000AD4: lsls       r0, r2, #0x18                 
  0x08000AD6: lsrs       r0, r0, #0x18                 
  0x08000AD8: mov        r2, sb                        
  0x08000ADA: lsls       r1, r2, #0x18                 
  0x08000ADC: lsrs       r1, r1, #0x18                 
  0x08000ADE: bl         #0x8002d20                    
  0x08000AE2: adds       r2, r0, #0                    
  0x08000AE4: cmp        r2, #0                        
  0x08000AE6: beq        #0x8000b2c                    
  0x08000AE8: ldrh       r1, [r2]                      
  0x08000AEA: adds       r0, r1, #0                    
  0x08000AEC: ldr        r5, [pc, #0xc]                  ; = 0x0000FFFD 
  0x08000AEE: cmp        r0, r5                        
  0x08000AF0: beq        #0x8000b2c                    
  0x08000AF2: ldr        r3, [pc, #0xc]                  ; = 0x0000FFF4 
  0x08000AF4: cmp        r0, r3                        
  0x08000AF6: beq        #0x8000b2c                    
  0x08000AF8: movs       r6, #0                        
  0x08000AFA: b          #0x8000b24                    
  0x08000B04: strh       r1, [r4]                      
  0x08000B06: adds       r2, #2                        
  0x08000B08: adds       r4, #2                        
  0x08000B0A: lsls       r0, r7, #0x10                 
  0x08000B0C: movs       r1, #0x80                     
  0x08000B0E: lsls       r1, r1, #9                    
  0x08000B10: adds       r0, r0, r1                    
  0x08000B12: lsrs       r7, r0, #0x10                 
  0x08000B14: lsls       r0, r6, #0x10                 
  0x08000B16: adds       r0, r0, r1                    
  0x08000B18: lsrs       r6, r0, #0x10                 
  0x08000B1A: asrs       r0, r0, #0x10                 
  0x08000B1C: cmp        r0, #7                        
  0x08000B1E: bgt        #0x8000b2c                    
  0x08000B20: ldrh       r1, [r2]                      
  0x08000B22: adds       r0, r1, #0                    
  0x08000B24: cmp        r0, r5                        
  0x08000B26: beq        #0x8000b2c                    
  0x08000B28: cmp        r0, r3                        
  0x08000B2A: bne        #0x8000b04                    
  0x08000B2C: lsls       r0, r7, #0x10                 
  0x08000B2E: asrs       r0, r0, #0x10                 
  0x08000B30: cmp        r0, #0x11                     
  0x08000B32: bgt        #0x8000b3a                    
  0x08000B34: ldr        r2, [pc, #0x10]                 ; = 0x0000FFFD 
  0x08000B36: adds       r0, r2, #0                    
  0x08000B38: strh       r0, [r4]                      
  0x08000B3A: pop        {r3, r4}                      
  0x08000B3C: mov        r8, r3                        
  0x08000B3E: mov        sb, r4                        
  0x08000B40: pop        {r4, r5, r6, r7}              
  0x08000B42: pop        {r0}                          
  0x08000B44: bx         r0                            