; Function at 0x08044C14
; 186 instructions traced

  0x08044C14: push       {r4, r5, r6, r7, lr}          
  0x08044C16: mov        r7, sl                        
  0x08044C18: mov        r6, sb                        
  0x08044C1A: mov        r5, r8                        
  0x08044C1C: push       {r5, r6, r7}                  
  0x08044C1E: sub        sp, #0x18                     
  0x08044C20: adds       r5, r0, #0                    
  0x08044C22: lsls       r1, r1, #0x18                 
  0x08044C24: lsrs       r1, r1, #0x18                 
  0x08044C26: mov        sl, r1                        
  0x08044C28: lsls       r2, r2, #0x18                 
  0x08044C2A: lsrs       r6, r2, #0x18                 
  0x08044C2C: cmp        r6, #6                        
  0x08044C2E: bls        #0x8044c32                    
  0x08044C30: b          #0x8044da2                    
  0x08044C32: cmp        r6, #6                        
  0x08044C34: beq        #0x8044d18                    
  0x08044C36: ldrb       r7, [r5, #0x18]               
  0x08044C38: adds       r0, r6, #0                    
  0x08044C3A: movs       r1, #3                        
  0x08044C3C: bl         #0x81c7bac                    
  0x08044C40: adds       r4, r0, #0                    
  0x08044C42: lsls       r4, r4, #0x18                 
  0x08044C44: lsrs       r4, r4, #0x18                 
  0x08044C46: adds       r0, r6, #0                    
  0x08044C48: movs       r1, #3                        
  0x08044C4A: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x08044C4E: lsls       r0, r0, #0x18                 
  0x08044C50: lsrs       r0, r0, #0x17                 
  0x08044C52: adds       r4, r4, r0                    
  0x08044C54: adds       r0, r5, #0                    
  0x08044C56: adds       r0, #0x51                     
  0x08044C58: adds       r0, r0, r4                    
  0x08044C5A: ldrb       r0, [r0]                      
  0x08044C5C: adds       r2, r0, #0                    
  0x08044C5E: cmp        r2, #0xff                     
  0x08044C60: bne        #0x8044c6c                    
  0x08044C62: movs       r0, #0x4f                     
  0x08044C64: bl         #0x8002c68                    
  0x08044C68: adds       r7, r0, #0                    
  0x08044C6A: b          #0x8044c8c                    
  0x08044C6C: cmp        r2, #9                        
  0x08044C6E: bhi        #0x8044c88                    
  0x08044C70: ldr        r0, [pc, #0x10]                 ; = 0x08208CB0 
  0x08044C72: lsls       r1, r7, #2                    
  0x08044C74: adds       r1, r1, r7                    
  0x08044C76: lsls       r1, r1, #1                    
  0x08044C78: adds       r1, r1, r2                    
  0x08044C7A: lsls       r1, r1, #1                    
  0x08044C7C: adds       r1, r1, r0                    
  0x08044C7E: ldrh       r1, [r1]                      
  0x08044C80: adds       r7, r1, r0                    
  0x08044C82: b          #0x8044c8c                    
  0x08044C88: ldr        r0, [pc, #0x7c]                 ; = 0x00000232 
  0x08044C8A: adds       r7, r5, r0                    
  0x08044C8C: adds       r0, r7, #0                    
  0x08044C8E: movs       r1, #0xa                      
  0x08044C90: bl         #0x806862c                    
  0x08044C94: ldr        r2, [pc, #0x74]                 ; = 0x081C9B5C 
  0x08044C96: mov        r3, sl                        
  0x08044C98: lsls       r1, r3, #1                    
  0x08044C9A: adds       r1, r1, r2                    
  0x08044C9C: lsls       r0, r0, #0x10                 
  0x08044C9E: lsrs       r0, r0, #0x11                 
  0x08044CA0: ldrh       r1, [r1]                      
  0x08044CA2: subs       r1, r1, r0                    
  0x08044CA4: lsls       r1, r1, #0x10                 
  0x08044CA6: lsrs       r0, r1, #0x10                 
  0x08044CA8: mov        r8, r0                        
  0x08044CAA: cmp        r1, #0                        
  0x08044CAC: bge        #0x8044cb2                    
  0x08044CAE: movs       r1, #0                        
  0x08044CB0: mov        r8, r1                        
  0x08044CB2: ldr        r0, [pc, #0x5c]                 ; = 0x081C9BD4 
  0x08044CB4: ldrh       r0, [r0, #4]                  
  0x08044CB6: lsls       r5, r0, #5                    
  0x08044CB8: movs       r2, #0                        
  0x08044CBA: mov        sb, r2                        
  0x08044CBC: str        r2, [sp, #8]                  
  0x08044CBE: ldr        r2, [pc, #0x54]                 ; = 0x081C9B64 
  0x08044CC0: mov        r3, sl                        
  0x08044CC2: lsls       r0, r3, #2                    
  0x08044CC4: lsls       r1, r6, #3                    
  0x08044CC6: adds       r0, r0, r1                    
  0x08044CC8: adds       r0, r0, r2                    
  0x08044CCA: ldr        r6, [r0]                      
  0x08044CCC: adds       r4, r5, #0                    
  0x08044CCE: lsrs       r4, r4, #2                    
  0x08044CD0: movs       r0, #0x80                     
  0x08044CD2: lsls       r0, r0, #0x11                 
  0x08044CD4: orrs       r4, r0                        
  0x08044CD6: add        r0, sp, #8                    
  0x08044CD8: adds       r1, r6, #0                    
  0x08044CDA: adds       r2, r4, #0                    
  0x08044CDC: bl         #0x81c77c4                    
  0x08044CE0: mov        r0, sb                        
  0x08044CE2: str        r0, [sp, #0xc]                
  0x08044CE4: add        r0, sp, #0xc                  
  0x08044CE6: movs       r2, #0x80                     
  0x08044CE8: lsls       r2, r2, #3                    
  0x08044CEA: adds       r1, r6, r2                    
  0x08044CEC: adds       r2, r4, #0                    
  0x08044CEE: bl         #0x81c77c4                    
  0x08044CF2: mov        r3, r8                        
  0x08044CF4: mov        r0, sb                        
  0x08044CF6: str        r0, [sp]                      
  0x08044CF8: movs       r0, #0x20                     
  0x08044CFA: str        r0, [sp, #4]                  
  0x08044CFC: adds       r0, r7, #0                    
  0x08044CFE: movs       r1, #0xa                      
  0x08044D00: adds       r2, r6, #0                    
  0x08044D02: bl         #0x80681ec                    
  0x08044D06: b          #0x8044da2                    
  0x08044D18: ldr        r1, [pc, #0x98]                 ; = 0x00000246 
  0x08044D1A: adds       r0, r5, r1                    
  0x08044D1C: ldrb       r0, [r0]                      
  0x08044D1E: cmp        r0, #0x1e                     
  0x08044D20: beq        #0x8044da2                    
  0x08044D22: movs       r2, #0x93                     
  0x08044D24: lsls       r2, r2, #2                    
  0x08044D26: adds       r7, r5, r2                    
  0x08044D28: adds       r0, r7, #0                    
  0x08044D2A: movs       r1, #0x10                     
  0x08044D2C: bl         #0x806862c                    
  0x08044D30: ldr        r2, [pc, #0x84]                 ; = 0x081C9B60 
  0x08044D32: mov        r3, sl                        
  0x08044D34: lsls       r1, r3, #1                    
  0x08044D36: adds       r1, r1, r2                    
  0x08044D38: lsls       r0, r0, #0x10                 
  0x08044D3A: lsrs       r0, r0, #0x11                 
  0x08044D3C: ldrh       r1, [r1]                      
  0x08044D3E: subs       r1, r1, r0                    
  0x08044D40: lsls       r1, r1, #0x10                 
  0x08044D42: lsrs       r0, r1, #0x10                 
  0x08044D44: mov        r8, r0                        
  0x08044D46: cmp        r1, #0                        
  0x08044D48: bge        #0x8044d4e                    
  0x08044D4A: movs       r1, #0                        
  0x08044D4C: mov        r8, r1                        
  0x08044D4E: ldr        r0, [pc, #0x6c]                 ; = 0x081C9BD4 
  0x08044D50: ldrh       r0, [r0, #0xc]                
  0x08044D52: lsls       r5, r0, #5                    
  0x08044D54: movs       r2, #0                        
  0x08044D56: mov        sb, r2                        
  0x08044D58: str        r2, [sp, #0x10]               
  0x08044D5A: add        r3, sp, #0x10                 
  0x08044D5C: ldr        r1, [pc, #0x60]                 ; = 0x081C9B64 
  0x08044D5E: mov        r2, sl                        
  0x08044D60: lsls       r0, r2, #2                    
  0x08044D62: adds       r0, #0x30                     
  0x08044D64: adds       r0, r0, r1                    
  0x08044D66: ldr        r6, [r0]                      
  0x08044D68: adds       r2, r5, #0                    
  0x08044D6A: lsrs       r4, r2, #2                    
  0x08044D6C: movs       r0, #0x80                     
  0x08044D6E: lsls       r0, r0, #0x11                 
  0x08044D70: orrs       r4, r0                        
  0x08044D72: adds       r0, r3, #0                    
  0x08044D74: adds       r1, r6, #0                    
  0x08044D76: adds       r2, r4, #0                    
  0x08044D78: bl         #0x81c77c4                    
  0x08044D7C: mov        r3, sb                        
  0x08044D7E: str        r3, [sp, #0x14]               
  0x08044D80: add        r0, sp, #0x14                 
  0x08044D82: movs       r2, #0x80                     
  0x08044D84: lsls       r2, r2, #3                    
  0x08044D86: adds       r1, r6, r2                    
  0x08044D88: adds       r2, r4, #0                    
  0x08044D8A: bl         #0x81c77c4                    
  0x08044D8E: mov        r3, r8                        
  0x08044D90: mov        r0, sb                        
  0x08044D92: str        r0, [sp]                      
  0x08044D94: movs       r0, #0x20                     
  0x08044D96: str        r0, [sp, #4]                  
  0x08044D98: adds       r0, r7, #0                    
  0x08044D9A: movs       r1, #0x10                     
  0x08044D9C: adds       r2, r6, #0                    
  0x08044D9E: bl         #0x80681ec                    
  0x08044DA2: add        sp, #0x18                     
  0x08044DA4: pop        {r3, r4, r5}                  
  0x08044DA6: mov        r8, r3                        
  0x08044DA8: mov        sb, r4                        
  0x08044DAA: mov        sl, r5                        
  0x08044DAC: pop        {r4, r5, r6, r7}              
  0x08044DAE: pop        {r0}                          
  0x08044DB0: bx         r0                            