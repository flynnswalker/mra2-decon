; Function at 0x08043E00
; 500 instructions traced

  0x08043E00: stc2l      p8, c4, [r1], #0x28c          
  0x08043E04: ldr        r1, [pc, #0x28c]                ; = 0x050000A0 
  0x08043E06: movs       r2, #8                        
  0x08043E08: bl         #0x81c77c4                    
  0x08043E0C: ldr        r0, [pc, #0x288]                ; = 0x08411934 
  0x08043E0E: adds       r0, r4, r0                    
  0x08043E10: ldr        r0, [r0]                      
  0x08043E12: ldr        r1, [pc, #0x288]                ; = 0x06007000 
  0x08043E14: bl         #0x81c77e0                    
  0x08043E18: add        r0, sp, #0x1c                 
  0x08043E1A: ldr        r2, [pc, #0x284]                ; = 0x00005001 
  0x08043E1C: adds       r5, r2, #0                    
  0x08043E1E: strh       r5, [r0]                      
  0x08043E20: ldr        r1, [pc, #0x280]                ; = 0x0600E000 
  0x08043E22: ldr        r2, [pc, #0x284]                ; = 0x01000080 
  0x08043E24: bl         #0x81c77c8                    
  0x08043E28: ldr        r0, [pc, #0x280]                ; = 0x08411964 
  0x08043E2A: adds       r4, r4, r0                    
  0x08043E2C: ldr        r0, [r4]                      
  0x08043E2E: ldr        r1, [pc, #0x280]                ; = 0x0600E100 
  0x08043E30: movs       r2, #0xb0                     
  0x08043E32: lsls       r2, r2, #1                    
  0x08043E34: bl         #0x81c77c8                    
  0x08043E38: mov        r0, sp                        
  0x08043E3A: adds       r0, #0x1e                     
  0x08043E3C: strh       r5, [r0]                      
  0x08043E3E: ldr        r1, [pc, #0x274]                ; = 0x0600E3C0 
  0x08043E40: ldr        r2, [pc, #0x274]                ; = 0x010000A0 
  0x08043E42: bl         #0x81c77c8                    
  0x08043E46: bl         #0x8044bec                    
  0x08043E4A: ldr        r0, [pc, #0x270]                ; = 0x08412830 
  0x08043E4C: ldr        r1, [pc, #0x270]                ; = 0x06008800 
  0x08043E4E: bl         #0x81c77e0                    
  0x08043E52: ldr        r0, [pc, #0x270]                ; = 0x084119C4 
  0x08043E54: ldr        r1, [pc, #0x270]                ; = 0x06007C00 
  0x08043E56: bl         #0x81c77e0                    
  0x08043E5A: ldr        r0, [pc, #0x270]                ; = 0x08411AC8 
  0x08043E5C: ldr        r1, [pc, #0x270]                ; = 0x06008400 
  0x08043E5E: bl         #0x81c77e0                    
  0x08043E62: ldr        r0, [pc, #0x270]                ; = 0x08412454 
  0x08043E64: ldr        r3, [pc, #0x270]                ; = 0x0600F000 
  0x08043E66: mov        sb, r3                        
  0x08043E68: mov        r1, sb                        
  0x08043E6A: movs       r2, #0x40                     
  0x08043E6C: bl         #0x81c77c4                    
  0x08043E70: ldr        r0, [pc, #0x268]                ; = 0x08412554 
  0x08043E72: ldr        r1, [pc, #0x26c]                ; = 0x0600F3C0 
  0x08043E74: movs       r2, #0x10                     
  0x08043E76: bl         #0x81c77c4                    
  0x08043E7A: ldr        r0, [pc, #0x268]                ; = 0x08412594 
  0x08043E7C: ldr        r1, [pc, #0x268]                ; = 0x0600EC00 
  0x08043E7E: movs       r2, #0x40                     
  0x08043E80: bl         #0x81c77c4                    
  0x08043E84: ldr        r1, [pc, #0x264]                ; = 0xFFFF0000 
  0x08043E86: ldr        r0, [sp, #0x24]               
  0x08043E88: ands       r0, r1                        
  0x08043E8A: str        r0, [sp, #0x24]               
  0x08043E8C: add        r5, sp, #0x24                 
  0x08043E8E: movs       r0, #6                        
  0x08043E90: strh       r0, [r5, #2]                  
  0x08043E92: movs       r6, #0x1e                     
  0x08043E94: strh       r6, [r5, #4]                  
  0x08043E96: movs       r7, #2                        
  0x08043E98: strh       r7, [r5, #6]                  
  0x08043E9A: ldr        r1, [pc, #0x254]                ; = 0x00004002 
  0x08043E9C: ldr        r3, [sp, #0x24]               
  0x08043E9E: ldr        r4, [sp, #0x28]               
  0x08043EA0: str        r4, [sp]                      
  0x08043EA2: movs       r0, #1                        
  0x08043EA4: mov        r2, sb                        
  0x08043EA6: bl         #0x8065ea0                    
  0x08043EAA: mov        r0, sl                        
  0x08043EAC: strh       r0, [r5]                      
  0x08043EAE: movs       r1, #0x10                     
  0x08043EB0: strh       r1, [r5, #2]                  
  0x08043EB2: strh       r6, [r5, #4]                  
  0x08043EB4: movs       r2, #4                        
  0x08043EB6: mov        r8, r2                        
  0x08043EB8: mov        r3, r8                        
  0x08043EBA: strh       r3, [r5, #6]                  
  0x08043EBC: ldr        r1, [pc, #0x234]                ; = 0x00004042 
  0x08043EBE: ldr        r3, [sp, #0x24]               
  0x08043EC0: ldr        r4, [sp, #0x28]               
  0x08043EC2: str        r4, [sp]                      
  0x08043EC4: movs       r0, #1                        
  0x08043EC6: mov        r2, sb                        
  0x08043EC8: bl         #0x8065ea0                    
  0x08043ECC: mov        r0, sl                        
  0x08043ECE: strh       r0, [r5]                      
  0x08043ED0: strh       r0, [r5, #2]                  
  0x08043ED2: movs       r6, #0xf                      
  0x08043ED4: strh       r6, [r5, #4]                  
  0x08043ED6: strh       r7, [r5, #6]                  
  0x08043ED8: ldr        r1, [pc, #0x21c]                ; = 0x0000528F 
  0x08043EDA: ldr        r2, [pc, #0x220]                ; = 0x0600E800 
  0x08043EDC: mov        sb, r2                        
  0x08043EDE: ldr        r3, [sp, #0x24]               
  0x08043EE0: ldr        r4, [sp, #0x28]               
  0x08043EE2: str        r4, [sp]                      
  0x08043EE4: movs       r0, #1                        
  0x08043EE6: bl         #0x8065ea0                    
  0x08043EEA: strh       r6, [r5]                      
  0x08043EEC: mov        r3, sl                        
  0x08043EEE: strh       r3, [r5, #2]                  
  0x08043EF0: strh       r6, [r5, #4]                  
  0x08043EF2: strh       r7, [r5, #6]                  
  0x08043EF4: ldr        r1, [pc, #0x208]                ; = 0x000052CF 
  0x08043EF6: ldr        r3, [sp, #0x24]               
  0x08043EF8: ldr        r4, [sp, #0x28]               
  0x08043EFA: str        r4, [sp]                      
  0x08043EFC: movs       r0, #1                        
  0x08043EFE: mov        r2, sb                        
  0x08043F00: bl         #0x8065ea0                    
  0x08043F04: movs       r0, #3                        
  0x08043F06: strh       r0, [r5]                      
  0x08043F08: mov        r0, r8                        
  0x08043F0A: strh       r0, [r5, #2]                  
  0x08043F0C: movs       r6, #1                        
  0x08043F0E: strh       r6, [r5, #4]                  
  0x08043F10: strh       r0, [r5, #6]                  
  0x08043F12: ldr        r1, [pc, #0x1f0]                ; = 0x0000529E 
  0x08043F14: ldr        r3, [sp, #0x24]               
  0x08043F16: ldr        r4, [sp, #0x28]               
  0x08043F18: str        r4, [sp]                      
  0x08043F1A: movs       r0, #1                        
  0x08043F1C: mov        r2, sb                        
  0x08043F1E: bl         #0x8065ea0                    
  0x08043F22: movs       r0, #0x1a                     
  0x08043F24: strh       r0, [r5]                      
  0x08043F26: mov        r1, r8                        
  0x08043F28: strh       r1, [r5, #2]                  
  0x08043F2A: strh       r6, [r5, #4]                  
  0x08043F2C: strh       r1, [r5, #6]                  
  0x08043F2E: ldr        r1, [pc, #0x1d8]                ; = 0x0000529F 
  0x08043F30: ldr        r3, [sp, #0x24]               
  0x08043F32: ldr        r4, [sp, #0x28]               
  0x08043F34: str        r4, [sp]                      
  0x08043F36: movs       r0, #1                        
  0x08043F38: mov        r2, sb                        
  0x08043F3A: bl         #0x8065ea0                    
  0x08043F3E: ldr        r0, [pc, #0x1cc]                ; = 0x050002C0 
  0x08043F40: bl         #0x80682f8                    
  0x08043F44: ldr        r0, [pc, #0x1c8]                ; = 0x0840ADC4 
  0x08043F46: ldr        r1, [pc, #0x1cc]                ; = 0x050002E0 
  0x08043F48: movs       r2, #8                        
  0x08043F4A: bl         #0x81c77c4                    
  0x08043F4E: ldr        r0, [pc, #0x1c8]                ; = 0x0840ADE4 
  0x08043F50: ldr        r1, [pc, #0x1c8]                ; = 0x05000300 
  0x08043F52: movs       r2, #8                        
  0x08043F54: bl         #0x81c77c4                    
  0x08043F58: ldr        r0, [pc, #0x1c4]                ; = 0x0840AE04 
  0x08043F5A: ldr        r1, [pc, #0x1c8]                ; = 0x05000320 
  0x08043F5C: movs       r2, #8                        
  0x08043F5E: bl         #0x81c77c4                    
  0x08043F62: ldr        r3, [pc, #0x1c4]                ; = 0x08411BE0 
  0x08043F64: movs       r0, #0x60                     
  0x08043F66: str        r0, [sp]                      
  0x08043F68: movs       r2, #0x10                     
  0x08043F6A: str        r2, [sp, #4]                  
  0x08043F6C: mov        r0, sl                        
  0x08043F6E: str        r0, [sp, #8]                  
  0x08043F70: ldr        r0, [pc, #0xf4]                 ; = 0x06010000 
  0x08043F72: movs       r1, #0                        
  0x08043F74: movs       r2, #0xc0                     
  0x08043F76: bl         #0x8067414                    
  0x08043F7A: ldr        r3, [pc, #0x1b0]                ; = 0x08412238 
  0x08043F7C: movs       r0, #0x20                     
  0x08043F7E: str        r0, [sp]                      
  0x08043F80: str        r0, [sp, #4]                  
  0x08043F82: mov        r1, sl                        
  0x08043F84: str        r1, [sp, #8]                  
  0x08043F86: ldr        r0, [pc, #0xe0]                 ; = 0x06010000 
  0x08043F88: movs       r1, #0                        
  0x08043F8A: movs       r2, #0xe0                     
  0x08043F8C: bl         #0x8067414                    
  0x08043F90: ldr        r3, [pc, #0x19c]                ; = 0x084122BC 
  0x08043F92: movs       r2, #0x10                     
  0x08043F94: str        r2, [sp]                      
  0x08043F96: str        r2, [sp, #4]                  
  0x08043F98: mov        r0, sl                        
  0x08043F9A: str        r0, [sp, #8]                  
  0x08043F9C: ldr        r0, [pc, #0xc8]                 ; = 0x06010000 
  0x08043F9E: movs       r1, #0x60                     
  0x08043FA0: movs       r2, #0xc0                     
  0x08043FA2: bl         #0x8067414                    
  0x08043FA6: ldr        r3, [pc, #0x18c]                ; = 0x084122D4 
  0x08043FA8: movs       r0, #0x40                     
  0x08043FAA: str        r0, [sp]                      
  0x08043FAC: movs       r1, #0x10                     
  0x08043FAE: str        r1, [sp, #4]                  
  0x08043FB0: mov        r2, sl                        
  0x08043FB2: str        r2, [sp, #8]                  
  0x08043FB4: ldr        r0, [pc, #0xb0]                 ; = 0x06010000 
  0x08043FB6: movs       r1, #0x38                     
  0x08043FB8: movs       r2, #0xf0                     
  0x08043FBA: bl         #0x8067414                    
  0x08043FBE: ldr        r3, [pc, #0x178]                ; = 0x0841475C 
  0x08043FC0: movs       r0, #0x18                     
  0x08043FC2: str        r0, [sp]                      
  0x08043FC4: movs       r4, #8                        
  0x08043FC6: str        r4, [sp, #4]                  
  0x08043FC8: mov        r0, sl                        
  0x08043FCA: str        r0, [sp, #8]                  
  0x08043FCC: ldr        r0, [pc, #0x98]                 ; = 0x06010000 
  0x08043FCE: movs       r1, #0xb0                     
  0x08043FD0: movs       r2, #0xc8                     
  0x08043FD2: bl         #0x8067414                    
  0x08043FD6: ldr        r3, [pc, #0x164]                ; = 0x084147C0 
  0x08043FD8: str        r4, [sp]                      
  0x08043FDA: str        r4, [sp, #4]                  
  0x08043FDC: mov        r1, sl                        
  0x08043FDE: str        r1, [sp, #8]                  
  0x08043FE0: ldr        r0, [pc, #0x84]                 ; = 0x06010000 
  0x08043FE2: movs       r1, #0xc8                     
  0x08043FE4: movs       r2, #0xc8                     
  0x08043FE6: bl         #0x8067414                    
  0x08043FEA: ldr        r3, [pc, #0x154]                ; = 0x081EA19C 
  0x08043FEC: str        r4, [sp]                      
  0x08043FEE: str        r4, [sp, #4]                  
  0x08043FF0: mov        r2, sl                        
  0x08043FF2: str        r2, [sp, #8]                  
  0x08043FF4: ldr        r0, [pc, #0x70]                 ; = 0x06010000 
  0x08043FF6: movs       r1, #0xd0                     
  0x08043FF8: movs       r2, #0xc8                     
  0x08043FFA: bl         #0x8067414                    
  0x08043FFE: mov        r3, sl                        
  0x08044000: strh       r3, [r5]                      
  0x08044002: strh       r3, [r5, #2]                  
  0x08044004: movs       r0, #0x50                     
  0x08044006: strh       r0, [r5, #4]                  
  0x08044008: strh       r4, [r5, #6]                  
  0x0804400A: ldr        r3, [pc, #0x138]                ; = 0x084147E4 
  0x0804400C: str        r0, [sp]                      
  0x0804400E: str        r4, [sp, #4]                  
  0x08044010: str        r5, [sp, #8]                  
  0x08044012: ldr        r0, [pc, #0x54]                 ; = 0x06010000 
  0x08044014: movs       r1, #0xb0                     
  0x08044016: movs       r2, #0xc0                     
  0x08044018: bl         #0x8067414                    
  0x0804401C: ldr        r3, [pc, #0x128]                ; = 0x08414718 
  0x0804401E: str        r4, [sp]                      
  0x08044020: movs       r0, #0x10                     
  0x08044022: str        r0, [sp, #4]                  
  0x08044024: mov        r1, sl                        
  0x08044026: str        r1, [sp, #8]                  
  0x08044028: ldr        r0, [pc, #0x3c]                 ; = 0x06010000 
  0x0804402A: movs       r1, #0xa8                     
  0x0804402C: movs       r2, #0xc0                     
  0x0804402E: bl         #0x8067414                    
  0x08044032: ldr        r0, [pc, #0x44]                 ; = 0x0200CA00 
  0x08044034: adds       r0, #0x51                     
  0x08044036: ldrb       r1, [r0]                      
  0x08044038: mov        r8, r5                        
  0x0804403A: adds       r5, r0, #0                    
  0x0804403C: cmp        r1, #0xff                     
  0x0804403E: beq        #0x8044042                    
  0x08044040: b          #0x804414c                    
  0x08044042: add        r1, sp, #0xc                  
  0x08044044: movs       r0, #0xff                     
  0x08044046: strb       r0, [r1]                      
  0x08044048: b          #0x804418a                    
  0x0804414C: cmp        r1, #9                        
  0x0804414E: bhi        #0x804417c                    
  0x08044150: add        r3, sp, #0xc                  
  0x08044152: ldr        r2, [pc, #0x20]                 ; = 0x08208CB0 
  0x08044154: ldr        r0, [pc, #0x20]                 ; = 0x0200CA00 
  0x08044156: ldrb       r1, [r0, #0x18]               
  0x08044158: lsls       r0, r1, #2                    
  0x0804415A: adds       r0, r0, r1                    
  0x0804415C: lsls       r0, r0, #1                    
  0x0804415E: ldrb       r1, [r5]                      
  0x08044160: adds       r0, r0, r1                    
  0x08044162: lsls       r0, r0, #1                    
  0x08044164: adds       r0, r0, r2                    
  0x08044166: ldrh       r0, [r0]                      
  0x08044168: adds       r0, r0, r2                    
  0x0804416A: adds       r0, #0x30                     
  0x0804416C: ldrb       r0, [r0]                      
  0x0804416E: strb       r0, [r3]                      
  0x08044170: b          #0x804418a                    
  0x0804417C: add        r0, sp, #0xc                  
  0x0804417E: ldr        r2, [pc, #0x20]                 ; = 0x0200CA00 
  0x08044180: movs       r3, #0x9f                     
  0x08044182: lsls       r3, r3, #2                    
  0x08044184: adds       r1, r2, r3                    
  0x08044186: ldrb       r1, [r1]                      
  0x08044188: strb       r1, [r0]                      
  0x0804418A: ldr        r0, [pc, #0x14]                 ; = 0x0200CA00 
  0x0804418C: adds       r0, #0x53                     
  0x0804418E: ldrb       r1, [r0]                      
  0x08044190: adds       r6, r0, #0                    
  0x08044192: cmp        r1, #0xff                     
  0x08044194: bne        #0x80441a4                    
  0x08044196: add        r1, sp, #0xc                  
  0x08044198: movs       r0, #0xff                     
  0x0804419A: strb       r0, [r1, #1]                  
  0x0804419C: b          #0x80441e2                    
  0x080441A4: cmp        r1, #9                        
  0x080441A6: bhi        #0x80441d4                    
  0x080441A8: add        r3, sp, #0xc                  
  0x080441AA: ldr        r2, [pc, #0x20]                 ; = 0x08208CB0 
  0x080441AC: ldr        r0, [pc, #0x20]                 ; = 0x0200CA00 
  0x080441AE: ldrb       r1, [r0, #0x18]               
  0x080441B0: lsls       r0, r1, #2                    
  0x080441B2: adds       r0, r0, r1                    
  0x080441B4: lsls       r0, r0, #1                    
  0x080441B6: ldrb       r1, [r6]                      
  0x080441B8: adds       r0, r0, r1                    
  0x080441BA: lsls       r0, r0, #1                    
  0x080441BC: adds       r0, r0, r2                    
  0x080441BE: ldrh       r0, [r0]                      
  0x080441C0: adds       r0, r0, r2                    
  0x080441C2: adds       r0, #0x30                     
  0x080441C4: ldrb       r0, [r0]                      
  0x080441C6: strb       r0, [r3, #1]                  
  0x080441C8: b          #0x80441e2                    
  0x080441D4: add        r0, sp, #0xc                  
  0x080441D6: ldr        r2, [pc, #0x20]                 ; = 0x0200CA00 
  0x080441D8: movs       r3, #0x9f                     
  0x080441DA: lsls       r3, r3, #2                    
  0x080441DC: adds       r1, r2, r3                    
  0x080441DE: ldrb       r1, [r1]                      
  0x080441E0: strb       r1, [r0, #1]                  
  0x080441E2: ldr        r0, [pc, #0x14]                 ; = 0x0200CA00 
  0x080441E4: adds       r0, #0x55                     
  0x080441E6: ldrb       r1, [r0]                      
  0x080441E8: adds       r4, r0, #0                    
  0x080441EA: cmp        r1, #0xff                     
  0x080441EC: bne        #0x80441fc                    
  0x080441EE: add        r1, sp, #0xc                  
  0x080441F0: movs       r0, #0xff                     
  0x080441F2: strb       r0, [r1, #2]                  
  0x080441F4: b          #0x804423a                    
  0x080441FC: cmp        r1, #9                        
  0x080441FE: bhi        #0x804422c                    
  0x08044200: add        r3, sp, #0xc                  
  0x08044202: ldr        r2, [pc, #0x20]                 ; = 0x08208CB0 
  0x08044204: ldr        r0, [pc, #0x20]                 ; = 0x0200CA00 
  0x08044206: ldrb       r1, [r0, #0x18]               
  0x08044208: lsls       r0, r1, #2                    
  0x0804420A: adds       r0, r0, r1                    
  0x0804420C: lsls       r0, r0, #1                    
  0x0804420E: ldrb       r1, [r4]                      
  0x08044210: adds       r0, r0, r1                    
  0x08044212: lsls       r0, r0, #1                    
  0x08044214: adds       r0, r0, r2                    
  0x08044216: ldrh       r0, [r0]                      
  0x08044218: adds       r0, r0, r2                    
  0x0804421A: adds       r0, #0x30                     
  0x0804421C: ldrb       r0, [r0]                      
  0x0804421E: strb       r0, [r3, #2]                  
  0x08044220: b          #0x804423a                    
  0x0804422C: add        r0, sp, #0xc                  
  0x0804422E: ldr        r2, [pc, #0x44]                 ; = 0x0200CA00 
  0x08044230: movs       r3, #0x9f                     
  0x08044232: lsls       r3, r3, #2                    
  0x08044234: adds       r1, r2, r3                    
  0x08044236: ldrb       r1, [r1]                      
  0x08044238: strb       r1, [r0, #2]                  
  0x0804423A: add        r0, sp, #0xc                  
  0x0804423C: ldrb       r0, [r0]                      
  0x0804423E: add        r1, sp, #0xc                  
  0x08044240: ldrb       r1, [r1, #1]                  
  0x08044242: add        r2, sp, #0xc                  
  0x08044244: ldrb       r2, [r2, #2]                  
  0x08044246: bl         #0x8044eac                    
  0x0804424A: ldr        r1, [pc, #0x28]                 ; = 0x0200CA00 
  0x0804424C: ldrb       r0, [r1, #0x18]               
  0x0804424E: ldrb       r1, [r5]                      
  0x08044250: ldrb       r2, [r6]                      
  0x08044252: ldrb       r3, [r4]                      
  0x08044254: bl         #0x8045898                    
  0x08044258: ldr        r2, [pc, #0x18]                 ; = 0x0200CA00 
  0x0804425A: movs       r3, #0xb4                     
  0x0804425C: lsls       r3, r3, #2                    
  0x0804425E: adds       r4, r2, r3                    
  0x08044260: ldr        r5, [pc, #0x14]                 ; = 0x00000321 
  0x08044262: adds       r0, r2, r5                    
  0x08044264: ldrb       r1, [r0]                      
  0x08044266: adds       r5, r0, #0                    
  0x08044268: cmp        r1, #0xff                     
  0x0804426A: bne        #0x804427c                    
  0x0804426C: add        r1, sp, #0xc                  
  0x0804426E: movs       r0, #0xff                     
  0x08044270: strb       r0, [r1]                      
  0x08044272: b          #0x80442b0                    
  0x0804427C: cmp        r1, #9                        
  0x0804427E: bhi        #0x80442a4                    
  0x08044280: add        r3, sp, #0xc                  
  0x08044282: ldr        r2, [pc, #0x1c]                 ; = 0x08208CB0 
  0x08044284: ldrb       r1, [r4, #0x18]               
  0x08044286: lsls       r0, r1, #2                    
  0x08044288: adds       r0, r0, r1                    
  0x0804428A: lsls       r0, r0, #1                    
  0x0804428C: ldrb       r1, [r5]                      
  0x0804428E: adds       r0, r0, r1                    
  0x08044290: lsls       r0, r0, #1                    
  0x08044292: adds       r0, r0, r2                    
  0x08044294: ldrh       r0, [r0]                      
  0x08044296: adds       r0, r0, r2                    
  0x08044298: adds       r0, #0x30                     
  0x0804429A: ldrb       r0, [r0]                      
  0x0804429C: strb       r0, [r3]                      
  0x0804429E: b          #0x80442b0                    
  0x080442A4: add        r0, sp, #0xc                  
  0x080442A6: ldr        r2, [pc, #0x24]                 ; = 0x0200CA00 
  0x080442A8: ldr        r3, [pc, #0x24]                 ; = 0x0000054C 
  0x080442AA: adds       r1, r2, r3                    
  0x080442AC: ldrb       r1, [r1]                      
  0x080442AE: strb       r1, [r0]                      
  0x080442B0: ldr        r0, [pc, #0x18]                 ; = 0x0200CA00 
  0x080442B2: movs       r1, #0xb4                     
  0x080442B4: lsls       r1, r1, #2                    
  0x080442B6: adds       r4, r0, r1                    
  0x080442B8: ldr        r2, [pc, #0x18]                 ; = 0x00000323 
  0x080442BA: adds       r0, r0, r2                    
  0x080442BC: ldrb       r1, [r0]                      
  0x080442BE: adds       r7, r0, #0                    
  0x080442C0: cmp        r1, #0xff                     
  0x080442C2: bne        #0x80442d8                    
  0x080442C4: add        r1, sp, #0xc                  
  0x080442C6: movs       r0, #0xff                     
  0x080442C8: strb       r0, [r1, #1]                  
  0x080442CA: b          #0x804430c                    
  0x080442D8: cmp        r1, #9                        
  0x080442DA: bhi        #0x8044300                    
  0x080442DC: add        r3, sp, #0xc                  
  0x080442DE: ldr        r2, [pc, #0x1c]                 ; = 0x08208CB0 
  0x080442E0: ldrb       r1, [r4, #0x18]               
  0x080442E2: lsls       r0, r1, #2                    
  0x080442E4: adds       r0, r0, r1                    
  0x080442E6: lsls       r0, r0, #1                    
  0x080442E8: ldrb       r1, [r7]                      
  0x080442EA: adds       r0, r0, r1                    
  0x080442EC: lsls       r0, r0, #1                    
  0x080442EE: adds       r0, r0, r2                    
  0x080442F0: ldrh       r0, [r0]                      
  0x080442F2: adds       r0, r0, r2                    
  0x080442F4: adds       r0, #0x30                     
  0x080442F6: ldrb       r0, [r0]                      
  0x080442F8: strb       r0, [r3, #1]                  
  0x080442FA: b          #0x804430c                    
  0x08044300: add        r0, sp, #0xc                  
  0x08044302: ldr        r2, [pc, #0x24]                 ; = 0x0200CA00 
  0x08044304: ldr        r3, [pc, #0x24]                 ; = 0x0000054C 
  0x08044306: adds       r1, r2, r3                    
  0x08044308: ldrb       r1, [r1]                      
  0x0804430A: strb       r1, [r0, #1]                  
  0x0804430C: ldr        r0, [pc, #0x18]                 ; = 0x0200CA00 
  0x0804430E: movs       r1, #0xb4                     
  0x08044310: lsls       r1, r1, #2                    
  0x08044312: adds       r4, r0, r1                    
  0x08044314: ldr        r2, [pc, #0x18]                 ; = 0x00000325 
  0x08044316: adds       r0, r0, r2                    
  0x08044318: ldrb       r1, [r0]                      
  0x0804431A: adds       r6, r0, #0                    
  0x0804431C: cmp        r1, #0xff                     
  0x0804431E: bne        #0x8044334                    
  0x08044320: add        r1, sp, #0xc                  
  0x08044322: movs       r0, #0xff                     
  0x08044324: strb       r0, [r1, #2]                  
  0x08044326: b          #0x8044368                    
  0x08044334: cmp        r1, #9                        
  0x08044336: bhi        #0x804435c                    
  0x08044338: add        r3, sp, #0xc                  
  0x0804433A: ldr        r2, [pc, #0x1c]                 ; = 0x08208CB0 
  0x0804433C: ldrb       r1, [r4, #0x18]               
  0x0804433E: lsls       r0, r1, #2                    
  0x08044340: adds       r0, r0, r1                    
  0x08044342: lsls       r0, r0, #1                    
  0x08044344: ldrb       r1, [r6]                      
  0x08044346: adds       r0, r0, r1                    
  0x08044348: lsls       r0, r0, #1                    
  0x0804434A: adds       r0, r0, r2                    
  0x0804434C: ldrh       r0, [r0]                      
  0x0804434E: adds       r0, r0, r2                    
  0x08044350: adds       r0, #0x30                     
  0x08044352: ldrb       r0, [r0]                      
  0x08044354: strb       r0, [r3, #2]                  
  0x08044356: b          #0x8044368                    
  0x08044368: add        r0, sp, #0xc                  
  0x0804436A: ldrb       r0, [r0]                      
  0x0804436C: add        r1, sp, #0xc                  
  0x0804436E: ldrb       r1, [r1, #1]                  
  0x08044370: add        r2, sp, #0xc                  
  0x08044372: ldrb       r2, [r2, #2]                  
  0x08044374: bl         #0x8045b34                    
  0x08044378: ldr        r0, [pc, #0x5c]                 ; = 0x0200CA00 
  0x0804437A: movs       r1, #0xb4                     
  0x0804437C: lsls       r1, r1, #2                    
  0x0804437E: adds       r4, r0, r1                    
  0x08044380: ldrb       r0, [r4, #0x18]               
  0x08044382: ldrb       r1, [r5]                      
  0x08044384: ldrb       r2, [r7]                      
  0x08044386: ldrb       r3, [r6]                      
  0x08044388: bl         #0x80464fc                    
  0x0804438C: ldr        r2, [pc, #0x48]                 ; = 0x0200CA00 
  0x0804438E: ldrb       r0, [r2, #0x18]               
  0x08044390: ldrb       r1, [r2, #0x19]               
  0x08044392: movs       r3, #0xb4                     