; Function at 0x08018654
; 133 instructions traced

  0x08018654: push       {r4, r5, r6, r7, lr}          
  0x08018656: mov        r7, sl                        
  0x08018658: mov        r6, sb                        
  0x0801865A: mov        r5, r8                        
  0x0801865C: push       {r5, r6, r7}                  
  0x0801865E: sub        sp, #0x44                     
  0x08018660: adds       r7, r0, #0                    
  0x08018662: movs       r1, #0x6b                     
  0x08018664: movs       r2, #0                        
  0x08018666: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0801866A: adds       r4, r0, #0                    
  0x0801866C: adds       r0, r7, #0                    
  0x0801866E: movs       r1, #0x6c                     
  0x08018670: movs       r2, #0                        
  0x08018672: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08018676: adds       r1, r0, #0                    
  0x08018678: adds       r0, r4, #0                    
  0x0801867A: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x0801867E: adds       r4, r0, #0                    
  0x08018680: bl         #0x8018c10                    
  0x08018684: adds       r0, r4, #0                    
  0x08018686: bl         #0x8018914                    
  0x0801868A: adds       r0, r4, #0                    
  0x0801868C: bl         #0x8018e00                    
  0x08018690: movs       r5, #0                        
  0x08018692: add        r4, sp, #0x3c                 
  0x08018694: movs       r0, #0xb                      
  0x08018696: mov        sl, r0                        
  0x08018698: ldr        r1, [pc, #0x78]                 ; = 0x0000FFFF 
  0x0801869A: mov        sb, r1                        
  0x0801869C: movs       r0, #0x80                     
  0x0801869E: lsls       r0, r0, #0xe                  
  0x080186A0: mov        r8, r0                        
  0x080186A2: add        r6, sp, #0x24                 
  0x080186A4: ldr        r0, [sp, #0x3c]               
  0x080186A6: ldr        r1, [pc, #0x70]                 ; = 0xFFFF0000 
  0x080186A8: ands       r0, r1                        
  0x080186AA: mov        r1, sl                        
  0x080186AC: orrs       r0, r1                        
  0x080186AE: mov        r1, sb                        
  0x080186B0: ands       r0, r1                        
  0x080186B2: mov        r1, r8                        
  0x080186B4: orrs       r0, r1                        
  0x080186B6: str        r0, [sp, #0x3c]               
  0x080186B8: ldr        r0, [r4, #4]                  
  0x080186BA: ldr        r1, [pc, #0x5c]                 ; = 0xFFFF0000 
  0x080186BC: ands       r0, r1                        
  0x080186BE: mov        r1, sl                        
  0x080186C0: orrs       r0, r1                        
  0x080186C2: mov        r1, sb                        
  0x080186C4: ands       r0, r1                        
  0x080186C6: mov        r1, r8                        
  0x080186C8: orrs       r0, r1                        
  0x080186CA: str        r0, [r4, #4]                  
  0x080186CC: adds       r0, r7, #0                    
  0x080186CE: movs       r1, #0x4b                     
  0x080186D0: adds       r2, r5, #0                    
  0x080186D2: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080186D6: adds       r1, r0, #0                    
  0x080186D8: cmp        r1, #0xff                     
  0x080186DA: beq        #0x801871c                    
  0x080186DC: add        r0, sp, #4                    
  0x080186DE: bl         #0x800d45c                    
  0x080186E2: ldr        r1, [sp, #0x1c]               
  0x080186E4: adds       r0, r6, #0                    
  0x080186E6: bl         #0x80036d4                    
  0x080186EA: adds       r0, r4, #0                    
  0x080186EC: adds       r1, r6, #0                    
  0x080186EE: movs       r2, #0x60                     
  0x080186F0: bl         #0x800836c                    
  0x080186F4: ldrh       r2, [r4]                      
  0x080186F6: ldrh       r3, [r4, #2]                  
  0x080186F8: adds       r3, #1                        
  0x080186FA: lsls       r0, r5, #4                    
  0x080186FC: adds       r3, r3, r0                    
  0x080186FE: lsls       r3, r3, #0x10                 
  0x08018700: lsrs       r3, r3, #0x10                 
  0x08018702: movs       r0, #0x20                     
  0x08018704: str        r0, [sp]                      
  0x08018706: adds       r0, r6, #0                    
  0x08018708: movs       r1, #0xc0                     
  0x0801870A: lsls       r1, r1, #0x13                 
  0x0801870C: bl         #0x8068158                    
  0x08018710: b          #0x8018742                    
  0x0801871C: movs       r0, #0x4f                     
  0x0801871E: bl         #0x8002c68                    
  0x08018722: ldrh       r2, [r4, #4]                  
  0x08018724: adds       r2, #0x14                     
  0x08018726: lsls       r2, r2, #0x10                 
  0x08018728: lsrs       r2, r2, #0x10                 
  0x0801872A: ldrh       r3, [r4, #6]                  
  0x0801872C: adds       r3, #1                        
  0x0801872E: lsls       r1, r5, #4                    
  0x08018730: adds       r3, r3, r1                    
  0x08018732: lsls       r3, r3, #0x10                 
  0x08018734: lsrs       r3, r3, #0x10                 
  0x08018736: movs       r1, #0x20                     
  0x08018738: str        r1, [sp]                      
  0x0801873A: movs       r1, #0xc0                     
  0x0801873C: lsls       r1, r1, #0x13                 
  0x0801873E: bl         #0x8068158                    
  0x08018742: adds       r5, #1                        
  0x08018744: cmp        r5, #2                        
  0x08018746: ble        #0x80186a4                    
  0x08018748: movs       r5, #3                        
  0x0801874A: movs       r0, #0x4f                     
  0x0801874C: bl         #0x8002c68                    
  0x08018750: ldrh       r2, [r4, #4]                  
  0x08018752: adds       r2, #0x14                     
  0x08018754: lsls       r2, r2, #0x10                 
  0x08018756: lsrs       r2, r2, #0x10                 
  0x08018758: ldrh       r3, [r4, #6]                  
  0x0801875A: adds       r3, #1                        
  0x0801875C: lsls       r1, r5, #4                    
  0x0801875E: adds       r3, r3, r1                    
  0x08018760: lsls       r3, r3, #0x10                 
  0x08018762: lsrs       r3, r3, #0x10                 
  0x08018764: movs       r1, #0x20                     
  0x08018766: str        r1, [sp]                      
  0x08018768: movs       r1, #0xc0                     
  0x0801876A: lsls       r1, r1, #0x13                 
  0x0801876C: bl         #0x8068158                    
  0x08018770: adds       r5, #1                        
  0x08018772: cmp        r5, #5                        
  0x08018774: ble        #0x801874a                    
  0x08018776: add        sp, #0x44                     
  0x08018778: pop        {r3, r4, r5}                  
  0x0801877A: mov        r8, r3                        
  0x0801877C: mov        sb, r4                        
  0x0801877E: mov        sl, r5                        
  0x08018780: pop        {r4, r5, r6, r7}              
  0x08018782: pop        {r0}                          
  0x08018784: bx         r0                            