; Function at 0x080015D0
; 200 instructions traced

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