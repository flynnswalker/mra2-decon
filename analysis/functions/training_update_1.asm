; Function at 0x08068810
; 258 instructions traced

  0x08068810: push       {r4, r5, r6, r7, lr}          
  0x08068812: mov        r7, sl                        
  0x08068814: mov        r6, sb                        
  0x08068816: mov        r5, r8                        
  0x08068818: push       {r5, r6, r7}                  
  0x0806881A: sub        sp, #0xfc                     
  0x0806881C: adds       r4, r0, #0                    
  0x0806881E: lsls       r4, r4, #0x18                 
  0x08068820: lsrs       r4, r4, #0x18                 
  0x08068822: ldr        r0, [pc, #0xf0]                 ; = 0x081C9F80 STAT_GROWTH_TABLE
  0x08068824: ldr        r1, [r0, #4]                  
  0x08068826: ldr        r0, [r0]                      
  0x08068828: add        r6, sp, #0xe4                 
  0x0806882A: str        r0, [r6]                      
  0x0806882C: str        r1, [r6, #4]                  
  0x0806882E: ldr        r1, [pc, #0xe8]                 ; = 0x081C9F88 
  0x08068830: add        r0, sp, #0xc                  
  0x08068832: movs       r2, #0x78                     
  0x08068834: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x08068838: add        r5, sp, #0x84                 
  0x0806883A: ldr        r1, [pc, #0xe0]                 ; = 0x081CA000 
  0x0806883C: adds       r0, r5, #0                    
  0x0806883E: movs       r2, #0x60                     
  0x08068840: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x08068844: movs       r0, #0x98                     
  0x08068846: adds       r1, r4, #0                    
  0x08068848: muls       r1, r0, r1                    
  0x0806884A: ldr        r0, [pc, #0xd4]                 ; = 0x0201E558 
  0x0806884C: adds       r7, r1, r0                    
  0x0806884E: lsls       r4, r4, #2                    
  0x08068850: ldr        r0, [pc, #0xd0]                 ; = 0x083F31F4 
  0x08068852: adds       r0, r0, r4                    
  0x08068854: mov        ip, r0                        
  0x08068856: ldr        r0, [pc, #0xd0]                 ; = 0x083F31FC 
  0x08068858: adds       r0, r4, r0                    
  0x0806885A: str        r0, [sp, #0xf4]               
  0x0806885C: ldr        r0, [pc, #0xcc]                 ; = 0x083F32E4 
  0x0806885E: adds       r4, r4, r0                    
  0x08068860: str        r4, [sp, #0xf8]               
  0x08068862: adds       r1, r7, #0                    
  0x08068864: adds       r1, #0x8d                     
  0x08068866: ldrb       r0, [r1]                      
  0x08068868: mov        sl, r5                        
  0x0806886A: add        r2, sp, #0xec                 
  0x0806886C: mov        r8, r2                        
  0x0806886E: cmp        r0, #0                        
  0x08068870: beq        #0x80688b8                    
  0x08068872: movs       r0, #0                        
  0x08068874: strb       r0, [r1]                      
  0x08068876: adds       r3, r7, #0                    
  0x08068878: adds       r3, #0x8f                     
  0x0806887A: ldrb       r0, [r3]                      
  0x0806887C: lsls       r0, r0, #2                    
  0x0806887E: adds       r0, r0, r6                    
  0x08068880: ldrh       r2, [r0]                      
  0x08068882: ldr        r1, [pc, #0xac]                 ; = 0xFFFF0000 
  0x08068884: mov        r4, r8                        
  0x08068886: ldr        r0, [r4]                      
  0x08068888: ands       r0, r1                        
  0x0806888A: orrs       r0, r2                        
  0x0806888C: str        r0, [r4]                      
  0x0806888E: ldrb       r0, [r3]                      
  0x08068890: lsls       r0, r0, #2                    
  0x08068892: adds       r0, r0, r6                    
  0x08068894: ldrh       r0, [r0, #2]                  
  0x08068896: strh       r0, [r4, #2]                  
  0x08068898: movs       r0, #0x30                     
  0x0806889A: strh       r0, [r4, #4]                  
  0x0806889C: strh       r0, [r4, #6]                  
  0x0806889E: ldr        r0, [pc, #0x94]                 ; = 0x06010000 
  0x080688A0: mov        r2, ip                        
  0x080688A2: ldrh       r1, [r2]                      
  0x080688A4: ldrh       r2, [r2, #2]                  
  0x080688A6: ldr        r3, [pc, #0x90]                 ; = 0x08754F0C 
  0x080688A8: movs       r4, #0xf0                     
  0x080688AA: str        r4, [sp]                      
  0x080688AC: movs       r4, #0x60                     
  0x080688AE: str        r4, [sp, #4]                  
  0x080688B0: mov        r4, r8                        
  0x080688B2: str        r4, [sp, #8]                  
  0x080688B4: bl         #0x8065f6c                    
  0x080688B8: movs       r4, #0                        
  0x080688BA: adds       r0, r7, #0                    
  0x080688BC: adds       r0, #0x90                     
  0x080688BE: ldrb       r1, [r0]                      
  0x080688C0: adds       r6, r0, #0                    
  0x080688C2: cmp        r1, #0                        
  0x080688C4: beq        #0x80688e6                    
  0x080688C6: cmp        r1, #3                        
  0x080688C8: beq        #0x80688e6                    
  0x080688CA: cmp        r1, #6                        
  0x080688CC: beq        #0x80688e6                    
  0x080688CE: cmp        r1, #0xc                      
  0x080688D0: beq        #0x80688e6                    
  0x080688D2: cmp        r1, #0xf                      
  0x080688D4: beq        #0x80688e6                    
  0x080688D6: cmp        r1, #0x12                     
  0x080688D8: beq        #0x80688e6                    
  0x080688DA: cmp        r1, #0x15                     
  0x080688DC: beq        #0x80688e6                    
  0x080688DE: cmp        r1, #0x18                     
  0x080688E0: beq        #0x80688e6                    
  0x080688E2: cmp        r1, #0x1b                     
  0x080688E4: bne        #0x8068942                    
  0x080688E6: adds       r1, r7, #0                    
  0x080688E8: adds       r1, #0x92                     
  0x080688EA: ldrh       r0, [r1]                      
  0x080688EC: adds       r0, #1                        
  0x080688EE: strh       r0, [r1]                      
  0x080688F0: lsls       r0, r0, #0x10                 
  0x080688F2: lsrs       r0, r0, #0x10                 
  0x080688F4: cmp        r0, #0xc0                     
  0x080688F6: bne        #0x80688fc                    
  0x080688F8: movs       r0, #0                        
  0x080688FA: strh       r0, [r1]                      
  0x080688FC: ldrh       r0, [r1]                      
  0x080688FE: movs       r1, #0x78                     
  0x08068900: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x08068904: lsls       r0, r0, #0x10                 
  0x08068906: lsrs       r0, r0, #0x11                 
  0x08068908: cmp        r0, #2                        
  0x0806890A: bls        #0x8068940                    
  0x0806890C: cmp        r0, #5                        
  0x0806890E: bhi        #0x806893c                    
  0x08068910: movs       r4, #2                        
  0x08068912: b          #0x8068942                    
  0x0806893C: cmp        r0, #8                        
  0x0806893E: bhi        #0x8068942                    
  0x08068940: movs       r4, #1                        
  0x08068942: ldrb       r0, [r6]                      
  0x08068944: adds       r0, r0, r4                    
  0x08068946: lsls       r0, r0, #2                    
  0x08068948: add        r0, sp, r0                    
  0x0806894A: adds       r0, #0xc                      
  0x0806894C: ldrh       r0, [r0]                      
  0x0806894E: mov        r1, r8                        
  0x08068950: strh       r0, [r1]                      
  0x08068952: ldrb       r0, [r6]                      
  0x08068954: adds       r0, r0, r4                    
  0x08068956: lsls       r0, r0, #2                    
  0x08068958: add        r0, sp, r0                    
  0x0806895A: adds       r0, #0xc                      
  0x0806895C: ldrh       r0, [r0, #2]                  
  0x0806895E: add        r5, sp, #0xec                 
  0x08068960: strh       r0, [r5, #2]                  
  0x08068962: movs       r0, #0x18                     
  0x08068964: strh       r0, [r5, #4]                  
  0x08068966: movs       r2, #0x10                     
  0x08068968: mov        sb, r2                        
  0x0806896A: mov        r3, sb                        
  0x0806896C: strh       r3, [r5, #6]                  
  0x0806896E: ldr        r0, [pc, #0x38]                 ; = 0x06010000 
  0x08068970: ldr        r4, [sp, #0xf4]               
  0x08068972: ldrh       r1, [r4]                      
  0x08068974: ldrh       r2, [r4, #2]                  
  0x08068976: ldr        r3, [pc, #0x34]                 ; = 0x08754F0C 
  0x08068978: movs       r4, #0xf0                     
  0x0806897A: str        r4, [sp]                      
  0x0806897C: movs       r4, #0x60                     
  0x0806897E: str        r4, [sp, #4]                  
  0x08068980: str        r5, [sp, #8]                  
  0x08068982: bl         #0x8065f6c                    
  0x08068986: adds       r0, r7, #0                    
  0x08068988: adds       r0, #0x8a                     
  0x0806898A: ldrb       r0, [r0]                      
  0x0806898C: cmp        r0, #0                        
  0x0806898E: beq        #0x8068a02                    
  0x08068990: adds       r0, r7, #0                    
  0x08068992: adds       r0, #0x8f                     
  0x08068994: ldrb       r4, [r0]                      
  0x08068996: cmp        r4, #0                        
  0x08068998: bne        #0x80689b0                    
  0x0806899A: adds       r0, r7, #0                    
  0x0806899C: bl         #0x80687c4                    
  0x080689A0: adds       r1, r7, #0                    
  0x080689A2: adds       r1, #0x96                     
  0x080689A4: strb       r0, [r1]                      
  0x080689A6: b          #0x8068a0c                    
  0x080689B0: cmp        r4, #1                        
  0x080689B2: bne        #0x8068a2a                    
  0x080689B4: adds       r1, r7, #0                    
  0x080689B6: adds       r1, #0x94                     
  0x080689B8: ldrh       r0, [r1]                      
  0x080689BA: adds       r0, #1                        
  0x080689BC: strh       r0, [r1]                      
  0x080689BE: lsls       r0, r0, #0x10                 
  0x080689C0: lsrs       r0, r0, #0x10                 
  0x080689C2: adds       r6, r7, #0                    
  0x080689C4: adds       r6, #0x96                     
  0x080689C6: cmp        r0, #4                        
  0x080689C8: bne        #0x80689da                    
  0x080689CA: movs       r0, #0                        
  0x080689CC: strh       r0, [r1]                      
  0x080689CE: bl         #0x806354c                    
  0x080689D2: lsls       r0, r0, #0x10                 
  0x080689D4: lsrs       r0, r0, #0x10                 
  0x080689D6: ands       r0, r4                        
  0x080689D8: strb       r0, [r6]                      
  0x080689DA: adds       r2, r7, #0                    
  0x080689DC: adds       r2, #0x91                     
  0x080689DE: ldrb       r0, [r2]                      
  0x080689E0: ldrb       r1, [r6]                      
  0x080689E2: adds       r0, r0, r1                    
  0x080689E4: lsls       r0, r0, #2                    
  0x080689E6: add        r0, sl                        
  0x080689E8: ldrh       r0, [r0]                      
  0x080689EA: mov        r4, r8                        
  0x080689EC: strh       r0, [r4]                      
  0x080689EE: ldrb       r0, [r2]                      
  0x080689F0: ldrb       r1, [r6]                      
  0x080689F2: adds       r0, r0, r1                    
  0x080689F4: lsls       r0, r0, #2                    
  0x080689F6: add        r0, sl                        
  0x080689F8: ldrh       r0, [r0, #2]                  
  0x080689FA: strh       r0, [r5, #2]                  
  0x080689FC: mov        r0, sb                        
  0x080689FE: strh       r0, [r5, #4]                  
  0x08068A00: b          #0x8068a26                    
  0x08068A02: adds       r1, r7, #0                    
  0x08068A04: adds       r1, #0x96                     
  0x08068A06: movs       r0, #0                        
  0x08068A08: strb       r0, [r1]                      
  0x08068A0A: subs       r1, #5                        
  0x08068A0C: ldrb       r0, [r1]                      
  0x08068A0E: lsls       r0, r0, #2                    
  0x08068A10: add        r0, sl                        
  0x08068A12: ldrh       r0, [r0]                      
  0x08068A14: mov        r2, r8                        
  0x08068A16: strh       r0, [r2]                      
  0x08068A18: ldrb       r0, [r1]                      
  0x08068A1A: lsls       r0, r0, #2                    
  0x08068A1C: add        r0, sl                        
  0x08068A1E: ldrh       r0, [r0, #2]                  
  0x08068A20: strh       r0, [r5, #2]                  
  0x08068A22: mov        r3, sb                        
  0x08068A24: strh       r3, [r5, #4]                  
  0x08068A26: movs       r0, #8                        
  0x08068A28: strh       r0, [r5, #6]                  
  0x08068A2A: ldr        r0, [pc, #0x28]                 ; = 0x06010000 
  0x08068A2C: ldr        r4, [sp, #0xf8]               
  0x08068A2E: ldrh       r1, [r4]                      
  0x08068A30: ldrh       r2, [r4, #2]                  
  0x08068A32: ldr        r3, [pc, #0x24]                 ; = 0x08754F0C 
  0x08068A34: movs       r4, #0xf0                     
  0x08068A36: str        r4, [sp]                      
  0x08068A38: movs       r4, #0x60                     
  0x08068A3A: str        r4, [sp, #4]                  
  0x08068A3C: mov        r4, r8                        
  0x08068A3E: str        r4, [sp, #8]                  
  0x08068A40: bl         #0x8065f6c                    
  0x08068A44: add        sp, #0xfc                     
  0x08068A46: pop        {r3, r4, r5}                  
  0x08068A48: mov        r8, r3                        
  0x08068A4A: mov        sb, r4                        
  0x08068A4C: mov        sl, r5                        
  0x08068A4E: pop        {r4, r5, r6, r7}              
  0x08068A50: pop        {r0}                          
  0x08068A52: bx         r0                            