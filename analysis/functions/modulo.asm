; Function at 0x081C7A6C
; 102 instructions traced

  0x081C7A6C: movs       r3, #1                        
  0x081C7A6E: cmp        r1, #0                        
  0x081C7A70: beq        #0x81c7b30                    
  0x081C7A72: bpl        #0x81c7a76                    
  0x081C7A74: rsbs       r1, r1, #0                    
  0x081C7A76: push       {r4}                          
  0x081C7A78: push       {r0}                          
  0x081C7A7A: cmp        r0, #0                        
  0x081C7A7C: bpl        #0x81c7a80                    
  0x081C7A7E: rsbs       r0, r0, #0                    
  0x081C7A80: cmp        r0, r1                        
  0x081C7A82: blo        #0x81c7b24                    
  0x081C7A84: movs       r4, #1                        
  0x081C7A86: lsls       r4, r4, #0x1c                 
  0x081C7A88: cmp        r1, r4                        
  0x081C7A8A: bhs        #0x81c7a96                    
  0x081C7A8C: cmp        r1, r0                        
  0x081C7A8E: bhs        #0x81c7a96                    
  0x081C7A90: lsls       r1, r1, #4                    
  0x081C7A92: lsls       r3, r3, #4                    
  0x081C7A94: b          #0x81c7a88                    
  0x081C7A96: lsls       r4, r4, #3                    
  0x081C7A98: cmp        r1, r4                        
  0x081C7A9A: bhs        #0x81c7aa6                    
  0x081C7A9C: cmp        r1, r0                        
  0x081C7A9E: bhs        #0x81c7aa6                    
  0x081C7AA0: lsls       r1, r1, #1                    
  0x081C7AA2: lsls       r3, r3, #1                    
  0x081C7AA4: b          #0x81c7a98                    
  0x081C7AA6: movs       r2, #0                        
  0x081C7AA8: cmp        r0, r1                        
  0x081C7AAA: blo        #0x81c7aae                    
  0x081C7AAC: subs       r0, r0, r1                    
  0x081C7AAE: lsrs       r4, r1, #1                    
  0x081C7AB0: cmp        r0, r4                        
  0x081C7AB2: blo        #0x81c7ac0                    
  0x081C7AB4: subs       r0, r0, r4                    
  0x081C7AB6: mov        ip, r3                        
  0x081C7AB8: movs       r4, #1                        
  0x081C7ABA: rors       r3, r4                        
  0x081C7ABC: orrs       r2, r3                        
  0x081C7ABE: mov        r3, ip                        
  0x081C7AC0: lsrs       r4, r1, #2                    
  0x081C7AC2: cmp        r0, r4                        
  0x081C7AC4: blo        #0x81c7ad2                    
  0x081C7AC6: subs       r0, r0, r4                    
  0x081C7AC8: mov        ip, r3                        
  0x081C7ACA: movs       r4, #2                        
  0x081C7ACC: rors       r3, r4                        
  0x081C7ACE: orrs       r2, r3                        
  0x081C7AD0: mov        r3, ip                        
  0x081C7AD2: lsrs       r4, r1, #3                    
  0x081C7AD4: cmp        r0, r4                        
  0x081C7AD6: blo        #0x81c7ae4                    
  0x081C7AD8: subs       r0, r0, r4                    
  0x081C7ADA: mov        ip, r3                        
  0x081C7ADC: movs       r4, #3                        
  0x081C7ADE: rors       r3, r4                        
  0x081C7AE0: orrs       r2, r3                        
  0x081C7AE2: mov        r3, ip                        
  0x081C7AE4: mov        ip, r3                        
  0x081C7AE6: cmp        r0, #0                        
  0x081C7AE8: beq        #0x81c7af2                    
  0x081C7AEA: lsrs       r3, r3, #4                    
  0x081C7AEC: beq        #0x81c7af2                    
  0x081C7AEE: lsrs       r1, r1, #4                    
  0x081C7AF0: b          #0x81c7aa6                    
  0x081C7AF2: movs       r4, #0xe                      
  0x081C7AF4: lsls       r4, r4, #0x1c                 
  0x081C7AF6: ands       r2, r4                        
  0x081C7AF8: beq        #0x81c7b24                    
  0x081C7AFA: mov        r3, ip                        
  0x081C7AFC: movs       r4, #3                        
  0x081C7AFE: rors       r3, r4                        
  0x081C7B00: tst        r2, r3                        
  0x081C7B02: beq        #0x81c7b08                    
  0x081C7B04: lsrs       r4, r1, #3                    
  0x081C7B06: adds       r0, r0, r4                    
  0x081C7B08: mov        r3, ip                        
  0x081C7B0A: movs       r4, #2                        
  0x081C7B0C: rors       r3, r4                        
  0x081C7B0E: tst        r2, r3                        
  0x081C7B10: beq        #0x81c7b16                    
  0x081C7B12: lsrs       r4, r1, #2                    
  0x081C7B14: adds       r0, r0, r4                    
  0x081C7B16: mov        r3, ip                        
  0x081C7B18: movs       r4, #1                        
  0x081C7B1A: rors       r3, r4                        
  0x081C7B1C: tst        r2, r3                        
  0x081C7B1E: beq        #0x81c7b24                    
  0x081C7B20: lsrs       r4, r1, #1                    
  0x081C7B22: adds       r0, r0, r4                    
  0x081C7B24: pop        {r4}                          
  0x081C7B26: cmp        r4, #0                        
  0x081C7B28: bpl        #0x81c7b2c                    
  0x081C7B2A: rsbs       r0, r0, #0                    
  0x081C7B2C: pop        {r4}                          
  0x081C7B2E: mov        pc, lr                        
  0x081C7B30: push       {lr}                          
  0x081C7B32: bl         #0x81c7a68                    
  0x081C7B36: movs       r0, #0                        
  0x081C7B38: pop        {pc}                          