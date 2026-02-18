; Function at 0x08018C10
; 118 instructions traced

  0x08018C10: push       {r4, r5, r6, r7, lr}          
  0x08018C12: mov        r7, sl                        
  0x08018C14: mov        r6, sb                        
  0x08018C16: mov        r5, r8                        
  0x08018C18: push       {r5, r6, r7}                  
  0x08018C1A: sub        sp, #0x4c                     
  0x08018C1C: str        r0, [sp, #0x44]               
  0x08018C1E: bl         #0x8002530                    
  0x08018C22: str        r0, [sp, #0x48]               
  0x08018C24: movs       r5, #0                        
  0x08018C26: add        r4, sp, #0x3c                 
  0x08018C28: ldr        r0, [pc, #0x7c]                 ; = 0xFFFF0000 
  0x08018C2A: mov        sl, r0                        
  0x08018C2C: movs       r1, #0x87                     
  0x08018C2E: mov        sb, r1                        
  0x08018C30: ldr        r0, [pc, #0x78]                 ; = 0x0000FFFF 
  0x08018C32: mov        r8, r0                        
  0x08018C34: movs       r7, #0x80                     
  0x08018C36: lsls       r7, r7, #0xe                  
  0x08018C38: add        r6, sp, #0x24                 
  0x08018C3A: ldr        r0, [sp, #0x3c]               
  0x08018C3C: mov        r1, sl                        
  0x08018C3E: ands       r0, r1                        
  0x08018C40: mov        r1, sb                        
  0x08018C42: orrs       r0, r1                        
  0x08018C44: mov        r1, r8                        
  0x08018C46: ands       r0, r1                        
  0x08018C48: orrs       r0, r7                        
  0x08018C4A: str        r0, [sp, #0x3c]               
  0x08018C4C: ldr        r0, [r4, #4]                  
  0x08018C4E: mov        r1, sl                        
  0x08018C50: ands       r0, r1                        
  0x08018C52: mov        r1, sb                        
  0x08018C54: orrs       r0, r1                        
  0x08018C56: mov        r1, r8                        
  0x08018C58: ands       r0, r1                        
  0x08018C5A: orrs       r0, r7                        
  0x08018C5C: str        r0, [r4, #4]                  
  0x08018C5E: adds       r1, r5, #0                    
  0x08018C60: adds       r1, #0x95                     
  0x08018C62: ldr        r0, [sp, #0x48]               
  0x08018C64: ldr        r2, [sp, #0x44]               
  0x08018C66: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08018C6A: adds       r1, r0, #0                    
  0x08018C6C: cmp        r1, #0xff                     
  0x08018C6E: beq        #0x8018cb0                    
  0x08018C70: add        r0, sp, #4                    
  0x08018C72: bl         #0x800d45c                    
  0x08018C76: ldr        r1, [sp, #0x1c]               
  0x08018C78: adds       r0, r6, #0                    
  0x08018C7A: bl         #0x80036d4                    
  0x08018C7E: adds       r0, r4, #0                    
  0x08018C80: adds       r1, r6, #0                    
  0x08018C82: movs       r2, #0x60                     
  0x08018C84: bl         #0x800836c                    
  0x08018C88: ldrh       r2, [r4]                      
  0x08018C8A: ldrh       r3, [r4, #2]                  
  0x08018C8C: adds       r3, #1                        
  0x08018C8E: lsls       r0, r5, #4                    
  0x08018C90: adds       r3, r3, r0                    
  0x08018C92: lsls       r3, r3, #0x10                 
  0x08018C94: lsrs       r3, r3, #0x10                 
  0x08018C96: movs       r0, #0x20                     
  0x08018C98: str        r0, [sp]                      
  0x08018C9A: adds       r0, r6, #0                    
  0x08018C9C: movs       r1, #0xc0                     
  0x08018C9E: lsls       r1, r1, #0x13                 
  0x08018CA0: bl         #0x8068158                    
  0x08018CA4: b          #0x8018cd6                    
  0x08018CB0: movs       r0, #0x4f                     
  0x08018CB2: bl         #0x8002c68                    
  0x08018CB6: ldrh       r2, [r4, #4]                  
  0x08018CB8: adds       r2, #0x14                     
  0x08018CBA: lsls       r2, r2, #0x10                 
  0x08018CBC: lsrs       r2, r2, #0x10                 
  0x08018CBE: ldrh       r3, [r4, #6]                  
  0x08018CC0: adds       r3, #1                        
  0x08018CC2: lsls       r1, r5, #4                    
  0x08018CC4: adds       r3, r3, r1                    
  0x08018CC6: lsls       r3, r3, #0x10                 
  0x08018CC8: lsrs       r3, r3, #0x10                 
  0x08018CCA: movs       r1, #0x20                     
  0x08018CCC: str        r1, [sp]                      
  0x08018CCE: movs       r1, #0xc0                     
  0x08018CD0: lsls       r1, r1, #0x13                 
  0x08018CD2: bl         #0x8068158                    
  0x08018CD6: adds       r5, #1                        
  0x08018CD8: cmp        r5, #2                        
  0x08018CDA: ble        #0x8018c3a                    
  0x08018CDC: movs       r5, #3                        
  0x08018CDE: movs       r0, #0x4f                     
  0x08018CE0: bl         #0x8002c68                    
  0x08018CE4: ldrh       r2, [r4, #4]                  
  0x08018CE6: adds       r2, #0x14                     
  0x08018CE8: lsls       r2, r2, #0x10                 
  0x08018CEA: lsrs       r2, r2, #0x10                 
  0x08018CEC: ldrh       r3, [r4, #6]                  
  0x08018CEE: adds       r3, #1                        
  0x08018CF0: lsls       r1, r5, #4                    
  0x08018CF2: adds       r3, r3, r1                    
  0x08018CF4: lsls       r3, r3, #0x10                 
  0x08018CF6: lsrs       r3, r3, #0x10                 
  0x08018CF8: movs       r1, #0x20                     
  0x08018CFA: str        r1, [sp]                      
  0x08018CFC: movs       r1, #0xc0                     
  0x08018CFE: lsls       r1, r1, #0x13                 
  0x08018D00: bl         #0x8068158                    
  0x08018D04: adds       r5, #1                        
  0x08018D06: cmp        r5, #5                        
  0x08018D08: ble        #0x8018cde                    
  0x08018D0A: add        sp, #0x4c                     
  0x08018D0C: pop        {r3, r4, r5}                  
  0x08018D0E: mov        r8, r3                        
  0x08018D10: mov        sb, r4                        
  0x08018D12: mov        sl, r5                        
  0x08018D14: pop        {r4, r5, r6, r7}              
  0x08018D16: pop        {r0}                          
  0x08018D18: bx         r0                            