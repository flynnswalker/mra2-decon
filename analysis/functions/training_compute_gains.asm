; Function at 0x08020514
; 192 instructions traced

  0x08020514: push       {r4, r5, r6, r7, lr}          
  0x08020516: mov        r7, sb                        
  0x08020518: mov        r6, r8                        
  0x0802051A: push       {r6, r7}                      
  0x0802051C: sub        sp, #0x14                     
  0x0802051E: adds       r4, r0, #0                    
  0x08020520: bl         #0x8002530                    
  0x08020524: movs       r1, #0x71                     
  0x08020526: movs       r2, #0                        
  0x08020528: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0802052C: mov        r8, r0                        
  0x0802052E: ldr        r0, [pc, #0x44]                 ; = 0x0200DF80 
  0x08020530: mov        sb, r0                        
  0x08020532: ldr        r0, [pc, #0x44]                 ; = 0x081C97E8 
  0x08020534: ldr        r6, [r0]                      
  0x08020536: ldr        r7, [r0, #4]                  
  0x08020538: adds       r0, r4, #0                    
  0x0802053A: bl         #0x8000310                    
  0x0802053E: cmp        r0, #0                        
  0x08020540: beq        #0x80205ee                    
  0x08020542: ldr        r4, [pc, #0x38]                 ; = 0x0200A398 
  0x08020544: ldr        r0, [r4]                      
  0x08020546: adds       r0, #0x4d                     
  0x08020548: ldrb       r0, [r0]                      
  0x0802054A: cmp        r0, #1                        
  0x0802054C: bne        #0x802055a                    
  0x0802054E: movs       r2, #0x80                     
  0x08020550: lsls       r2, r2, #0x13                 
  0x08020552: ldrh       r1, [r2]                      
  0x08020554: ldr        r0, [pc, #0x28]                 ; = 0x0000FEFF 
  0x08020556: ands       r0, r1                        
  0x08020558: strh       r0, [r2]                      
  0x0802055A: bl         #0x8008258                    
  0x0802055E: bl         #0x8009634                    
  0x08020562: ldr        r0, [r4]                      
  0x08020564: adds       r0, #0x4c                     
  0x08020566: ldrb       r0, [r0]                      
  0x08020568: cmp        r0, #0                        
  0x0802056A: bne        #0x8020584                    
  0x0802056C: mov        r0, r8                        
  0x0802056E: bl         #0x8018578                    
  0x08020572: b          #0x802058a                    
  0x08020584: mov        r0, r8                        
  0x08020586: bl         #0x8018654                    
  0x0802058A: bl         #0x8008390                    
  0x0802058E: movs       r0, #1                        
  0x08020590: bl         #0x8022114                    
  0x08020594: ldr        r5, [pc, #0xb4]                 ; = 0x0200A398 
  0x08020596: ldr        r0, [r5]                      
  0x08020598: adds       r0, #0x46                     
  0x0802059A: movs       r2, #0                        
  0x0802059C: ldrsh      r1, [r0, r2]                  
  0x0802059E: movs       r0, #0xc                      
  0x080205A0: str        r0, [sp]                      
  0x080205A2: movs       r0, #4                        
  0x080205A4: str        r0, [sp, #4]                  
  0x080205A6: movs       r0, #1                        
  0x080205A8: str        r0, [sp, #8]                  
  0x080205AA: movs       r4, #0                        
  0x080205AC: str        r4, [sp, #0xc]                
  0x080205AE: str        r4, [sp, #0x10]               
  0x080205B0: mov        r0, sb                        
  0x080205B2: movs       r2, #1                        
  0x080205B4: movs       r3, #1                        
  0x080205B6: bl         #0x8062db0                    
  0x080205BA: ldr        r1, [r5]                      
  0x080205BC: adds       r0, r1, #0                    
  0x080205BE: adds       r0, #0x48                     
  0x080205C0: movs       r3, #0                        
  0x080205C2: ldrsh      r0, [r0, r3]                  
  0x080205C4: adds       r1, #0x4a                     
  0x080205C6: movs       r2, #0                        
  0x080205C8: ldrsh      r1, [r1, r2]                  
  0x080205CA: bl         #0x80189bc                    
  0x080205CE: ldr        r0, [r5]                      
  0x080205D0: adds       r0, #0x4d                     
  0x080205D2: ldrb       r0, [r0]                      
  0x080205D4: cmp        r0, #1                        
  0x080205D6: bne        #0x80205e8                    
  0x080205D8: movs       r0, #0x80                     
  0x080205DA: lsls       r0, r0, #0x13                 
  0x080205DC: ldrh       r1, [r0]                      
  0x080205DE: movs       r3, #0x80                     
  0x080205E0: lsls       r3, r3, #1                    
  0x080205E2: adds       r2, r3, #0                    
  0x080205E4: orrs       r1, r2                        
  0x080205E6: strh       r1, [r0]                      
  0x080205E8: ldr        r0, [r5]                      
  0x080205EA: adds       r0, #0x4d                     
  0x080205EC: strb       r4, [r0]                      
  0x080205EE: ldr        r4, [pc, #0x5c]                 ; = 0x0200A398 
  0x080205F0: ldr        r0, [r4]                      
  0x080205F2: mov        r2, sb                        
  0x080205F4: ldrh       r1, [r2]                      
  0x080205F6: adds       r0, #0x48                     
  0x080205F8: strh       r1, [r0]                      
  0x080205FA: mov        r0, sb                        
  0x080205FC: movs       r1, #0                        
  0x080205FE: bl         #0x8062bdc                    
  0x08020602: ldr        r2, [r4]                      
  0x08020604: mov        r3, sb                        
  0x08020606: ldrh       r0, [r3]                      
  0x08020608: adds       r1, r2, #0                    
  0x0802060A: adds       r1, #0x46                     
  0x0802060C: strh       r0, [r1]                      
  0x0802060E: ldrh       r0, [r3]                      
  0x08020610: adds       r1, #4                        
  0x08020612: strh       r0, [r1]                      
  0x08020614: adds       r0, r2, #0                    
  0x08020616: adds       r0, #0x48                     
  0x08020618: movs       r2, #0                        
  0x0802061A: ldrsh      r0, [r0, r2]                  
  0x0802061C: movs       r3, #0                        
  0x0802061E: ldrsh      r1, [r1, r3]                  
  0x08020620: bl         #0x80189bc                    
  0x08020624: ldr        r0, [r4]                      
  0x08020626: adds       r1, r0, #0                    
  0x08020628: adds       r1, #0x46                     
  0x0802062A: ldrh       r1, [r1]                      
  0x0802062C: adds       r0, #0x4c                     
  0x0802062E: ldrb       r2, [r0]                      
  0x08020630: mov        r0, r8                        
  0x08020632: bl         #0x8018788                    
  0x08020636: ldr        r0, [pc, #0x18]                 ; = 0x03000718 
  0x08020638: ldrh       r1, [r0, #2]                  
  0x0802063A: movs       r0, #1                        
  0x0802063C: ands       r0, r1                        
  0x0802063E: cmp        r0, #0                        
  0x08020640: beq        #0x8020654                    
  0x08020642: movs       r0, #1                        
  0x08020644: bl         #0x806de2c                    
  0x08020648: movs       r0, #0x1a                     
  0x0802064A: b          #0x80206cc                    
  0x08020654: movs       r0, #0x80                     
  0x08020656: ands       r0, r1                        
  0x08020658: cmp        r0, #0                        
  0x0802065A: beq        #0x802068e                    
  0x0802065C: ldr        r0, [r4]                      
  0x0802065E: adds       r0, #0x4c                     
  0x08020660: ldrb       r0, [r0]                      
  0x08020662: cmp        r0, #0                        
  0x08020664: bne        #0x80206c8                    
  0x08020666: movs       r0, #4                        
  0x08020668: bl         #0x806de2c                    
  0x0802066C: adds       r0, r6, #0                    
  0x0802066E: movs       r1, #0xe                      
  0x08020670: movs       r2, #0xd                      
  0x08020672: bl         #0x8018dbc                    
  0x08020676: adds       r0, r7, #0                    
  0x08020678: movs       r1, #0xe                      
  0x0802067A: movs       r2, #0xd                      
  0x0802067C: bl         #0x8018dbc                    
  0x08020680: mov        r0, r8                        
  0x08020682: bl         #0x8018654                    
  0x08020686: ldr        r0, [r4]                      
  0x08020688: adds       r0, #0x4c                     
  0x0802068A: movs       r1, #1                        
  0x0802068C: b          #0x80206c6                    
  0x0802068E: movs       r0, #0x40                     
  0x08020690: ands       r0, r1                        
  0x08020692: cmp        r0, #0                        
  0x08020694: beq        #0x80206c8                    
  0x08020696: ldr        r0, [r4]                      
  0x08020698: adds       r0, #0x4c                     
  0x0802069A: ldrb       r0, [r0]                      
  0x0802069C: cmp        r0, #1                        
  0x0802069E: bne        #0x80206c8                    
  0x080206A0: movs       r0, #4                        
  0x080206A2: bl         #0x806de2c                    
  0x080206A6: adds       r0, r6, #0                    
  0x080206A8: movs       r1, #0xe                      
  0x080206AA: movs       r2, #0xd                      
  0x080206AC: bl         #0x8018dbc                    
  0x080206B0: adds       r0, r7, #0                    
  0x080206B2: movs       r1, #0xe                      
  0x080206B4: movs       r2, #0xd                      
  0x080206B6: bl         #0x8018dbc                    
  0x080206BA: mov        r0, r8                        
  0x080206BC: bl         #0x8018578                    
  0x080206C0: ldr        r0, [r4]                      
  0x080206C2: adds       r0, #0x4c                     
  0x080206C4: movs       r1, #0                        
  0x080206C6: strb       r1, [r0]                      
  0x080206C8: movs       r0, #0x80                     
  0x080206CA: lsls       r0, r0, #0x18                 
  0x080206CC: add        sp, #0x14                     
  0x080206CE: pop        {r3, r4}                      
  0x080206D0: mov        r8, r3                        
  0x080206D2: mov        sb, r4                        
  0x080206D4: pop        {r4, r5, r6, r7}              
  0x080206D6: pop        {r1}                          
  0x080206D8: bx         r1                            