; Function at 0x0806B06C
; 217 instructions traced

  0x0806B06C: push       {r4, r5, r6, r7, lr}          
  0x0806B06E: mov        r7, sl                        
  0x0806B070: mov        r6, sb                        
  0x0806B072: mov        r5, r8                        
  0x0806B074: push       {r5, r6, r7}                  
  0x0806B076: sub        sp, #0x8c                     
  0x0806B078: adds       r4, r0, #0                    
  0x0806B07A: lsls       r4, r4, #0x18                 
  0x0806B07C: lsrs       r4, r4, #0x18                 
  0x0806B07E: ldr        r0, [pc, #0xd0]                 ; = 0x081C9F80 STAT_GROWTH_TABLE
  0x0806B080: ldr        r1, [r0, #4]                  
  0x0806B082: ldr        r0, [r0]                      
  0x0806B084: str        r0, [sp, #0x74]               
  0x0806B086: str        r1, [sp, #0x78]               
  0x0806B088: ldr        r1, [pc, #0xc8]                 ; = 0x081CA698 
  0x0806B08A: add        r0, sp, #0xc                  
  0x0806B08C: movs       r2, #0x3c                     
  0x0806B08E: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x0806B092: add        r2, sp, #0x48                 
  0x0806B094: adds       r1, r2, #0                    
  0x0806B096: ldr        r0, [pc, #0xc0]                 ; = 0x081CA6D4 
  0x0806B098: ldm        r0!, {r3, r5, r6}             
  0x0806B09A: stm        r1!, {r3, r5, r6}             
  0x0806B09C: ldm        r0!, {r3, r5, r6}             
  0x0806B09E: stm        r1!, {r3, r5, r6}             
  0x0806B0A0: ldm        r0!, {r3, r5, r6}             
  0x0806B0A2: stm        r1!, {r3, r5, r6}             
  0x0806B0A4: ldm        r0!, {r3, r5}                 
  0x0806B0A6: stm        r1!, {r3, r5}                 
  0x0806B0A8: movs       r0, #0x98                     
  0x0806B0AA: adds       r1, r4, #0                    
  0x0806B0AC: muls       r1, r0, r1                    
  0x0806B0AE: ldr        r0, [pc, #0xac]                 ; = 0x0201E558 
  0x0806B0B0: adds       r6, r1, r0                    
  0x0806B0B2: lsls       r4, r4, #2                    
  0x0806B0B4: ldr        r0, [pc, #0xa8]                 ; = 0x083F31F4 
  0x0806B0B6: adds       r5, r4, r0                    
  0x0806B0B8: ldr        r0, [pc, #0xa8]                 ; = 0x083F32B4 
  0x0806B0BA: adds       r0, r4, r0                    
  0x0806B0BC: str        r0, [sp, #0x84]               
  0x0806B0BE: ldr        r0, [pc, #0xa8]                 ; = 0x083F339C 
  0x0806B0C0: adds       r4, r4, r0                    
  0x0806B0C2: str        r4, [sp, #0x88]               
  0x0806B0C4: adds       r1, r6, #0                    
  0x0806B0C6: adds       r1, #0x8d                     
  0x0806B0C8: ldrb       r0, [r1]                      
  0x0806B0CA: mov        sl, r2                        
  0x0806B0CC: add        r7, sp, #0x7c                 
  0x0806B0CE: cmp        r0, #0                        
  0x0806B0D0: beq        #0x806b114                    
  0x0806B0D2: movs       r0, #0                        
  0x0806B0D4: strb       r0, [r1]                      
  0x0806B0D6: adds       r4, r6, #0                    
  0x0806B0D8: adds       r4, #0x8f                     
  0x0806B0DA: ldrb       r0, [r4]                      
  0x0806B0DC: lsls       r0, r0, #2                    
  0x0806B0DE: add        r3, sp, #0x74                 
  0x0806B0E0: adds       r0, r0, r3                    
  0x0806B0E2: ldrh       r2, [r0]                      
  0x0806B0E4: ldr        r1, [pc, #0x84]                 ; = 0xFFFF0000 
  0x0806B0E6: ldr        r0, [sp, #0x7c]               
  0x0806B0E8: ands       r0, r1                        
  0x0806B0EA: orrs       r0, r2                        
  0x0806B0EC: str        r0, [sp, #0x7c]               
  0x0806B0EE: ldrb       r0, [r4]                      
  0x0806B0F0: lsls       r0, r0, #2                    
  0x0806B0F2: adds       r0, r0, r3                    
  0x0806B0F4: ldrh       r0, [r0, #2]                  
  0x0806B0F6: strh       r0, [r7, #2]                  
  0x0806B0F8: movs       r0, #0x30                     
  0x0806B0FA: strh       r0, [r7, #4]                  
  0x0806B0FC: strh       r0, [r7, #6]                  
  0x0806B0FE: ldr        r0, [pc, #0x70]                 ; = 0x06010000 
  0x0806B100: ldrh       r1, [r5]                      
  0x0806B102: ldrh       r2, [r5, #2]                  
  0x0806B104: ldr        r3, [pc, #0x6c]                 ; = 0x0877300C 
  0x0806B106: movs       r4, #0xf0                     
  0x0806B108: str        r4, [sp]                      
  0x0806B10A: movs       r4, #0x60                     
  0x0806B10C: str        r4, [sp, #4]                  
  0x0806B10E: str        r7, [sp, #8]                  
  0x0806B110: bl         #0x8065f6c                    
  0x0806B114: movs       r2, #0                        
  0x0806B116: adds       r0, r6, #0                    
  0x0806B118: adds       r0, #0x90                     
  0x0806B11A: ldrb       r1, [r0]                      
  0x0806B11C: adds       r3, r0, #0                    
  0x0806B11E: cmp        r1, #0                        
  0x0806B120: beq        #0x806b12e                    
  0x0806B122: cmp        r1, #4                        
  0x0806B124: beq        #0x806b12e                    
  0x0806B126: cmp        r1, #7                        
  0x0806B128: beq        #0x806b12e                    
  0x0806B12A: cmp        r1, #0xa                      
  0x0806B12C: bne        #0x806b18a                    
  0x0806B12E: adds       r1, r6, #0                    
  0x0806B130: adds       r1, #0x92                     
  0x0806B132: ldrh       r0, [r1]                      
  0x0806B134: adds       r0, #1                        
  0x0806B136: strh       r0, [r1]                      
  0x0806B138: lsls       r0, r0, #0x10                 
  0x0806B13A: lsrs       r0, r0, #0x10                 
  0x0806B13C: cmp        r0, #0x39                     
  0x0806B13E: bne        #0x806b144                    
  0x0806B140: movs       r0, #0                        
  0x0806B142: strh       r0, [r1]                      
  0x0806B144: ldrh       r0, [r1]                      
  0x0806B146: cmp        r0, #0x31                     
  0x0806B148: bhi        #0x806b178                    
  0x0806B14A: movs       r2, #0                        
  0x0806B14C: b          #0x806b18a                    
  0x0806B178: cmp        r0, #0x33                     
  0x0806B17A: bls        #0x806b188                    
  0x0806B17C: cmp        r0, #0x36                     
  0x0806B17E: bhi        #0x806b184                    
  0x0806B180: movs       r2, #2                        
  0x0806B182: b          #0x806b18a                    
  0x0806B184: cmp        r0, #0x38                     
  0x0806B186: bhi        #0x806b18a                    
  0x0806B188: movs       r2, #1                        
  0x0806B18A: ldrb       r0, [r3]                      
  0x0806B18C: adds       r0, r0, r2                    
  0x0806B18E: lsls       r0, r0, #2                    
  0x0806B190: add        r0, sp, r0                    
  0x0806B192: adds       r0, #0xc                      
  0x0806B194: ldrh       r0, [r0]                      
  0x0806B196: strh       r0, [r7]                      
  0x0806B198: ldrb       r0, [r3]                      
  0x0806B19A: adds       r0, r0, r2                    
  0x0806B19C: lsls       r0, r0, #2                    
  0x0806B19E: add        r0, sp, r0                    
  0x0806B1A0: adds       r0, #0xc                      
  0x0806B1A2: ldrh       r0, [r0, #2]                  
  0x0806B1A4: add        r5, sp, #0x7c                 
  0x0806B1A6: strh       r0, [r5, #2]                  
  0x0806B1A8: movs       r0, #0x18                     
  0x0806B1AA: mov        r8, r0                        
  0x0806B1AC: mov        r2, r8                        
  0x0806B1AE: strh       r2, [r5, #4]                  
  0x0806B1B0: movs       r3, #0x10                     
  0x0806B1B2: mov        sb, r3                        
  0x0806B1B4: mov        r0, sb                        
  0x0806B1B6: strh       r0, [r5, #6]                  
  0x0806B1B8: ldr        r0, [pc, #0x48]                 ; = 0x06010000 
  0x0806B1BA: ldr        r2, [sp, #0x84]               
  0x0806B1BC: ldrh       r1, [r2]                      
  0x0806B1BE: ldrh       r2, [r2, #2]                  
  0x0806B1C0: ldr        r3, [pc, #0x44]                 ; = 0x0877300C 
  0x0806B1C2: movs       r4, #0xf0                     
  0x0806B1C4: str        r4, [sp]                      
  0x0806B1C6: movs       r4, #0x60                     
  0x0806B1C8: str        r4, [sp, #4]                  
  0x0806B1CA: str        r5, [sp, #8]                  
  0x0806B1CC: bl         #0x8065f6c                    
  0x0806B1D0: adds       r0, r6, #0                    
  0x0806B1D2: adds       r0, #0x8a                     
  0x0806B1D4: ldrb       r0, [r0]                      
  0x0806B1D6: cmp        r0, #0                        
  0x0806B1D8: beq        #0x806b20c                    
  0x0806B1DA: adds       r0, r6, #0                    
  0x0806B1DC: bl         #0x80687c4                    
  0x0806B1E0: adds       r1, r6, #0                    
  0x0806B1E2: adds       r1, #0x96                     
  0x0806B1E4: strb       r0, [r1]                      
  0x0806B1E6: ldrb       r0, [r1]                      
  0x0806B1E8: lsls       r0, r0, #2                    
  0x0806B1EA: add        r0, sl                        
  0x0806B1EC: ldrh       r0, [r0]                      
  0x0806B1EE: strh       r0, [r7]                      
  0x0806B1F0: ldrb       r0, [r1]                      
  0x0806B1F2: lsls       r0, r0, #2                    
  0x0806B1F4: add        r0, sl                        
  0x0806B1F6: ldrh       r0, [r0, #2]                  
  0x0806B1F8: strh       r0, [r5, #2]                  
  0x0806B1FA: mov        r3, r8                        
  0x0806B1FC: strh       r3, [r5, #4]                  
  0x0806B1FE: mov        r6, sb                        
  0x0806B200: strh       r6, [r5, #6]                  
  0x0806B202: b          #0x806b232                    
  0x0806B20C: adds       r1, r6, #0                    
  0x0806B20E: adds       r1, #0x96                     
  0x0806B210: movs       r0, #0                        
  0x0806B212: strb       r0, [r1]                      
  0x0806B214: subs       r1, #5                        
  0x0806B216: ldrb       r0, [r1]                      
  0x0806B218: lsls       r0, r0, #2                    
  0x0806B21A: add        r0, sl                        
  0x0806B21C: ldrh       r0, [r0]                      
  0x0806B21E: strh       r0, [r7]                      
  0x0806B220: ldrb       r0, [r1]                      
  0x0806B222: lsls       r0, r0, #2                    
  0x0806B224: add        r0, sl                        
  0x0806B226: ldrh       r0, [r0, #2]                  
  0x0806B228: strh       r0, [r5, #2]                  
  0x0806B22A: mov        r0, r8                        
  0x0806B22C: strh       r0, [r5, #4]                  
  0x0806B22E: mov        r2, sb                        
  0x0806B230: strh       r2, [r5, #6]                  
  0x0806B232: ldr        r0, [pc, #0x28]                 ; = 0x06010000 
  0x0806B234: ldr        r3, [sp, #0x88]               
  0x0806B236: ldrh       r1, [r3]                      
  0x0806B238: ldrh       r2, [r3, #2]                  
  0x0806B23A: ldr        r3, [pc, #0x24]                 ; = 0x0877300C 
  0x0806B23C: movs       r4, #0xf0                     
  0x0806B23E: str        r4, [sp]                      
  0x0806B240: movs       r4, #0x60                     
  0x0806B242: str        r4, [sp, #4]                  
  0x0806B244: str        r7, [sp, #8]                  
  0x0806B246: bl         #0x8065f6c                    
  0x0806B24A: add        sp, #0x8c                     
  0x0806B24C: pop        {r3, r4, r5}                  
  0x0806B24E: mov        r8, r3                        
  0x0806B250: mov        sb, r4                        
  0x0806B252: mov        sl, r5                        
  0x0806B254: pop        {r4, r5, r6, r7}              
  0x0806B256: pop        {r0}                          
  0x0806B258: bx         r0                            