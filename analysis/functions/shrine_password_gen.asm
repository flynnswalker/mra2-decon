; Function at 0x08000B4C
; 177 instructions traced

  0x08000B4C: push       {r4, r5, r6, r7, lr}          
  0x08000B4E: mov        r7, r8                        
  0x08000B50: push       {r7}                          
  0x08000B52: sub        sp, #4                        
  0x08000B54: adds       r7, r0, #0                    
  0x08000B56: ldr        r0, [pc, #0xf8]                 ; = 0x02002B24 WRAM_PLAYER_STATE
  0x08000B58: mov        r8, r0                        
  0x08000B5A: movs       r1, #0x8b                     
  0x08000B5C: movs       r2, #0xa                      
  0x08000B5E: movs       r3, #0                        
  0x08000B60: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000B64: mov        r0, r8                        
  0x08000B66: movs       r1, #0x8c                     
  0x08000B68: movs       r2, #0xa                      
  0x08000B6A: movs       r3, #0                        
  0x08000B6C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000B70: movs       r5, #0                        
  0x08000B72: adds       r0, r5, #0                    
  0x08000B74: adds       r1, r5, #0                    
  0x08000B76: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08000B7A: lsls       r0, r0, #0x10                 
  0x08000B7C: lsrs       r0, r0, #0x10                 
  0x08000B7E: bl         #0x8002b88                      ; -> resolve_ptr_16(index)
  0x08000B82: adds       r2, r0, #0                    
  0x08000B84: str        r5, [sp]                      
  0x08000B86: adds       r0, r7, #0                    
  0x08000B88: movs       r1, #0x4d                     
  0x08000B8A: movs       r3, #0xa                      
  0x08000B8C: bl         #0x800363c                    
  0x08000B90: adds       r0, r5, #0                    
  0x08000B92: adds       r1, r5, #0                    
  0x08000B94: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08000B98: lsls       r0, r0, #0x10                 
  0x08000B9A: lsrs       r0, r0, #0x10                 
  0x08000B9C: bl         #0x8002b88                      ; -> resolve_ptr_16(index)
  0x08000BA0: adds       r2, r0, #0                    
  0x08000BA2: str        r5, [sp]                      
  0x08000BA4: adds       r0, r7, #0                    
  0x08000BA6: movs       r1, #0x4e                     
  0x08000BA8: movs       r3, #0xa                      
  0x08000BAA: bl         #0x800363c                    
  0x08000BAE: adds       r0, r7, #0                    
  0x08000BB0: movs       r1, #0x50                     
  0x08000BB2: adds       r2, r5, #0                    
  0x08000BB4: adds       r3, r5, #0                    
  0x08000BB6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000BBA: adds       r0, r7, #0                    
  0x08000BBC: movs       r1, #0x51                     
  0x08000BBE: adds       r2, r5, #0                    
  0x08000BC0: adds       r3, r5, #0                    
  0x08000BC2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000BC6: mov        r0, r8                        
  0x08000BC8: movs       r1, #0xac                     
  0x08000BCA: movs       r2, #0                        
  0x08000BCC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000BD0: adds       r2, r0, #0                    
  0x08000BD2: adds       r0, r7, #0                    
  0x08000BD4: movs       r1, #0x52                     
  0x08000BD6: adds       r3, r5, #0                    
  0x08000BD8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000BDC: adds       r0, r7, #0                    
  0x08000BDE: movs       r1, #0x53                     
  0x08000BE0: movs       r2, #0                        
  0x08000BE2: adds       r3, r5, #0                    
  0x08000BE4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000BE8: bl         #0x806354c                      ; -> prng()
  0x08000BEC: lsls       r0, r0, #0x10                 
  0x08000BEE: lsrs       r0, r0, #0x10                 
  0x08000BF0: movs       r1, #1                        
  0x08000BF2: ands       r0, r1                        
  0x08000BF4: adds       r2, r0, #3                    
  0x08000BF6: adds       r0, r7, #0                    
  0x08000BF8: movs       r1, #0x54                     
  0x08000BFA: adds       r3, r5, #0                    
  0x08000BFC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000C00: bl         #0x806354c                      ; -> prng()
  0x08000C04: lsls       r0, r0, #0x10                 
  0x08000C06: lsrs       r0, r0, #0x10                 
  0x08000C08: movs       r1, #0xf                      
  0x08000C0A: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x08000C0E: lsls       r0, r0, #0x10                 
  0x08000C10: lsrs       r2, r0, #0x10                 
  0x08000C12: adds       r0, r7, #0                    
  0x08000C14: movs       r1, #0x55                     
  0x08000C16: adds       r3, r5, #0                    
  0x08000C18: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000C1C: adds       r0, r5, #0                    
  0x08000C1E: adds       r1, r5, #0                    
  0x08000C20: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08000C24: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x08000C28: adds       r4, r0, #0                    
  0x08000C2A: ldrb       r0, [r4, #2]                  
  0x08000C2C: ldrb       r1, [r4, #3]                  
  0x08000C2E: adds       r0, r0, r1                    
  0x08000C30: asrs       r6, r0, #1                    
  0x08000C32: ldrb       r0, [r4, #5]                  
  0x08000C34: ldrb       r1, [r4, #6]                  
  0x08000C36: adds       r0, r0, r1                    
  0x08000C38: asrs       r3, r0, #1                    
  0x08000C3A: ldrb       r0, [r4, #4]                  
  0x08000C3C: ldrb       r1, [r4, #7]                  
  0x08000C3E: adds       r0, r0, r1                    
  0x08000C40: asrs       r0, r0, #1                    
  0x08000C42: cmp        r6, r3                        
  0x08000C44: ble        #0x8000c54                    
  0x08000C46: movs       r2, #2                        
  0x08000C48: cmp        r6, r0                        
  0x08000C4A: ble        #0x8000c5c                    
  0x08000C4C: movs       r2, #0                        
  0x08000C4E: b          #0x8000c5c                    
  0x08000C54: movs       r2, #2                        
  0x08000C56: cmp        r3, r0                        
  0x08000C58: ble        #0x8000c5c                    
  0x08000C5A: movs       r2, #1                        
  0x08000C5C: adds       r0, r7, #0                    
  0x08000C5E: movs       r1, #0x56                     
  0x08000C60: adds       r3, r5, #0                    
  0x08000C62: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000C66: ldrb       r1, [r4, #2]                  
  0x08000C68: ldrb       r0, [r4, #3]                  
  0x08000C6A: cmp        r1, r0                        
  0x08000C6C: bne        #0x8000c78                    
  0x08000C6E: bl         #0x806354c                      ; -> prng()
  0x08000C72: movs       r2, #1                        
  0x08000C74: ands       r2, r0                        
  0x08000C76: b          #0x8000c80                    
  0x08000C78: movs       r2, #1                        
  0x08000C7A: cmp        r1, r0                        
  0x08000C7C: bls        #0x8000c80                    
  0x08000C7E: movs       r2, #0                        
  0x08000C80: adds       r0, r7, #0                    
  0x08000C82: movs       r1, #0x57                     
  0x08000C84: adds       r3, r5, #0                    
  0x08000C86: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000C8A: ldrb       r2, [r4, #4]                  
  0x08000C8C: adds       r0, r7, #0                    
  0x08000C8E: movs       r1, #0x58                     
  0x08000C90: adds       r3, r5, #0                    
  0x08000C92: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000C96: ldrb       r0, [r4, #2]                  
  0x08000C98: ldrb       r1, [r4, #3]                  
  0x08000C9A: adds       r0, r0, r1                    
  0x08000C9C: ldrb       r1, [r4, #4]                  
  0x08000C9E: adds       r0, r0, r1                    
  0x08000CA0: ldrb       r1, [r4, #5]                  
  0x08000CA2: adds       r0, r0, r1                    
  0x08000CA4: ldrb       r1, [r4, #6]                  
  0x08000CA6: adds       r0, r0, r1                    
  0x08000CA8: ldrb       r1, [r4, #7]                  
  0x08000CAA: adds       r2, r0, r1                    
  0x08000CAC: adds       r0, r7, #0                    
  0x08000CAE: movs       r1, #0x59                     
  0x08000CB0: adds       r3, r5, #0                    
  0x08000CB2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000CB6: bl         #0x806354c                      ; -> prng()
  0x08000CBA: lsls       r0, r0, #0x10                 
  0x08000CBC: lsrs       r2, r0, #0x10                 
  0x08000CBE: adds       r0, r7, #0                    
  0x08000CC0: movs       r1, #0x4f                     
  0x08000CC2: adds       r3, r5, #0                    
  0x08000CC4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000CC8: adds       r3, r5, #0                    
  0x08000CCA: adds       r3, #0xa                      
  0x08000CCC: adds       r0, r7, #0                    
  0x08000CCE: movs       r1, #0x11                     
  0x08000CD0: movs       r2, #1                        
  0x08000CD2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000CD6: adds       r5, #1                        
  0x08000CD8: cmp        r5, #8                        
  0x08000CDA: bgt        #0x8000cde                    
  0x08000CDC: b          #0x8000b72                    
  0x08000CDE: add        sp, #4                        
  0x08000CE0: pop        {r3}                          
  0x08000CE2: mov        r8, r3                        
  0x08000CE4: pop        {r4, r5, r6, r7}              
  0x08000CE6: pop        {r0}                          
  0x08000CE8: bx         r0                            