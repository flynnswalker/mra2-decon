; Function at 0x0801FCFC
; 200 instructions traced

  0x0801FCFC: push       {r4, r5, r6, r7, lr}          
  0x0801FCFE: mov        r7, r8                        
  0x0801FD00: push       {r7}                          
  0x0801FD02: bl         #0x8002530                    
  0x0801FD06: movs       r1, #0x71                     
  0x0801FD08: movs       r2, #0                        
  0x0801FD0A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_113 (offset None)
  0x0801FD0E: adds       r5, r0, #0                    
  0x0801FD10: movs       r1, #0x13                     
  0x0801FD12: movs       r2, #0                        
  0x0801FD14: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_19 (offset 0x0089)
  0x0801FD18: adds       r4, r0, #0                    
  0x0801FD1A: adds       r0, r5, #0                    
  0x0801FD1C: bl         #0x80027ac                    
  0x0801FD20: adds       r1, r0, #0                    
  0x0801FD22: adds       r0, r4, #0                    
  0x0801FD24: bl         #0x8024da8                    
  0x0801FD28: adds       r6, r0, #0                    
  0x0801FD2A: adds       r0, r5, #0                    
  0x0801FD2C: movs       r1, #0x1b                     
  0x0801FD2E: movs       r2, #0                        
  0x0801FD30: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat999_0x9E (offset 0x009E)
  0x0801FD34: mov        r8, r0                        
  0x0801FD36: movs       r7, #0                        
  0x0801FD38: adds       r0, r5, #0                    
  0x0801FD3A: movs       r1, #0x18                     
  0x0801FD3C: movs       r2, #0                        
  0x0801FD3E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
  0x0801FD42: cmp        r0, #4                        
  0x0801FD44: beq        #0x801fd6a                    
  0x0801FD46: adds       r0, r5, #0                    
  0x0801FD48: movs       r1, #0x18                     
  0x0801FD4A: movs       r2, #0                        
  0x0801FD4C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
  0x0801FD50: cmp        r0, #6                        
  0x0801FD52: beq        #0x801fd6a                    
  0x0801FD54: movs       r0, #6                        
  0x0801FD56: bl         #0x8002538                    
  0x0801FD5A: adds       r1, r0, #0                    
  0x0801FD5C: cmp        r1, #0                        
  0x0801FD5E: blt        #0x801fd6a                    
  0x0801FD60: lsls       r0, r1, #2                    
  0x0801FD62: adds       r0, r0, r1                    
  0x0801FD64: lsls       r0, r0, #2                    
  0x0801FD66: adds       r7, r0, #0                    
  0x0801FD68: adds       r7, #0xa                      
  0x0801FD6A: adds       r4, r6, #0                    
  0x0801FD6C: subs       r4, #0x14                     
  0x0801FD6E: cmp        r4, #0                        
  0x0801FD70: ble        #0x801fd86                    
  0x0801FD72: bl         #0x8063588                    
  0x0801FD76: lsls       r0, r0, #0x18                 
  0x0801FD78: lsrs       r0, r0, #0x18                 
  0x0801FD7A: adds       r1, r6, #0                    
  0x0801FD7C: subs       r1, #0x13                     
  0x0801FD7E: bl         #0x81c7a6c                    
  0x0801FD82: adds       r4, r0, #0                    
  0x0801FD84: b          #0x801fd98                    
  0x0801FD86: bl         #0x8063588                    
  0x0801FD8A: lsls       r0, r0, #0x18                 
  0x0801FD8C: lsrs       r0, r0, #0x18                 
  0x0801FD8E: rsbs       r1, r4, #0                    
  0x0801FD90: adds       r1, #1                        
  0x0801FD92: bl         #0x81c7a6c                    
  0x0801FD96: rsbs       r4, r0, #0                    
  0x0801FD98: adds       r0, r5, #0                    
  0x0801FD9A: movs       r1, #0xfb                     
  0x0801FD9C: movs       r2, #0                        
  0x0801FD9E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[251]
  0x0801FDA2: cmp        r0, #1                        
  0x0801FDA4: bne        #0x801fdb8                    
  0x0801FDA6: lsls       r1, r7, #2                    
  0x0801FDA8: adds       r1, r1, r7                    
  0x0801FDAA: lsls       r1, r1, #1                    
  0x0801FDAC: lsls       r0, r4, #2                    
  0x0801FDAE: adds       r0, r0, r4                    
  0x0801FDB0: lsls       r0, r0, #1                    
  0x0801FDB2: movs       r2, #0xc8                     
  0x0801FDB4: lsls       r2, r2, #1                    
  0x0801FDB6: b          #0x801fdc8                    
  0x0801FDB8: lsls       r1, r7, #2                    
  0x0801FDBA: adds       r1, r1, r7                    
  0x0801FDBC: lsls       r1, r1, #1                    
  0x0801FDBE: lsls       r0, r4, #2                    
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
  0x0801FDFC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
  0x0801FE00: cmp        r0, #4                        
  0x0801FE02: beq        #0x801fe26                    
  0x0801FE04: adds       r0, r5, #0                    
  0x0801FE06: movs       r1, #0x18                     
  0x0801FE08: movs       r2, #0                        
  0x0801FE0A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
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
  0x0801FE60: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[251]
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
  0x0801FEB6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
  0x0801FEBA: cmp        r0, #1                        
  0x0801FEBC: beq        #0x801fed4                    
  0x0801FEBE: bl         #0x8063588                    
  0x0801FEC2: movs       r2, #3                        
  0x0801FEC4: ands       r2, r0                        
  0x0801FEC6: adds       r2, #7                        