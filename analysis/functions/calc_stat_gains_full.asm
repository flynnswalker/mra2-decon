; Function at 0x0800146C
; 600 instructions traced

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
  0x0800148E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
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
  0x080014B4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080014B8: adds       r2, r0, #0                    
  0x080014BA: lsls       r2, r2, #0x18                 
  0x080014BC: lsrs       r2, r2, #0x18                 
  0x080014BE: adds       r0, r7, #0                    
  0x080014C0: movs       r1, #0xc5                     
  0x080014C2: movs       r3, #0                        
  0x080014C4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080014C8: mov        r0, r8                        
  0x080014CA: movs       r1, #0x6c                     
  0x080014CC: movs       r2, #0                        
  0x080014CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080014D2: adds       r2, r0, #0                    
  0x080014D4: lsls       r2, r2, #0x18                 
  0x080014D6: lsrs       r2, r2, #0x18                 
  0x080014D8: adds       r0, r7, #0                    
  0x080014DA: movs       r1, #0xc6                     
  0x080014DC: movs       r3, #0                        
  0x080014DE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080014E2: mov        r0, r8                        
  0x080014E4: movs       r1, #0                        
  0x080014E6: movs       r2, #0                        
  0x080014E8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080014EC: adds       r2, r0, #0                    
  0x080014EE: adds       r0, r7, #0                    
  0x080014F0: movs       r1, #0xc7                     
  0x080014F2: movs       r3, #0                        
  0x080014F4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080014F8: mov        r0, r8                        
  0x080014FA: movs       r1, #1                        
  0x080014FC: movs       r2, #0                        
  0x080014FE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001502: adds       r2, r0, #0                    
  0x08001504: adds       r0, r7, #0                    
  0x08001506: movs       r1, #0xc8                     
  0x08001508: movs       r3, #0                        
  0x0800150A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800150E: mov        r0, r8                        
  0x08001510: movs       r1, #2                        
  0x08001512: movs       r2, #0                        
  0x08001514: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001518: adds       r2, r0, #0                    
  0x0800151A: adds       r0, r7, #0                    
  0x0800151C: movs       r1, #0xc9                     
  0x0800151E: movs       r3, #0                        
  0x08001520: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001524: mov        r0, r8                        
  0x08001526: movs       r1, #3                        
  0x08001528: movs       r2, #0                        
  0x0800152A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800152E: adds       r2, r0, #0                    
  0x08001530: adds       r0, r7, #0                    
  0x08001532: movs       r1, #0xca                     
  0x08001534: movs       r3, #0                        
  0x08001536: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800153A: mov        r0, r8                        
  0x0800153C: movs       r1, #4                        
  0x0800153E: movs       r2, #0                        
  0x08001540: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001544: adds       r2, r0, #0                    
  0x08001546: adds       r0, r7, #0                    
  0x08001548: movs       r1, #0xcb                     
  0x0800154A: movs       r3, #0                        
  0x0800154C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001550: mov        r0, r8                        
  0x08001552: movs       r1, #5                        
  0x08001554: movs       r2, #0                        
  0x08001556: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800155A: adds       r2, r0, #0                    
  0x0800155C: adds       r0, r7, #0                    
  0x0800155E: movs       r1, #0xcc                     
  0x08001560: movs       r3, #0                        
  0x08001562: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001566: mov        r0, r8                        
  0x08001568: movs       r1, #0x20                     
  0x0800156A: movs       r2, #0                        
  0x0800156C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001570: adds       r2, r0, #0                    
  0x08001572: adds       r0, r7, #0                    
  0x08001574: movs       r1, #0xcd                     
  0x08001576: movs       r3, #0                        
  0x08001578: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800157C: mov        r0, r8                        
  0x0800157E: movs       r1, #0x21                     
  0x08001580: movs       r2, #0                        
  0x08001582: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001586: adds       r2, r0, #0                    
  0x08001588: adds       r0, r7, #0                    
  0x0800158A: movs       r1, #0xce                     
  0x0800158C: movs       r3, #0                        
  0x0800158E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001592: mov        r0, r8                        
  0x08001594: movs       r1, #0x22                     
  0x08001596: movs       r2, #0                        
  0x08001598: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800159C: adds       r2, r0, #0                    
  0x0800159E: adds       r0, r7, #0                    
  0x080015A0: movs       r1, #0xcf                     
  0x080015A2: movs       r3, #0                        
  0x080015A4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080015A8: mov        r0, r8                        
  0x080015AA: movs       r1, #0x23                     
  0x080015AC: movs       r2, #0                        
  0x080015AE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080015B2: adds       r2, r0, #0                    
  0x080015B4: adds       r0, r7, #0                    
  0x080015B6: movs       r1, #0xd0                     
  0x080015B8: movs       r3, #0                        
  0x080015BA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080015BE: mov        r0, r8                        
  0x080015C0: movs       r1, #0x24                     
  0x080015C2: movs       r2, #0                        
  0x080015C4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080015C8: adds       r2, r0, #0                    
  0x080015CA: adds       r0, r7, #0                    
  0x080015CC: movs       r1, #0xd1                     
  0x080015CE: movs       r3, #0                        
  0x080015D0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080015D4: mov        r0, r8                        
  0x080015D6: movs       r1, #0x25                     
  0x080015D8: movs       r2, #0                        
  0x080015DA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080015DE: adds       r2, r0, #0                    
  0x080015E0: adds       r0, r7, #0                    
  0x080015E2: movs       r1, #0xd2                     
  0x080015E4: movs       r3, #0                        
  0x080015E6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
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
  0x08001602: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08001606: adds       r0, r7, #0                    
  0x08001608: movs       r1, #0xce                     
  0x0800160A: movs       r2, #3                        
  0x0800160C: movs       r3, #0                        
  0x0800160E: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08001612: adds       r0, r7, #0                    
  0x08001614: movs       r1, #0xcf                     
  0x08001616: movs       r2, #3                        
  0x08001618: movs       r3, #0                        
  0x0800161A: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x0800161E: adds       r0, r7, #0                    
  0x08001620: movs       r1, #0xd0                     
  0x08001622: movs       r2, #3                        
  0x08001624: movs       r3, #0                        
  0x08001626: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x0800162A: adds       r0, r7, #0                    
  0x0800162C: movs       r1, #0xd1                     
  0x0800162E: movs       r2, #3                        
  0x08001630: movs       r3, #0                        
  0x08001632: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08001636: adds       r0, r7, #0                    
  0x08001638: movs       r1, #0xd2                     
  0x0800163A: movs       r2, #3                        
  0x0800163C: movs       r3, #0                        
  0x0800163E: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08001642: mov        r0, r8                        
  0x08001644: movs       r1, #0x12                     
  0x08001646: movs       r2, #0                        
  0x08001648: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800164C: mov        sb, r0                        
  0x0800164E: cmp        r0, #5                        
  0x08001650: ble        #0x8001656                    
  0x08001652: movs       r0, #5                        
  0x08001654: mov        sb, r0                        
  0x08001656: adds       r0, r7, #0                    
  0x08001658: movs       r1, #0xd3                     
  0x0800165A: mov        r2, sb                        
  0x0800165C: movs       r3, #0                        
  0x0800165E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001662: adds       r0, r7, #0                    
  0x08001664: movs       r1, #0xd4                     
  0x08001666: movs       r2, #3                        
  0x08001668: movs       r3, #0                        
  0x0800166A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800166E: mov        r1, sb                        
  0x08001670: lsls       r0, r1, #2                    
  0x08001672: add        r0, sp, r0                    
  0x08001674: ldr        r2, [r0]                      
  0x08001676: adds       r0, r7, #0                    
  0x08001678: movs       r1, #0xd5                     
  0x0800167A: movs       r3, #0                        
  0x0800167C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001680: mov        r0, r8                        
  0x08001682: movs       r1, #0x1e                     
  0x08001684: movs       r2, #0                        
  0x08001686: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800168A: mov        sl, r0                        
  0x0800168C: mov        r0, r8                        
  0x0800168E: movs       r1, #0x26                     
  0x08001690: movs       r2, #0                        
  0x08001692: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001696: adds       r6, r0, #0                    
  0x08001698: mov        r0, r8                        
  0x0800169A: movs       r1, #0x27                     
  0x0800169C: movs       r2, #0                        
  0x0800169E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016A2: adds       r6, r6, r0                    
  0x080016A4: mov        r0, r8                        
  0x080016A6: movs       r1, #0x28                     
  0x080016A8: movs       r2, #0                        
  0x080016AA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016AE: adds       r6, r6, r0                    
  0x080016B0: mov        r0, r8                        
  0x080016B2: movs       r1, #0x29                     
  0x080016B4: movs       r2, #0                        
  0x080016B6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016BA: adds       r6, r6, r0                    
  0x080016BC: mov        r0, r8                        
  0x080016BE: movs       r1, #0x2a                     
  0x080016C0: movs       r2, #0                        
  0x080016C2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016C6: adds       r6, r6, r0                    
  0x080016C8: mov        r0, r8                        
  0x080016CA: movs       r1, #0x2b                     
  0x080016CC: movs       r2, #0                        
  0x080016CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016D2: adds       r6, r6, r0                    
  0x080016D4: mov        r0, r8                        
  0x080016D6: movs       r1, #0x20                     
  0x080016D8: movs       r2, #0                        
  0x080016DA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016DE: adds       r5, r0, #0                    
  0x080016E0: mov        r0, r8                        
  0x080016E2: movs       r1, #0x21                     
  0x080016E4: movs       r2, #0                        
  0x080016E6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016EA: adds       r5, r5, r0                    
  0x080016EC: mov        r0, r8                        
  0x080016EE: movs       r1, #0x22                     
  0x080016F0: movs       r2, #0                        
  0x080016F2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080016F6: adds       r5, r5, r0                    
  0x080016F8: mov        r0, r8                        
  0x080016FA: movs       r1, #0x23                     
  0x080016FC: movs       r2, #0                        
  0x080016FE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001702: adds       r5, r5, r0                    
  0x08001704: mov        r0, r8                        
  0x08001706: movs       r1, #0x24                     
  0x08001708: movs       r2, #0                        
  0x0800170A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800170E: adds       r5, r5, r0                    
  0x08001710: mov        r0, r8                        
  0x08001712: movs       r1, #0x25                     
  0x08001714: movs       r2, #0                        
  0x08001716: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800171A: adds       r5, r5, r0                    
  0x0800171C: mov        r0, sl                        
  0x0800171E: subs       r0, #0x32                     
  0x08001720: movs       r1, #0x19                     
  0x08001722: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08001726: adds       r4, r0, #0                    
  0x08001728: adds       r6, r6, r5                    
  0x0800172A: adds       r0, r6, #0                    
  0x0800172C: movs       r1, #0x18                     
  0x0800172E: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08001732: adds       r4, r4, r0                    
  0x08001734: add        r4, sb                        
  0x08001736: subs       r2, r4, #2                    
  0x08001738: cmp        r2, #0                        
  0x0800173A: bgt        #0x800173e                    
  0x0800173C: movs       r2, #1                        
  0x0800173E: cmp        r2, #6                        
  0x08001740: ble        #0x8001744                    
  0x08001742: movs       r2, #6                        
  0x08001744: adds       r0, r7, #0                    
  0x08001746: movs       r1, #0xd6                     
  0x08001748: movs       r3, #0                        
  0x0800174A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800174E: movs       r4, #0                        
  0x08001750: adds       r0, r7, #0                    
  0x08001752: movs       r1, #0xd7                     
  0x08001754: movs       r2, #0                        
  0x08001756: adds       r3, r4, #0                    
  0x08001758: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800175C: adds       r4, #1                        
  0x0800175E: cmp        r4, #0xb                      
  0x08001760: bls        #0x8001750                    
  0x08001762: mov        r0, r8                        
  0x08001764: movs       r1, #0x2f                     
  0x08001766: movs       r2, #0                        
  0x08001768: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800176C: adds       r2, r0, #0                    
  0x0800176E: ldr        r0, [sp, #0x18]               
  0x08001770: mov        r1, sl                        
  0x08001772: bl         #0x8002a5c                    
  0x08001776: adds       r2, r0, #0                    
  0x08001778: adds       r0, r7, #0                    
  0x0800177A: movs       r1, #0xee                     
  0x0800177C: movs       r3, #0                        
  0x0800177E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001782: mov        r0, r8                        
  0x08001784: movs       r1, #0x38                     
  0x08001786: movs       r2, #0                        
  0x08001788: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800178C: adds       r4, r0, #0                    
  0x0800178E: adds       r0, r7, #0                    
  0x08001790: movs       r1, #0xef                     
  0x08001792: adds       r2, r4, #0                    
  0x08001794: movs       r3, #0                        
  0x08001796: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800179A: mov        r0, r8                        
  0x0800179C: movs       r1, #0x39                     
  0x0800179E: movs       r2, #0                        
  0x080017A0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080017A4: adds       r6, r0, #0                    
  0x080017A6: adds       r0, r7, #0                    
  0x080017A8: movs       r1, #0xf0                     
  0x080017AA: adds       r2, r6, #0                    
  0x080017AC: movs       r3, #0                        
  0x080017AE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080017B2: mov        r0, r8                        
  0x080017B4: movs       r1, #0x3b                     
  0x080017B6: movs       r2, #0                        
  0x080017B8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080017BC: adds       r2, r0, #0                    
  0x080017BE: adds       r0, r7, #0                    
  0x080017C0: movs       r1, #0xf1                     
  0x080017C2: movs       r3, #0                        
  0x080017C4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080017C8: mov        r0, r8                        
  0x080017CA: movs       r1, #0x3c                     
  0x080017CC: movs       r2, #0                        
  0x080017CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080017D2: adds       r2, r0, #0                    
  0x080017D4: adds       r0, r7, #0                    
  0x080017D6: movs       r1, #0xf2                     
  0x080017D8: movs       r3, #0                        
  0x080017DA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080017DE: mov        r0, r8                        
  0x080017E0: movs       r1, #0x16                     
  0x080017E2: movs       r2, #0                        
  0x080017E4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080017E8: lsls       r0, r0, #0x10                 
  0x080017EA: lsrs       r5, r0, #0x10                 
  0x080017EC: cmp        r4, #0                        
  0x080017EE: beq        #0x8001808                    
  0x080017F0: movs       r0, #0x64                     
  0x080017F2: muls       r0, r6, r0                    
  0x080017F4: adds       r1, r4, #0                    
  0x080017F6: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x080017FA: adds       r6, r0, #0                    
  0x080017FC: b          #0x800180a                    
  0x08001808: movs       r6, #0                        
  0x0800180A: mov        r0, r8                        
  0x0800180C: movs       r1, #0x1f                     
  0x0800180E: movs       r2, #0                        
  0x08001810: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001814: adds       r4, r0, #0                    
  0x08001816: mov        r0, r8                        
  0x08001818: movs       r1, #0x12                     
  0x0800181A: movs       r2, #0                        
  0x0800181C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001820: str        r0, [sp, #0x18]               
  0x08001822: adds       r0, r5, #0                    
  0x08001824: ldr        r1, [sp, #0x18]               
  0x08001826: adds       r2, r6, #0                    
  0x08001828: adds       r3, r4, #0                    
  0x0800182A: bl         #0x8002a98                    
  0x0800182E: lsls       r0, r0, #0x10                 
  0x08001830: lsrs       r5, r0, #0x10                 
  0x08001832: adds       r0, r7, #0                    
  0x08001834: movs       r1, #0xd8                     
  0x08001836: adds       r2, r5, #0                    
  0x08001838: movs       r3, #0                        
  0x0800183A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800183E: adds       r0, r7, #0                    
  0x08001840: movs       r1, #0xd9                     
  0x08001842: adds       r2, r5, #0                    
  0x08001844: movs       r3, #0                        
  0x08001846: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800184A: adds       r0, r7, #0                    
  0x0800184C: movs       r1, #0xda                     
  0x0800184E: movs       r2, #0                        
  0x08001850: movs       r3, #0                        
  0x08001852: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001856: ldr        r0, [sp, #0x1c]               
  0x08001858: cmp        r0, #0                        
  0x0800185A: bge        #0x800185e                    
  0x0800185C: adds       r0, #3                        
  0x0800185E: asrs       r0, r0, #2                    
  0x08001860: lsls       r0, r0, #2                    
  0x08001862: ldr        r2, [sp, #0x1c]               
  0x08001864: subs       r0, r2, r0                    
  0x08001866: movs       r1, #0x63                     
  0x08001868: subs       r2, r1, r0                    
  0x0800186A: adds       r0, r7, #0                    
  0x0800186C: movs       r1, #0xdb                     
  0x0800186E: movs       r3, #0                        
  0x08001870: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001874: adds       r0, r7, #0                    
  0x08001876: movs       r1, #0xdc                     
  0x08001878: movs       r2, #0                        
  0x0800187A: movs       r3, #0                        
  0x0800187C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001880: mov        r0, r8                        
  0x08001882: movs       r1, #0xc                      
  0x08001884: movs       r2, #0                        
  0x08001886: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800188A: adds       r2, r0, #0                    
  0x0800188C: adds       r0, r7, #0                    
  0x0800188E: movs       r1, #0xdd                     
  0x08001890: movs       r3, #0                        
  0x08001892: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001896: mov        r0, r8                        
  0x08001898: movs       r1, #0x2f                     
  0x0800189A: movs       r2, #0                        
  0x0800189C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080018A0: adds       r2, r0, #0                    
  0x080018A2: adds       r0, r7, #0                    
  0x080018A4: movs       r1, #0xde                     
  0x080018A6: movs       r3, #0                        
  0x080018A8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080018AC: movs       r4, #0                        
  0x080018AE: adds       r0, r7, #0                    
  0x080018B0: movs       r1, #0xe0                     
  0x080018B2: movs       r2, #0xff                     
  0x080018B4: adds       r3, r4, #0                    
  0x080018B6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080018BA: adds       r4, #1                        
  0x080018BC: cmp        r4, #5                        
  0x080018BE: bls        #0x80018ae                    
  0x080018C0: movs       r4, #0                        
  0x080018C2: mov        r0, r8                        
  0x080018C4: movs       r1, #0x4b                     
  0x080018C6: adds       r2, r4, #0                    
  0x080018C8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080018CC: adds       r2, r0, #0                    
  0x080018CE: adds       r0, r7, #0                    
  0x080018D0: movs       r1, #0xe0                     
  0x080018D2: adds       r3, r4, #0                    
  0x080018D4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080018D8: adds       r4, #1                        
  0x080018DA: cmp        r4, #5                        
  0x080018DC: bls        #0x80018c2                    
  0x080018DE: mov        r0, r8                        
  0x080018E0: movs       r1, #0x3e                     
  0x080018E2: movs       r2, #0                        
  0x080018E4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080018E8: adds       r2, r0, #1                    
  0x080018EA: cmp        r2, #0xa                      
  0x080018EC: bls        #0x80018f0                    
  0x080018EE: movs       r2, #0xa                      
  0x080018F0: adds       r0, r7, #0                    
  0x080018F2: movs       r1, #0xe1                     
  0x080018F4: movs       r3, #0                        
  0x080018F6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080018FA: mov        r0, r8                        
  0x080018FC: movs       r1, #0x3f                     
  0x080018FE: movs       r2, #0                        
  0x08001900: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001904: adds       r2, r0, #1                    
  0x08001906: cmp        r2, #0xa                      
  0x08001908: bls        #0x800190c                    
  0x0800190A: movs       r2, #0xa                      
  0x0800190C: adds       r0, r7, #0                    
  0x0800190E: movs       r1, #0xe2                     
  0x08001910: movs       r3, #0                        
  0x08001912: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001916: mov        r0, r8                        
  0x08001918: movs       r1, #0x40                     
  0x0800191A: movs       r2, #0                        
  0x0800191C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001920: adds       r2, r0, #1                    
  0x08001922: cmp        r2, #0xa                      
  0x08001924: bls        #0x8001928                    
  0x08001926: movs       r2, #0xa                      
  0x08001928: adds       r0, r7, #0                    
  0x0800192A: movs       r1, #0xe3                     
  0x0800192C: movs       r3, #0                        
  0x0800192E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001932: mov        r0, r8                        
  0x08001934: movs       r1, #0x41                     
  0x08001936: movs       r2, #0                        
  0x08001938: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800193C: adds       r2, r0, #1                    
  0x0800193E: cmp        r2, #0xa                      
  0x08001940: bls        #0x8001944                    
  0x08001942: movs       r2, #0xa                      
  0x08001944: adds       r0, r7, #0                    
  0x08001946: movs       r1, #0xe4                     
  0x08001948: movs       r3, #0                        
  0x0800194A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800194E: mov        r0, r8                        
  0x08001950: movs       r1, #0x42                     
  0x08001952: movs       r2, #0                        
  0x08001954: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001958: adds       r2, r0, #1                    
  0x0800195A: cmp        r2, #0xa                      
  0x0800195C: bls        #0x8001960                    
  0x0800195E: movs       r2, #0xa                      
  0x08001960: adds       r0, r7, #0                    
  0x08001962: movs       r1, #0xe5                     
  0x08001964: movs       r3, #0                        
  0x08001966: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800196A: mov        r0, r8                        
  0x0800196C: movs       r1, #0x43                     
  0x0800196E: movs       r2, #0                        
  0x08001970: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001974: adds       r2, r0, #1                    
  0x08001976: cmp        r2, #0xa                      
  0x08001978: bls        #0x800197c                    
  0x0800197A: movs       r2, #0xa                      
  0x0800197C: adds       r0, r7, #0                    
  0x0800197E: movs       r1, #0xe6                     
  0x08001980: movs       r3, #0                        
  0x08001982: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08001986: mov        r0, r8                        
  0x08001988: movs       r1, #0x44                     
  0x0800198A: movs       r2, #0                        
  0x0800198C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08001990: adds       r2, r0, #1                    
  0x08001992: cmp        r2, #0xa                      
  0x08001994: bls        #0x8001998                    
  0x08001996: movs       r2, #0xa                      
  0x08001998: adds       r0, r7, #0                    
  0x0800199A: movs       r1, #0xe7                     
  0x0800199C: movs       r3, #0                        
  0x0800199E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080019A2: mov        r0, r8                        
  0x080019A4: movs       r1, #0x45                     
  0x080019A6: movs       r2, #0                        
  0x080019A8: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080019AC: adds       r2, r0, #1                    
  0x080019AE: cmp        r2, #0xa                      
  0x080019B0: bls        #0x80019b4                    
  0x080019B2: movs       r2, #0xa                      
  0x080019B4: adds       r0, r7, #0                    
  0x080019B6: movs       r1, #0xe8                     
  0x080019B8: movs       r3, #0                        
  0x080019BA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080019BE: mov        r0, r8                        
  0x080019C0: movs       r1, #0x46                     
  0x080019C2: movs       r2, #0                        
  0x080019C4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080019C8: adds       r2, r0, #1                    
  0x080019CA: cmp        r2, #0xa                      
  0x080019CC: bls        #0x80019d0                    
  0x080019CE: movs       r2, #0xa                      
  0x080019D0: adds       r0, r7, #0                    
  0x080019D2: movs       r1, #0xe9                     
  0x080019D4: movs       r3, #0                        
  0x080019D6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080019DA: mov        r0, r8                        
  0x080019DC: movs       r1, #0x47                     
  0x080019DE: movs       r2, #0                        
  0x080019E0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080019E4: adds       r2, r0, #1                    
  0x080019E6: cmp        r2, #0xa                      
  0x080019E8: bls        #0x80019ec                    
  0x080019EA: movs       r2, #0xa                      
  0x080019EC: adds       r0, r7, #0                    
  0x080019EE: movs       r1, #0xea                     
  0x080019F0: movs       r3, #0                        
  0x080019F2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080019F6: mov        r0, r8                        
  0x080019F8: movs       r1, #0x48                     
  0x080019FA: movs       r2, #0                        
  0x080019FC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)