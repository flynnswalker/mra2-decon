; Function at 0x080203D0
; 121 instructions traced

  0x080203D0: push       {r4, r5, r6, lr}              
  0x080203D2: sub        sp, #0xc                      
  0x080203D4: bl         #0x8000310                    
  0x080203D8: cmp        r0, #0                        
  0x080203DA: beq        #0x802044a                    
  0x080203DC: bl         #0x8008258                    
  0x080203E0: bl         #0x80227a4                    
  0x080203E4: movs       r0, #0xca                     
  0x080203E6: bl         #0x806de2c                    
  0x080203EA: ldr        r5, [pc, #0x2c]                 ; = 0x0200A398 
  0x080203EC: ldr        r0, [r5]                      
  0x080203EE: adds       r0, #0x2d                     
  0x080203F0: ldrb       r0, [r0]                      
  0x080203F2: cmp        r0, #1                        
  0x080203F4: bne        #0x802042a                    
  0x080203F6: bl         #0x8002530                    
  0x080203FA: movs       r1, #0xb3                     
  0x080203FC: movs       r2, #0x20                     
  0x080203FE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020402: adds       r4, r0, #0                    
  0x08020404: ldr        r0, [r5]                      
  0x08020406: ldrb       r0, [r0, #0x18]               
  0x08020408: bl         #0x8002928                    
  0x0802040C: cmp        r4, r0                        
  0x0802040E: bge        #0x8020420                    
  0x08020410: ldr        r0, [pc, #8]                  
  0x08020412: bl         #0x80682b4                    
  0x08020416: b          #0x802044a                    
  0x08020420: bl         #0x80212e4                    
  0x08020424: bl         #0x80682b4                    
  0x08020428: b          #0x802044a                    
  0x0802042A: ldr        r0, [pc, #0x90]                 ; = 0x08116B42 
  0x0802042C: bl         #0x80682b4                    
  0x08020430: ldr        r0, [r5]                      
  0x08020432: adds       r0, #4                        
  0x08020434: ldr        r1, [pc, #0x88]                 ; = 0x05000200 
  0x08020436: ldr        r2, [pc, #0x8c]                 ; = 0x081C97C8 
  0x08020438: ldr        r3, [pc, #0x8c]                 ; = 0x081C97A8 
  0x0802043A: movs       r4, #0                        
  0x0802043C: str        r4, [sp]                      
  0x0802043E: movs       r4, #0x10                     
  0x08020440: str        r4, [sp, #4]                  
  0x08020442: movs       r4, #0x1e                     
  0x08020444: str        r4, [sp, #8]                  
  0x08020446: bl         #0x806351c                    
  0x0802044A: movs       r0, #0                        
  0x0802044C: bl         #0x8022774                    
  0x08020450: ldr        r6, [pc, #0x78]                 ; = 0x0200A398 
  0x08020452: ldr        r0, [r6]                      
  0x08020454: adds       r0, #4                        
  0x08020456: bl         #0x806341c                    
  0x0802045A: bl         #0x80682e0                    
  0x0802045E: cmp        r0, #1                        
  0x08020460: bne        #0x8020506                    
  0x08020462: movs       r5, #1                        
  0x08020464: bl         #0x8002530                    
  0x08020468: movs       r1, #0xb3                     
  0x0802046A: movs       r2, #0x20                     
  0x0802046C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020470: adds       r4, r0, #0                    
  0x08020472: ldr        r0, [r6]                      
  0x08020474: ldrb       r0, [r0, #0x18]               
  0x08020476: bl         #0x8002928                    
  0x0802047A: cmp        r4, r0                        
  0x0802047C: bge        #0x8020480                    
  0x0802047E: movs       r5, #0                        
  0x08020480: ldr        r1, [r6]                      
  0x08020482: adds       r0, r1, #0                    
  0x08020484: adds       r0, #0x2d                     
  0x08020486: ldrb       r0, [r0]                      
  0x08020488: cmp        r0, #1                        
  0x0802048A: beq        #0x802048e                    
  0x0802048C: movs       r5, #0                        
  0x0802048E: cmp        r5, #1                        
  0x08020490: bne        #0x80204d8                    
  0x08020492: adds       r0, r1, #0                    
  0x08020494: adds       r0, #0x2c                     
  0x08020496: ldrb       r0, [r0]                      
  0x08020498: cmp        r0, #0                        
  0x0802049A: bne        #0x80204d4                    
  0x0802049C: ldrb       r0, [r1, #0x18]               
  0x0802049E: ldrb       r1, [r1, #0x19]               
  0x080204A0: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x080204A4: adds       r4, r0, #0                    
  0x080204A6: bl         #0x8002530                    
  0x080204AA: movs       r1, #0x8d                     
  0x080204AC: adds       r2, r4, #0                    
  0x080204AE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080204B2: cmp        r0, #0                        
  0x080204B4: bne        #0x80204d0                    
  0x080204B6: movs       r0, #0x17                     
  0x080204B8: b          #0x802050a                    
  0x080204D0: movs       r0, #0x18                     
  0x080204D2: b          #0x802050a                    
  0x080204D4: movs       r0, #9                        
  0x080204D6: b          #0x802050a                    
  0x080204D8: movs       r0, #0                        
  0x080204DA: bl         #0x806439c                    
  0x080204DE: bl         #0x8002530                    
  0x080204E2: movs       r1, #0x71                     
  0x080204E4: movs       r2, #0                        
  0x080204E6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080204EA: movs       r1, #0x18                     
  0x080204EC: movs       r2, #0                        
  0x080204EE: movs       r3, #0                        
  0x080204F0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080204F4: ldr        r0, [r6]                      
  0x080204F6: adds       r0, #0x2c                     
  0x080204F8: ldrb       r0, [r0]                      
  0x080204FA: cmp        r0, #0                        
  0x080204FC: bne        #0x8020502                    
  0x080204FE: movs       r0, #0x1b                     
  0x08020500: b          #0x802050a                    
  0x08020502: movs       r0, #0x1f                     
  0x08020504: b          #0x802050a                    
  0x08020506: movs       r0, #0x80                     
  0x08020508: lsls       r0, r0, #0x18                 
  0x0802050A: add        sp, #0xc                      
  0x0802050C: pop        {r4, r5, r6}                  
  0x0802050E: pop        {r1}                          
  0x08020510: bx         r1                            