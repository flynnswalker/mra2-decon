; Function at 0x08018ADC
; 82 instructions traced

  0x08018ADC: push       {r4, r5, r6, r7, lr}          
  0x08018ADE: mov        r7, sl                        
  0x08018AE0: mov        r6, sb                        
  0x08018AE2: mov        r5, r8                        
  0x08018AE4: push       {r5, r6, r7}                  
  0x08018AE6: sub        sp, #0x10                     
  0x08018AE8: mov        r8, r0                        
  0x08018AEA: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x08018AEE: str        r0, [sp, #8]                  
  0x08018AF0: bl         #0x8002530                    
  0x08018AF4: mov        sb, r0                        
  0x08018AF6: ldr        r0, [pc, #0x54]                 ; = 0xFFFF0000 
  0x08018AF8: mov        r1, sl                        
  0x08018AFA: ands       r1, r0                        
  0x08018AFC: movs       r0, #0x87                     
  0x08018AFE: orrs       r1, r0                        
  0x08018B00: ldr        r0, [pc, #0x4c]                 ; = 0x0000FFFF 
  0x08018B02: ands       r1, r0                        
  0x08018B04: movs       r0, #0x80                     
  0x08018B06: lsls       r0, r0, #0xe                  
  0x08018B08: orrs       r1, r0                        
  0x08018B0A: mov        sl, r1                        
  0x08018B0C: movs       r2, #0                        
  0x08018B0E: str        r2, [sp, #0xc]                
  0x08018B10: ldr        r0, [sp, #0xc]                
  0x08018B12: adds       r0, #0x28                     
  0x08018B14: bl         #0x8002c68                    
  0x08018B18: movs       r1, #0xc0                     
  0x08018B1A: lsls       r1, r1, #0x13                 
  0x08018B1C: mov        r2, sl                        
  0x08018B1E: adds       r2, #4                        
  0x08018B20: lsls       r2, r2, #0x10                 
  0x08018B22: lsrs       r2, r2, #0x10                 
  0x08018B24: mov        r3, sl                        
  0x08018B26: asrs       r6, r3, #0x10                 
  0x08018B28: adds       r3, r6, #1                    
  0x08018B2A: ldr        r4, [sp, #0xc]                
  0x08018B2C: lsls       r5, r4, #4                    
  0x08018B2E: adds       r3, r3, r5                    
  0x08018B30: lsls       r3, r3, #0x10                 
  0x08018B32: lsrs       r3, r3, #0x10                 
  0x08018B34: movs       r4, #0x20                     
  0x08018B36: str        r4, [sp]                      
  0x08018B38: bl         #0x8068158                    
  0x08018B3C: ldr        r0, [sp, #0xc]                
  0x08018B3E: cmp        r0, #5                        
  0x08018B40: bhi        #0x8018bd0                    
  0x08018B42: lsls       r0, r0, #2                    
  0x08018B44: ldr        r1, [pc, #0xc]                  ; = 0x08018B58 
  0x08018B46: adds       r0, r0, r1                    
  0x08018B48: ldr        r0, [r0]                      
  0x08018B4A: mov        pc, r0                        
  0x08018B4C: movs       r0, r0                        
  0x08018BD0: movs       r1, #0xc0                     
  0x08018BD2: lsls       r1, r1, #0x13                 
  0x08018BD4: mov        r2, sl                        
  0x08018BD6: adds       r2, #0x3e                     
  0x08018BD8: lsls       r2, r2, #0x10                 
  0x08018BDA: lsrs       r2, r2, #0x10                 
  0x08018BDC: adds       r3, r6, #1                    
  0x08018BDE: adds       r3, r3, r5                    
  0x08018BE0: lsls       r3, r3, #0x10                 
  0x08018BE2: lsrs       r3, r3, #0x10                 
  0x08018BE4: movs       r0, #0x20                     
  0x08018BE6: str        r0, [sp]                      
  0x08018BE8: ldr        r0, [pc, #0x20]                 ; = 0x80000003 
  0x08018BEA: str        r0, [sp, #4]                  
  0x08018BEC: adds       r0, r7, #0                    
  0x08018BEE: bl         #0x8003844                    
  0x08018BF2: ldr        r0, [sp, #0xc]                
  0x08018BF4: adds       r0, #1                        
  0x08018BF6: str        r0, [sp, #0xc]                
  0x08018BF8: cmp        r0, #5                        
  0x08018BFA: ble        #0x8018b10                    
  0x08018BFC: add        sp, #0x10                     
  0x08018BFE: pop        {r3, r4, r5}                  
  0x08018C00: mov        r8, r3                        
  0x08018C02: mov        sb, r4                        
  0x08018C04: mov        sl, r5                        
  0x08018C06: pop        {r4, r5, r6, r7}              
  0x08018C08: pop        {r0}                          
  0x08018C0A: bx         r0                            