; Function at 0x08020774
; 359 instructions traced

  0x08020774: push       {r4, r5, r6, r7, lr}          
  0x08020776: mov        r7, sb                        
  0x08020778: mov        r6, r8                        
  0x0802077A: push       {r6, r7}                      
  0x0802077C: adds       r5, r0, #0                    
  0x0802077E: adds       r0, r1, #0                    
  0x08020780: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x08020784: adds       r6, r0, #0                    
  0x08020786: ldr        r2, [pc, #0x320]                ; = 0x00000594 
  0x08020788: adds       r0, r5, #0                    
  0x0802078A: movs       r1, #0                        
  0x0802078C: bl         #0x81c770c                      ; -> memset(dst, val, len)
  0x08020790: adds       r0, r5, #0                    
  0x08020792: movs       r1, #0x18                     
  0x08020794: movs       r2, #1                        
  0x08020796: movs       r3, #0                        
  0x08020798: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_24 (offset 0x0098)
  0x0802079C: ldrb       r0, [r6]                      
  0x0802079E: ldrb       r1, [r6, #1]                  
  0x080207A0: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x080207A4: lsls       r0, r0, #0x10                 
  0x080207A6: lsrs       r0, r0, #0x10                 
  0x080207A8: bl         #0x8002b88                      ; -> resolve_ptr_16(index)
  0x080207AC: adds       r2, r0, #0                    
  0x080207AE: adds       r0, r5, #0                    
  0x080207B0: movs       r1, #0x63                     
  0x080207B2: movs       r3, #8                        
  0x080207B4: bl         #0x8003608                    
  0x080207B8: ldrb       r2, [r6]                      
  0x080207BA: adds       r0, r5, #0                    
  0x080207BC: movs       r1, #0x6b                     
  0x080207BE: movs       r3, #0                        
  0x080207C0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_107 (offset 0x0104)
  0x080207C4: ldrb       r2, [r6, #1]                  
  0x080207C6: adds       r0, r5, #0                    
  0x080207C8: movs       r1, #0x6c                     
  0x080207CA: movs       r3, #0                        
  0x080207CC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_108 (offset 0x0105)
  0x080207D0: ldrb       r2, [r6, #2]                  
  0x080207D2: adds       r0, r5, #0                    
  0x080207D4: movs       r1, #0                        
  0x080207D6: movs       r3, #0                        
  0x080207D8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_pow (offset 0x0068)
  0x080207DC: ldrb       r2, [r6, #3]                  
  0x080207DE: adds       r0, r5, #0                    
  0x080207E0: movs       r1, #1                        
  0x080207E2: movs       r3, #0                        
  0x080207E4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_int (offset 0x006A)
  0x080207E8: ldrb       r2, [r6, #4]                  
  0x080207EA: adds       r0, r5, #0                    
  0x080207EC: movs       r1, #2                        
  0x080207EE: movs       r3, #0                        
  0x080207F0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_ski (offset 0x006C)
  0x080207F4: ldrb       r2, [r6, #5]                  
  0x080207F6: adds       r0, r5, #0                    
  0x080207F8: movs       r1, #3                        
  0x080207FA: movs       r3, #0                        
  0x080207FC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_spd (offset 0x006E)
  0x08020800: ldrb       r2, [r6, #6]                  
  0x08020802: adds       r0, r5, #0                    
  0x08020804: movs       r1, #4                        
  0x08020806: movs       r3, #0                        
  0x08020808: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_def (offset 0x0070)
  0x0802080C: ldrb       r2, [r6, #7]                  
  0x0802080E: adds       r0, r5, #0                    
  0x08020810: movs       r1, #5                        
  0x08020812: movs       r3, #0                        
  0x08020814: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_lif (offset 0x0072)
  0x08020818: movs       r2, #8                        
  0x0802081A: ldrsb      r2, [r6, r2]                  
  0x0802081C: adds       r0, r5, #0                    
  0x0802081E: movs       r1, #0x20                     
  0x08020820: movs       r3, #0                        
  0x08020822: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_32 (offset 0x00A5)
  0x08020826: movs       r2, #9                        
  0x08020828: ldrsb      r2, [r6, r2]                  
  0x0802082A: adds       r0, r5, #0                    
  0x0802082C: movs       r1, #0x21                     
  0x0802082E: movs       r3, #0                        
  0x08020830: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_33 (offset 0x00A6)
  0x08020834: movs       r2, #0xa                      
  0x08020836: ldrsb      r2, [r6, r2]                  
  0x08020838: adds       r0, r5, #0                    
  0x0802083A: movs       r1, #0x22                     
  0x0802083C: movs       r3, #0                        
  0x0802083E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_34 (offset 0x00A7)
  0x08020842: movs       r2, #0xb                      
  0x08020844: ldrsb      r2, [r6, r2]                  
  0x08020846: adds       r0, r5, #0                    
  0x08020848: movs       r1, #0x23                     
  0x0802084A: movs       r3, #0                        
  0x0802084C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_35 (offset 0x00A8)
  0x08020850: movs       r2, #0xc                      
  0x08020852: ldrsb      r2, [r6, r2]                  
  0x08020854: adds       r0, r5, #0                    
  0x08020856: movs       r1, #0x24                     
  0x08020858: movs       r3, #0                        
  0x0802085A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_36 (offset 0x00A9)
  0x0802085E: movs       r2, #0xd                      
  0x08020860: ldrsb      r2, [r6, r2]                  
  0x08020862: adds       r0, r5, #0                    
  0x08020864: movs       r1, #0x25                     
  0x08020866: movs       r3, #0                        
  0x08020868: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_37 (offset 0x00AA)
  0x0802086C: ldrh       r2, [r6, #0xe]                
  0x0802086E: adds       r0, r5, #0                    
  0x08020870: movs       r1, #0x13                     
  0x08020872: movs       r3, #0                        
  0x08020874: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_19 (offset 0x0089)
  0x08020878: ldrh       r2, [r6, #0x10]               
  0x0802087A: adds       r0, r5, #0                    
  0x0802087C: movs       r1, #0x16                     
  0x0802087E: movs       r3, #0                        
  0x08020880: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> amount_0x94 (offset 0x0094)
  0x08020884: ldrh       r2, [r6, #0x10]               
  0x08020886: adds       r0, r5, #0                    
  0x08020888: movs       r1, #0x17                     
  0x0802088A: movs       r3, #0                        
  0x0802088C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> amount_0x96 (offset 0x0096)
  0x08020890: ldrh       r2, [r6, #0x12]               
  0x08020892: adds       r0, r5, #0                    
  0x08020894: movs       r1, #0x4a                     
  0x08020896: movs       r3, #0                        
  0x08020898: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_74 (offset 0x00F7)
  0x0802089C: ldrb       r2, [r6, #0x14]               
  0x0802089E: adds       r0, r5, #0                    
  0x080208A0: movs       r1, #0x49                     
  0x080208A2: movs       r3, #0                        
  0x080208A4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_73 (offset 0x00F6)
  0x080208A8: movs       r2, #0x15                     
  0x080208AA: ldrsb      r2, [r6, r2]                  
  0x080208AC: adds       r0, r5, #0                    
  0x080208AE: movs       r1, #0x3e                     
  0x080208B0: movs       r3, #0                        
  0x080208B2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xEB (offset 0x00EB)
  0x080208B6: movs       r2, #0x16                     
  0x080208B8: ldrsb      r2, [r6, r2]                  
  0x080208BA: adds       r0, r5, #0                    
  0x080208BC: movs       r1, #0x3f                     
  0x080208BE: movs       r3, #0                        
  0x080208C0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xEC (offset 0x00EC)
  0x080208C4: movs       r2, #0x17                     
  0x080208C6: ldrsb      r2, [r6, r2]                  
  0x080208C8: adds       r0, r5, #0                    
  0x080208CA: movs       r1, #0x40                     
  0x080208CC: movs       r3, #0                        
  0x080208CE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xED (offset 0x00ED)
  0x080208D2: movs       r2, #0x18                     
  0x080208D4: ldrsb      r2, [r6, r2]                  
  0x080208D6: adds       r0, r5, #0                    
  0x080208D8: movs       r1, #0x41                     
  0x080208DA: movs       r3, #0                        
  0x080208DC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xEE (offset 0x00EE)
  0x080208E0: movs       r2, #0x19                     
  0x080208E2: ldrsb      r2, [r6, r2]                  
  0x080208E4: adds       r0, r5, #0                    
  0x080208E6: movs       r1, #0x42                     
  0x080208E8: movs       r3, #0                        
  0x080208EA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xEF (offset 0x00EF)
  0x080208EE: movs       r2, #0x1a                     
  0x080208F0: ldrsb      r2, [r6, r2]                  
  0x080208F2: adds       r0, r5, #0                    
  0x080208F4: movs       r1, #0x43                     
  0x080208F6: movs       r3, #0                        
  0x080208F8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF0 (offset 0x00F0)
  0x080208FC: movs       r2, #0x1b                     
  0x080208FE: ldrsb      r2, [r6, r2]                  
  0x08020900: adds       r0, r5, #0                    
  0x08020902: movs       r1, #0x44                     
  0x08020904: movs       r3, #0                        
  0x08020906: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF1 (offset 0x00F1)
  0x0802090A: movs       r2, #0x1c                     
  0x0802090C: ldrsb      r2, [r6, r2]                  
  0x0802090E: adds       r0, r5, #0                    
  0x08020910: movs       r1, #0x45                     
  0x08020912: movs       r3, #0                        
  0x08020914: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF2 (offset 0x00F2)
  0x08020918: movs       r2, #0x1d                     
  0x0802091A: ldrsb      r2, [r6, r2]                  
  0x0802091C: adds       r0, r5, #0                    
  0x0802091E: movs       r1, #0x46                     
  0x08020920: movs       r3, #0                        
  0x08020922: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF3 (offset 0x00F3)
  0x08020926: movs       r2, #0x1e                     
  0x08020928: ldrsb      r2, [r6, r2]                  
  0x0802092A: adds       r0, r5, #0                    
  0x0802092C: movs       r1, #0x47                     
  0x0802092E: movs       r3, #0                        
  0x08020930: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF4 (offset 0x00F4)
  0x08020934: movs       r2, #0x1f                     
  0x08020936: ldrsb      r2, [r6, r2]                  
  0x08020938: adds       r0, r5, #0                    
  0x0802093A: movs       r1, #0x48                     
  0x0802093C: movs       r3, #0                        
  0x0802093E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> level_0xF5 (offset 0x00F5)
  0x08020942: ldr        r2, [r6, #0x20]               
  0x08020944: adds       r0, r5, #0                    
  0x08020946: movs       r1, #0x65                     
  0x08020948: movs       r3, #0                        
  0x0802094A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_101 (offset 0x0024)
  0x0802094E: movs       r4, #0                        
  0x08020950: ldr        r0, [r6, #0x28]               
  0x08020952: lsrs       r0, r4                        
  0x08020954: movs       r1, #1                        
  0x08020956: ands       r0, r1                        
  0x08020958: cmp        r0, #0                        
  0x0802095A: beq        #0x8020968                    
  0x0802095C: adds       r0, r5, #0                    
  0x0802095E: movs       r1, #0x11                     
  0x08020960: movs       r2, #1                        
  0x08020962: adds       r3, r4, #0                    
  0x08020964: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_17 (offset None)
  0x08020968: adds       r4, #1                        
  0x0802096A: cmp        r4, #9                        
  0x0802096C: ble        #0x8020950                    
  0x0802096E: movs       r4, #0                        
  0x08020970: adds       r7, r6, #0                    
  0x08020972: adds       r7, #0x24                     
  0x08020974: movs       r0, #0x30                     
  0x08020976: adds       r0, r0, r6                    
  0x08020978: mov        r8, r0                        
  0x0802097A: movs       r0, #0x38                     
  0x0802097C: adds       r0, r0, r6                    
  0x0802097E: mov        sb, r0                        
  0x08020980: adds       r0, r5, #0                    
  0x08020982: movs       r1, #0x4b                     
  0x08020984: movs       r2, #0xff                     
  0x08020986: adds       r3, r4, #0                    
  0x08020988: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x0802098C: adds       r4, #1                        
  0x0802098E: cmp        r4, #5                        
  0x08020990: ble        #0x8020980                    
  0x08020992: movs       r4, #0                        
  0x08020994: adds       r0, r7, r4                    
  0x08020996: ldrb       r1, [r0]                      
  0x08020998: cmp        r1, #0xff                     
  0x0802099A: beq        #0x80209a4                    
  0x0802099C: adds       r0, r5, #0                    
  0x0802099E: movs       r2, #0                        
  0x080209A0: bl         #0x800d2b0                    
  0x080209A4: adds       r4, #1                        
  0x080209A6: cmp        r4, #3                        
  0x080209A8: ble        #0x8020994                    
  0x080209AA: movs       r4, #0                        
  0x080209AC: movs       r7, #0xf                      
  0x080209AE: lsls       r0, r4, #2                    
  0x080209B0: ldr        r2, [r6, #0x2c]               
  0x080209B2: lsrs       r2, r0                        
  0x080209B4: ands       r2, r7                        
  0x080209B6: adds       r0, r5, #0                    
  0x080209B8: movs       r1, #0x33                     
  0x080209BA: adds       r3, r4, #0                    
  0x080209BC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_51 (offset None)
  0x080209C0: adds       r4, #1                        
  0x080209C2: cmp        r4, #4                        
  0x080209C4: ble        #0x80209ae                    
  0x080209C6: movs       r4, #0                        
  0x080209C8: adds       r0, r4, #0                    
  0x080209CA: cmp        r4, #0                        
  0x080209CC: bge        #0x80209d0                    
  0x080209CE: adds       r0, r4, #7                    
  0x080209D0: asrs       r0, r0, #3                    
  0x080209D2: lsls       r1, r0, #2                    
  0x080209D4: add        r1, r8                        
  0x080209D6: lsls       r0, r0, #3                    
  0x080209D8: subs       r0, r4, r0                    
  0x080209DA: lsls       r0, r0, #2                    
  0x080209DC: ldr        r2, [r1]                      
  0x080209DE: lsrs       r2, r0                        
  0x080209E0: movs       r0, #0xf                      
  0x080209E2: ands       r2, r0                        
  0x080209E4: adds       r0, r5, #0                    
  0x080209E6: movs       r1, #0x34                     
  0x080209E8: adds       r3, r4, #0                    
  0x080209EA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_52 (offset None)
  0x080209EE: adds       r4, #1                        
  0x080209F0: cmp        r4, #0xf                      
  0x080209F2: ble        #0x80209c8                    
  0x080209F4: movs       r4, #0                        
  0x080209F6: adds       r0, r4, #0                    
  0x080209F8: cmp        r4, #0                        
  0x080209FA: bge        #0x80209fe                    
  0x080209FC: adds       r0, r4, #7                    
  0x080209FE: asrs       r0, r0, #3                    
  0x08020A00: lsls       r1, r0, #2                    
  0x08020A02: add        r1, sb                        
  0x08020A04: lsls       r0, r0, #3                    
  0x08020A06: subs       r0, r4, r0                    
  0x08020A08: lsls       r0, r0, #2                    
  0x08020A0A: ldr        r2, [r1]                      
  0x08020A0C: lsrs       r2, r0                        
  0x08020A0E: movs       r0, #0xf                      
  0x08020A10: ands       r2, r0                        
  0x08020A12: adds       r0, r5, #0                    
  0x08020A14: movs       r1, #0x35                     
  0x08020A16: adds       r3, r4, #0                    
  0x08020A18: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_53 (offset None)
  0x08020A1C: adds       r4, #1                        
  0x08020A1E: cmp        r4, #0x1f                     
  0x08020A20: ble        #0x80209f6                    
  0x08020A22: movs       r4, #0                        
  0x08020A24: adds       r0, r5, #0                    
  0x08020A26: movs       r1, #0x50                     
  0x08020A28: movs       r2, #0x1e                     
  0x08020A2A: adds       r3, r4, #0                    
  0x08020A2C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_80 (offset 0x014C)
  0x08020A30: adds       r4, #1                        
  0x08020A32: cmp        r4, #9                        
  0x08020A34: ble        #0x8020a24                    
  0x08020A36: movs       r4, #0                        
  0x08020A38: adds       r0, r5, #0                    
  0x08020A3A: movs       r1, #0x5d                     
  0x08020A3C: movs       r2, #0x1e                     
  0x08020A3E: adds       r3, r4, #0                    
  0x08020A40: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_93 (offset 0x049C)
  0x08020A44: adds       r4, #1                        
  0x08020A46: cmp        r4, #5                        
  0x08020A48: ble        #0x8020a38                    
  0x08020A4A: adds       r0, r5, #0                    
  0x08020A4C: bl         #0x802ba64                    
  0x08020A50: bl         #0x80028d4                    
  0x08020A54: adds       r4, r0, #0                    
  0x08020A56: adds       r0, r5, #0                    
  0x08020A58: movs       r1, #0x2f                     
  0x08020A5A: adds       r2, r4, #0                    
  0x08020A5C: movs       r3, #0                        
  0x08020A5E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_47 (offset 0x00B4)
  0x08020A62: movs       r4, #0                        
  0x08020A64: adds       r0, r5, #0                    
  0x08020A66: movs       r1, #0x80                     
  0x08020A68: lsls       r1, r1, #1                    
  0x08020A6A: movs       r2, #0x14                     
  0x08020A6C: adds       r3, r4, #0                    
  0x08020A6E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_128 (offset 0x019F)
  0x08020A72: adds       r0, r5, #0                    
  0x08020A74: ldr        r1, [pc, #0x34]                 ; = 0x00000101 
  0x08020A76: movs       r2, #3                        
  0x08020A78: adds       r3, r4, #0                    
  0x08020A7A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08020A7E: adds       r4, #1                        
  0x08020A80: cmp        r4, #3                        
  0x08020A82: ble        #0x8020a64                    
  0x08020A84: movs       r4, #0                        
  0x08020A86: adds       r0, r5, #0                    
  0x08020A88: movs       r1, #0x81                     
  0x08020A8A: lsls       r1, r1, #1                    
  0x08020A8C: movs       r2, #0xa                      
  0x08020A8E: adds       r3, r4, #0                    
  0x08020A90: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_129 (offset 0x01A0)
  0x08020A94: adds       r4, #1                        
  0x08020A96: cmp        r4, #3                        
  0x08020A98: ble        #0x8020a86                    
  0x08020A9A: movs       r0, #0                        
  0x08020A9C: pop        {r3, r4}                      
  0x08020A9E: mov        r8, r3                        
  0x08020AA0: mov        sb, r4                        
  0x08020AA2: pop        {r4, r5, r6, r7}              
  0x08020AA4: pop        {r1}                          
  0x08020AA6: bx         r1                            