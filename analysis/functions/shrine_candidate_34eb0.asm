; Function at 0x08034EB0
; 309 instructions traced

  0x08034EB0: push       {r4, r5, r6, r7, lr}          
  0x08034EB2: mov        r7, sl                        
  0x08034EB4: mov        r6, sb                        
  0x08034EB6: mov        r5, r8                        
  0x08034EB8: push       {r5, r6, r7}                  
  0x08034EBA: sub        sp, #0x30                     
  0x08034EBC: adds       r5, r0, #0                    
  0x08034EBE: adds       r7, r1, #0                    
  0x08034EC0: adds       r1, r5, #0                    
  0x08034EC2: adds       r1, #0xb1                     
  0x08034EC4: ldrb       r0, [r1]                      
  0x08034EC6: cmp        r0, #0x13                     
  0x08034EC8: bls        #0x8034ed2                    
  0x08034ECA: adds       r0, r5, #0                    
  0x08034ECC: adds       r0, #0xb0                     
  0x08034ECE: ldrb       r1, [r0]                      
  0x08034ED0: b          #0x8034eea                    
  0x08034ED2: adds       r4, r5, #0                    
  0x08034ED4: adds       r4, #0xb0                     
  0x08034ED6: ldrb       r0, [r4]                      
  0x08034ED8: ldrb       r1, [r1]                      
  0x08034EDA: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08034EDE: adds       r1, r0, #0                    
  0x08034EE0: movs       r0, #1                        
  0x08034EE2: rsbs       r0, r0, #0                    
  0x08034EE4: cmp        r1, r0                        
  0x08034EE6: bne        #0x8034ef2                    
  0x08034EE8: ldrb       r1, [r4]                      
  0x08034EEA: adds       r0, r1, #0                    
  0x08034EEC: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08034EF0: adds       r1, r0, #0                    
  0x08034EF2: adds       r0, r7, #0                    
  0x08034EF4: bl         #0x8020774                      ; -> monster_init(...)
  0x08034EF8: adds       r0, r7, #0                    
  0x08034EFA: bl         #0x8002648                    
  0x08034EFE: adds       r2, r7, #0                    
  0x08034F00: adds       r2, #0x84                     
  0x08034F02: adds       r1, r5, #0                    
  0x08034F04: adds       r1, #0xc0                     
  0x08034F06: ldr        r0, [r2]                      
  0x08034F08: ldr        r1, [r1]                      
  0x08034F0A: orrs       r0, r1                        
  0x08034F0C: str        r0, [r2]                      
  0x08034F0E: adds       r0, r7, #0                    
  0x08034F10: bl         #0x803513c                    
  0x08034F14: adds       r6, r7, #0                    
  0x08034F16: adds       r6, #0x68                     
  0x08034F18: movs       r0, #0x6a                     
  0x08034F1A: adds       r0, r0, r7                    
  0x08034F1C: mov        sb, r0                        
  0x08034F1E: movs       r1, #0x6c                     
  0x08034F20: adds       r1, r1, r7                    
  0x08034F22: mov        sl, r1                        
  0x08034F24: adds       r2, r5, #0                    
  0x08034F26: adds       r2, #0x40                     
  0x08034F28: str        r2, [sp, #0x14]               
  0x08034F2A: adds       r0, r7, #0                    
  0x08034F2C: adds       r0, #0x6e                     
  0x08034F2E: str        r0, [sp, #0x24]               
  0x08034F30: adds       r1, r5, #0                    
  0x08034F32: adds       r1, #0x42                     
  0x08034F34: str        r1, [sp, #0x18]               
  0x08034F36: adds       r2, r7, #0                    
  0x08034F38: adds       r2, #0x70                     
  0x08034F3A: str        r2, [sp, #0x28]               
  0x08034F3C: adds       r0, r5, #0                    
  0x08034F3E: adds       r0, #0x44                     
  0x08034F40: str        r0, [sp, #0x1c]               
  0x08034F42: adds       r1, r7, #0                    
  0x08034F44: adds       r1, #0x72                     
  0x08034F46: str        r1, [sp, #0x2c]               
  0x08034F48: adds       r2, r5, #0                    
  0x08034F4A: adds       r2, #0x46                     
  0x08034F4C: str        r2, [sp, #0x20]               
  0x08034F4E: adds       r0, #0x70                     
  0x08034F50: str        r0, [sp, #0x10]               
  0x08034F52: add        r1, sp, #8                    
  0x08034F54: mov        r8, r1                        
  0x08034F56: adds       r2, r5, #0                    
  0x08034F58: adds       r1, r7, #0                    
  0x08034F5A: movs       r4, #0xb                      
  0x08034F5C: ldrh       r0, [r2]                      
  0x08034F5E: strh       r0, [r1]                      
  0x08034F60: adds       r2, #2                        
  0x08034F62: adds       r1, #2                        
  0x08034F64: subs       r4, #1                        
  0x08034F66: cmp        r4, #0                        
  0x08034F68: bge        #0x8034f5c                    
  0x08034F6A: ldrh       r0, [r5, #0x3c]               
  0x08034F6C: movs       r1, #0xa                      
  0x08034F6E: bl         #0x81c7bac                    
  0x08034F72: ldrh       r1, [r6]                      
  0x08034F74: adds       r1, r1, r0                    
  0x08034F76: strh       r1, [r6]                      
  0x08034F78: lsls       r1, r1, #0x10                 
  0x08034F7A: lsrs       r1, r1, #0x10                 
  0x08034F7C: cmp        r1, #0xfa                     
  0x08034F7E: bls        #0x8034f84                    
  0x08034F80: movs       r0, #0xfa                     
  0x08034F82: strh       r0, [r6]                      
  0x08034F84: ldrh       r0, [r5, #0x3e]               
  0x08034F86: movs       r1, #0xa                      
  0x08034F88: bl         #0x81c7bac                    
  0x08034F8C: mov        r2, sb                        
  0x08034F8E: ldrh       r1, [r2]                      
  0x08034F90: adds       r1, r1, r0                    
  0x08034F92: strh       r1, [r2]                      
  0x08034F94: lsls       r1, r1, #0x10                 
  0x08034F96: lsrs       r1, r1, #0x10                 
  0x08034F98: cmp        r1, #0xfa                     
  0x08034F9A: bls        #0x8034fa0                    
  0x08034F9C: movs       r0, #0xfa                     
  0x08034F9E: strh       r0, [r2]                      
  0x08034FA0: ldr        r1, [sp, #0x14]               
  0x08034FA2: ldrh       r0, [r1]                      
  0x08034FA4: movs       r1, #0xa                      
  0x08034FA6: bl         #0x81c7bac                    
  0x08034FAA: mov        r2, sl                        
  0x08034FAC: ldrh       r1, [r2]                      
  0x08034FAE: adds       r1, r1, r0                    
  0x08034FB0: strh       r1, [r2]                      
  0x08034FB2: lsls       r1, r1, #0x10                 
  0x08034FB4: lsrs       r1, r1, #0x10                 
  0x08034FB6: cmp        r1, #0xfa                     
  0x08034FB8: bls        #0x8034fbe                    
  0x08034FBA: movs       r0, #0xfa                     
  0x08034FBC: strh       r0, [r2]                      
  0x08034FBE: ldr        r1, [sp, #0x18]               
  0x08034FC0: ldrh       r0, [r1]                      
  0x08034FC2: movs       r1, #0xa                      
  0x08034FC4: bl         #0x81c7bac                    
  0x08034FC8: ldr        r2, [sp, #0x24]               
  0x08034FCA: ldrh       r1, [r2]                      
  0x08034FCC: adds       r1, r1, r0                    
  0x08034FCE: strh       r1, [r2]                      
  0x08034FD0: lsls       r1, r1, #0x10                 
  0x08034FD2: lsrs       r1, r1, #0x10                 
  0x08034FD4: cmp        r1, #0xfa                     
  0x08034FD6: bls        #0x8034fdc                    
  0x08034FD8: movs       r0, #0xfa                     
  0x08034FDA: strh       r0, [r2]                      
  0x08034FDC: ldr        r1, [sp, #0x1c]               
  0x08034FDE: ldrh       r0, [r1]                      
  0x08034FE0: movs       r1, #0xa                      
  0x08034FE2: bl         #0x81c7bac                    
  0x08034FE6: ldr        r2, [sp, #0x28]               
  0x08034FE8: ldrh       r1, [r2]                      
  0x08034FEA: adds       r1, r1, r0                    
  0x08034FEC: strh       r1, [r2]                      
  0x08034FEE: lsls       r1, r1, #0x10                 
  0x08034FF0: lsrs       r1, r1, #0x10                 
  0x08034FF2: cmp        r1, #0xfa                     
  0x08034FF4: bls        #0x8034ffa                    
  0x08034FF6: movs       r0, #0xfa                     
  0x08034FF8: strh       r0, [r2]                      
  0x08034FFA: ldr        r1, [sp, #0x20]               
  0x08034FFC: ldrh       r0, [r1]                      
  0x08034FFE: movs       r1, #0xa                      
  0x08035000: bl         #0x81c7bac                    
  0x08035004: ldr        r2, [sp, #0x2c]               
  0x08035006: ldrh       r1, [r2]                      
  0x08035008: adds       r1, r1, r0                    
  0x0803500A: strh       r1, [r2]                      
  0x0803500C: lsls       r1, r1, #0x10                 
  0x0803500E: lsrs       r1, r1, #0x10                 
  0x08035010: cmp        r1, #0xfa                     
  0x08035012: bls        #0x8035018                    
  0x08035014: movs       r0, #0xfa                     
  0x08035016: strh       r0, [r2]                      
  0x08035018: movs       r4, #0                        
  0x0803501A: movs       r2, #0xff                     
  0x0803501C: mov        r0, sp                        
  0x0803501E: adds       r1, r0, r4                    
  0x08035020: ldrb       r0, [r1]                      
  0x08035022: orrs       r0, r2                        
  0x08035024: strb       r0, [r1]                      
  0x08035026: adds       r4, #1                        
  0x08035028: cmp        r4, #5                        
  0x0803502A: ble        #0x803501c                    
  0x0803502C: movs       r4, #0                        
  0x0803502E: ldr        r1, [sp, #0x10]               
  0x08035030: adds       r0, r1, r4                    
  0x08035032: ldrb       r0, [r0]                      
  0x08035034: adds       r1, r7, #0                    
  0x08035036: bl         #0x80352b0                    
  0x0803503A: mov        r2, r8                        
  0x0803503C: adds       r1, r2, r4                    
  0x0803503E: strb       r0, [r1]                      
  0x08035040: adds       r4, #1                        
  0x08035042: cmp        r4, #5                        
  0x08035044: ble        #0x803502e                    
  0x08035046: movs       r4, #0                        
  0x08035048: adds       r2, r4, #0                    
  0x0803504A: cmp        r4, #5                        
  0x0803504C: bgt        #0x8035074                    
  0x0803504E: mov        r6, r8                        
  0x08035050: adds       r5, r6, r4                    
  0x08035052: movs       r0, #0xff                     
  0x08035054: mov        ip, r0                        
  0x08035056: adds       r3, r6, r2                    
  0x08035058: ldrb       r0, [r3]                      
  0x0803505A: ldrb       r1, [r5]                      
  0x0803505C: cmp        r1, r0                        
  0x0803505E: bne        #0x803506e                    
  0x08035060: cmp        r1, #0xff                     
  0x08035062: beq        #0x803506e                    
  0x08035064: cmp        r2, r4                        
  0x08035066: beq        #0x803506e                    
  0x08035068: mov        r1, ip                        
  0x0803506A: orrs       r0, r1                        
  0x0803506C: strb       r0, [r3]                      
  0x0803506E: adds       r2, #1                        
  0x08035070: cmp        r2, #5                        
  0x08035072: ble        #0x8035056                    
  0x08035074: adds       r4, #1                        
  0x08035076: cmp        r4, #5                        
  0x08035078: ble        #0x8035048                    
  0x0803507A: movs       r6, #0                        
  0x0803507C: movs       r4, #0                        
  0x0803507E: movs       r5, #0                        
  0x08035080: adds       r2, r4, #0                    
  0x08035082: adds       r0, r4, #1                    
  0x08035084: mov        sb, r0                        
  0x08035086: cmp        r4, #5                        
  0x08035088: bgt        #0x80350b6                    
  0x0803508A: mov        r1, r8                        
  0x0803508C: adds       r0, r1, r4                    
  0x0803508E: ldrb       r0, [r0]                      
  0x08035090: cmp        r0, #0xff                     
  0x08035092: beq        #0x80350b4                    
  0x08035094: mov        r0, r8                        
  0x08035096: adds       r1, r0, r4                    
  0x08035098: adds       r0, r7, #0                    
  0x0803509A: adds       r0, #0xf8                     
  0x0803509C: adds       r0, r0, r2                    
  0x0803509E: ldrb       r1, [r1]                      
  0x080350A0: ldrb       r0, [r0]                      
  0x080350A2: cmp        r1, r0                        
  0x080350A4: bne        #0x80350aa                    
  0x080350A6: cmp        r1, #0xff                     
  0x080350A8: bne        #0x80350b4                    
  0x080350AA: adds       r2, #1                        
  0x080350AC: cmp        r2, #5                        
  0x080350AE: bgt        #0x80350b6                    
  0x080350B0: cmp        r1, #0xff                     
  0x080350B2: bne        #0x8035094                    
  0x080350B4: movs       r5, #1                        
  0x080350B6: mov        r2, r8                        
  0x080350B8: adds       r1, r2, r4                    
  0x080350BA: ldrb       r0, [r1]                      
  0x080350BC: cmp        r0, #0xff                     
  0x080350BE: beq        #0x80350d4                    
  0x080350C0: adds       r1, r0, #0                    
  0x080350C2: adds       r0, r7, #0                    
  0x080350C4: movs       r2, #0                        
  0x080350C6: bl         #0x800d928                    
  0x080350CA: movs       r1, #1                        
  0x080350CC: rsbs       r1, r1, #0                    
  0x080350CE: cmp        r0, r1                        
  0x080350D0: bne        #0x80350d4                    
  0x080350D2: movs       r5, #1                        
  0x080350D4: cmp        r5, #0                        
  0x080350D6: bne        #0x80350e6                    
  0x080350D8: mov        r1, sp                        
  0x080350DA: adds       r0, r1, r6                    
  0x080350DC: mov        r2, r8                        
  0x080350DE: adds       r1, r2, r4                    
  0x080350E0: ldrb       r1, [r1]                      
  0x080350E2: strb       r1, [r0]                      
  0x080350E4: adds       r6, #1                        
  0x080350E6: mov        r4, sb                        
  0x080350E8: cmp        r4, #5                        
  0x080350EA: ble        #0x803507e                    
  0x080350EC: cmp        r6, #0                        
  0x080350EE: beq        #0x803512c                    
  0x080350F0: bl         #0x806354c                      ; -> prng()
  0x080350F4: lsls       r0, r0, #0x10                 
  0x080350F6: lsrs       r0, r0, #0x10                 
  0x080350F8: adds       r1, r6, #0                    
  0x080350FA: bl         #0x81c7a6c                    
  0x080350FE: add        r0, sp, r0                    
  0x08035100: ldrb       r1, [r0]                      
  0x08035102: movs       r4, #0                        
  0x08035104: b          #0x8035108                    
  0x08035106: adds       r4, #1                        
  0x08035108: cmp        r4, #5                        
  0x0803510A: bgt        #0x8035120                    
  0x0803510C: adds       r0, r7, #0                    
  0x0803510E: adds       r0, #0xf8                     
  0x08035110: adds       r0, r0, r4                    
  0x08035112: ldrb       r0, [r0]                      
  0x08035114: cmp        r0, #0xff                     
  0x08035116: bne        #0x8035106                    
  0x08035118: adds       r0, r7, #0                    
  0x0803511A: movs       r2, #0                        
  0x0803511C: bl         #0x800d2b0                      ; -> learn_technique(monster, tech_id, slot)
  0x08035120: adds       r0, r7, #0                    
  0x08035122: movs       r1, #0x30                     
  0x08035124: movs       r2, #0                        
  0x08035126: movs       r3, #0                        
  0x08035128: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0803512C: add        sp, #0x30                     
  0x0803512E: pop        {r3, r4, r5}                  
  0x08035130: mov        r8, r3                        
  0x08035132: mov        sb, r4                        
  0x08035134: mov        sl, r5                        
  0x08035136: pop        {r4, r5, r6, r7}              
  0x08035138: pop        {r0}                          
  0x0803513A: bx         r0                            