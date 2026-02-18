; Function at 0x0800D928
; 300 instructions traced

  0x0800D928: push       {r4, r5, r6, r7, lr}          
  0x0800D92A: mov        r7, sl                        
  0x0800D92C: mov        r6, sb                        
  0x0800D92E: mov        r5, r8                        
  0x0800D930: push       {r5, r6, r7}                  
  0x0800D932: sub        sp, #0x10                     
  0x0800D934: adds       r5, r0, #0                    
  0x0800D936: lsls       r1, r1, #0x18                 
  0x0800D938: lsrs       r6, r1, #0x18                 
  0x0800D93A: lsls       r2, r2, #0x18                 
  0x0800D93C: lsrs       r2, r2, #0x18                 
  0x0800D93E: mov        sl, r2                        
  0x0800D940: ldr        r7, [pc, #0x9c]                 ; = 0x08202C00 
  0x0800D942: movs       r1, #0x6b                     
  0x0800D944: movs       r2, #0                        
  0x0800D946: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D94A: lsls       r0, r0, #0x18                 
  0x0800D94C: lsrs       r0, r0, #0x18                 
  0x0800D94E: mov        sb, r0                        
  0x0800D950: movs       r0, #0                        
  0x0800D952: str        r0, [sp, #0xc]                
  0x0800D954: movs       r4, #0                        
  0x0800D956: adds       r0, r5, #0                    
  0x0800D958: movs       r1, #0x4b                     
  0x0800D95A: adds       r2, r4, #0                    
  0x0800D95C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D960: mov        r2, sp                        
  0x0800D962: adds       r1, r2, r4                    
  0x0800D964: strb       r0, [r1]                      
  0x0800D966: lsls       r0, r0, #0x18                 
  0x0800D968: lsrs       r0, r0, #0x18                 
  0x0800D96A: cmp        r0, r6                        
  0x0800D96C: bne        #0x800d972                    
  0x0800D96E: movs       r0, #1                        
  0x0800D970: str        r0, [sp, #0xc]                
  0x0800D972: adds       r4, #1                        
  0x0800D974: cmp        r4, #5                        
  0x0800D976: ble        #0x800d956                    
  0x0800D978: ldr        r1, [sp, #0xc]                
  0x0800D97A: cmp        r1, #0                        
  0x0800D97C: beq        #0x800d980                    
  0x0800D97E: b          #0x800dd04                    
  0x0800D980: ldrh       r0, [r7]                      
  0x0800D982: cmp        r0, r6                        
  0x0800D984: bhi        #0x800d988                    
  0x0800D986: b          #0x800dd04                    
  0x0800D988: adds       r0, r7, #2                    
  0x0800D98A: lsls       r1, r6, #1                    
  0x0800D98C: adds       r1, r1, r0                    
  0x0800D98E: ldrh       r0, [r1]                      
  0x0800D990: adds       r0, r7, r0                    
  0x0800D992: str        r0, [sp, #8]                  
  0x0800D994: mov        r2, sl                        
  0x0800D996: cmp        r2, #0                        
  0x0800D998: beq        #0x800d9a4                    
  0x0800D99A: ldrb       r0, [r0, #0xc]                
  0x0800D99C: ands       r0, r2                        
  0x0800D99E: cmp        r0, #0                        
  0x0800D9A0: bne        #0x800d9a4                    
  0x0800D9A2: b          #0x800dd04                    
  0x0800D9A4: ldr        r0, [sp, #8]                  
  0x0800D9A6: ldr        r1, [r0, #4]                  
  0x0800D9A8: cmp        r1, #0                        
  0x0800D9AA: beq        #0x800d9ba                    
  0x0800D9AC: movs       r0, #1                        
  0x0800D9AE: mov        r2, sb                        
  0x0800D9B0: lsls       r0, r2                        
  0x0800D9B2: ands       r1, r0                        
  0x0800D9B4: cmp        r1, #0                        
  0x0800D9B6: bne        #0x800d9ba                    
  0x0800D9B8: b          #0x800dd04                    
  0x0800D9BA: ldr        r1, [sp, #8]                  
  0x0800D9BC: ldr        r0, [r1]                      
  0x0800D9BE: cmp        r0, #5                        
  0x0800D9C0: bhi        #0x800d9e4                    
  0x0800D9C2: adds       r0, r5, #0                    
  0x0800D9C4: movs       r1, #0x65                     
  0x0800D9C6: movs       r2, #0                        
  0x0800D9C8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D9CC: adds       r7, r0, #0                    
  0x0800D9CE: ldr        r2, [sp, #8]                  
  0x0800D9D0: ldr        r1, [r2]                      
  0x0800D9D2: movs       r0, #1                        
  0x0800D9D4: lsls       r0, r1                        
  0x0800D9D6: ands       r0, r7                        
  0x0800D9D8: cmp        r0, #0                        
  0x0800D9DA: bne        #0x800d9de                    
  0x0800D9DC: b          #0x800dd04                    
  0x0800D9DE: b          #0x800da34                    
  0x0800D9E4: cmp        r0, #0x17                     
  0x0800D9E6: bhi        #0x800da34                    
  0x0800D9E8: subs       r0, #6                        
  0x0800D9EA: movs       r7, #1                        
  0x0800D9EC: lsls       r7, r0                        
  0x0800D9EE: movs       r4, #0                        
  0x0800D9F0: ldr        r0, [pc, #0x10]                 ; = 0x08208CB0 
  0x0800D9F2: mov        r8, r0                        
  0x0800D9F4: mov        r1, sb                        
  0x0800D9F6: lsls       r0, r1, #2                    
  0x0800D9F8: add        r0, sb                        
  0x0800D9FA: lsls       r0, r0, #2                    
  0x0800D9FC: mov        r2, r8                        
  0x0800D9FE: adds       r6, r0, r2                    
  0x0800DA00: b          #0x800da0c                    
  0x0800DA08: adds       r6, #2                        
  0x0800DA0A: adds       r4, #1                        
  0x0800DA0C: cmp        r4, #9                        
  0x0800DA0E: bgt        #0x800da2c                    
  0x0800DA10: mov        r0, sb                        
  0x0800DA12: adds       r1, r4, #0                    
  0x0800DA14: bl         #0x8002658                    
  0x0800DA18: cmp        r0, #1                        
  0x0800DA1A: bne        #0x800da08                    
  0x0800DA1C: ldrh       r0, [r6]                      
  0x0800DA1E: add        r0, r8                        
  0x0800DA20: ldr        r0, [r0, #0x28]               
  0x0800DA22: ands       r0, r7                        
  0x0800DA24: cmp        r0, #0                        
  0x0800DA26: beq        #0x800da08                    
  0x0800DA28: movs       r0, #1                        
  0x0800DA2A: str        r0, [sp, #0xc]                
  0x0800DA2C: ldr        r1, [sp, #0xc]                
  0x0800DA2E: cmp        r1, #0                        
  0x0800DA30: bne        #0x800da34                    
  0x0800DA32: b          #0x800dd04                    
  0x0800DA34: movs       r2, #1                        
  0x0800DA36: str        r2, [sp, #0xc]                
  0x0800DA38: mov        r0, sl                        
  0x0800DA3A: cmp        r0, #2                        
  0x0800DA3C: beq        #0x800da48                    
  0x0800DA3E: cmp        r0, #4                        
  0x0800DA40: beq        #0x800da48                    
  0x0800DA42: cmp        r0, #8                        
  0x0800DA44: beq        #0x800da48                    
  0x0800DA46: b          #0x800dcb6                    
  0x0800DA48: ldr        r1, [sp, #8]                  
  0x0800DA4A: ldrh       r0, [r1, #8]                  
  0x0800DA4C: subs       r0, #1                        
  0x0800DA4E: cmp        r0, #0x22                     
  0x0800DA50: bls        #0x800da54                    
  0x0800DA52: b          #0x800dcb6                    
  0x0800DA54: lsls       r0, r0, #2                    
  0x0800DA56: ldr        r1, [pc, #8]                  
  0x0800DA58: adds       r0, r0, r1                    
  0x0800DA5A: ldr        r0, [r0]                      
  0x0800DA5C: mov        pc, r0                        
  0x0800DA5E: movs       r0, r0                        
  0x0800DA60: bge        #0x800db2c                    
  0x0800DA62: lsrs       r0, r0, #0x20                 
  0x0800DA64: bge        #0x800da48                    
  0x0800DA66: lsrs       r0, r0, #0x20                 
  0x0800DA68: blt        #0x800da94                    
  0x0800DA6A: lsrs       r0, r0, #0x20                 
  0x0800DA6C: blt        #0x800dab4                    
  0x0800DA6E: lsrs       r0, r0, #0x20                 
  0x0800DA70: blt        #0x800db24                    
  0x0800DA72: lsrs       r0, r0, #0x20                 
  0x0800DA74: blt        #0x800d9a0                    
  0x0800DA76: lsrs       r0, r0, #0x20                 
  0x0800DA78: blt        #0x800d9c0                    
  0x0800DA7A: lsrs       r0, r0, #0x20                 
  0x0800DA7C: blt        #0x800d9d0                    
  0x0800DA7E: lsrs       r0, r0, #0x20                 
  0x0800DA80: blt        #0x800d9e0                    
  0x0800DA82: lsrs       r0, r0, #0x20                 
  0x0800DA84: blt        #0x800da00                    
  0x0800DA86: lsrs       r0, r0, #0x20                 
  0x0800DA88: bgt        #0x800d9f8                    
  0x0800DA8A: lsrs       r0, r0, #0x20                 
  0x0800DA8C: blt        #0x800da30                    
  0x0800DA8E: lsrs       r0, r0, #0x20                 
  0x0800DA90: blt        #0x800da40                    
  0x0800DA92: lsrs       r0, r0, #0x20                 
  0x0800DA94: blt        #0x800da50                    
  0x0800DA96: lsrs       r0, r0, #0x20                 
  0x0800DA98: blt        #0x800da60                    
  0x0800DA9A: lsrs       r0, r0, #0x20                 
  0x0800DA9C: blt        #0x800da70                    
  0x0800DA9E: lsrs       r0, r0, #0x20                 
  0x0800DAA0: blt        #0x800da80                    
  0x0800DAA2: lsrs       r0, r0, #0x20                 
  0x0800DAA4: blt        #0x800da90                    
  0x0800DAA6: lsrs       r0, r0, #0x20                 
  0x0800DAA8: blt        #0x800daa0                    
  0x0800DAAA: lsrs       r0, r0, #0x20                 
  0x0800DAAC: bgt        #0x800dab0                    
  0x0800DAAE: lsrs       r0, r0, #0x20                 
  0x0800DAB0: bgt        #0x800dac0                    
  0x0800DAB2: lsrs       r0, r0, #0x20                 
  0x0800DAB4: bgt        #0x800dad0                    
  0x0800DAB6: lsrs       r0, r0, #0x20                 
  0x0800DAB8: bgt        #0x800dae0                    
  0x0800DABA: lsrs       r0, r0, #0x20                 
  0x0800DABC: bgt        #0x800daf0                    
  0x0800DABE: lsrs       r0, r0, #0x20                 
  0x0800DAC0: bgt        #0x800db00                    
  0x0800DAC2: lsrs       r0, r0, #0x20                 
  0x0800DAC4: bgt        #0x800db10                    
  0x0800DAC6: lsrs       r0, r0, #0x20                 
  0x0800DAC8: bgt        #0x800db20                    
  0x0800DACA: lsrs       r0, r0, #0x20                 
  0x0800DACC: bgt        #0x800da3c                    
  0x0800DACE: lsrs       r0, r0, #0x20                 
  0x0800DAD0: bgt        #0x800db34                    
  0x0800DAD2: lsrs       r0, r0, #0x20                 
  0x0800DAD4: bgt        #0x800db44                    
  0x0800DAD6: lsrs       r0, r0, #0x20                 
  0x0800DAD8: bgt        #0x800db6c                    
  0x0800DADA: lsrs       r0, r0, #0x20                 
  0x0800DADC: bgt        #0x800db90                    
  0x0800DADE: lsrs       r0, r0, #0x20                 
  0x0800DAE0: bgt        #0x800d9ec                    
  0x0800DAE2: lsrs       r0, r0, #0x20                 
  0x0800DAE4: bgt        #0x800d9fc                    
  0x0800DAE6: lsrs       r0, r0, #0x20                 
  0x0800DAE8: bgt        #0x800da0c                    
  0x0800DAEA: lsrs       r0, r0, #0x20                 
  0x0800DAEC: bgt        #0x800da34                    
  0x0800DAEE: lsrs       r0, r0, #0x20                 
  0x0800DAF0: adds       r0, r5, #0                    
  0x0800DAF2: movs       r1, #0x38                     
  0x0800DAF4: movs       r2, #0                        
  0x0800DAF6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800DAFA: lsls       r0, r0, #0x10                 
  0x0800DAFC: lsrs       r4, r0, #0x10                 
  0x0800DAFE: adds       r0, r5, #0                    
  0x0800DB00: movs       r1, #0x39                     
  0x0800DB02: movs       r2, #0                        
  0x0800DB04: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800DB08: lsls       r0, r0, #0x10                 
  0x0800DB0A: lsrs       r0, r0, #0x10                 
  0x0800DB0C: cmp        r4, r0                        
  0x0800DB0E: bne        #0x800db12                    
  0x0800DB10: b          #0x800dcb6                    
  0x0800DB2C: lsls       r0, r0, #0x10                 
  0x0800DB2E: lsrs       r4, r0, #0x10                 
  0x0800DB30: adds       r0, r5, #0                    
  0x0800DB32: movs       r1, #0x16                     
  0x0800DB34: movs       r2, #0                        
  0x0800DB36: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800DB3A: lsls       r0, r0, #0x10                 
  0x0800DB3C: lsrs       r1, r0, #0x10                 
  0x0800DB3E: cmp        r1, #0                        
  0x0800DB40: bne        #0x800db44                    
  0x0800DB42: movs       r1, #1                        
  0x0800DB44: movs       r0, #0x64                     
  0x0800DB46: muls       r0, r4, r0                    
  0x0800DB48: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0800DB4C: lsls       r0, r0, #0x10                 
  0x0800DCB6: ldr        r2, [sp, #0xc]                
  0x0800DCB8: cmp        r2, #0                        
  0x0800DCBA: beq        #0x800dd04                    
  0x0800DCBC: movs       r2, #0                        
  0x0800DCBE: ldr        r1, [sp, #8]                  
  0x0800DCC0: adds       r1, #0xd                      
  0x0800DCC2: adds       r3, r1, r2                    
  0x0800DCC4: ldrb       r0, [r3]                      
  0x0800DCC6: adds       r6, r2, #1                    
  0x0800DCC8: cmp        r0, #0xff                     
  0x0800DCCA: beq        #0x800dcea                    
  0x0800DCCC: movs       r4, #0                        
  0x0800DCCE: adds       r5, r3, #0                    
  0x0800DCD0: movs       r7, #0xff                     
  0x0800DCD2: mov        r0, sp                        
  0x0800DCD4: adds       r3, r0, r4                    
  0x0800DCD6: ldrb       r2, [r3]                      
  0x0800DCD8: ldrb       r0, [r5]                      
  0x0800DCDA: cmp        r0, r2                        
  0x0800DCDC: bne        #0x800dce4                    
  0x0800DCDE: adds       r0, r2, #0                    
  0x0800DCE0: orrs       r0, r7                        
  0x0800DCE2: strb       r0, [r3]                      
  0x0800DCE4: adds       r4, #1                        
  0x0800DCE6: cmp        r4, #5                        
  0x0800DCE8: ble        #0x800dcd2                    
  0x0800DCEA: lsls       r0, r6, #0x18                 
  0x0800DCEC: lsrs       r2, r0, #0x18                 
  0x0800DCEE: cmp        r2, #6                        
  0x0800DCF0: bls        #0x800dcc2                    
  0x0800DCF2: movs       r4, #0                        
  0x0800DCF4: mov        r1, sp                        
  0x0800DCF6: adds       r0, r1, r4                    
  0x0800DCF8: ldrb       r0, [r0]                      
  0x0800DCFA: cmp        r0, #0xff                     
  0x0800DCFC: beq        #0x800dd0a                    
  0x0800DCFE: adds       r4, #1                        
  0x0800DD00: cmp        r4, #5                        
  0x0800DD02: ble        #0x800dcf4                    
  0x0800DD04: movs       r0, #1                        
  0x0800DD06: rsbs       r0, r0, #0                    
  0x0800DD08: b          #0x800dd0c                    
  0x0800DD0A: adds       r0, r4, #0                    
  0x0800DD0C: add        sp, #0x10                     
  0x0800DD0E: pop        {r3, r4, r5}                  
  0x0800DD10: mov        r8, r3                        
  0x0800DD12: mov        sb, r4                        
  0x0800DD14: mov        sl, r5                        
  0x0800DD16: pop        {r4, r5, r6, r7}              
  0x0800DD18: pop        {r1}                          
  0x0800DD1A: bx         r1                            