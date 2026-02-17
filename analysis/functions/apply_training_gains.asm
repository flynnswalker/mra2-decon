; Function at 0x08005A10
; 118 instructions traced

  0x08005A10: push       {r4, r5, r6, lr}              
  0x08005A12: adds       r5, r1, #0                    
  0x08005A14: adds       r6, r2, #0                    
  0x08005A16: ldr        r2, [pc, #0x118]                ; = 0x00000594 
  0x08005A18: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x08005A1C: adds       r0, r5, #0                    
  0x08005A1E: movs       r1, #0x63                     
  0x08005A20: bl         #0x80035f8                    
  0x08005A24: adds       r4, r0, #0                    
  0x08005A26: adds       r0, r6, #0                    
  0x08005A28: movs       r1, #0xc4                     
  0x08005A2A: bl         #0x80035f8                    
  0x08005A2E: adds       r1, r0, #0                    
  0x08005A30: adds       r0, r4, #0                    
  0x08005A32: bl         #0x80036d4                    
  0x08005A36: adds       r0, r6, #0                    
  0x08005A38: movs       r1, #0xc5                     
  0x08005A3A: movs       r2, #0                        
  0x08005A3C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[197]
  0x08005A40: adds       r2, r0, #0                    
  0x08005A42: adds       r0, r5, #0                    
  0x08005A44: movs       r1, #0x6b                     
  0x08005A46: movs       r3, #0                        
  0x08005A48: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_107 (offset 0x0104)
  0x08005A4C: adds       r0, r6, #0                    
  0x08005A4E: movs       r1, #0xc6                     
  0x08005A50: movs       r2, #0                        
  0x08005A52: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[198]
  0x08005A56: adds       r2, r0, #0                    
  0x08005A58: adds       r0, r5, #0                    
  0x08005A5A: movs       r1, #0x6c                     
  0x08005A5C: movs       r3, #0                        
  0x08005A5E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_108 (offset 0x0105)
  0x08005A62: adds       r0, r6, #0                    
  0x08005A64: movs       r1, #0xc7                     
  0x08005A66: movs       r2, #0                        
  0x08005A68: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[199]
  0x08005A6C: adds       r2, r0, #0                    
  0x08005A6E: adds       r0, r5, #0                    
  0x08005A70: movs       r1, #0                        
  0x08005A72: movs       r3, #0                        
  0x08005A74: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_pow (offset 0x0068)
  0x08005A78: adds       r0, r6, #0                    
  0x08005A7A: movs       r1, #0xc8                     
  0x08005A7C: movs       r2, #0                        
  0x08005A7E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[200]
  0x08005A82: adds       r2, r0, #0                    
  0x08005A84: adds       r0, r5, #0                    
  0x08005A86: movs       r1, #1                        
  0x08005A88: movs       r3, #0                        
  0x08005A8A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_int (offset 0x006A)
  0x08005A8E: adds       r0, r6, #0                    
  0x08005A90: movs       r1, #0xc9                     
  0x08005A92: movs       r2, #0                        
  0x08005A94: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[201]
  0x08005A98: adds       r2, r0, #0                    
  0x08005A9A: adds       r0, r5, #0                    
  0x08005A9C: movs       r1, #2                        
  0x08005A9E: movs       r3, #0                        
  0x08005AA0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_ski (offset 0x006C)
  0x08005AA4: adds       r0, r6, #0                    
  0x08005AA6: movs       r1, #0xca                     
  0x08005AA8: movs       r2, #0                        
  0x08005AAA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[202]
  0x08005AAE: adds       r2, r0, #0                    
  0x08005AB0: adds       r0, r5, #0                    
  0x08005AB2: movs       r1, #3                        
  0x08005AB4: movs       r3, #0                        
  0x08005AB6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_spd (offset 0x006E)
  0x08005ABA: adds       r0, r6, #0                    
  0x08005ABC: movs       r1, #0xcb                     
  0x08005ABE: movs       r2, #0                        
  0x08005AC0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[203]
  0x08005AC4: adds       r2, r0, #0                    
  0x08005AC6: adds       r0, r5, #0                    
  0x08005AC8: movs       r1, #4                        
  0x08005ACA: movs       r3, #0                        
  0x08005ACC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_def (offset 0x0070)
  0x08005AD0: adds       r0, r6, #0                    
  0x08005AD2: movs       r1, #0xcc                     
  0x08005AD4: movs       r2, #0                        
  0x08005AD6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[204]
  0x08005ADA: adds       r2, r0, #0                    
  0x08005ADC: adds       r0, r5, #0                    
  0x08005ADE: movs       r1, #5                        
  0x08005AE0: movs       r3, #0                        
  0x08005AE2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> stat_lif (offset 0x0072)
  0x08005AE6: ldr        r4, [pc, #0x4c]                 ; = 0x02000630 
  0x08005AE8: adds       r0, r6, #0                    
  0x08005AEA: movs       r1, #0xd6                     
  0x08005AEC: movs       r2, #0                        
  0x08005AEE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[214]
  0x08005AF2: adds       r2, r0, #0                    
  0x08005AF4: adds       r0, r4, #0                    
  0x08005AF6: movs       r1, #0xd6                     
  0x08005AF8: movs       r3, #0                        
  0x08005AFA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[214]
  0x08005AFE: movs       r4, #0                        
  0x08005B00: adds       r0, r5, #0                    
  0x08005B02: movs       r1, #0x4b                     
  0x08005B04: movs       r2, #0xff                     
  0x08005B06: adds       r3, r4, #0                    
  0x08005B08: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x08005B0C: adds       r0, r6, #0                    
  0x08005B0E: movs       r1, #0xe0                     
  0x08005B10: adds       r2, r4, #0                    
  0x08005B12: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[224]
  0x08005B16: adds       r2, r0, #0                    
  0x08005B18: adds       r0, r5, #0                    
  0x08005B1A: movs       r1, #0x4b                     
  0x08005B1C: adds       r3, r4, #0                    
  0x08005B1E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_75 (offset 0x00F8)
  0x08005B22: adds       r4, #1                        
  0x08005B24: cmp        r4, #5                        
  0x08005B26: ble        #0x8005b00                    
  0x08005B28: pop        {r4, r5, r6}                  
  0x08005B2A: pop        {r0}                          
  0x08005B2C: bx         r0                            