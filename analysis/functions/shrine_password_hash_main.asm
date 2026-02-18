; Function at 0x08018E48
; 419 instructions traced

  0x08018E48: push       {r4, r5, r6, r7, lr}          
  0x08018E4A: mov        r7, sl                        
  0x08018E4C: mov        r6, sb                        
  0x08018E4E: mov        r5, r8                        
  0x08018E50: push       {r5, r6, r7}                  
  0x08018E52: ldr        r1, [pc, #0x34c]                ; = 0x0300075C 
  0x08018E54: movs       r2, #0x80                     
  0x08018E56: lsls       r2, r2, #4                    
  0x08018E58: adds       r1, r1, r2                    
  0x08018E5A: ldr        r4, [r1]                      
  0x08018E5C: ldr        r1, [pc, #0x344]                ; = 0xFFFF0000 
  0x08018E5E: mov        sl, r1                        
  0x08018E60: ands       r5, r1                        
  0x08018E62: movs       r1, #0xb                      
  0x08018E64: orrs       r5, r1                        
  0x08018E66: ldr        r1, [pc, #0x340]                ; = 0x0000FFFF 
  0x08018E68: ands       r5, r1                        
  0x08018E6A: movs       r1, #0xdc                     
  0x08018E6C: lsls       r1, r1, #0xe                  
  0x08018E6E: orrs       r5, r1                        
  0x08018E70: movs       r2, #0                        
  0x08018E72: mov        r8, r2                        
  0x08018E74: adds       r7, r0, #1                    
  0x08018E76: adds       r0, r7, #0                    
  0x08018E78: movs       r1, #0x64                     
  0x08018E7A: bl         #0x81c79d4                      ; -> __aeabi_idiv(a, b)
  0x08018E7E: adds       r6, r0, #0                    
  0x08018E80: ldr        r0, [pc, #0x328]                ; = 0x081C9764 
  0x08018E82: mov        sb, r0                        
  0x08018E84: cmp        r6, #0                        
  0x08018E86: beq        #0x8018eda                    
  0x08018E88: asrs       r0, r5, #0x10                 
  0x08018E8A: strb       r0, [r4]                      
  0x08018E8C: ldrb       r2, [r4, #1]                  
  0x08018E8E: movs       r1, #0x3f                     
  0x08018E90: adds       r0, r1, #0                    
  0x08018E92: ands       r0, r2                        
  0x08018E94: strb       r0, [r4, #1]                  
  0x08018E96: lsls       r2, r5, #0x17                 
  0x08018E98: lsrs       r2, r2, #0x17                 
  0x08018E9A: ldrh       r3, [r4, #2]                  
  0x08018E9C: ldr        r0, [pc, #0x310]                ; = 0xFFFFFE00 
  0x08018E9E: ands       r0, r3                        
  0x08018EA0: orrs       r0, r2                        
  0x08018EA2: strh       r0, [r4, #2]                  
  0x08018EA4: ldrb       r0, [r4, #3]                  
  0x08018EA6: ands       r1, r0                        
  0x08018EA8: movs       r0, #0x40                     
  0x08018EAA: orrs       r1, r0                        
  0x08018EAC: strb       r1, [r4, #3]                  
  0x08018EAE: lsls       r0, r6, #1                    
  0x08018EB0: add        r0, sb                        
  0x08018EB2: ldrh       r0, [r0]                      
  0x08018EB4: ldr        r1, [pc, #0x2fc]                ; = 0x000003FF 
  0x08018EB6: ands       r1, r0                        
  0x08018EB8: ldrh       r2, [r4, #4]                  
  0x08018EBA: ldr        r0, [pc, #0x2fc]                ; = 0xFFFFFC00 
  0x08018EBC: ands       r0, r2                        
  0x08018EBE: orrs       r0, r1                        
  0x08018EC0: strh       r0, [r4, #4]                  
  0x08018EC2: ldrb       r1, [r4, #5]                  
  0x08018EC4: movs       r0, #0xd                      
  0x08018EC6: rsbs       r0, r0, #0                    
  0x08018EC8: ands       r0, r1                        
  0x08018ECA: movs       r1, #0xf                      
  0x08018ECC: ands       r0, r1                        
  0x08018ECE: movs       r1, #0xd0                     
  0x08018ED0: orrs       r0, r1                        
  0x08018ED2: strb       r0, [r4, #5]                  
  0x08018ED4: adds       r4, #8                        
  0x08018ED6: movs       r1, #1                        
  0x08018ED8: mov        r8, r1                        
  0x08018EDA: adds       r0, r7, #0                    
  0x08018EDC: movs       r1, #0x64                     
  0x08018EDE: bl         #0x81c7a6c                    
  0x08018EE2: adds       r7, r0, #0                    
  0x08018EE4: movs       r1, #0xa                      
  0x08018EE6: bl         #0x81c79d4                      ; -> __aeabi_idiv(a, b)
  0x08018EEA: adds       r6, r0, #0                    
  0x08018EEC: adds       r0, r5, #0                    
  0x08018EEE: adds       r0, #8                        
  0x08018EF0: lsls       r0, r0, #0x10                 
  0x08018EF2: lsrs       r0, r0, #0x10                 
  0x08018EF4: mov        r2, sl                        
  0x08018EF6: ands       r5, r2                        
  0x08018EF8: orrs       r5, r0                        
  0x08018EFA: cmp        r6, #0                        
  0x08018EFC: bne        #0x8018f04                    
  0x08018EFE: mov        r0, r8                        
  0x08018F00: cmp        r0, #0                        
  0x08018F02: beq        #0x8018f52                    
  0x08018F04: asrs       r0, r5, #0x10                 
  0x08018F06: strb       r0, [r4]                      
  0x08018F08: ldrb       r2, [r4, #1]                  
  0x08018F0A: movs       r1, #0x3f                     
  0x08018F0C: adds       r0, r1, #0                    
  0x08018F0E: ands       r0, r2                        
  0x08018F10: strb       r0, [r4, #1]                  
  0x08018F12: lsls       r2, r5, #0x17                 
  0x08018F14: lsrs       r2, r2, #0x17                 
  0x08018F16: ldrh       r3, [r4, #2]                  
  0x08018F18: ldr        r0, [pc, #0x294]                ; = 0xFFFFFE00 
  0x08018F1A: ands       r0, r3                        
  0x08018F1C: orrs       r0, r2                        
  0x08018F1E: strh       r0, [r4, #2]                  
  0x08018F20: ldrb       r0, [r4, #3]                  
  0x08018F22: ands       r1, r0                        
  0x08018F24: movs       r0, #0x40                     
  0x08018F26: orrs       r1, r0                        
  0x08018F28: strb       r1, [r4, #3]                  
  0x08018F2A: lsls       r0, r6, #1                    
  0x08018F2C: add        r0, sb                        
  0x08018F2E: ldrh       r0, [r0]                      
  0x08018F30: ldr        r1, [pc, #0x280]                ; = 0x000003FF 
  0x08018F32: ands       r1, r0                        
  0x08018F34: ldrh       r2, [r4, #4]                  
  0x08018F36: ldr        r0, [pc, #0x280]                ; = 0xFFFFFC00 
  0x08018F38: ands       r0, r2                        
  0x08018F3A: orrs       r0, r1                        
  0x08018F3C: strh       r0, [r4, #4]                  
  0x08018F3E: ldrb       r1, [r4, #5]                  
  0x08018F40: movs       r0, #0xd                      
  0x08018F42: rsbs       r0, r0, #0                    
  0x08018F44: ands       r0, r1                        
  0x08018F46: movs       r1, #0xf                      
  0x08018F48: ands       r0, r1                        
  0x08018F4A: movs       r1, #0xd0                     
  0x08018F4C: orrs       r0, r1                        
  0x08018F4E: strb       r0, [r4, #5]                  
  0x08018F50: adds       r4, #8                        
  0x08018F52: adds       r0, r7, #0                    
  0x08018F54: movs       r1, #0xa                      
  0x08018F56: bl         #0x81c7a6c                    
  0x08018F5A: adds       r6, r0, #0                    
  0x08018F5C: adds       r0, r5, #0                    
  0x08018F5E: adds       r0, #8                        
  0x08018F60: lsls       r0, r0, #0x10                 
  0x08018F62: lsrs       r0, r0, #0x10                 
  0x08018F64: ldr        r1, [pc, #0x23c]                ; = 0xFFFF0000 
  0x08018F66: ands       r5, r1                        
  0x08018F68: orrs       r5, r0                        
  0x08018F6A: asrs       r0, r5, #0x10                 
  0x08018F6C: strb       r0, [r4]                      
  0x08018F6E: ldrb       r1, [r4, #1]                  
  0x08018F70: movs       r2, #0x3f                     
  0x08018F72: mov        sb, r2                        
  0x08018F74: mov        r0, sb                        
  0x08018F76: ands       r0, r1                        
  0x08018F78: strb       r0, [r4, #1]                  
  0x08018F7A: lsls       r1, r5, #0x10                 
  0x08018F7C: asrs       r1, r1, #0x10                 
  0x08018F7E: ldr        r0, [pc, #0x23c]                ; = 0x000001FF 
  0x08018F80: ands       r1, r0                        
  0x08018F82: ldrh       r2, [r4, #2]                  
  0x08018F84: ldr        r0, [pc, #0x228]                ; = 0xFFFFFE00 
  0x08018F86: ands       r0, r2                        
  0x08018F88: orrs       r0, r1                        
  0x08018F8A: strh       r0, [r4, #2]                  
  0x08018F8C: ldrb       r1, [r4, #3]                  
  0x08018F8E: mov        r0, sb                        
  0x08018F90: ands       r0, r1                        
  0x08018F92: movs       r1, #0x40                     
  0x08018F94: orrs       r0, r1                        
  0x08018F96: strb       r0, [r4, #3]                  
  0x08018F98: lsls       r0, r6, #1                    
  0x08018F9A: ldr        r2, [pc, #0x210]                ; = 0x081C9764 
  0x08018F9C: adds       r0, r0, r2                    
  0x08018F9E: ldrh       r0, [r0]                      
  0x08018FA0: ldr        r1, [pc, #0x210]                ; = 0x000003FF 
  0x08018FA2: ands       r1, r0                        
  0x08018FA4: ldrh       r2, [r4, #4]                  
  0x08018FA6: ldr        r0, [pc, #0x210]                ; = 0xFFFFFC00 
  0x08018FA8: ands       r0, r2                        
  0x08018FAA: orrs       r0, r1                        
  0x08018FAC: strh       r0, [r4, #4]                  
  0x08018FAE: ldrb       r1, [r4, #5]                  
  0x08018FB0: movs       r0, #0xd                      
  0x08018FB2: rsbs       r0, r0, #0                    
  0x08018FB4: ands       r0, r1                        
  0x08018FB6: movs       r1, #0xf                      
  0x08018FB8: ands       r0, r1                        
  0x08018FBA: movs       r2, #0xd0                     
  0x08018FBC: mov        sl, r2                        
  0x08018FBE: mov        r1, sl                        
  0x08018FC0: orrs       r0, r1                        
  0x08018FC2: strb       r0, [r4, #5]                  
  0x08018FC4: adds       r4, #8                        
  0x08018FC6: adds       r0, r5, #0                    
  0x08018FC8: adds       r0, #8                        
  0x08018FCA: lsls       r0, r0, #0x10                 
  0x08018FCC: lsrs       r0, r0, #0x10                 
  0x08018FCE: ldr        r2, [pc, #0x1d4]                ; = 0xFFFF0000 
  0x08018FD0: ands       r5, r2                        
  0x08018FD2: orrs       r5, r0                        
  0x08018FD4: asrs       r0, r5, #0x10                 
  0x08018FD6: strb       r0, [r4]                      
  0x08018FD8: ldrb       r1, [r4, #1]                  
  0x08018FDA: mov        r0, sb                        
  0x08018FDC: ands       r0, r1                        
  0x08018FDE: strb       r0, [r4, #1]                  
  0x08018FE0: lsls       r1, r5, #0x10                 
  0x08018FE2: asrs       r1, r1, #0x10                 
  0x08018FE4: ldr        r0, [pc, #0x1d4]                ; = 0x000001FF 
  0x08018FE6: ands       r1, r0                        
  0x08018FE8: ldrh       r2, [r4, #2]                  
  0x08018FEA: ldr        r0, [pc, #0x1c4]                ; = 0xFFFFFE00 
  0x08018FEC: ands       r0, r2                        
  0x08018FEE: orrs       r0, r1                        
  0x08018FF0: strh       r0, [r4, #2]                  
  0x08018FF2: ldrb       r1, [r4, #3]                  
  0x08018FF4: mov        r0, sb                        
  0x08018FF6: ands       r0, r1                        
  0x08018FF8: movs       r1, #0x40                     
  0x08018FFA: orrs       r0, r1                        
  0x08018FFC: strb       r0, [r4, #3]                  
  0x08018FFE: ldrh       r1, [r4, #4]                  
  0x08019000: ldr        r0, [pc, #0x1b4]                ; = 0xFFFFFC00 
  0x08019002: ands       r0, r1                        
  0x08019004: ldr        r2, [pc, #0x1b8]                ; = 0x0000035D 
  0x08019006: adds       r1, r2, #0                    
  0x08019008: orrs       r0, r1                        
  0x0801900A: strh       r0, [r4, #4]                  
  0x0801900C: ldrb       r1, [r4, #5]                  
  0x0801900E: movs       r0, #0xd                      
  0x08019010: rsbs       r0, r0, #0                    
  0x08019012: ands       r0, r1                        
  0x08019014: movs       r1, #0xf                      
  0x08019016: ands       r0, r1                        
  0x08019018: mov        r2, sl                        
  0x0801901A: orrs       r0, r2                        
  0x0801901C: strb       r0, [r4, #5]                  
  0x0801901E: adds       r4, #8                        
  0x08019020: movs       r0, #0                        
  0x08019022: mov        r8, r0                        
  0x08019024: ldr        r0, [pc, #0x19c]                ; = 0x0200A35C 
  0x08019026: ldr        r0, [r0]                      
  0x08019028: ldr        r0, [r0]                      
  0x0801902A: bl         #0x8002884                    
  0x0801902E: adds       r7, r0, #0                    
  0x08019030: movs       r1, #0x64                     
  0x08019032: bl         #0x81c79d4                      ; -> __aeabi_idiv(a, b)
  0x08019036: adds       r6, r0, #0                    
  0x08019038: adds       r0, r5, #0                    
  0x0801903A: adds       r0, #8                        
  0x0801903C: lsls       r0, r0, #0x10                 
  0x0801903E: lsrs       r0, r0, #0x10                 
  0x08019040: ldr        r1, [pc, #0x160]                ; = 0xFFFF0000 
  0x08019042: ands       r5, r1                        
  0x08019044: orrs       r5, r0                        
  0x08019046: cmp        r6, #0                        
  0x08019048: beq        #0x80190a2                    
  0x0801904A: asrs       r0, r5, #0x10                 
  0x0801904C: strb       r0, [r4]                      
  0x0801904E: ldrb       r1, [r4, #1]                  
  0x08019050: mov        r0, sb                        
  0x08019052: ands       r0, r1                        
  0x08019054: strb       r0, [r4, #1]                  
  0x08019056: lsls       r1, r5, #0x10                 
  0x08019058: asrs       r1, r1, #0x10                 
  0x0801905A: ldr        r2, [pc, #0x160]                ; = 0x000001FF 
  0x0801905C: ands       r1, r2                        
  0x0801905E: ldrh       r2, [r4, #2]                  
  0x08019060: ldr        r0, [pc, #0x14c]                ; = 0xFFFFFE00 
  0x08019062: ands       r0, r2                        
  0x08019064: orrs       r0, r1                        
  0x08019066: strh       r0, [r4, #2]                  
  0x08019068: ldrb       r1, [r4, #3]                  
  0x0801906A: mov        r0, sb                        
  0x0801906C: ands       r0, r1                        
  0x0801906E: movs       r1, #0x40                     
  0x08019070: orrs       r0, r1                        
  0x08019072: strb       r0, [r4, #3]                  
  0x08019074: lsls       r0, r6, #1                    
  0x08019076: ldr        r2, [pc, #0x134]                ; = 0x081C9764 
  0x08019078: adds       r0, r0, r2                    
  0x0801907A: ldrh       r0, [r0]                      
  0x0801907C: ldr        r1, [pc, #0x134]                ; = 0x000003FF 
  0x0801907E: ands       r1, r0                        
  0x08019080: ldrh       r2, [r4, #4]                  
  0x08019082: ldr        r0, [pc, #0x134]                ; = 0xFFFFFC00 
  0x08019084: ands       r0, r2                        
  0x08019086: orrs       r0, r1                        
  0x08019088: strh       r0, [r4, #4]                  
  0x0801908A: ldrb       r1, [r4, #5]                  
  0x0801908C: movs       r0, #0xd                      
  0x0801908E: rsbs       r0, r0, #0                    
  0x08019090: ands       r0, r1                        
  0x08019092: movs       r1, #0xf                      
  0x08019094: ands       r0, r1                        
  0x08019096: mov        r2, sl                        
  0x08019098: orrs       r0, r2                        
  0x0801909A: strb       r0, [r4, #5]                  
  0x0801909C: adds       r4, #8                        
  0x0801909E: movs       r0, #1                        
  0x080190A0: mov        r8, r0                        
  0x080190A2: adds       r0, r7, #0                    
  0x080190A4: movs       r1, #0x64                     
  0x080190A6: bl         #0x81c7a6c                    
  0x080190AA: adds       r7, r0, #0                    
  0x080190AC: movs       r1, #0xa                      
  0x080190AE: bl         #0x81c79d4                      ; -> __aeabi_idiv(a, b)
  0x080190B2: adds       r6, r0, #0                    
  0x080190B4: adds       r0, r5, #0                    
  0x080190B6: adds       r0, #8                        
  0x080190B8: lsls       r0, r0, #0x10                 
  0x080190BA: lsrs       r0, r0, #0x10                 
  0x080190BC: ldr        r1, [pc, #0xe4]                 ; = 0xFFFF0000 
  0x080190BE: ands       r5, r1                        
  0x080190C0: orrs       r5, r0                        
  0x080190C2: cmp        r6, #0                        
  0x080190C4: bne        #0x80190cc                    
  0x080190C6: mov        r2, r8                        
  0x080190C8: cmp        r2, #0                        
  0x080190CA: beq        #0x8019120                    
  0x080190CC: asrs       r0, r5, #0x10                 
  0x080190CE: strb       r0, [r4]                      
  0x080190D0: ldrb       r1, [r4, #1]                  
  0x080190D2: mov        r0, sb                        
  0x080190D4: ands       r0, r1                        
  0x080190D6: strb       r0, [r4, #1]                  
  0x080190D8: lsls       r1, r5, #0x10                 
  0x080190DA: asrs       r1, r1, #0x10                 
  0x080190DC: ldr        r0, [pc, #0xdc]                 ; = 0x000001FF 
  0x080190DE: ands       r1, r0                        
  0x080190E0: ldrh       r2, [r4, #2]                  
  0x080190E2: ldr        r0, [pc, #0xcc]                 ; = 0xFFFFFE00 
  0x080190E4: ands       r0, r2                        
  0x080190E6: orrs       r0, r1                        
  0x080190E8: strh       r0, [r4, #2]                  
  0x080190EA: ldrb       r1, [r4, #3]                  
  0x080190EC: mov        r0, sb                        
  0x080190EE: ands       r0, r1                        
  0x080190F0: movs       r1, #0x40                     
  0x080190F2: orrs       r0, r1                        
  0x080190F4: strb       r0, [r4, #3]                  
  0x080190F6: lsls       r0, r6, #1                    
  0x080190F8: ldr        r2, [pc, #0xb0]                 ; = 0x081C9764 
  0x080190FA: adds       r0, r0, r2                    
  0x080190FC: ldrh       r0, [r0]                      
  0x080190FE: ldr        r1, [pc, #0xb4]                 ; = 0x000003FF 
  0x08019100: ands       r1, r0                        
  0x08019102: ldrh       r2, [r4, #4]                  
  0x08019104: ldr        r0, [pc, #0xb0]                 ; = 0xFFFFFC00 
  0x08019106: ands       r0, r2                        
  0x08019108: orrs       r0, r1                        
  0x0801910A: strh       r0, [r4, #4]                  
  0x0801910C: ldrb       r1, [r4, #5]                  
  0x0801910E: movs       r0, #0xd                      
  0x08019110: rsbs       r0, r0, #0                    
  0x08019112: ands       r0, r1                        
  0x08019114: movs       r1, #0xf                      
  0x08019116: ands       r0, r1                        
  0x08019118: mov        r2, sl                        
  0x0801911A: orrs       r0, r2                        
  0x0801911C: strb       r0, [r4, #5]                  
  0x0801911E: adds       r4, #8                        
  0x08019120: adds       r0, r7, #0                    
  0x08019122: movs       r1, #0xa                      
  0x08019124: bl         #0x81c7a6c                    
  0x08019128: adds       r6, r0, #0                    
  0x0801912A: adds       r0, r5, #0                    
  0x0801912C: adds       r0, #8                        
  0x0801912E: lsls       r0, r0, #0x10                 
  0x08019130: lsrs       r0, r0, #0x10                 
  0x08019132: ldr        r1, [pc, #0x70]                 ; = 0xFFFF0000 
  0x08019134: ands       r5, r1                        
  0x08019136: orrs       r5, r0                        
  0x08019138: asrs       r0, r5, #0x10                 
  0x0801913A: strb       r0, [r4]                      
  0x0801913C: ldrb       r2, [r4, #1]                  
  0x0801913E: movs       r1, #0x3f                     
  0x08019140: adds       r0, r1, #0                    
  0x08019142: ands       r0, r2                        
  0x08019144: strb       r0, [r4, #1]                  
  0x08019146: lsls       r2, r5, #0x17                 
  0x08019148: lsrs       r2, r2, #0x17                 
  0x0801914A: ldrh       r3, [r4, #2]                  
  0x0801914C: ldr        r0, [pc, #0x60]                 ; = 0xFFFFFE00 
  0x0801914E: ands       r0, r3                        
  0x08019150: orrs       r0, r2                        
  0x08019152: strh       r0, [r4, #2]                  
  0x08019154: ldrb       r0, [r4, #3]                  
  0x08019156: ands       r1, r0                        
  0x08019158: movs       r0, #0x40                     
  0x0801915A: orrs       r1, r0                        
  0x0801915C: strb       r1, [r4, #3]                  
  0x0801915E: ldr        r1, [pc, #0x4c]                 ; = 0x081C9764 
  0x08019160: lsls       r0, r6, #1                    
  0x08019162: adds       r0, r0, r1                    
  0x08019164: ldrh       r0, [r0]                      
  0x08019166: ldr        r1, [pc, #0x4c]                 ; = 0x000003FF 
  0x08019168: ands       r1, r0                        
  0x0801916A: ldrh       r2, [r4, #4]                  
  0x0801916C: ldr        r0, [pc, #0x48]                 ; = 0xFFFFFC00 
  0x0801916E: ands       r0, r2                        
  0x08019170: orrs       r0, r1                        
  0x08019172: strh       r0, [r4, #4]                  
  0x08019174: ldrb       r1, [r4, #5]                  
  0x08019176: movs       r0, #0xd                      
  0x08019178: rsbs       r0, r0, #0                    
  0x0801917A: ands       r0, r1                        
  0x0801917C: movs       r1, #0xf                      
  0x0801917E: ands       r0, r1                        
  0x08019180: movs       r1, #0xd0                     
  0x08019182: orrs       r0, r1                        
  0x08019184: strb       r0, [r4, #5]                  
  0x08019186: adds       r4, #8                        
  0x08019188: ldr        r0, [pc, #0x14]                 ; = 0x0300075C 
  0x0801918A: movs       r1, #0x80                     
  0x0801918C: lsls       r1, r1, #4                    
  0x0801918E: adds       r0, r0, r1                    
  0x08019190: str        r4, [r0]                      
  0x08019192: pop        {r3, r4, r5}                  
  0x08019194: mov        r8, r3                        
  0x08019196: mov        sb, r4                        
  0x08019198: mov        sl, r5                        
  0x0801919A: pop        {r4, r5, r6, r7}              
  0x0801919C: pop        {r0}                          
  0x0801919E: bx         r0                            