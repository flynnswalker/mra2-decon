; Function at 0x08001BEC
; 300 instructions traced

  0x08001BEC: push       {r4, r5, r6, r7, lr}          
  0x08001BEE: mov        r7, sl                        
  0x08001BF0: mov        r6, sb                        
  0x08001BF2: mov        r5, r8                        
  0x08001BF4: push       {r5, r6, r7}                  
  0x08001BF6: sub        sp, #0x10                     
  0x08001BF8: adds       r6, r0, #0                    
  0x08001BFA: adds       r4, r1, #0                    
  0x08001BFC: lsls       r2, r2, #0x18                 
  0x08001BFE: lsrs       r5, r2, #0x18                 
  0x08001C00: ldr        r0, [pc, #0x36c]                ; = 0x02002B24 WRAM_PLAYER_STATE
  0x08001C02: movs       r1, #0xac                     
  0x08001C04: movs       r2, #0                        
  0x08001C06: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001C0A: mov        sb, r0                        
  0x08001C0C: adds       r0, r6, #0                    
  0x08001C0E: movs       r1, #0xc4                     
  0x08001C10: bl         #0x80035f8                    
  0x08001C14: adds       r1, r4, #0                    
  0x08001C16: bl         #0x80036d4                    
  0x08001C1A: adds       r0, r4, #0                    
  0x08001C1C: adds       r0, #0x30                     
  0x08001C1E: ldrb       r0, [r0]                      
  0x08001C20: str        r0, [sp, #4]                  
  0x08001C22: adds       r0, r6, #0                    
  0x08001C24: movs       r1, #0xc5                     
  0x08001C26: ldr        r2, [sp, #4]                  
  0x08001C28: movs       r3, #0                        
  0x08001C2A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C2E: adds       r0, r4, #0                    
  0x08001C30: adds       r0, #0x31                     
  0x08001C32: ldrb       r0, [r0]                      
  0x08001C34: mov        sl, r0                        
  0x08001C36: adds       r0, r6, #0                    
  0x08001C38: movs       r1, #0xc6                     
  0x08001C3A: mov        r2, sl                        
  0x08001C3C: movs       r3, #0                        
  0x08001C3E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C42: ldr        r0, [sp, #4]                  
  0x08001C44: mov        r1, sl                        
  0x08001C46: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08001C4A: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x08001C4E: adds       r7, r0, #0                    
  0x08001C50: ldrh       r2, [r4, #0x24]               
  0x08001C52: adds       r0, r6, #0                    
  0x08001C54: movs       r1, #0xc7                     
  0x08001C56: movs       r3, #0                        
  0x08001C58: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C5C: ldrh       r2, [r4, #0x26]               
  0x08001C5E: adds       r0, r6, #0                    
  0x08001C60: movs       r1, #0xc8                     
  0x08001C62: movs       r3, #0                        
  0x08001C64: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C68: ldrh       r2, [r4, #0x28]               
  0x08001C6A: adds       r0, r6, #0                    
  0x08001C6C: movs       r1, #0xc9                     
  0x08001C6E: movs       r3, #0                        
  0x08001C70: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C74: ldrh       r2, [r4, #0x2a]               
  0x08001C76: adds       r0, r6, #0                    
  0x08001C78: movs       r1, #0xca                     
  0x08001C7A: movs       r3, #0                        
  0x08001C7C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C80: ldrh       r2, [r4, #0x2c]               
  0x08001C82: adds       r0, r6, #0                    
  0x08001C84: movs       r1, #0xcb                     
  0x08001C86: movs       r3, #0                        
  0x08001C88: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C8C: ldrh       r2, [r4, #0x2e]               
  0x08001C8E: adds       r0, r6, #0                    
  0x08001C90: movs       r1, #0xcc                     
  0x08001C92: movs       r3, #0                        
  0x08001C94: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001C98: movs       r2, #8                        
  0x08001C9A: ldrsb      r2, [r7, r2]                  
  0x08001C9C: adds       r0, r6, #0                    
  0x08001C9E: movs       r1, #0xcd                     
  0x08001CA0: movs       r3, #0                        
  0x08001CA2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CA6: movs       r2, #9                        
  0x08001CA8: ldrsb      r2, [r7, r2]                  
  0x08001CAA: adds       r0, r6, #0                    
  0x08001CAC: movs       r1, #0xce                     
  0x08001CAE: movs       r3, #0                        
  0x08001CB0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CB4: movs       r2, #0xa                      
  0x08001CB6: ldrsb      r2, [r7, r2]                  
  0x08001CB8: adds       r0, r6, #0                    
  0x08001CBA: movs       r1, #0xcf                     
  0x08001CBC: movs       r3, #0                        
  0x08001CBE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CC2: movs       r2, #0xb                      
  0x08001CC4: ldrsb      r2, [r7, r2]                  
  0x08001CC6: adds       r0, r6, #0                    
  0x08001CC8: movs       r1, #0xd0                     
  0x08001CCA: movs       r3, #0                        
  0x08001CCC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CD0: movs       r2, #0xc                      
  0x08001CD2: ldrsb      r2, [r7, r2]                  
  0x08001CD4: adds       r0, r6, #0                    
  0x08001CD6: movs       r1, #0xd1                     
  0x08001CD8: movs       r3, #0                        
  0x08001CDA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CDE: movs       r2, #0xd                      
  0x08001CE0: ldrsb      r2, [r7, r2]                  
  0x08001CE2: adds       r0, r6, #0                    
  0x08001CE4: movs       r1, #0xd2                     
  0x08001CE6: movs       r3, #0                        
  0x08001CE8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001CEC: adds       r0, r4, #0                    
  0x08001CEE: adds       r0, #0x32                     
  0x08001CF0: ldrb       r0, [r0]                      
  0x08001CF2: mov        r8, r0                        
  0x08001CF4: cmp        r0, #5                        
  0x08001CF6: ble        #0x8001cfc                    
  0x08001CF8: movs       r0, #5                        
  0x08001CFA: mov        r8, r0                        
  0x08001CFC: adds       r0, r6, #0                    
  0x08001CFE: movs       r1, #0xd3                     
  0x08001D00: mov        r2, r8                        
  0x08001D02: movs       r3, #0                        
  0x08001D04: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D08: adds       r0, r6, #0                    
  0x08001D0A: movs       r1, #0xd4                     
  0x08001D0C: adds       r2, r5, #0                    
  0x08001D0E: movs       r3, #0                        
  0x08001D10: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D14: ldr        r2, [r4, #0x20]               
  0x08001D16: adds       r0, r6, #0                    
  0x08001D18: movs       r1, #0xd5                     
  0x08001D1A: movs       r3, #0                        
  0x08001D1C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D20: movs       r0, #8                        
  0x08001D22: ldrsb      r0, [r7, r0]                  
  0x08001D24: movs       r1, #9                        
  0x08001D26: ldrsb      r1, [r7, r1]                  
  0x08001D28: adds       r0, r0, r1                    
  0x08001D2A: movs       r1, #0xa                      
  0x08001D2C: ldrsb      r1, [r7, r1]                  
  0x08001D2E: adds       r0, r0, r1                    
  0x08001D30: movs       r1, #0xb                      
  0x08001D32: ldrsb      r1, [r7, r1]                  
  0x08001D34: adds       r0, r0, r1                    
  0x08001D36: movs       r1, #0xc                      
  0x08001D38: ldrsb      r1, [r7, r1]                  
  0x08001D3A: adds       r0, r0, r1                    
  0x08001D3C: movs       r1, #0xd                      
  0x08001D3E: ldrsb      r1, [r7, r1]                  
  0x08001D40: adds       r0, r0, r1                    
  0x08001D42: movs       r1, #0x18                     
  0x08001D44: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08001D48: adds       r1, r4, #0                    
  0x08001D4A: adds       r1, #0x33                     
  0x08001D4C: add        r0, r8                        
  0x08001D4E: ldrb       r1, [r1]                      
  0x08001D50: adds       r2, r0, r1                    
  0x08001D52: cmp        r2, #0                        
  0x08001D54: bgt        #0x8001d58                    
  0x08001D56: movs       r2, #1                        
  0x08001D58: cmp        r2, #6                        
  0x08001D5A: ble        #0x8001d5e                    
  0x08001D5C: movs       r2, #6                        
  0x08001D5E: adds       r0, r6, #0                    
  0x08001D60: movs       r1, #0xd6                     
  0x08001D62: movs       r3, #0                        
  0x08001D64: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D68: movs       r5, #0                        
  0x08001D6A: adds       r1, r7, #0                    
  0x08001D6C: adds       r1, #0x24                     
  0x08001D6E: str        r1, [sp, #0xc]                
  0x08001D70: adds       r4, #0x34                     
  0x08001D72: str        r4, [sp, #8]                  
  0x08001D74: adds       r0, r6, #0                    
  0x08001D76: movs       r1, #0xd7                     
  0x08001D78: movs       r2, #0                        
  0x08001D7A: adds       r3, r5, #0                    
  0x08001D7C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D80: adds       r5, #1                        
  0x08001D82: cmp        r5, #0xb                      
  0x08001D84: ble        #0x8001d74                    
  0x08001D86: mov        r0, r8                        
  0x08001D88: movs       r1, #0x64                     
  0x08001D8A: ldr        r2, [sp]                      
  0x08001D8C: bl         #0x8002a5c                    
  0x08001D90: adds       r2, r0, #0                    
  0x08001D92: adds       r0, r6, #0                    
  0x08001D94: movs       r1, #0xee                     
  0x08001D96: movs       r3, #0                        
  0x08001D98: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001D9C: adds       r0, r6, #0                    
  0x08001D9E: movs       r1, #0xef                     
  0x08001DA0: movs       r2, #0                        
  0x08001DA2: movs       r3, #0                        
  0x08001DA4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DA8: adds       r0, r6, #0                    
  0x08001DAA: movs       r1, #0xf0                     
  0x08001DAC: movs       r2, #0                        
  0x08001DAE: movs       r3, #0                        
  0x08001DB0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DB4: adds       r0, r6, #0                    
  0x08001DB6: movs       r1, #0xf1                     
  0x08001DB8: movs       r2, #0                        
  0x08001DBA: movs       r3, #0                        
  0x08001DBC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DC0: adds       r0, r6, #0                    
  0x08001DC2: movs       r1, #0xf2                     
  0x08001DC4: movs       r2, #0                        
  0x08001DC6: movs       r3, #0                        
  0x08001DC8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DCC: ldrh       r0, [r7, #0x10]               
  0x08001DCE: mov        r1, r8                        
  0x08001DD0: movs       r2, #0x32                     
  0x08001DD2: movs       r3, #0                        
  0x08001DD4: bl         #0x8002a98                    
  0x08001DD8: adds       r4, r0, #0                    
  0x08001DDA: lsls       r4, r4, #0x10                 
  0x08001DDC: lsrs       r4, r4, #0x10                 
  0x08001DDE: adds       r0, r6, #0                    
  0x08001DE0: movs       r1, #0xd8                     
  0x08001DE2: adds       r2, r4, #0                    
  0x08001DE4: movs       r3, #0                        
  0x08001DE6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DEA: adds       r0, r6, #0                    
  0x08001DEC: movs       r1, #0xd9                     
  0x08001DEE: adds       r2, r4, #0                    
  0x08001DF0: movs       r3, #0                        
  0x08001DF2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001DF6: adds       r0, r6, #0                    
  0x08001DF8: movs       r1, #0xda                     
  0x08001DFA: movs       r2, #0                        
  0x08001DFC: movs       r3, #0                        
  0x08001DFE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E02: mov        r0, sb                        
  0x08001E04: cmp        r0, #0                        
  0x08001E06: bge        #0x8001e0a                    
  0x08001E08: adds       r0, #3                        
  0x08001E0A: asrs       r0, r0, #2                    
  0x08001E0C: lsls       r0, r0, #2                    
  0x08001E0E: mov        r1, sb                        
  0x08001E10: subs       r0, r1, r0                    
  0x08001E12: movs       r1, #0x63                     
  0x08001E14: subs       r2, r1, r0                    
  0x08001E16: adds       r0, r6, #0                    
  0x08001E18: movs       r1, #0xdb                     
  0x08001E1A: movs       r3, #0                        
  0x08001E1C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E20: adds       r0, r6, #0                    
  0x08001E22: movs       r1, #0xdc                     
  0x08001E24: movs       r2, #0                        
  0x08001E26: movs       r3, #0                        
  0x08001E28: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E2C: ldr        r0, [sp, #4]                  
  0x08001E2E: mov        r1, sl                        
  0x08001E30: bl         #0x80020a0                    
  0x08001E34: lsls       r0, r0, #0x18                 
  0x08001E36: lsrs       r2, r0, #0x18                 
  0x08001E38: adds       r0, r6, #0                    
  0x08001E3A: movs       r1, #0xdd                     
  0x08001E3C: movs       r3, #0                        
  0x08001E3E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E42: movs       r0, #7                        
  0x08001E44: bl         #0x8053564                    
  0x08001E48: lsls       r0, r0, #0x18                 
  0x08001E4A: lsrs       r0, r0, #0x18                 
  0x08001E4C: adds       r0, #7                        
  0x08001E4E: str        r0, [sp]                      
  0x08001E50: adds       r0, r6, #0                    
  0x08001E52: movs       r1, #0xde                     
  0x08001E54: ldr        r2, [sp]                      
  0x08001E56: movs       r3, #0                        
  0x08001E58: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E5C: movs       r5, #0                        
  0x08001E5E: adds       r0, r6, #0                    
  0x08001E60: movs       r1, #0xe0                     
  0x08001E62: movs       r2, #0xff                     
  0x08001E64: adds       r3, r5, #0                    
  0x08001E66: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E6A: adds       r5, #1                        
  0x08001E6C: cmp        r5, #5                        
  0x08001E6E: ble        #0x8001e5e                    
  0x08001E70: movs       r5, #0                        
  0x08001E72: ldr        r1, [sp, #0xc]                
  0x08001E74: ldrb       r0, [r1]                      
  0x08001E76: cmp        r0, #0xff                     
  0x08001E78: beq        #0x8001e96                    
  0x08001E7A: adds       r4, r1, #0                    
  0x08001E7C: ldrb       r2, [r4]                      
  0x08001E7E: adds       r0, r6, #0                    
  0x08001E80: movs       r1, #0xe0                     
  0x08001E82: adds       r3, r5, #0                    
  0x08001E84: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001E88: adds       r4, #1                        
  0x08001E8A: adds       r5, #1                        
  0x08001E8C: cmp        r5, #3                        
  0x08001E8E: bgt        #0x8001e96                    
  0x08001E90: ldrb       r0, [r4]                      
  0x08001E92: cmp        r0, #0xff                     
  0x08001E94: bne        #0x8001e7c                    
  0x08001E96: movs       r5, #0                        
  0x08001E98: ldr        r1, [sp, #8]                  