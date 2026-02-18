; Function at 0x08044EAC
; 252 instructions traced

  0x08044EAC: push       {r4, r5, r6, r7, lr}          
  0x08044EAE: sub        sp, #4                        
  0x08044EB0: lsls       r0, r0, #0x18                 
  0x08044EB2: lsrs       r7, r0, #0x18                 
  0x08044EB4: lsls       r1, r1, #0x18                 
  0x08044EB6: lsrs       r6, r1, #0x18                 
  0x08044EB8: lsls       r2, r2, #0x18                 
  0x08044EBA: lsrs       r0, r2, #0x18                 
  0x08044EBC: cmp        r0, #0xff                     
  0x08044EBE: beq        #0x8044f54                    
  0x08044EC0: lsls       r0, r0, #0x10                 
  0x08044EC2: lsrs       r2, r0, #0x10                 
  0x08044EC4: movs       r4, #1                        
  0x08044EC6: movs       r1, #0                        
  0x08044EC8: adds       r5, r0, #0                    
  0x08044ECA: lsls       r0, r4, #2                    
  0x08044ECC: adds       r0, r0, r4                    
  0x08044ECE: lsls       r0, r0, #0x19                 
  0x08044ED0: lsrs       r4, r0, #0x18                 
  0x08044ED2: adds       r0, r1, #1                    
  0x08044ED4: lsls       r0, r0, #0x18                 
  0x08044ED6: lsrs       r1, r0, #0x18                 
  0x08044ED8: cmp        r1, #1                        
  0x08044EDA: blo        #0x8044eca                    
  0x08044EDC: cmp        r2, #0x63                     
  0x08044EDE: bls        #0x8044eea                    
  0x08044EE0: lsls       r1, r4, #2                    
  0x08044EE2: adds       r1, r1, r4                    
  0x08044EE4: lsls       r1, r1, #1                    
  0x08044EE6: movs       r0, #0x63                     
  0x08044EE8: b          #0x8044efa                    
  0x08044EEA: cmp        r2, r4                        
  0x08044EEC: bhs        #0x8044ef2                    
  0x08044EEE: movs       r0, #0xb                      
  0x08044EF0: b          #0x8044f04                    
  0x08044EF2: lsls       r1, r4, #2                    
  0x08044EF4: adds       r1, r1, r4                    
  0x08044EF6: lsls       r1, r1, #1                    
  0x08044EF8: adds       r0, r2, #0                    
  0x08044EFA: bl         #0x81c7a6c                    
  0x08044EFE: adds       r1, r4, #0                    
  0x08044F00: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08044F04: lsls       r0, r0, #0x18                 
  0x08044F06: lsrs       r0, r0, #0x18                 
  0x08044F08: ldr        r1, [pc, #0x14]                 ; = 0x06000840 
  0x08044F0A: movs       r2, #0x20                     
  0x08044F0C: str        r2, [sp]                      
  0x08044F0E: movs       r2, #4                        
  0x08044F10: movs       r3, #2                        
  0x08044F12: bl         #0x80683cc                    
  0x08044F16: lsrs       r0, r5, #0x10                 
  0x08044F18: cmp        r0, #0                        
  0x08044F1A: bne        #0x8044f24                    
  0x08044F1C: movs       r0, #0                        
  0x08044F1E: b          #0x8044f3a                    
  0x08044F24: cmp        r0, #0x63                     
  0x08044F26: bls        #0x8044f2c                    
  0x08044F28: movs       r0, #9                        
  0x08044F2A: b          #0x8044f3a                    
  0x08044F2C: cmp        r0, #1                        
  0x08044F2E: bhs        #0x8044f34                    
  0x08044F30: movs       r0, #0xb                      
  0x08044F32: b          #0x8044f3a                    
  0x08044F34: movs       r1, #0xa                      
  0x08044F36: bl         #0x81c7a6c                    
  0x08044F3A: lsls       r0, r0, #0x18                 
  0x08044F3C: lsrs       r0, r0, #0x18                 
  0x08044F3E: ldr        r1, [pc, #0x10]                 ; = 0x06000840 
  0x08044F40: movs       r2, #0x20                     
  0x08044F42: str        r2, [sp]                      
  0x08044F44: movs       r2, #0xa                      
  0x08044F46: movs       r3, #2                        
  0x08044F48: bl         #0x80683cc                    
  0x08044F4C: b          #0x8044f74                    
  0x08044F54: ldr        r5, [pc, #0x4c]                 ; = 0x06000840 
  0x08044F56: movs       r4, #0x20                     
  0x08044F58: str        r4, [sp]                      
  0x08044F5A: movs       r0, #0xb                      
  0x08044F5C: adds       r1, r5, #0                    
  0x08044F5E: movs       r2, #4                        
  0x08044F60: movs       r3, #2                        
  0x08044F62: bl         #0x80683cc                    
  0x08044F66: str        r4, [sp]                      
  0x08044F68: movs       r0, #0xb                      
  0x08044F6A: adds       r1, r5, #0                    
  0x08044F6C: movs       r2, #0xa                      
  0x08044F6E: movs       r3, #2                        
  0x08044F70: bl         #0x80683cc                    
  0x08044F74: cmp        r6, #0xff                     
  0x08044F76: beq        #0x8045014                    
  0x08044F78: lsls       r0, r6, #0x10                 
  0x08044F7A: lsrs       r3, r0, #0x10                 
  0x08044F7C: movs       r4, #1                        
  0x08044F7E: movs       r2, #0                        
  0x08044F80: adds       r5, r0, #0                    
  0x08044F82: lsls       r0, r4, #2                    
  0x08044F84: adds       r0, r0, r4                    
  0x08044F86: lsls       r0, r0, #0x19                 
  0x08044F88: lsrs       r4, r0, #0x18                 
  0x08044F8A: adds       r0, r2, #1                    
  0x08044F8C: lsls       r0, r0, #0x18                 
  0x08044F8E: lsrs       r2, r0, #0x18                 
  0x08044F90: cmp        r2, #1                        
  0x08044F92: blo        #0x8044f82                    
  0x08044F94: cmp        r3, #0x63                     
  0x08044F96: bls        #0x8044fa8                    
  0x08044F98: lsls       r1, r4, #2                    
  0x08044F9A: adds       r1, r1, r4                    
  0x08044F9C: lsls       r1, r1, #1                    
  0x08044F9E: movs       r0, #0x63                     
  0x08044FA0: b          #0x8044fb8                    
  0x08044FA8: cmp        r3, r4                        
  0x08044FAA: bhs        #0x8044fb0                    
  0x08044FAC: movs       r0, #0xb                      
  0x08044FAE: b          #0x8044fc2                    
  0x08044FB0: lsls       r1, r4, #2                    
  0x08044FB2: adds       r1, r1, r4                    
  0x08044FB4: lsls       r1, r1, #1                    
  0x08044FB6: adds       r0, r3, #0                    
  0x08044FB8: bl         #0x81c7a6c                    
  0x08044FBC: adds       r1, r4, #0                    
  0x08044FBE: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08044FC2: lsls       r0, r0, #0x18                 
  0x08044FC4: lsrs       r0, r0, #0x18                 
  0x08044FC6: ldr        r1, [pc, #0x18]                 ; = 0x06000840 
  0x08044FC8: movs       r2, #0x20                     
  0x08044FCA: str        r2, [sp]                      
  0x08044FCC: movs       r2, #0x25                     
  0x08044FCE: movs       r3, #2                        
  0x08044FD0: bl         #0x80683cc                    
  0x08044FD4: lsrs       r0, r5, #0x10                 
  0x08044FD6: cmp        r0, #0                        
  0x08044FD8: bne        #0x8044fe4                    
  0x08044FDA: movs       r0, #0                        
  0x08044FDC: b          #0x8044ffa                    
  0x08044FE4: cmp        r0, #0x63                     
  0x08044FE6: bls        #0x8044fec                    
  0x08044FE8: movs       r0, #9                        
  0x08044FEA: b          #0x8044ffa                    
  0x08044FEC: cmp        r0, #1                        
  0x08044FEE: bhs        #0x8044ff4                    
  0x08044FF0: movs       r0, #0xb                      
  0x08044FF2: b          #0x8044ffa                    
  0x08044FF4: movs       r1, #0xa                      
  0x08044FF6: bl         #0x81c7a6c                    
  0x08044FFA: lsls       r0, r0, #0x18                 
  0x08044FFC: lsrs       r0, r0, #0x18                 
  0x08044FFE: ldr        r1, [pc, #0x10]                 ; = 0x06000840 
  0x08045000: movs       r2, #0x20                     
  0x08045002: str        r2, [sp]                      
  0x08045004: movs       r2, #0x2b                     
  0x08045006: movs       r3, #2                        
  0x08045008: bl         #0x80683cc                    
  0x0804500C: b          #0x8045034                    
  0x08045014: ldr        r5, [pc, #0x4c]                 ; = 0x06000840 
  0x08045016: movs       r4, #0x20                     
  0x08045018: str        r4, [sp]                      
  0x0804501A: movs       r0, #0xb                      
  0x0804501C: adds       r1, r5, #0                    
  0x0804501E: movs       r2, #0x25                     
  0x08045020: movs       r3, #2                        
  0x08045022: bl         #0x80683cc                    
  0x08045026: str        r4, [sp]                      
  0x08045028: movs       r0, #0xb                      
  0x0804502A: adds       r1, r5, #0                    
  0x0804502C: movs       r2, #0x2b                     
  0x0804502E: movs       r3, #2                        
  0x08045030: bl         #0x80683cc                    
  0x08045034: cmp        r7, #0xff                     
  0x08045036: beq        #0x80450d4                    
  0x08045038: lsls       r0, r7, #0x10                 
  0x0804503A: lsrs       r2, r0, #0x10                 
  0x0804503C: movs       r4, #1                        
  0x0804503E: movs       r1, #0                        
  0x08045040: adds       r5, r0, #0                    
  0x08045042: lsls       r0, r4, #2                    
  0x08045044: adds       r0, r0, r4                    
  0x08045046: lsls       r0, r0, #0x19                 
  0x08045048: lsrs       r4, r0, #0x18                 
  0x0804504A: adds       r0, r1, #1                    
  0x0804504C: lsls       r0, r0, #0x18                 
  0x0804504E: lsrs       r1, r0, #0x18                 
  0x08045050: cmp        r1, #1                        
  0x08045052: blo        #0x8045042                    
  0x08045054: cmp        r2, #0x63                     
  0x08045056: bls        #0x8045068                    
  0x08045058: lsls       r1, r4, #2                    
  0x0804505A: adds       r1, r1, r4                    
  0x0804505C: lsls       r1, r1, #1                    
  0x0804505E: movs       r0, #0x63                     
  0x08045060: b          #0x8045078                    
  0x08045068: cmp        r2, r4                        
  0x0804506A: bhs        #0x8045070                    
  0x0804506C: movs       r0, #0xb                      
  0x0804506E: b          #0x8045082                    
  0x08045070: lsls       r1, r4, #2                    
  0x08045072: adds       r1, r1, r4                    
  0x08045074: lsls       r1, r1, #1                    
  0x08045076: adds       r0, r2, #0                    
  0x08045078: bl         #0x81c7a6c                    
  0x0804507C: adds       r1, r4, #0                    
  0x0804507E: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08045082: lsls       r0, r0, #0x18                 
  0x08045084: lsrs       r0, r0, #0x18                 
  0x08045086: ldr        r1, [pc, #0x18]                 ; = 0x06000840 
  0x08045088: movs       r2, #0x20                     
  0x0804508A: str        r2, [sp]                      
  0x0804508C: movs       r2, #0x46                     
  0x0804508E: movs       r3, #2                        
  0x08045090: bl         #0x80683cc                    
  0x08045094: lsrs       r0, r5, #0x10                 
  0x08045096: cmp        r0, #0                        
  0x08045098: bne        #0x80450a4                    
  0x0804509A: movs       r0, #0                        
  0x0804509C: b          #0x80450ba                    
  0x080450A4: cmp        r0, #0x63                     
  0x080450A6: bls        #0x80450ac                    
  0x080450A8: movs       r0, #9                        
  0x080450AA: b          #0x80450ba                    
  0x080450AC: cmp        r0, #1                        
  0x080450AE: bhs        #0x80450b4                    
  0x080450B0: movs       r0, #0xb                      
  0x080450B2: b          #0x80450ba                    
  0x080450B4: movs       r1, #0xa                      
  0x080450B6: bl         #0x81c7a6c                    
  0x080450BA: lsls       r0, r0, #0x18                 
  0x080450BC: lsrs       r0, r0, #0x18                 
  0x080450BE: ldr        r1, [pc, #0x10]                 ; = 0x06000840 
  0x080450C0: movs       r2, #0x20                     
  0x080450C2: str        r2, [sp]                      
  0x080450C4: movs       r2, #0x4c                     
  0x080450C6: movs       r3, #2                        
  0x080450C8: bl         #0x80683cc                    
  0x080450CC: b          #0x80450f4                    
  0x080450D4: ldr        r5, [pc, #0x24]                 ; = 0x06000840 
  0x080450D6: movs       r4, #0x20                     
  0x080450D8: str        r4, [sp]                      
  0x080450DA: movs       r0, #0xb                      
  0x080450DC: adds       r1, r5, #0                    
  0x080450DE: movs       r2, #0x46                     
  0x080450E0: movs       r3, #2                        
  0x080450E2: bl         #0x80683cc                    
  0x080450E6: str        r4, [sp]                      
  0x080450E8: movs       r0, #0xb                      
  0x080450EA: adds       r1, r5, #0                    
  0x080450EC: movs       r2, #0x4c                     
  0x080450EE: movs       r3, #2                        
  0x080450F0: bl         #0x80683cc                    
  0x080450F4: add        sp, #4                        
  0x080450F6: pop        {r4, r5, r6, r7}              
  0x080450F8: pop        {r0}                          
  0x080450FA: bx         r0                            