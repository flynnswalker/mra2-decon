; Function at 0x0801FDC0
; 226 instructions traced

  0x0801FDC0: adds       r0, r0, r4                    
  0x0801FDC2: lsls       r0, r0, #1                    
  0x0801FDC4: movs       r2, #0xfa                     
  0x0801FDC6: lsls       r2, r2, #1                    
  0x0801FDC8: adds       r0, r0, r2                    
  0x0801FDCA: adds       r4, r1, r0                    
  0x0801FDCC: adds       r0, r5, #0                    
  0x0801FDCE: movs       r1, #0x33                     
  0x0801FDD0: bl         #0x800d3a8                    
  0x0801FDD4: movs       r1, #1                        
  0x0801FDD6: rsbs       r1, r1, #0                    
  0x0801FDD8: cmp        r0, r1                        
  0x0801FDDA: beq        #0x801fde8                    
  0x0801FDDC: movs       r0, #0x96                     
  0x0801FDDE: muls       r0, r4, r0                    
  0x0801FDE0: movs       r1, #0x64                     
  0x0801FDE2: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0801FDE6: adds       r4, r0, #0                    
  0x0801FDE8: rsbs       r2, r4, #0                    
  0x0801FDEA: adds       r0, r5, #0                    
  0x0801FDEC: movs       r1, #0x1b                     
  0x0801FDEE: movs       r3, #0                        
  0x0801FDF0: bl         #0x8003944                    
  0x0801FDF4: movs       r7, #0                        
  0x0801FDF6: adds       r0, r5, #0                    
  0x0801FDF8: movs       r1, #0x18                     
  0x0801FDFA: movs       r2, #0                        
  0x0801FDFC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FE00: cmp        r0, #4                        
  0x0801FE02: beq        #0x801fe26                    
  0x0801FE04: adds       r0, r5, #0                    
  0x0801FE06: movs       r1, #0x18                     
  0x0801FE08: movs       r2, #0                        
  0x0801FE0A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FE0E: cmp        r0, #6                        
  0x0801FE10: beq        #0x801fe26                    
  0x0801FE12: movs       r0, #6                        
  0x0801FE14: bl         #0x8002538                    
  0x0801FE18: adds       r1, r0, #0                    
  0x0801FE1A: cmp        r1, #0                        
  0x0801FE1C: blt        #0x801fe26                    
  0x0801FE1E: lsls       r0, r1, #2                    
  0x0801FE20: adds       r0, r0, r1                    
  0x0801FE22: lsls       r0, r0, #1                    
  0x0801FE24: adds       r7, r0, #5                    
  0x0801FE26: lsrs       r0, r6, #0x1f                 
  0x0801FE28: adds       r0, r6, r0                    
  0x0801FE2A: asrs       r6, r0, #1                    
  0x0801FE2C: adds       r4, r6, #0                    
  0x0801FE2E: subs       r4, #0xa                      
  0x0801FE30: cmp        r4, #0                        
  0x0801FE32: ble        #0x801fe48                    
  0x0801FE34: bl         #0x8063588                    
  0x0801FE38: lsls       r0, r0, #0x18                 
  0x0801FE3A: lsrs       r0, r0, #0x18                 
  0x0801FE3C: adds       r1, r6, #0                    
  0x0801FE3E: subs       r1, #9                        
  0x0801FE40: bl         #0x81c7a6c                    
  0x0801FE44: adds       r4, r0, #0                    
  0x0801FE46: b          #0x801fe5a                    
  0x0801FE48: bl         #0x8063588                    
  0x0801FE4C: lsls       r0, r0, #0x18                 
  0x0801FE4E: lsrs       r0, r0, #0x18                 
  0x0801FE50: rsbs       r1, r4, #0                    
  0x0801FE52: adds       r1, #1                        
  0x0801FE54: bl         #0x81c7a6c                    
  0x0801FE58: rsbs       r4, r0, #0                    
  0x0801FE5A: adds       r0, r5, #0                    
  0x0801FE5C: movs       r1, #0xfb                     
  0x0801FE5E: movs       r2, #0                        
  0x0801FE60: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FE64: cmp        r0, #1                        
  0x0801FE66: bne        #0x801fe78                    
  0x0801FE68: lsls       r1, r7, #2                    
  0x0801FE6A: adds       r1, r1, r7                    
  0x0801FE6C: lsls       r1, r1, #1                    
  0x0801FE6E: lsls       r0, r4, #2                    
  0x0801FE70: adds       r0, r0, r4                    
  0x0801FE72: lsls       r0, r0, #1                    
  0x0801FE74: adds       r0, #0xc8                     
  0x0801FE76: b          #0x801fe86                    
  0x0801FE78: lsls       r1, r7, #2                    
  0x0801FE7A: adds       r1, r1, r7                    
  0x0801FE7C: lsls       r1, r1, #1                    
  0x0801FE7E: lsls       r0, r4, #2                    
  0x0801FE80: adds       r0, r0, r4                    
  0x0801FE82: lsls       r0, r0, #1                    
  0x0801FE84: adds       r0, #0xfa                     
  0x0801FE86: adds       r4, r1, r0                    
  0x0801FE88: adds       r0, r5, #0                    
  0x0801FE8A: movs       r1, #0x33                     
  0x0801FE8C: bl         #0x800d3a8                    
  0x0801FE90: movs       r1, #1                        
  0x0801FE92: rsbs       r1, r1, #0                    
  0x0801FE94: cmp        r0, r1                        
  0x0801FE96: beq        #0x801fea4                    
  0x0801FE98: movs       r0, #0x96                     
  0x0801FE9A: muls       r0, r4, r0                    
  0x0801FE9C: movs       r1, #0x64                     
  0x0801FE9E: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0801FEA2: adds       r4, r0, #0                    
  0x0801FEA4: rsbs       r2, r4, #0                    
  0x0801FEA6: adds       r0, r5, #0                    
  0x0801FEA8: movs       r1, #0x19                     
  0x0801FEAA: movs       r3, #0                        
  0x0801FEAC: bl         #0x8003944                    
  0x0801FEB0: adds       r0, r5, #0                    
  0x0801FEB2: movs       r1, #0x18                     
  0x0801FEB4: movs       r2, #0                        
  0x0801FEB6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FEBA: cmp        r0, #1                        
  0x0801FEBC: beq        #0x801fed4                    
  0x0801FEBE: bl         #0x8063588                    
  0x0801FEC2: movs       r2, #3                        
  0x0801FEC4: ands       r2, r0                        
  0x0801FEC6: adds       r2, #7                        
  0x0801FEC8: rsbs       r2, r2, #0                    
  0x0801FECA: adds       r0, r5, #0                    
  0x0801FECC: movs       r1, #0x31                     
  0x0801FECE: movs       r3, #0                        
  0x0801FED0: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x0801FED4: adds       r0, r5, #0                    
  0x0801FED6: movs       r1, #0x18                     
  0x0801FED8: movs       r2, #0                        
  0x0801FEDA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FEDE: cmp        r0, #1                        
  0x0801FEE0: bne        #0x801ffa2                    
  0x0801FEE2: ldr        r0, [pc, #0x64]                 ; = 0x0200A2F3 
  0x0801FEE4: ldrb       r0, [r0]                      
  0x0801FEE6: cmp        r0, #0                        
  0x0801FEE8: bne        #0x801ffa2                    
  0x0801FEEA: adds       r0, r5, #0                    
  0x0801FEEC: movs       r1, #0x1b                     
  0x0801FEEE: movs       r2, #0                        
  0x0801FEF0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FEF4: cmp        r0, #0                        
  0x0801FEF6: bne        #0x801ff2e                    
  0x0801FEF8: adds       r0, r5, #0                    
  0x0801FEFA: movs       r1, #0x19                     
  0x0801FEFC: movs       r2, #0                        
  0x0801FEFE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FF02: cmp        r0, #0                        
  0x0801FF04: bne        #0x801ff2e                    
  0x0801FF06: adds       r0, r5, #0                    
  0x0801FF08: movs       r1, #0x33                     
  0x0801FF0A: movs       r2, #3                        
  0x0801FF0C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FF10: adds       r0, r5, #0                    
  0x0801FF12: movs       r1, #0x33                     
  0x0801FF14: movs       r2, #3                        
  0x0801FF16: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FF1A: movs       r7, #5                        
  0x0801FF1C: cmp        r0, #2                        
  0x0801FF1E: bgt        #0x801ff22                    
  0x0801FF20: movs       r7, #0                        
  0x0801FF22: adds       r0, r5, #0                    
  0x0801FF24: movs       r1, #0x1a                     
  0x0801FF26: adds       r2, r7, #0                    
  0x0801FF28: movs       r3, #0                        
  0x0801FF2A: bl         #0x8003944                    
  0x0801FF2E: adds       r0, r5, #0                    
  0x0801FF30: movs       r1, #0x1d                     
  0x0801FF32: movs       r2, #1                        
  0x0801FF34: movs       r3, #0                        
  0x0801FF36: bl         #0x8003944                    
  0x0801FF3A: mov        r0, r8                        
  0x0801FF3C: cmp        r0, #0x63                     
  0x0801FF3E: bgt        #0x801ff4c                    
  0x0801FF40: adds       r0, r5, #0                    
  0x0801FF42: movs       r1, #0x1d                     
  0x0801FF44: movs       r2, #2                        
  0x0801FF46: b          #0x801ff6a                    
  0x0801FF4C: mov        r2, r8                        
  0x0801FF4E: cmp        r2, #0xc7                     
  0x0801FF50: ble        #0x801ff64                    
  0x0801FF52: ldr        r0, [pc, #0x20]                 ; = 0x0000012B 
  0x0801FF54: cmp        r8, r0                        
  0x0801FF56: bgt        #0x801ff78                    
  0x0801FF58: bl         #0x8063588                    
  0x0801FF5C: movs       r1, #1                        
  0x0801FF5E: ands       r1, r0                        
  0x0801FF60: cmp        r1, #0                        
  0x0801FF62: beq        #0x801ff96                    
  0x0801FF64: adds       r0, r5, #0                    
  0x0801FF66: movs       r1, #0x1d                     
  0x0801FF68: movs       r2, #1                        
  0x0801FF6A: movs       r3, #0                        
  0x0801FF6C: bl         #0x8003944                    
  0x0801FF70: b          #0x801ff96                    
  0x0801FF78: ldr        r0, [pc, #0x54]                 ; = 0x0000018F 
  0x0801FF7A: cmp        r8, r0                        
  0x0801FF7C: bgt        #0x801ff96                    
  0x0801FF7E: bl         #0x8063588                    
  0x0801FF82: movs       r1, #3                        
  0x0801FF84: ands       r1, r0                        
  0x0801FF86: cmp        r1, #0                        
  0x0801FF88: bne        #0x801ff96                    
  0x0801FF8A: adds       r0, r5, #0                    
  0x0801FF8C: movs       r1, #0x1d                     
  0x0801FF8E: movs       r2, #1                        
  0x0801FF90: movs       r3, #0                        
  0x0801FF92: bl         #0x8003944                    
  0x0801FF96: adds       r0, r5, #0                    
  0x0801FF98: movs       r1, #0x1e                     
  0x0801FF9A: movs       r2, #1                        
  0x0801FF9C: movs       r3, #0                        
  0x0801FF9E: bl         #0x8003944                    
  0x0801FFA2: adds       r0, r5, #0                    
  0x0801FFA4: movs       r1, #0x1f                     
  0x0801FFA6: movs       r2, #0                        
  0x0801FFA8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801FFAC: bl         #0x8024df0                    
  0x0801FFB0: adds       r7, r0, #0                    
  0x0801FFB2: rsbs       r2, r7, #0                    
  0x0801FFB4: adds       r0, r5, #0                    
  0x0801FFB6: movs       r1, #0x1c                     
  0x0801FFB8: movs       r3, #0                        
  0x0801FFBA: bl         #0x8003944                    
  0x0801FFBE: ldr        r1, [pc, #0x14]                 ; = 0x0200A2F3 
  0x0801FFC0: movs       r0, #0                        
  0x0801FFC2: strb       r0, [r1]                      
  0x0801FFC4: pop        {r3}                          
  0x0801FFC6: mov        r8, r3                        
  0x0801FFC8: pop        {r4, r5, r6, r7}              
  0x0801FFCA: pop        {r0}                          
  0x0801FFCC: bx         r0                            