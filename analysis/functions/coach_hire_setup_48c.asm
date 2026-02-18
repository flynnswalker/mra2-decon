; Function at 0x0800048C
; 192 instructions traced

  0x0800048C: push       {r4, r5, r6, r7, lr}          
  0x0800048E: mov        r7, sb                        
  0x08000490: mov        r6, r8                        
  0x08000492: push       {r6, r7}                      
  0x08000494: sub        sp, #4                        
  0x08000496: mov        r8, r0                        
  0x08000498: mov        sb, r1                        
  0x0800049A: ldr        r7, [pc, #0xbc]                 ; = 0x02002B24 WRAM_PLAYER_STATE
  0x0800049C: movs       r1, #0x6b                     
  0x0800049E: movs       r2, #0                        
  0x080004A0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080004A4: adds       r4, r0, #0                    
  0x080004A6: mov        r0, r8                        
  0x080004A8: movs       r1, #0x6c                     
  0x080004AA: movs       r2, #0                        
  0x080004AC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080004B0: adds       r1, r0, #0                    
  0x080004B2: adds       r0, r4, #0                    
  0x080004B4: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x080004B8: adds       r6, r0, #0                    
  0x080004BA: bl         #0x8020c5c                      ; -> get_monster_record(index)
  0x080004BE: adds       r4, r0, #0                    
  0x080004C0: adds       r0, r7, #0                    
  0x080004C2: movs       r1, #0x8d                     
  0x080004C4: movs       r2, #1                        
  0x080004C6: adds       r3, r6, #0                    
  0x080004C8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004CC: mov        r0, sb                        
  0x080004CE: cmp        r0, #0                        
  0x080004D0: bne        #0x8000560                    
  0x080004D2: adds       r0, r7, #0                    
  0x080004D4: movs       r1, #0x8e                     
  0x080004D6: movs       r2, #0                        
  0x080004D8: adds       r3, r6, #0                    
  0x080004DA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004DE: adds       r0, r7, #0                    
  0x080004E0: movs       r1, #0x8f                     
  0x080004E2: movs       r2, #0                        
  0x080004E4: adds       r3, r6, #0                    
  0x080004E6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004EA: adds       r0, r7, #0                    
  0x080004EC: movs       r1, #0x90                     
  0x080004EE: movs       r2, #0                        
  0x080004F0: adds       r3, r6, #0                    
  0x080004F2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080004F6: adds       r0, r7, #0                    
  0x080004F8: movs       r1, #0x91                     
  0x080004FA: movs       r2, #0                        
  0x080004FC: adds       r3, r6, #0                    
  0x080004FE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000502: adds       r0, r7, #0                    
  0x08000504: movs       r1, #0x92                     
  0x08000506: movs       r2, #0                        
  0x08000508: adds       r3, r6, #0                    
  0x0800050A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800050E: adds       r0, r7, #0                    
  0x08000510: movs       r1, #0x93                     
  0x08000512: movs       r2, #0                        
  0x08000514: adds       r3, r6, #0                    
  0x08000516: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800051A: adds       r0, r7, #0                    
  0x0800051C: movs       r1, #0x94                     
  0x0800051E: movs       r2, #0                        
  0x08000520: adds       r3, r6, #0                    
  0x08000522: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000526: movs       r5, #0                        
  0x08000528: adds       r4, r5, #0                    
  0x0800052A: adds       r4, #0x95                     
  0x0800052C: mov        r0, r8                        
  0x0800052E: movs       r1, #0x4b                     
  0x08000530: adds       r2, r5, #0                    
  0x08000532: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000536: adds       r2, r0, #0                    
  0x08000538: adds       r0, r7, #0                    
  0x0800053A: adds       r1, r4, #0                    
  0x0800053C: adds       r3, r6, #0                    
  0x0800053E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000542: adds       r5, #1                        
  0x08000544: cmp        r5, #3                        
  0x08000546: ble        #0x8000528                    
  0x08000548: ldr        r2, [pc, #0x10]                 ; = 0x081C7F06 
  0x0800054A: str        r6, [sp]                      
  0x0800054C: adds       r0, r7, #0                    
  0x0800054E: movs       r1, #0x99                     
  0x08000550: movs       r3, #8                        
  0x08000552: bl         #0x800363c                    
  0x08000556: b          #0x8000646                    
  0x08000560: mov        r0, r8                        
  0x08000562: movs       r1, #0                        
  0x08000564: movs       r2, #0                        
  0x08000566: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800056A: adds       r2, r0, #0                    
  0x0800056C: ldrb       r0, [r4, #2]                  
  0x0800056E: subs       r2, r2, r0                    
  0x08000570: adds       r0, r7, #0                    
  0x08000572: movs       r1, #0x8e                     
  0x08000574: adds       r3, r6, #0                    
  0x08000576: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800057A: mov        r0, r8                        
  0x0800057C: movs       r1, #1                        
  0x0800057E: movs       r2, #0                        
  0x08000580: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000584: adds       r2, r0, #0                    
  0x08000586: ldrb       r0, [r4, #3]                  
  0x08000588: subs       r2, r2, r0                    
  0x0800058A: adds       r0, r7, #0                    
  0x0800058C: movs       r1, #0x8f                     
  0x0800058E: adds       r3, r6, #0                    
  0x08000590: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000594: mov        r0, r8                        
  0x08000596: movs       r1, #2                        
  0x08000598: movs       r2, #0                        
  0x0800059A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800059E: adds       r2, r0, #0                    
  0x080005A0: ldrb       r0, [r4, #4]                  
  0x080005A2: subs       r2, r2, r0                    
  0x080005A4: adds       r0, r7, #0                    
  0x080005A6: movs       r1, #0x90                     
  0x080005A8: adds       r3, r6, #0                    
  0x080005AA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080005AE: mov        r0, r8                        
  0x080005B0: movs       r1, #3                        
  0x080005B2: movs       r2, #0                        
  0x080005B4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080005B8: adds       r2, r0, #0                    
  0x080005BA: ldrb       r0, [r4, #5]                  
  0x080005BC: subs       r2, r2, r0                    
  0x080005BE: adds       r0, r7, #0                    
  0x080005C0: movs       r1, #0x91                     
  0x080005C2: adds       r3, r6, #0                    
  0x080005C4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080005C8: mov        r0, r8                        
  0x080005CA: movs       r1, #4                        
  0x080005CC: movs       r2, #0                        
  0x080005CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080005D2: adds       r2, r0, #0                    
  0x080005D4: ldrb       r0, [r4, #6]                  
  0x080005D6: subs       r2, r2, r0                    
  0x080005D8: adds       r0, r7, #0                    
  0x080005DA: movs       r1, #0x92                     
  0x080005DC: adds       r3, r6, #0                    
  0x080005DE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080005E2: mov        r0, r8                        
  0x080005E4: movs       r1, #5                        
  0x080005E6: movs       r2, #0                        
  0x080005E8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080005EC: adds       r2, r0, #0                    
  0x080005EE: ldrb       r0, [r4, #7]                  
  0x080005F0: subs       r2, r2, r0                    
  0x080005F2: adds       r0, r7, #0                    
  0x080005F4: movs       r1, #0x93                     
  0x080005F6: adds       r3, r6, #0                    
  0x080005F8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080005FC: mov        r0, r8                        
  0x080005FE: movs       r1, #0x17                     
  0x08000600: movs       r2, #0                        
  0x08000602: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000606: adds       r2, r0, #0                    
  0x08000608: ldrh       r0, [r4, #0x10]               
  0x0800060A: subs       r2, r2, r0                    
  0x0800060C: adds       r0, r7, #0                    
  0x0800060E: movs       r1, #0x94                     
  0x08000610: adds       r3, r6, #0                    
  0x08000612: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000616: movs       r5, #0                        
  0x08000618: adds       r4, r5, #0                    
  0x0800061A: adds       r4, #0x95                     
  0x0800061C: mov        r0, r8                        
  0x0800061E: movs       r1, #0x4b                     
  0x08000620: adds       r2, r5, #0                    
  0x08000622: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08000626: adds       r2, r0, #0                    
  0x08000628: adds       r0, r7, #0                    
  0x0800062A: adds       r1, r4, #0                    
  0x0800062C: adds       r3, r6, #0                    
  0x0800062E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08000632: adds       r5, #1                        
  0x08000634: cmp        r5, #3                        
  0x08000636: ble        #0x8000618                    
  0x08000638: str        r6, [sp]                      
  0x0800063A: adds       r0, r7, #0                    
  0x0800063C: movs       r1, #0x99                     
  0x0800063E: mov        r2, sb                        
  0x08000640: movs       r3, #8                        
  0x08000642: bl         #0x800363c                    
  0x08000646: add        sp, #4                        
  0x08000648: pop        {r3, r4}                      
  0x0800064A: mov        r8, r3                        
  0x0800064C: mov        sb, r4                        
  0x0800064E: pop        {r4, r5, r6, r7}              
  0x08000650: pop        {r0}                          
  0x08000652: bx         r0                            