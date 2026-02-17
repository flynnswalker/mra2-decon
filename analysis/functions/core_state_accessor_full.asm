; Function at 0x08002240
; 98 instructions traced

  0x08001AE8: adds       r4, r0, #0                    
  0x08001AEA: bl         #0x8001b58                    
  0x08001AEE: cmp        r0, #1                        
  0x08001AF0: beq        #0x8001b00                    
  0x08001AF2: ldr        r0, [pc, #0x60]                 ; = 0x02000010 
  0x08001AF4: ldr        r0, [r0]                      
  0x08001AF6: adds       r1, r4, #0                    
  0x08001AF8: movs       r2, #1                        
  0x08001AFA: bl         #0x8001bec                    
  0x08001AFE: movs       r6, #1                        
  0x08001B00: movs       r5, #0                        
  0x08001B02: cmp        r6, #6                        
  0x08001B04: bgt        #0x8001b42                    
  0x08001B06: mov        r1, r8                        
  0x08001B08: lsls       r0, r1, #1                    
  0x08001B0A: add        r0, r8                        
  0x08001B0C: lsls       r7, r0, #1                    
  0x08001B0E: ldr        r2, [pc, #0x44]                 ; = 0x02000010 
  0x08001B10: mov        r8, r2                        
  0x08001B12: adds       r0, r7, r5                    
  0x08001B14: bl         #0x8002a84                    
  0x08001B18: adds       r4, r0, #0                    
  0x08001B1A: bl         #0x8001b58                    
  0x08001B1E: cmp        r0, #1                        
  0x08001B20: beq        #0x8001b38                    
  0x08001B22: movs       r0, #0x74                     
  0x08001B24: adds       r1, r6, #0                    
  0x08001B26: muls       r1, r0, r1                    
  0x08001B28: mov        r2, r8                        
  0x08001B2A: ldr        r0, [r2]                      
  0x08001B2C: adds       r0, r0, r1                    
  0x08001B2E: adds       r1, r4, #0                    
  0x08001B30: movs       r2, #1                        
  0x08001B32: bl         #0x8001bec                    
  0x08001B36: adds       r6, #1                        
  0x08001B38: adds       r5, #1                        
  0x08001B3A: cmp        r5, #5                        
  0x08001B3C: bgt        #0x8001b42                    
  0x08001B3E: cmp        r6, #6                        
  0x08001B40: ble        #0x8001b12                    
  0x08001B42: adds       r0, r6, #0                    
  0x08001B44: pop        {r3}                          
  0x08001B46: mov        r8, r3                        
  0x08001B48: pop        {r4, r5, r6, r7}              
  0x08001B4A: pop        {r1}                          
  0x08001B4C: bx         r1                            
  0x08002240: push       {r4, r5, r6, r7, lr}          
  0x08002242: mov        r7, sl                        
  0x08002244: mov        r6, sb                        
  0x08002246: mov        r5, r8                        
  0x08002248: push       {r5, r6, r7}                  
  0x0800224A: sub        sp, #4                        
  0x0800224C: mov        sl, r0                        
  0x0800224E: mov        sb, r1                        
  0x08002250: mov        r8, r2                        
  0x08002252: mov        ip, r3                        
  0x08002254: movs       r5, #0                        
  0x08002256: movs       r0, #1                        
  0x08002258: mov        r1, ip                        
  0x0800225A: ands       r1, r0                        
  0x0800225C: mov        ip, r1                        
  0x0800225E: ldr        r3, [pc, #0x34]                 ; = 0x083EE428 
  0x08002260: mov        r6, sb                        
  0x08002262: lsls       r2, r6, #4                    
  0x08002264: adds       r4, r2, r3                    
  0x08002266: ldr        r0, [r4]                      
  0x08002268: add        r0, sl                        
  0x0800226A: ldrh       r1, [r4, #6]                  
  0x0800226C: ldr        r6, [sp, #0x24]               
  0x0800226E: muls       r1, r6, r1                    
  0x08002270: adds       r7, r0, r1                    
  0x08002272: adds       r0, r3, #0                    
  0x08002274: adds       r0, #8                        
  0x08002276: adds       r0, r2, r0                    
  0x08002278: ldr        r6, [r0]                      
  0x0800227A: adds       r0, r3, #0                    
  0x0800227C: adds       r0, #0xc                      
  0x0800227E: adds       r2, r2, r0                    
  0x08002280: ldr        r2, [r2]                      
  0x08002282: ldrh       r0, [r4, #4]                  
  0x08002284: cmp        r0, #0xb                      
  0x08002286: bls        #0x800228a                    
  0x08002288: b          #0x8002438                    
  0x0800228A: lsls       r0, r0, #2                    
  0x0800228C: ldr        r1, [pc, #8]                  
  0x0800228E: adds       r0, r0, r1                    
  0x08002290: ldr        r0, [r0]                      
  0x08002292: mov        pc, r0                        
  0x08002294: b          #0x8001ae8                    
  0x08002438: adds       r0, r5, #0                    
  0x0800243A: add        sp, #4                        
  0x0800243C: pop        {r3, r4, r5}                  
  0x0800243E: mov        r8, r3                        
  0x08002440: mov        sb, r4                        
  0x08002442: mov        sl, r5                        
  0x08002444: pop        {r4, r5, r6, r7}              
  0x08002446: pop        {r1}                          
  0x08002448: bx         r1                            