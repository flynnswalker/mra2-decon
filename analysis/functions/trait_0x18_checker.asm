; Function at 0x08043610
; 105 instructions traced

  0x08043610: beq        #0x8043622                    
  0x08043612: b          #0x8043624                    
  0x08043622: adds       r6, #5                        
  0x08043624: adds       r0, r7, #0                    
  0x08043626: movs       r1, #0x18                     
  0x08043628: bl         #0x800d3a8                    
  0x0804362C: adds       r4, r0, #0                    
  0x0804362E: movs       r0, #1                        
  0x08043630: rsbs       r0, r0, #0                    
  0x08043632: cmp        r4, r0                        
  0x08043634: bne        #0x8043642                    
  0x08043636: mov        r0, r8                        
  0x08043638: movs       r1, #0x18                     
  0x0804363A: bl         #0x800d3a8                    
  0x0804363E: cmp        r0, r4                        
  0x08043640: beq        #0x804364c                    
  0x08043642: lsls       r0, r6, #1                    
  0x08043644: adds       r0, r0, r6                    
  0x08043646: lsrs       r1, r0, #0x1f                 
  0x08043648: adds       r0, r0, r1                    
  0x0804364A: asrs       r6, r0, #1                    
  0x0804364C: movs       r5, #4                        
  0x0804364E: cmp        r6, #0x63                     
  0x08043650: bgt        #0x8043666                    
  0x08043652: movs       r5, #3                        
  0x08043654: cmp        r6, #0x41                     
  0x08043656: bgt        #0x8043666                    
  0x08043658: movs       r5, #2                        
  0x0804365A: cmp        r6, #0x32                     
  0x0804365C: bgt        #0x8043666                    
  0x0804365E: movs       r5, #0                        
  0x08043660: cmp        r6, #0x28                     
  0x08043662: ble        #0x8043666                    
  0x08043664: movs       r5, #1                        
  0x08043666: adds       r0, r7, #0                    
  0x08043668: movs       r1, #0x12                     
  0x0804366A: movs       r2, #0                        
  0x0804366C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043670: adds       r4, r0, #0                    
  0x08043672: mov        r0, r8                        
  0x08043674: movs       r1, #0x12                     
  0x08043676: movs       r2, #0                        
  0x08043678: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804367C: cmp        r4, r0                        
  0x0804367E: ble        #0x804368c                    
  0x08043680: mov        r0, r8                        
  0x08043682: movs       r1, #0x12                     
  0x08043684: movs       r2, #0                        
  0x08043686: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804368A: b          #0x8043696                    
  0x0804368C: adds       r0, r7, #0                    
  0x0804368E: movs       r1, #0x12                     
  0x08043690: movs       r2, #0                        
  0x08043692: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043696: cmp        r0, #1                        
  0x08043698: bgt        #0x80436a0                    
  0x0804369A: cmp        r5, #3                        
  0x0804369C: ble        #0x80436a0                    
  0x0804369E: movs       r5, #3                        
  0x080436A0: cmp        r5, #1                        
  0x080436A2: bne        #0x80436b4                    
  0x080436A4: movs       r2, #1                        
  0x080436A6: rsbs       r2, r2, #0                    
  0x080436A8: adds       r0, r7, #0                    
  0x080436AA: movs       r1, #0x2f                     
  0x080436AC: movs       r3, #0                        
  0x080436AE: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x080436B2: b          #0x80436c6                    
  0x080436B4: cmp        r5, #0                        
  0x080436B6: bne        #0x80436c6                    
  0x080436B8: movs       r2, #4                        
  0x080436BA: rsbs       r2, r2, #0                    
  0x080436BC: adds       r0, r7, #0                    
  0x080436BE: movs       r1, #0x2f                     
  0x080436C0: movs       r3, #0                        
  0x080436C2: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x080436C6: cmp        r5, #2                        
  0x080436C8: ble        #0x80436d6                    
  0x080436CA: adds       r0, r7, #0                    
  0x080436CC: movs       r1, #0x2f                     
  0x080436CE: movs       r2, #1                        
  0x080436D0: movs       r3, #0                        
  0x080436D2: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x080436D6: ldr        r0, [pc, #0x14]                 ; = 0x0000FFFF 
  0x080436D8: cmp        sl, r0                        
  0x080436DA: beq        #0x80436f0                    
  0x080436DC: adds       r0, r7, #0                    
  0x080436DE: mov        r1, sb                        
  0x080436E0: mov        r2, sl                        
  0x080436E2: bl         #0x8043934                    
  0x080436E6: mov        r5, sl                        
  0x080436E8: b          #0x80436fa                    
  0x080436F0: adds       r0, r7, #0                    
  0x080436F2: mov        r1, sb                        
  0x080436F4: adds       r2, r5, #0                    
  0x080436F6: bl         #0x8043934                    
  0x080436FA: adds       r0, r5, #0                    
  0x080436FC: add        sp, #0x18                     
  0x080436FE: pop        {r3, r4, r5}                  
  0x08043700: mov        r8, r3                        
  0x08043702: mov        sb, r4                        
  0x08043704: mov        sl, r5                        
  0x08043706: pop        {r4, r5, r6, r7}              
  0x08043708: pop        {r1}                          
  0x0804370A: bx         r1                            