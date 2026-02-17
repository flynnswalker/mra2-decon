; Function at 0x0804AC60
; 194 instructions traced

  0x0804AC60: push       {r4, r5, r6, r7, lr}          
  0x0804AC62: mov        r7, sb                        
  0x0804AC64: mov        r6, r8                        
  0x0804AC66: push       {r6, r7}                      
  0x0804AC68: lsls       r0, r0, #0x10                 
  0x0804AC6A: lsrs       r0, r0, #0x10                 
  0x0804AC6C: ldr        r1, [pc, #0xa4]                 ; = 0x0200D590 
  0x0804AC6E: mov        r8, r1                        
  0x0804AC70: ldr        r2, [pc, #0xa4]                 ; = 0x0820CBA8 
  0x0804AC72: adds       r2, #4                        
  0x0804AC74: lsls       r1, r0, #1                    
  0x0804AC76: adds       r1, r1, r0                    
  0x0804AC78: lsls       r1, r1, #4                    
  0x0804AC7A: adds       r6, r1, r2                    
  0x0804AC7C: ldrb       r0, [r6, #0x1a]               
  0x0804AC7E: ldrb       r1, [r6, #0x1b]               
  0x0804AC80: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x0804AC84: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x0804AC88: adds       r4, r0, #0                    
  0x0804AC8A: mov        r0, r8                        
  0x0804AC8C: movs       r1, #0x63                     
  0x0804AC8E: adds       r2, r6, #0                    
  0x0804AC90: movs       r3, #0xa                      
  0x0804AC92: bl         #0x8003608                    
  0x0804AC96: ldrb       r2, [r6, #0x1a]               
  0x0804AC98: mov        r0, r8                        
  0x0804AC9A: movs       r1, #0x6b                     
  0x0804AC9C: movs       r3, #0                        
  0x0804AC9E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_107 (offset 0x0104)
  0x0804ACA2: ldrb       r2, [r6, #0x1b]               
  0x0804ACA4: mov        r0, r8                        
  0x0804ACA6: movs       r1, #0x6c                     
  0x0804ACA8: movs       r3, #0                        
  0x0804ACAA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_108 (offset 0x0105)
  0x0804ACAE: ldrh       r2, [r6, #0x1c]               
  0x0804ACB0: mov        r0, r8                        
  0x0804ACB2: movs       r1, #0                        
  0x0804ACB4: movs       r3, #0                        
  0x0804ACB6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_pow (offset 0x0068)
  0x0804ACBA: ldrh       r2, [r6, #0x1e]               
  0x0804ACBC: mov        r0, r8                        
  0x0804ACBE: movs       r1, #1                        
  0x0804ACC0: movs       r3, #0                        
  0x0804ACC2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_int (offset 0x006A)
  0x0804ACC6: ldrh       r2, [r6, #0x20]               
  0x0804ACC8: mov        r0, r8                        
  0x0804ACCA: movs       r1, #2                        
  0x0804ACCC: movs       r3, #0                        
  0x0804ACCE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_ski (offset 0x006C)
  0x0804ACD2: ldrh       r2, [r6, #0x22]               
  0x0804ACD4: mov        r0, r8                        
  0x0804ACD6: movs       r1, #3                        
  0x0804ACD8: movs       r3, #0                        
  0x0804ACDA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_spd (offset 0x006E)
  0x0804ACDE: ldrh       r2, [r6, #0x24]               
  0x0804ACE0: mov        r0, r8                        
  0x0804ACE2: movs       r1, #4                        
  0x0804ACE4: movs       r3, #0                        
  0x0804ACE6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_def (offset 0x0070)
  0x0804ACEA: ldrh       r2, [r6, #0x26]               
  0x0804ACEC: mov        r0, r8                        
  0x0804ACEE: movs       r1, #5                        
  0x0804ACF0: movs       r3, #0                        
  0x0804ACF2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_lif (offset 0x0072)
  0x0804ACF6: movs       r5, #0                        
  0x0804ACF8: lsls       r0, r5, #0x18                 
  0x0804ACFA: asrs       r3, r0, #0x18                 
  0x0804ACFC: movs       r1, #1                        
  0x0804ACFE: lsls       r1, r3                        
  0x0804AD00: ldr        r0, [r6, #0x28]               
  0x0804AD02: ands       r0, r1                        
  0x0804AD04: cmp        r0, #0                        
  0x0804AD06: beq        #0x804ad1c                    
  0x0804AD08: mov        r0, r8                        
  0x0804AD0A: movs       r1, #0x11                     
  0x0804AD0C: movs       r2, #1                        
  0x0804AD0E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_17 (offset None)
  0x0804AD12: b          #0x804ad26                    
  0x0804AD1C: mov        r0, r8                        
  0x0804AD1E: movs       r1, #0x11                     
  0x0804AD20: movs       r2, #0                        
  0x0804AD22: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_17 (offset None)
  0x0804AD26: lsls       r0, r5, #0x18                 
  0x0804AD28: movs       r1, #0x80                     
  0x0804AD2A: lsls       r1, r1, #0x11                 
  0x0804AD2C: adds       r0, r0, r1                    
  0x0804AD2E: lsrs       r5, r0, #0x18                 
  0x0804AD30: asrs       r0, r0, #0x18                 
  0x0804AD32: cmp        r0, #9                        
  0x0804AD34: ble        #0x804acf8                    
  0x0804AD36: ldr        r1, [pc, #0xe0]                 ; = 0x08208CB0 
  0x0804AD38: mov        r0, r8                        
  0x0804AD3A: bl         #0x8029e54                    
  0x0804AD3E: ldr        r2, [r4, #0x20]               
  0x0804AD40: mov        r0, r8                        
  0x0804AD42: movs       r1, #0x65                     
  0x0804AD44: movs       r3, #0                        
  0x0804AD46: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_101 (offset 0x0024)
  0x0804AD4A: movs       r5, #0                        
  0x0804AD4C: adds       r7, r4, #0                    
  0x0804AD4E: adds       r7, #0x24                     
  0x0804AD50: movs       r0, #0x2c                     
  0x0804AD52: adds       r0, r0, r6                    
  0x0804AD54: mov        sb, r0                        
  0x0804AD56: lsls       r4, r5, #0x18                 
  0x0804AD58: asrs       r4, r4, #0x18                 
  0x0804AD5A: mov        r0, r8                        
  0x0804AD5C: movs       r1, #0x4b                     
  0x0804AD5E: movs       r2, #0xff                     
  0x0804AD60: adds       r3, r4, #0                    
  0x0804AD62: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x0804AD66: adds       r4, #1                        
  0x0804AD68: lsls       r4, r4, #0x18                 
  0x0804AD6A: lsrs       r5, r4, #0x18                 
  0x0804AD6C: asrs       r4, r4, #0x18                 
  0x0804AD6E: cmp        r4, #5                        
  0x0804AD70: ble        #0x804ad56                    
  0x0804AD72: movs       r5, #0                        
  0x0804AD74: ldrb       r0, [r7]                      
  0x0804AD76: cmp        r0, #0xff                     
  0x0804AD78: beq        #0x804adb0                    
  0x0804AD7A: lsls       r0, r5, #0x18                 
  0x0804AD7C: asrs       r5, r0, #0x18                 
  0x0804AD7E: adds       r4, r7, r5                    
  0x0804AD80: ldrb       r1, [r4]                      
  0x0804AD82: mov        r0, r8                        
  0x0804AD84: movs       r2, #0                        
  0x0804AD86: bl         #0x800d928                    
  0x0804AD8A: lsls       r0, r0, #0x18                 
  0x0804AD8C: asrs       r3, r0, #0x18                 
  0x0804AD8E: cmp        r3, #0                        
  0x0804AD90: blt        #0x804ad9c                    
  0x0804AD92: ldrb       r2, [r4]                      
  0x0804AD94: mov        r0, r8                        
  0x0804AD96: movs       r1, #0x4b                     
  0x0804AD98: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x0804AD9C: adds       r0, r5, #1                    
  0x0804AD9E: lsls       r0, r0, #0x18                 
  0x0804ADA0: lsrs       r5, r0, #0x18                 
  0x0804ADA2: asrs       r0, r0, #0x18                 
  0x0804ADA4: cmp        r0, #3                        
  0x0804ADA6: bgt        #0x804adb0                    
  0x0804ADA8: adds       r0, r7, r0                    
  0x0804ADAA: ldrb       r0, [r0]                      
  0x0804ADAC: cmp        r0, #0xff                     
  0x0804ADAE: bne        #0x804ad7a                    
  0x0804ADB0: movs       r5, #0                        
  0x0804ADB2: mov        r1, sb                        
  0x0804ADB4: ldrb       r0, [r1]                      
  0x0804ADB6: cmp        r0, #0xff                     
  0x0804ADB8: beq        #0x804adf2                    
  0x0804ADBA: mov        r7, sb                        
  0x0804ADBC: lsls       r0, r5, #0x18                 
  0x0804ADBE: asrs       r5, r0, #0x18                 
  0x0804ADC0: adds       r4, r7, r5                    
  0x0804ADC2: ldrb       r1, [r4]                      
  0x0804ADC4: mov        r0, r8                        
  0x0804ADC6: movs       r2, #0                        
  0x0804ADC8: bl         #0x800d928                    
  0x0804ADCC: lsls       r0, r0, #0x18                 
  0x0804ADCE: asrs       r3, r0, #0x18                 
  0x0804ADD0: cmp        r3, #0                        
  0x0804ADD2: blt        #0x804adde                    
  0x0804ADD4: ldrb       r2, [r4]                      
  0x0804ADD6: mov        r0, r8                        
  0x0804ADD8: movs       r1, #0x4b                     
  0x0804ADDA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x0804ADDE: adds       r0, r5, #1                    
  0x0804ADE0: lsls       r0, r0, #0x18                 
  0x0804ADE2: lsrs       r5, r0, #0x18                 
  0x0804ADE4: asrs       r0, r0, #0x18                 
  0x0804ADE6: cmp        r0, #2                        
  0x0804ADE8: bgt        #0x804adf2                    
  0x0804ADEA: adds       r0, r7, r0                    
  0x0804ADEC: ldrb       r0, [r0]                      
  0x0804ADEE: cmp        r0, #0xff                     
  0x0804ADF0: bne        #0x804adbc                    
  0x0804ADF2: ldrb       r2, [r6, #0x15]               
  0x0804ADF4: mov        r0, r8                        
  0x0804ADF6: movs       r1, #0x1e                     
  0x0804ADF8: movs       r3, #0                        
  0x0804ADFA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_30 (offset 0x00A3)
  0x0804ADFE: ldrb       r2, [r6, #0x16]               
  0x0804AE00: mov        r0, r8                        
  0x0804AE02: movs       r1, #0xc                      
  0x0804AE04: movs       r3, #0                        
  0x0804AE06: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_12 (offset 0x007A)
  0x0804AE0A: mov        r0, r8                        
  0x0804AE0C: pop        {r3, r4}                      
  0x0804AE0E: mov        r8, r3                        
  0x0804AE10: mov        sb, r4                        
  0x0804AE12: pop        {r4, r5, r6, r7}              
  0x0804AE14: pop        {r1}                          
  0x0804AE16: bx         r1                            