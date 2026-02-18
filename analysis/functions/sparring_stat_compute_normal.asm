; Function at 0x08018578
; 91 instructions traced

  0x08018578: push       {r4, r5, r6, r7, lr}          
  0x0801857A: mov        r7, sl                        
  0x0801857C: mov        r6, sb                        
  0x0801857E: mov        r5, r8                        
  0x08018580: push       {r5, r6, r7}                  
  0x08018582: sub        sp, #0xc                      
  0x08018584: adds       r7, r0, #0                    
  0x08018586: movs       r1, #0x6b                     
  0x08018588: movs       r2, #0                        
  0x0801858A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801858E: adds       r4, r0, #0                    
  0x08018590: adds       r0, r7, #0                    
  0x08018592: movs       r1, #0x6c                     
  0x08018594: movs       r2, #0                        
  0x08018596: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801859A: adds       r1, r0, #0                    
  0x0801859C: adds       r0, r4, #0                    
  0x0801859E: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x080185A2: adds       r4, r0, #0                    
  0x080185A4: bl         #0x8018adc                    
  0x080185A8: adds       r0, r4, #0                    
  0x080185AA: bl         #0x8018914                    
  0x080185AE: adds       r0, r4, #0                    
  0x080185B0: bl         #0x8018e00                    
  0x080185B4: ldr        r0, [pc, #0x8c]                 ; = 0xFFFF0000 
  0x080185B6: ands       r5, r0                        
  0x080185B8: movs       r0, #0xb                      
  0x080185BA: orrs       r5, r0                        
  0x080185BC: ldr        r0, [pc, #0x88]                 ; = 0x0000FFFF 
  0x080185BE: ands       r5, r0                        
  0x080185C0: movs       r0, #0x80                     
  0x080185C2: lsls       r0, r0, #0xe                  
  0x080185C4: orrs       r5, r0                        
  0x080185C6: movs       r6, #0                        
  0x080185C8: movs       r0, #0xc0                     
  0x080185CA: lsls       r0, r0, #0x13                 
  0x080185CC: mov        sb, r0                        
  0x080185CE: asrs       r1, r5, #0x10                 
  0x080185D0: adds       r1, #1                        
  0x080185D2: movs       r2, #0x20                     
  0x080185D4: mov        r8, r2                        
  0x080185D6: adds       r0, r5, #4                    
  0x080185D8: lsls       r0, r0, #0x10                 
  0x080185DA: str        r0, [sp, #8]                  
  0x080185DC: adds       r0, r5, #0                    
  0x080185DE: adds       r0, #0x3e                     
  0x080185E0: lsls       r0, r0, #0x10                 
  0x080185E2: mov        sl, r0                        
  0x080185E4: lsls       r5, r1, #0x10                 
  0x080185E6: adds       r0, r6, #0                    
  0x080185E8: adds       r0, #0x28                     
  0x080185EA: bl         #0x8002c68                    
  0x080185EE: lsrs       r4, r5, #0x10                 
  0x080185F0: mov        r3, r8                        
  0x080185F2: str        r3, [sp]                      
  0x080185F4: mov        r1, sb                        
  0x080185F6: ldr        r3, [sp, #8]                  
  0x080185F8: lsrs       r2, r3, #0x10                 
  0x080185FA: adds       r3, r4, #0                    
  0x080185FC: bl         #0x8068158                    
  0x08018600: ldr        r1, [pc, #0x48]                 ; = 0x083EF4D0 
  0x08018602: lsls       r0, r6, #1                    
  0x08018604: adds       r0, r0, r1                    
  0x08018606: movs       r2, #0                        
  0x08018608: ldrsh      r1, [r0, r2]                  
  0x0801860A: adds       r0, r7, #0                    
  0x0801860C: movs       r2, #0                        
  0x0801860E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08018612: mov        r3, r8                        
  0x08018614: str        r3, [sp]                      
  0x08018616: ldr        r1, [pc, #0x38]                 ; = 0x80000003 
  0x08018618: str        r1, [sp, #4]                  
  0x0801861A: mov        r1, sb                        
  0x0801861C: mov        r3, sl                        
  0x0801861E: lsrs       r2, r3, #0x10                 
  0x08018620: adds       r3, r4, #0                    
  0x08018622: bl         #0x8003844                    
  0x08018626: movs       r0, #0x80                     
  0x08018628: lsls       r0, r0, #0xd                  
  0x0801862A: adds       r5, r5, r0                    
  0x0801862C: adds       r6, #1                        
  0x0801862E: cmp        r6, #5                        
  0x08018630: ble        #0x80185e6                    
  0x08018632: add        sp, #0xc                      
  0x08018634: pop        {r3, r4, r5}                  
  0x08018636: mov        r8, r3                        
  0x08018638: mov        sb, r4                        
  0x0801863A: mov        sl, r5                        
  0x0801863C: pop        {r4, r5, r6, r7}              
  0x0801863E: pop        {r0}                          
  0x08018640: bx         r0                            