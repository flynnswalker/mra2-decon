; Function at 0x0800146C
; 200 instructions traced

  0x0800146C: push       {r4, r5, r6, r7, lr}          
  0x0800146E: mov        r7, sl                        
  0x08001470: mov        r6, sb                        
  0x08001472: mov        r5, r8                        
  0x08001474: push       {r5, r6, r7}                  
  0x08001476: sub        sp, #0x20                     
  0x08001478: adds       r7, r0, #0                    
  0x0800147A: mov        r8, r1                        
  0x0800147C: mov        r1, sp                        
  0x0800147E: ldr        r0, [pc, #0x380]                ; = 0x081C7F10 
  0x08001480: ldm        r0!, {r2, r3, r4}             
  0x08001482: stm        r1!, {r2, r3, r4}             
  0x08001484: ldm        r0!, {r2, r3, r4}             
  0x08001486: stm        r1!, {r2, r3, r4}             
  0x08001488: ldr        r0, [pc, #0x378]                ; = 0x02002B24 WRAM_PLAYER_STATE
  0x0800148A: movs       r1, #0xac                     
  0x0800148C: movs       r2, #0                        
  0x0800148E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[172]
  0x08001492: str        r0, [sp, #0x1c]               
  0x08001494: adds       r0, r7, #0                    
  0x08001496: movs       r1, #0xc4                     
  0x08001498: bl         #0x80035f8                    
  0x0800149C: adds       r4, r0, #0                    
  0x0800149E: mov        r0, r8                        
  0x080014A0: movs       r1, #0x63                     
  0x080014A2: bl         #0x80035f8                    
  0x080014A6: adds       r1, r0, #0                    
  0x080014A8: adds       r0, r4, #0                    
  0x080014AA: bl         #0x80036d4                    
  0x080014AE: mov        r0, r8                        
  0x080014B0: movs       r1, #0x6b                     
  0x080014B2: movs       r2, #0                        
  0x080014B4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_107 (offset 0x0104)
  0x080014B8: adds       r2, r0, #0                    
  0x080014BA: lsls       r2, r2, #0x18                 
  0x080014BC: lsrs       r2, r2, #0x18                 
  0x080014BE: adds       r0, r7, #0                    
  0x080014C0: movs       r1, #0xc5                     
  0x080014C2: movs       r3, #0                        
  0x080014C4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[197]
  0x080014C8: mov        r0, r8                        
  0x080014CA: movs       r1, #0x6c                     
  0x080014CC: movs       r2, #0                        
  0x080014CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_108 (offset 0x0105)
  0x080014D2: adds       r2, r0, #0                    
  0x080014D4: lsls       r2, r2, #0x18                 
  0x080014D6: lsrs       r2, r2, #0x18                 
  0x080014D8: adds       r0, r7, #0                    
  0x080014DA: movs       r1, #0xc6                     
  0x080014DC: movs       r3, #0                        
  0x080014DE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[198]
  0x080014E2: mov        r0, r8                        
  0x080014E4: movs       r1, #0                        
  0x080014E6: movs       r2, #0                        
  0x080014E8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_pow (offset 0x0068)
  0x080014EC: adds       r2, r0, #0                    
  0x080014EE: adds       r0, r7, #0                    
  0x080014F0: movs       r1, #0xc7                     
  0x080014F2: movs       r3, #0                        
  0x080014F4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[199]
  0x080014F8: mov        r0, r8                        
  0x080014FA: movs       r1, #1                        
  0x080014FC: movs       r2, #0                        
  0x080014FE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_int (offset 0x006A)
  0x08001502: adds       r2, r0, #0                    
  0x08001504: adds       r0, r7, #0                    
  0x08001506: movs       r1, #0xc8                     
  0x08001508: movs       r3, #0                        
  0x0800150A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[200]
  0x0800150E: mov        r0, r8                        
  0x08001510: movs       r1, #2                        
  0x08001512: movs       r2, #0                        
  0x08001514: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_ski (offset 0x006C)
  0x08001518: adds       r2, r0, #0                    
  0x0800151A: adds       r0, r7, #0                    
  0x0800151C: movs       r1, #0xc9                     
  0x0800151E: movs       r3, #0                        
  0x08001520: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[201]
  0x08001524: mov        r0, r8                        
  0x08001526: movs       r1, #3                        
  0x08001528: movs       r2, #0                        
  0x0800152A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_spd (offset 0x006E)
  0x0800152E: adds       r2, r0, #0                    
  0x08001530: adds       r0, r7, #0                    
  0x08001532: movs       r1, #0xca                     
  0x08001534: movs       r3, #0                        
  0x08001536: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[202]
  0x0800153A: mov        r0, r8                        
  0x0800153C: movs       r1, #4                        
  0x0800153E: movs       r2, #0                        
  0x08001540: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_def (offset 0x0070)
  0x08001544: adds       r2, r0, #0                    
  0x08001546: adds       r0, r7, #0                    
  0x08001548: movs       r1, #0xcb                     
  0x0800154A: movs       r3, #0                        
  0x0800154C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[203]
  0x08001550: mov        r0, r8                        
  0x08001552: movs       r1, #5                        
  0x08001554: movs       r2, #0                        
  0x08001556: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> stat_lif (offset 0x0072)
  0x0800155A: adds       r2, r0, #0                    
  0x0800155C: adds       r0, r7, #0                    
  0x0800155E: movs       r1, #0xcc                     
  0x08001560: movs       r3, #0                        
  0x08001562: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[204]
  0x08001566: mov        r0, r8                        
  0x08001568: movs       r1, #0x20                     
  0x0800156A: movs       r2, #0                        
  0x0800156C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_32 (offset 0x00A5)
  0x08001570: adds       r2, r0, #0                    
  0x08001572: adds       r0, r7, #0                    
  0x08001574: movs       r1, #0xcd                     
  0x08001576: movs       r3, #0                        
  0x08001578: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[205]
  0x0800157C: mov        r0, r8                        
  0x0800157E: movs       r1, #0x21                     
  0x08001580: movs       r2, #0                        
  0x08001582: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_33 (offset 0x00A6)
  0x08001586: adds       r2, r0, #0                    
  0x08001588: adds       r0, r7, #0                    
  0x0800158A: movs       r1, #0xce                     
  0x0800158C: movs       r3, #0                        
  0x0800158E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[206]
  0x08001592: mov        r0, r8                        
  0x08001594: movs       r1, #0x22                     
  0x08001596: movs       r2, #0                        
  0x08001598: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_34 (offset 0x00A7)
  0x0800159C: adds       r2, r0, #0                    
  0x0800159E: adds       r0, r7, #0                    
  0x080015A0: movs       r1, #0xcf                     
  0x080015A2: movs       r3, #0                        
  0x080015A4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[207]
  0x080015A8: mov        r0, r8                        
  0x080015AA: movs       r1, #0x23                     
  0x080015AC: movs       r2, #0                        
  0x080015AE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_35 (offset 0x00A8)
  0x080015B2: adds       r2, r0, #0                    
  0x080015B4: adds       r0, r7, #0                    
  0x080015B6: movs       r1, #0xd0                     
  0x080015B8: movs       r3, #0                        
  0x080015BA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[208]
  0x080015BE: mov        r0, r8                        
  0x080015C0: movs       r1, #0x24                     
  0x080015C2: movs       r2, #0                        
  0x080015C4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_36 (offset 0x00A9)
  0x080015C8: adds       r2, r0, #0                    
  0x080015CA: adds       r0, r7, #0                    
  0x080015CC: movs       r1, #0xd1                     
  0x080015CE: movs       r3, #0                        
  0x080015D0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[209]
  0x080015D4: mov        r0, r8                        
  0x080015D6: movs       r1, #0x25                     
  0x080015D8: movs       r2, #0                        
  0x080015DA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_37 (offset 0x00AA)
  0x080015DE: adds       r2, r0, #0                    
  0x080015E0: adds       r0, r7, #0                    
  0x080015E2: movs       r1, #0xd2                     
  0x080015E4: movs       r3, #0                        
  0x080015E6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[210]
  0x080015EA: mov        r0, r8                        
  0x080015EC: movs       r1, #0x2e                     
  0x080015EE: bl         #0x800d3a8                    
  0x080015F2: movs       r1, #1                        
  0x080015F4: rsbs       r1, r1, #0                    
  0x080015F6: cmp        r0, r1                        
  0x080015F8: beq        #0x8001642                    
  0x080015FA: adds       r0, r7, #0                    
  0x080015FC: movs       r1, #0xcd                     
  0x080015FE: movs       r2, #3                        
  0x08001600: movs       r3, #0                        
  0x08001602: bl         #0x80035e4                    
  0x08001606: adds       r0, r7, #0                    
  0x08001608: movs       r1, #0xce                     
  0x0800160A: movs       r2, #3                        
  0x0800160C: movs       r3, #0                        
  0x0800160E: bl         #0x80035e4                    
  0x08001612: adds       r0, r7, #0                    
  0x08001614: movs       r1, #0xcf                     
  0x08001616: movs       r2, #3                        
  0x08001618: movs       r3, #0                        
  0x0800161A: bl         #0x80035e4                    
  0x0800161E: adds       r0, r7, #0                    
  0x08001620: movs       r1, #0xd0                     
  0x08001622: movs       r2, #3                        
  0x08001624: movs       r3, #0                        
  0x08001626: bl         #0x80035e4                    
  0x0800162A: adds       r0, r7, #0                    
  0x0800162C: movs       r1, #0xd1                     
  0x0800162E: movs       r2, #3                        
  0x08001630: movs       r3, #0                        
  0x08001632: bl         #0x80035e4                    
  0x08001636: adds       r0, r7, #0                    
  0x08001638: movs       r1, #0xd2                     
  0x0800163A: movs       r2, #3                        
  0x0800163C: movs       r3, #0                        
  0x0800163E: bl         #0x80035e4                    
  0x08001642: mov        r0, r8                        
  0x08001644: movs       r1, #0x12                     
  0x08001646: movs       r2, #0                        
  0x08001648: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_18 (offset 0x0088)