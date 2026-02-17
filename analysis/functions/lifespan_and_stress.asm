; Function at 0x0805FB5C
; 452 instructions traced

  0x0805FB5C: push       {r4, r5, r6, r7, lr}          
  0x0805FB5E: mov        r7, sl                        
  0x0805FB60: mov        r6, sb                        
  0x0805FB62: mov        r5, r8                        
  0x0805FB64: push       {r5, r6, r7}                  
  0x0805FB66: sub        sp, #0x88                     
  0x0805FB68: str        r0, [sp, #0x50]               
  0x0805FB6A: str        r1, [sp, #0x54]               
  0x0805FB6C: adds       r5, r3, #0                    
  0x0805FB6E: ldr        r0, [sp, #0xac]               
  0x0805FB70: lsls       r2, r2, #0x10                 
  0x0805FB72: lsrs       r2, r2, #0x10                 
  0x0805FB74: mov        sb, r2                        
  0x0805FB76: lsls       r0, r0, #0x18                 
  0x0805FB78: lsrs       r0, r0, #0x18                 
  0x0805FB7A: movs       r2, #0                        
  0x0805FB7C: mov        r1, sp                        
  0x0805FB7E: adds       r1, #0xe                      
  0x0805FB80: strh       r2, [r1]                      
  0x0805FB82: subs       r1, #2                        
  0x0805FB84: add        r3, sp, #4                    
  0x0805FB86: cmp        r1, r3                        
  0x0805FB88: bge        #0x805fb80                    
  0x0805FB8A: str        r0, [sp]                      
  0x0805FB8C: ldr        r0, [sp, #0x50]               
  0x0805FB8E: ldr        r1, [sp, #0x54]               
  0x0805FB90: mov        r2, sb                        
  0x0805FB92: bl         #0x80603d4                    
  0x0805FB96: str        r0, [sp, #0x58]               
  0x0805FB98: movs       r4, #0                        
  0x0805FB9A: cmp        r4, r0                        
  0x0805FB9C: blt        #0x805fba0                    
  0x0805FB9E: b          #0x805ff0c                    
  0x0805FBA0: lsls       r0, r4, #1                    
  0x0805FBA2: add        r0, sp, r0                    
  0x0805FBA4: adds       r0, #4                        
  0x0805FBA6: ldrh       r1, [r0]                      
  0x0805FBA8: adds       r0, r5, #0                    
  0x0805FBAA: bl         #0x8020774                    
  0x0805FBAE: ldr        r0, [sp, #0x50]               
  0x0805FBB0: movs       r1, #0x15                     
  0x0805FBB2: movs       r2, #0                        
  0x0805FBB4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_21 (offset 0x0090)
  0x0805FBB8: adds       r6, r5, #0                    
  0x0805FBBA: adds       r6, #0xf8                     
  0x0805FBBC: str        r6, [sp, #0x60]               
  0x0805FBBE: adds       r1, r5, #0                    
  0x0805FBC0: adds       r1, #0x84                     
  0x0805FBC2: str        r1, [sp, #0x84]               
  0x0805FBC4: ldr        r2, [sp, #0x50]               
  0x0805FBC6: adds       r2, #0x84                     
  0x0805FBC8: str        r2, [sp, #0x7c]               
  0x0805FBCA: ldr        r3, [sp, #0x54]               
  0x0805FBCC: adds       r3, #0x84                     
  0x0805FBCE: str        r3, [sp, #0x80]               
  0x0805FBD0: add        r6, sp, #0x10                 
  0x0805FBD2: subs       r1, #0x1c                     
  0x0805FBD4: str        r1, [sp, #0x64]               
  0x0805FBD6: adds       r2, r5, #0                    
  0x0805FBD8: adds       r2, #0x70                     
  0x0805FBDA: str        r2, [sp, #0x74]               
  0x0805FBDC: adds       r3, r5, #0                    
  0x0805FBDE: adds       r3, #0x6c                     
  0x0805FBE0: str        r3, [sp, #0x6c]               
  0x0805FBE2: adds       r1, #6                        
  0x0805FBE4: str        r1, [sp, #0x70]               
  0x0805FBE6: subs       r2, #6                        
  0x0805FBE8: str        r2, [sp, #0x68]               
  0x0805FBEA: adds       r3, #6                        
  0x0805FBEC: str        r3, [sp, #0x78]               
  0x0805FBEE: add        r1, sp, #0x28                 
  0x0805FBF0: mov        sl, r1                        
  0x0805FBF2: adds       r4, #1                        
  0x0805FBF4: str        r4, [sp, #0x5c]               
  0x0805FBF6: cmp        r0, #0x30                     
  0x0805FBF8: ble        #0x805fc54                    
  0x0805FBFA: ldr        r0, [sp, #0x54]               
  0x0805FBFC: movs       r1, #0x15                     
  0x0805FBFE: movs       r2, #0                        
  0x0805FC00: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_21 (offset 0x0090)
  0x0805FC04: cmp        r0, #0x30                     
  0x0805FC06: ble        #0x805fc54                    
  0x0805FC08: movs       r4, #4                        
  0x0805FC0A: ldr        r2, [sp, #0x50]               
  0x0805FC0C: adds       r2, #0xf8                     
  0x0805FC0E: mov        r8, r2                        
  0x0805FC10: ldr        r7, [sp, #0x54]               
  0x0805FC12: adds       r7, #0xf8                     
  0x0805FC14: ldr        r2, [sp, #0x60]               
  0x0805FC16: movs       r3, #0xff                     
  0x0805FC18: adds       r1, r2, r4                    
  0x0805FC1A: ldrb       r0, [r1]                      
  0x0805FC1C: orrs       r0, r3                        
  0x0805FC1E: strb       r0, [r1]                      
  0x0805FC20: adds       r4, #1                        
  0x0805FC22: cmp        r4, #5                        
  0x0805FC24: ble        #0x805fc18                    
  0x0805FC26: movs       r4, #0                        
  0x0805FC28: mov        r3, r8                        
  0x0805FC2A: adds       r1, r3, r4                    
  0x0805FC2C: ldrb       r0, [r1]                      
  0x0805FC2E: cmp        r0, #0xff                     
  0x0805FC30: beq        #0x805fc3c                    
  0x0805FC32: adds       r1, r0, #0                    
  0x0805FC34: adds       r0, r5, #0                    
  0x0805FC36: movs       r2, #1                        
  0x0805FC38: bl         #0x800d2b0                    
  0x0805FC3C: adds       r1, r7, r4                    
  0x0805FC3E: ldrb       r0, [r1]                      
  0x0805FC40: cmp        r0, #0xff                     
  0x0805FC42: beq        #0x805fc4e                    
  0x0805FC44: adds       r1, r0, #0                    
  0x0805FC46: adds       r0, r5, #0                    
  0x0805FC48: movs       r2, #1                        
  0x0805FC4A: bl         #0x800d2b0                    
  0x0805FC4E: adds       r4, #1                        
  0x0805FC50: cmp        r4, #5                        
  0x0805FC52: ble        #0x805fc28                    
  0x0805FC54: movs       r4, #3                        
  0x0805FC56: ldr        r7, [pc, #0x2c8]                ; = 0x08208CB0 
  0x0805FC58: ldr        r2, [sp, #0x60]               
  0x0805FC5A: movs       r3, #0xff                     
  0x0805FC5C: adds       r1, r2, r4                    
  0x0805FC5E: ldrb       r0, [r1]                      
  0x0805FC60: orrs       r0, r3                        
  0x0805FC62: strb       r0, [r1]                      
  0x0805FC64: adds       r4, #1                        
  0x0805FC66: cmp        r4, #5                        
  0x0805FC68: ble        #0x805fc5c                    
  0x0805FC6A: ldr        r4, [sp, #0x7c]               
  0x0805FC6C: ldr        r0, [r4]                      
  0x0805FC6E: movs       r2, #7                        
  0x0805FC70: ands       r0, r2                        
  0x0805FC72: ldr        r3, [sp, #0x84]               
  0x0805FC74: ldr        r1, [r3]                      
  0x0805FC76: orrs       r1, r0                        
  0x0805FC78: ldr        r4, [sp, #0x80]               
  0x0805FC7A: ldr        r0, [r4]                      
  0x0805FC7C: ands       r0, r2                        
  0x0805FC7E: orrs       r1, r0                        
  0x0805FC80: str        r1, [r3]                      
  0x0805FC82: adds       r0, r5, #0                    
  0x0805FC84: adds       r1, r7, #0                    
  0x0805FC86: bl         #0x8029e54                    
  0x0805FC8A: ldr        r0, [sp, #0x50]               
  0x0805FC8C: ldr        r1, [sp, #0x54]               
  0x0805FC8E: bl         #0x805ff28                    
  0x0805FC92: mov        r8, r0                        
  0x0805FC94: adds       r1, r6, #0                    
  0x0805FC96: movs       r2, #0                        
  0x0805FC98: adds       r0, r6, #0                    
  0x0805FC9A: adds       r0, #0x14                     
  0x0805FC9C: str        r2, [r0]                      
  0x0805FC9E: subs       r0, #4                        
  0x0805FCA0: cmp        r0, r1                        
  0x0805FCA2: bge        #0x805fc9c                    
  0x0805FCA4: mov        r0, sb                        
  0x0805FCA6: cmp        r0, #0x14                     
  0x0805FCA8: beq        #0x805fcae                    
  0x0805FCAA: cmp        r0, #0x20                     
  0x0805FCAC: bne        #0x805fcb2                    
  0x0805FCAE: movs       r1, #0xa                      
  0x0805FCB0: str        r1, [sp, #0x10]               
  0x0805FCB2: mov        r2, sb                        
  0x0805FCB4: cmp        r2, #0x18                     
  0x0805FCB6: beq        #0x805fcbc                    
  0x0805FCB8: cmp        r2, #0x20                     
  0x0805FCBA: bne        #0x805fcc0                    
  0x0805FCBC: movs       r3, #0xa                      
  0x0805FCBE: str        r3, [r6, #4]                  
  0x0805FCC0: mov        r4, sb                        
  0x0805FCC2: cmp        r4, #0x16                     
  0x0805FCC4: beq        #0x805fcca                    
  0x0805FCC6: cmp        r4, #0x21                     
  0x0805FCC8: bne        #0x805fcce                    
  0x0805FCCA: movs       r0, #0xa                      
  0x0805FCCC: str        r0, [r6, #8]                  
  0x0805FCCE: mov        r1, sb                        
  0x0805FCD0: cmp        r1, #0x17                     
  0x0805FCD2: beq        #0x805fcd8                    
  0x0805FCD4: cmp        r1, #0x21                     
  0x0805FCD6: bne        #0x805fcdc                    
  0x0805FCD8: movs       r2, #0xa                      
  0x0805FCDA: str        r2, [r6, #0xc]                
  0x0805FCDC: mov        r3, sb                        
  0x0805FCDE: cmp        r3, #0x15                     
  0x0805FCE0: beq        #0x805fce6                    
  0x0805FCE2: cmp        r3, #0x1f                     
  0x0805FCE4: bne        #0x805fcea                    
  0x0805FCE6: movs       r4, #0xa                      
  0x0805FCE8: str        r4, [r6, #0x10]               
  0x0805FCEA: mov        r0, sb                        
  0x0805FCEC: cmp        r0, #0x19                     
  0x0805FCEE: beq        #0x805fcf4                    
  0x0805FCF0: cmp        r0, #0x1f                     
  0x0805FCF2: bne        #0x805fcf8                    
  0x0805FCF4: movs       r1, #0xa                      
  0x0805FCF6: str        r1, [r6, #0x14]               
  0x0805FCF8: ldr        r2, [sp, #0x64]               
  0x0805FCFA: ldrh       r4, [r2]                      
  0x0805FCFC: lsls       r0, r4, #8                    
  0x0805FCFE: movs       r1, #0x64                     
  0x0805FD00: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FD04: adds       r7, r6, #0                    
  0x0805FD06: ldr        r1, [sp, #0x10]               
  0x0805FD08: add        r1, r8                        
  0x0805FD0A: muls       r0, r1, r0                    
  0x0805FD0C: asrs       r0, r0, #8                    
  0x0805FD0E: adds       r4, r4, r0                    
  0x0805FD10: ldr        r3, [sp, #0x64]               
  0x0805FD12: strh       r4, [r3]                      
  0x0805FD14: lsls       r4, r4, #0x10                 
  0x0805FD16: lsrs       r4, r4, #0x10                 
  0x0805FD18: cmp        r4, #0xff                     
  0x0805FD1A: bls        #0x805fd20                    
  0x0805FD1C: movs       r4, #0xff                     
  0x0805FD1E: strh       r4, [r3]                      
  0x0805FD20: ldr        r0, [sp, #0x74]               
  0x0805FD22: ldrh       r4, [r0]                      
  0x0805FD24: lsls       r0, r4, #8                    
  0x0805FD26: movs       r1, #0x64                     
  0x0805FD28: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FD2C: ldr        r1, [r7, #4]                  
  0x0805FD2E: add        r1, r8                        
  0x0805FD30: muls       r0, r1, r0                    
  0x0805FD32: asrs       r0, r0, #8                    
  0x0805FD34: adds       r4, r4, r0                    
  0x0805FD36: ldr        r1, [sp, #0x74]               
  0x0805FD38: strh       r4, [r1]                      
  0x0805FD3A: lsls       r4, r4, #0x10                 
  0x0805FD3C: lsrs       r4, r4, #0x10                 
  0x0805FD3E: cmp        r4, #0xff                     
  0x0805FD40: bls        #0x805fd46                    
  0x0805FD42: movs       r2, #0xff                     
  0x0805FD44: strh       r2, [r1]                      
  0x0805FD46: ldr        r3, [sp, #0x6c]               
  0x0805FD48: ldrh       r4, [r3]                      
  0x0805FD4A: lsls       r0, r4, #8                    
  0x0805FD4C: movs       r1, #0x64                     
  0x0805FD4E: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FD52: ldr        r1, [r7, #8]                  
  0x0805FD54: add        r1, r8                        
  0x0805FD56: muls       r0, r1, r0                    
  0x0805FD58: asrs       r0, r0, #8                    
  0x0805FD5A: adds       r4, r4, r0                    
  0x0805FD5C: ldr        r0, [sp, #0x6c]               
  0x0805FD5E: strh       r4, [r0]                      
  0x0805FD60: lsls       r4, r4, #0x10                 
  0x0805FD62: lsrs       r4, r4, #0x10                 
  0x0805FD64: cmp        r4, #0xff                     
  0x0805FD66: bls        #0x805fd6c                    
  0x0805FD68: movs       r1, #0xff                     
  0x0805FD6A: strh       r1, [r0]                      
  0x0805FD6C: ldr        r2, [sp, #0x70]               
  0x0805FD6E: ldrh       r4, [r2]                      
  0x0805FD70: lsls       r0, r4, #8                    
  0x0805FD72: movs       r1, #0x64                     
  0x0805FD74: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FD78: ldr        r1, [r7, #0xc]                
  0x0805FD7A: add        r1, r8                        
  0x0805FD7C: muls       r0, r1, r0                    
  0x0805FD7E: asrs       r0, r0, #8                    
  0x0805FD80: adds       r4, r4, r0                    
  0x0805FD82: ldr        r3, [sp, #0x70]               
  0x0805FD84: strh       r4, [r3]                      
  0x0805FD86: lsls       r4, r4, #0x10                 
  0x0805FD88: lsrs       r4, r4, #0x10                 
  0x0805FD8A: cmp        r4, #0xff                     
  0x0805FD8C: bls        #0x805fd92                    
  0x0805FD8E: movs       r4, #0xff                     
  0x0805FD90: strh       r4, [r3]                      
  0x0805FD92: ldr        r0, [sp, #0x68]               
  0x0805FD94: ldrh       r4, [r0]                      
  0x0805FD96: lsls       r0, r4, #8                    
  0x0805FD98: movs       r1, #0x64                     
  0x0805FD9A: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FD9E: ldr        r1, [r7, #0x10]               
  0x0805FDA0: add        r1, r8                        
  0x0805FDA2: muls       r0, r1, r0                    
  0x0805FDA4: asrs       r0, r0, #8                    
  0x0805FDA6: adds       r4, r4, r0                    
  0x0805FDA8: ldr        r1, [sp, #0x68]               
  0x0805FDAA: strh       r4, [r1]                      
  0x0805FDAC: lsls       r4, r4, #0x10                 
  0x0805FDAE: lsrs       r4, r4, #0x10                 
  0x0805FDB0: cmp        r4, #0xff                     
  0x0805FDB2: bls        #0x805fdb8                    
  0x0805FDB4: movs       r2, #0xff                     
  0x0805FDB6: strh       r2, [r1]                      
  0x0805FDB8: ldr        r3, [sp, #0x78]               
  0x0805FDBA: ldrh       r4, [r3]                      
  0x0805FDBC: lsls       r0, r4, #8                    
  0x0805FDBE: movs       r1, #0x64                     
  0x0805FDC0: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FDC4: ldr        r1, [r6, #0x14]               
  0x0805FDC6: add        r1, r8                        
  0x0805FDC8: muls       r0, r1, r0                    
  0x0805FDCA: asrs       r0, r0, #8                    
  0x0805FDCC: adds       r4, r4, r0                    
  0x0805FDCE: ldr        r6, [sp, #0x78]               
  0x0805FDD0: strh       r4, [r6]                      
  0x0805FDD2: lsls       r4, r4, #0x10                 
  0x0805FDD4: lsrs       r4, r4, #0x10                 
  0x0805FDD6: cmp        r4, #0xff                     
  0x0805FDD8: bls        #0x805fdde                    
  0x0805FDDA: movs       r0, #0xff                     
  0x0805FDDC: strh       r0, [r6]                      
  0x0805FDDE: adds       r0, r5, #0                    
  0x0805FDE0: mov        r1, sb                        
  0x0805FDE2: bl         #0x8060694                    
  0x0805FDE6: ldr        r0, [sp, #0x50]               
  0x0805FDE8: ldr        r1, [sp, #0x54]               
  0x0805FDEA: adds       r2, r5, #0                    
  0x0805FDEC: bl         #0x80021b0                    
  0x0805FDF0: adds       r2, r0, #0                    
  0x0805FDF2: lsls       r2, r2, #0x18                 
  0x0805FDF4: lsrs       r2, r2, #0x18                 
  0x0805FDF6: adds       r0, r5, #0                    
  0x0805FDF8: movs       r1, #0xc                      
  0x0805FDFA: movs       r3, #0                        
  0x0805FDFC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_12 (offset 0x007A)
  0x0805FE00: ldr        r0, [sp, #0x50]               
  0x0805FE02: movs       r1, #0x1e                     
  0x0805FE04: movs       r2, #0                        
  0x0805FE06: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_30 (offset 0x00A3)
  0x0805FE0A: adds       r4, r0, #0                    
  0x0805FE0C: ldr        r0, [sp, #0x54]               
  0x0805FE0E: movs       r1, #0x1e                     
  0x0805FE10: movs       r2, #0                        
  0x0805FE12: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_30 (offset 0x00A3)
  0x0805FE16: adds       r4, r4, r0                    
  0x0805FE18: adds       r0, r4, #0                    
  0x0805FE1A: movs       r1, #5                        
  0x0805FE1C: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0805FE20: adds       r2, r0, #0                    
  0x0805FE22: adds       r0, r5, #0                    
  0x0805FE24: movs       r1, #0x1e                     
  0x0805FE26: movs       r3, #0                        
  0x0805FE28: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_30 (offset 0x00A3)
  0x0805FE2C: adds       r0, r5, #0                    
  0x0805FE2E: movs       r1, #0x30                     
  0x0805FE30: movs       r2, #2                        
  0x0805FE32: movs       r3, #0                        
  0x0805FE34: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field_48 (offset 0x00B8)
  0x0805FE38: adds       r0, r5, #0                    
  0x0805FE3A: movs       r1, #0x6e                     
  0x0805FE3C: movs       r2, #0                        
  0x0805FE3E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_110 (offset None)
  0x0805FE42: adds       r4, r0, #0                    
  0x0805FE44: ldr        r0, [sp, #0x50]               
  0x0805FE46: mov        r1, sl                        
  0x0805FE48: bl         #0x8060718                    
  0x0805FE4C: adds       r1, r4, #0                    
  0x0805FE4E: adds       r1, #0xa4                     
  0x0805FE50: mov        r0, sl                        
  0x0805FE52: ldm        r0!, {r2, r3, r6}             
  0x0805FE54: stm        r1!, {r2, r3, r6}             
  0x0805FE56: ldm        r0!, {r2, r3, r6}             
  0x0805FE58: stm        r1!, {r2, r3, r6}             
  0x0805FE5A: ldm        r0!, {r2, r3, r6}             
  0x0805FE5C: stm        r1!, {r2, r3, r6}             
  0x0805FE5E: ldr        r0, [r0]                      
  0x0805FE60: str        r0, [r1]                      
  0x0805FE62: ldr        r0, [sp, #0x54]               
  0x0805FE64: mov        r1, sl                        
  0x0805FE66: bl         #0x8060718                    
  0x0805FE6A: adds       r1, r4, #0                    
  0x0805FE6C: adds       r1, #0xcc                     
  0x0805FE6E: mov        r0, sl                        
  0x0805FE70: ldm        r0!, {r2, r3, r6}             
  0x0805FE72: stm        r1!, {r2, r3, r6}             
  0x0805FE74: ldm        r0!, {r2, r3, r6}             
  0x0805FE76: stm        r1!, {r2, r3, r6}             
  0x0805FE78: ldm        r0!, {r2, r3, r6}             
  0x0805FE7A: stm        r1!, {r2, r3, r6}             
  0x0805FE7C: ldr        r0, [r0]                      
  0x0805FE7E: str        r0, [r1]                      
  0x0805FE80: ldr        r0, [sp, #0x50]               
  0x0805FE82: movs       r1, #0x6e                     
  0x0805FE84: movs       r2, #0                        
  0x0805FE86: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_110 (offset None)
  0x0805FE8A: adds       r1, r4, #4                    
  0x0805FE8C: adds       r0, #0xa4                     
  0x0805FE8E: ldm        r0!, {r2, r3, r6}             
  0x0805FE90: stm        r1!, {r2, r3, r6}             
  0x0805FE92: ldm        r0!, {r2, r3, r6}             
  0x0805FE94: stm        r1!, {r2, r3, r6}             
  0x0805FE96: ldm        r0!, {r2, r3, r6}             
  0x0805FE98: stm        r1!, {r2, r3, r6}             
  0x0805FE9A: ldr        r0, [r0]                      
  0x0805FE9C: str        r0, [r1]                      
  0x0805FE9E: ldr        r0, [sp, #0x50]               
  0x0805FEA0: movs       r1, #0x6e                     
  0x0805FEA2: movs       r2, #0                        
  0x0805FEA4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_110 (offset None)
  0x0805FEA8: adds       r1, r4, #0                    
  0x0805FEAA: adds       r1, #0x2c                     
  0x0805FEAC: adds       r0, #0xcc                     
  0x0805FEAE: ldm        r0!, {r2, r3, r6}             
  0x0805FEB0: stm        r1!, {r2, r3, r6}             
  0x0805FEB2: ldm        r0!, {r2, r3, r6}             
  0x0805FEB4: stm        r1!, {r2, r3, r6}             
  0x0805FEB6: ldm        r0!, {r2, r3, r6}             
  0x0805FEB8: stm        r1!, {r2, r3, r6}             
  0x0805FEBA: ldr        r0, [r0]                      
  0x0805FEBC: str        r0, [r1]                      
  0x0805FEBE: ldr        r0, [sp, #0x54]               
  0x0805FEC0: movs       r1, #0x6e                     
  0x0805FEC2: movs       r2, #0                        
  0x0805FEC4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_110 (offset None)
  0x0805FEC8: adds       r1, r4, #0                    
  0x0805FECA: adds       r1, #0x54                     
  0x0805FECC: adds       r0, #0xa4                     
  0x0805FECE: ldm        r0!, {r2, r3, r6}             
  0x0805FED0: stm        r1!, {r2, r3, r6}             
  0x0805FED2: ldm        r0!, {r2, r3, r6}             
  0x0805FED4: stm        r1!, {r2, r3, r6}             
  0x0805FED6: ldm        r0!, {r2, r3, r6}             
  0x0805FED8: stm        r1!, {r2, r3, r6}             
  0x0805FEDA: ldr        r0, [r0]                      
  0x0805FEDC: str        r0, [r1]                      
  0x0805FEDE: ldr        r0, [sp, #0x54]               
  0x0805FEE0: movs       r1, #0x6e                     
  0x0805FEE2: movs       r2, #0                        
  0x0805FEE4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_110 (offset None)
  0x0805FEE8: adds       r1, r4, #0                    
  0x0805FEEA: adds       r1, #0x7c                     
  0x0805FEEC: adds       r0, #0xcc                     
  0x0805FEEE: ldm        r0!, {r2, r3, r4}             
  0x0805FEF0: stm        r1!, {r2, r3, r4}             
  0x0805FEF2: ldm        r0!, {r2, r3, r6}             
  0x0805FEF4: stm        r1!, {r2, r3, r6}             
  0x0805FEF6: ldm        r0!, {r2, r4, r6}             
  0x0805FEF8: stm        r1!, {r2, r4, r6}             
  0x0805FEFA: ldr        r0, [r0]                      
  0x0805FEFC: str        r0, [r1]                      
  0x0805FEFE: ldr        r4, [sp, #0x5c]               
  0x0805FF00: ldr        r3, [pc, #0x20]                 ; = 0x00000594 
  0x0805FF02: adds       r5, r5, r3                    
  0x0805FF04: ldr        r6, [sp, #0x58]               
  0x0805FF06: cmp        r4, r6                        
  0x0805FF08: bge        #0x805ff0c                    
  0x0805FF0A: b          #0x805fba0                    
  0x0805FF0C: ldr        r0, [sp, #0x58]               
  0x0805FF0E: add        sp, #0x88                     
  0x0805FF10: pop        {r3, r4, r5}                  
  0x0805FF12: mov        r8, r3                        
  0x0805FF14: mov        sb, r4                        
  0x0805FF16: mov        sl, r5                        
  0x0805FF18: pop        {r4, r5, r6, r7}              
  0x0805FF1A: pop        {r1}                          
  0x0805FF1C: bx         r1                            