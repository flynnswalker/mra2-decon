; Function at 0x08022180
; 82 instructions traced

  0x08022180: str        r6, [sp, #4]                  
  0x08022182: str        r7, [sp, #8]                  
  0x08022184: movs       r1, #0                        
  0x08022186: movs       r2, #0                        
  0x08022188: bl         #0x8065f6c                    
  0x0802218C: ldr        r6, [pc, #0xa0]                 ; = 0x0200A398 
  0x0802218E: ldr        r1, [r6]                      
  0x08022190: ldrb       r0, [r1, #0x18]               
  0x08022192: ldrb       r1, [r1, #0x19]               
  0x08022194: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08022198: adds       r4, r0, #0                    
  0x0802219A: lsls       r4, r4, #0x10                 
  0x0802219C: lsrs       r4, r4, #0x10                 
  0x0802219E: movs       r0, #0x2e                     
  0x080221A0: bl         #0x8002c68                    
  0x080221A4: movs       r5, #0x20                     
  0x080221A6: str        r5, [sp]                      
  0x080221A8: mov        r1, sb                        
  0x080221AA: movs       r2, #0x32                     
  0x080221AC: movs       r3, #0x89                     
  0x080221AE: bl         #0x8068158                    
  0x080221B2: adds       r0, r4, #1                    
  0x080221B4: str        r5, [sp]                      
  0x080221B6: ldr        r1, [pc, #0x7c]                 ; = 0xC0000003 
  0x080221B8: str        r1, [sp, #4]                  
  0x080221BA: mov        r1, sb                        
  0x080221BC: movs       r2, #0x50                     
  0x080221BE: movs       r3, #0x89                     
  0x080221C0: bl         #0x8003844                    
  0x080221C4: adds       r0, r4, #0                    
  0x080221C6: bl         #0x8002b88                      ; -> resolve_ptr_16(index)
  0x080221CA: adds       r1, r0, #0                    
  0x080221CC: add        r0, sp, #0xc                  
  0x080221CE: bl         #0x80036d4                    
  0x080221D2: str        r5, [sp]                      
  0x080221D4: add        r0, sp, #0xc                  
  0x080221D6: mov        r1, sb                        
  0x080221D8: movs       r2, #0x82                     
  0x080221DA: movs       r3, #0x89                     
  0x080221DC: bl         #0x8068158                    
  0x080221E0: ldr        r0, [pc, #0x54]                 ; = 0x06016AE0 
  0x080221E2: ldr        r1, [pc, #0x58]                 ; = 0x050002C0 
  0x080221E4: ldr        r3, [r6]                      
  0x080221E6: ldrb       r2, [r3, #0x18]               
  0x080221E8: ldrb       r3, [r3, #0x19]               
  0x080221EA: bl         #0x8008498                    
  0x080221EE: mov        r0, r8                        
  0x080221F0: cmp        r0, #0                        
  0x080221F2: bne        #0x8022248                    
  0x080221F4: ldr        r1, [pc, #0x48]                 ; = 0xFFFF0000 
  0x080221F6: ldr        r0, [sp, #0x24]               
  0x080221F8: ands       r0, r1                        
  0x080221FA: str        r0, [sp, #0x24]               
  0x080221FC: add        r2, sp, #0x24                 
  0x080221FE: strh       r7, [r2, #2]                  
  0x08022200: movs       r0, #0x1e                     
  0x08022202: strh       r0, [r2, #4]                  
  0x08022204: movs       r0, #0x14                     
  0x08022206: strh       r0, [r2, #6]                  
  0x08022208: movs       r0, #0x90                     
  0x0802220A: lsls       r0, r0, #8                    
  0x0802220C: ldr        r1, [pc, #0x34]                 ; = 0x06007000 
  0x0802220E: bl         #0x8009648                    
  0x08022212: b          #0x8022260                    
  0x08022248: add        r2, sp, #0x24                 
  0x0802224A: strh       r7, [r2]                      
  0x0802224C: movs       r0, #0x11                     
  0x0802224E: strh       r0, [r2, #2]                  
  0x08022250: movs       r0, #0x1e                     
  0x08022252: strh       r0, [r2, #4]                  
  0x08022254: movs       r0, #2                        
  0x08022256: strh       r0, [r2, #6]                  
  0x08022258: ldr        r0, [pc, #0x14]                 ; = 0x00009220 
  0x0802225A: ldr        r1, [pc, #0x18]                 ; = 0x06007000 
  0x0802225C: bl         #0x8009648                    
  0x08022260: add        sp, #0x2c                     
  0x08022262: pop        {r3, r4}                      
  0x08022264: mov        r8, r3                        
  0x08022266: mov        sb, r4                        
  0x08022268: pop        {r4, r5, r6, r7}              
  0x0802226A: pop        {r0}                          
  0x0802226C: bx         r0                            