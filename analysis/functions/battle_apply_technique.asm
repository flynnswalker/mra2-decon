; Function at 0x08043934
; 118 instructions traced

  0x08043934: push       {r4, r5, r6, r7, lr}          
  0x08043936: mov        r7, sl                        
  0x08043938: mov        r6, sb                        
  0x0804393A: mov        r5, r8                        
  0x0804393C: push       {r5, r6, r7}                  
  0x0804393E: sub        sp, #0xc                      
  0x08043940: mov        r8, r0                        
  0x08043942: adds       r7, r1, #0                    
  0x08043944: str        r2, [sp]                      
  0x08043946: bl         #0x8002530                    
  0x0804394A: movs       r1, #0xb7                     
  0x0804394C: movs       r2, #0                        
  0x0804394E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043952: adds       r5, r0, #0                    
  0x08043954: adds       r0, r7, #0                    
  0x08043956: movs       r1, #0x6d                     
  0x08043958: movs       r2, #0                        
  0x0804395A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804395E: movs       r0, #0xea                     
  0x08043960: lsls       r0, r0, #3                    
  0x08043962: adds       r6, r5, r0                    
  0x08043964: movs       r1, #0xf7                     
  0x08043966: lsls       r1, r1, #3                    
  0x08043968: adds       r4, r5, r1                    
  0x0804396A: adds       r0, r4, #0                    
  0x0804396C: adds       r1, r6, #0                    
  0x0804396E: movs       r2, #0x68                     
  0x08043970: bl         #0x81c7d0c                      ; -> memcpy(dst, src, len)
  0x08043974: subs       r6, #0x68                     
  0x08043976: subs       r4, #0x68                     
  0x08043978: cmp        r4, r5                        
  0x0804397A: bgt        #0x804396a                    
  0x0804397C: adds       r0, r5, #0                    
  0x0804397E: movs       r1, #0                        
  0x08043980: movs       r2, #0x68                     
  0x08043982: bl         #0x81c770c                      ; -> memset(dst, val, len)
  0x08043986: adds       r4, r5, #0                    
  0x08043988: adds       r4, #0x20                     
  0x0804398A: adds       r6, r5, #0                    
  0x0804398C: adds       r6, #0x21                     
  0x0804398E: movs       r0, #0x22                     
  0x08043990: adds       r0, r0, r5                    
  0x08043992: mov        ip, r0                        
  0x08043994: movs       r1, #0x42                     
  0x08043996: adds       r1, r1, r5                    
  0x08043998: mov        sb, r1                        
  0x0804399A: movs       r0, #0x62                     
  0x0804399C: adds       r0, r0, r5                    
  0x0804399E: mov        sl, r0                        
  0x080439A0: adds       r1, r5, #0                    
  0x080439A2: adds       r1, #0x63                     
  0x080439A4: str        r1, [sp, #8]                  
  0x080439A6: adds       r0, r5, #0                    
  0x080439A8: adds       r0, #0x64                     
  0x080439AA: str        r0, [sp, #4]                  
  0x080439AC: adds       r3, r7, #0                    
  0x080439AE: adds       r1, r5, #0                    
  0x080439B0: movs       r2, #0xf                      
  0x080439B2: ldrh       r0, [r3]                      
  0x080439B4: strh       r0, [r1]                      
  0x080439B6: adds       r3, #2                        
  0x080439B8: adds       r1, #2                        
  0x080439BA: subs       r2, #1                        
  0x080439BC: cmp        r2, #0                        
  0x080439BE: bge        #0x80439b2                    
  0x080439C0: movs       r1, #0x82                     
  0x080439C2: lsls       r1, r1, #1                    
  0x080439C4: adds       r0, r7, r1                    
  0x080439C6: ldrb       r0, [r0]                      
  0x080439C8: strb       r0, [r4]                      
  0x080439CA: adds       r1, #1                        
  0x080439CC: adds       r0, r7, r1                    
  0x080439CE: ldrb       r0, [r0]                      
  0x080439D0: strb       r0, [r6]                      
  0x080439D2: ldr        r0, [pc, #0x58]                 ; = 0x00000594 
  0x080439D4: adds       r1, r7, r0                    
  0x080439D6: mov        r3, ip                        
  0x080439D8: movs       r2, #0xf                      
  0x080439DA: ldrh       r0, [r1]                      
  0x080439DC: strh       r0, [r3]                      
  0x080439DE: adds       r1, #2                        
  0x080439E0: adds       r3, #2                        
  0x080439E2: subs       r2, #1                        
  0x080439E4: cmp        r2, #0                        
  0x080439E6: bge        #0x80439da                    
  0x080439E8: mov        r3, r8                        
  0x080439EA: mov        r1, sb                        
  0x080439EC: movs       r2, #0xf                      
  0x080439EE: ldrh       r0, [r3]                      
  0x080439F0: strh       r0, [r1]                      
  0x080439F2: adds       r3, #2                        
  0x080439F4: adds       r1, #2                        
  0x080439F6: subs       r2, #1                        
  0x080439F8: cmp        r2, #0                        
  0x080439FA: bge        #0x80439ee                    
  0x080439FC: movs       r0, #0x82                     
  0x080439FE: lsls       r0, r0, #1                    
  0x08043A00: add        r0, r8                        
  0x08043A02: ldrb       r0, [r0]                      
  0x08043A04: mov        r1, sl                        
  0x08043A06: strb       r0, [r1]                      
  0x08043A08: ldr        r0, [pc, #0x24]                 ; = 0x00000105 
  0x08043A0A: add        r0, r8                        
  0x08043A0C: ldrb       r0, [r0]                      
  0x08043A0E: ldr        r1, [sp, #8]                  
  0x08043A10: strb       r0, [r1]                      
  0x08043A12: mov        r0, sp                        
  0x08043A14: ldrb       r1, [r0]                      
  0x08043A16: ldr        r0, [sp, #4]                  
  0x08043A18: strb       r1, [r0]                      
  0x08043A1A: add        sp, #0xc                      
  0x08043A1C: pop        {r3, r4, r5}                  
  0x08043A1E: mov        r8, r3                        
  0x08043A20: mov        sb, r4                        
  0x08043A22: mov        sl, r5                        
  0x08043A24: pop        {r4, r5, r6, r7}              
  0x08043A26: pop        {r0}                          
  0x08043A28: bx         r0                            