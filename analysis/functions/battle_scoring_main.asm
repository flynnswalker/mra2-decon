; Function at 0x080432E8
; 410 instructions traced

  0x080432E8: push       {r4, r5, r6, r7, lr}          
  0x080432EA: mov        r7, sl                        
  0x080432EC: mov        r6, sb                        
  0x080432EE: mov        r5, r8                        
  0x080432F0: push       {r5, r6, r7}                  
  0x080432F2: sub        sp, #0x18                     
  0x080432F4: adds       r7, r0, #0                    
  0x080432F6: mov        sb, r1                        
  0x080432F8: lsls       r2, r2, #0x10                 
  0x080432FA: lsrs       r2, r2, #0x10                 
  0x080432FC: mov        sl, r2                        
  0x080432FE: mov        r8, sb                        
  0x08043300: movs       r6, #0                        
  0x08043302: bl         #0x8002530                    
  0x08043306: movs       r1, #0x8c                     
  0x08043308: movs       r2, #1                        
  0x0804330A: movs       r3, #0                        
  0x0804330C: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08043310: adds       r0, r7, #0                    
  0x08043312: movs       r1, #0x2f                     
  0x08043314: movs       r2, #1                        
  0x08043316: movs       r3, #0                        
  0x08043318: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x0804331C: ldr        r4, [pc, #0x34]                 ; = 0x081C9A00 
  0x0804331E: ldr        r3, [pc, #0x38]                 ; = 0x081E9224 
  0x08043320: movs       r0, #0x82                     
  0x08043322: lsls       r0, r0, #1                    
  0x08043324: mov        r2, sb                        
  0x08043326: adds       r1, r2, r0                    
  0x08043328: ldrb       r2, [r1]                      
  0x0804332A: adds       r2, r2, r3                    
  0x0804332C: adds       r0, r7, r0                    
  0x0804332E: ldrb       r0, [r0]                      
  0x08043330: adds       r0, r0, r3                    
  0x08043332: ldrb       r1, [r0]                      
  0x08043334: lsls       r0, r1, #2                    
  0x08043336: adds       r0, r0, r1                    
  0x08043338: ldrb       r2, [r2]                      
  0x0804333A: adds       r0, r0, r2                    
  0x0804333C: adds       r0, r0, r4                    
  0x0804333E: movs       r5, #0                        
  0x08043340: ldrsb      r5, [r0, r5]                  
  0x08043342: adds       r0, r5, #2                    
  0x08043344: cmp        r0, #4                        
  0x08043346: bhi        #0x80433aa                    
  0x08043348: lsls       r0, r0, #2                    
  0x0804334A: ldr        r1, [pc, #0x10]                 ; = 0x08043360 
  0x0804334C: adds       r0, r0, r1                    
  0x0804334E: ldr        r0, [r0]                      
  0x08043350: mov        pc, r0                        
  0x08043352: movs       r0, r0                        
  0x08043354: ldr        r2, [sp]                      
  0x08043356: lsrs       r4, r3, #0x20                 
  0x08043358: str        r2, [sp, #0x90]               
  0x0804335A: lsrs       r6, r3, #0x20                 
  0x0804335C: adds       r3, #0x60                     
  0x0804335E: lsrs       r4, r0, #0x20                 
  0x08043360: adds       r3, #0x74                     
  0x08043362: lsrs       r4, r0, #0x20                 
  0x08043364: adds       r3, #0x80                     
  0x08043366: lsrs       r4, r0, #0x20                 
  0x08043368: adds       r3, #0x8c                     
  0x0804336A: lsrs       r4, r0, #0x20                 
  0x0804336C: adds       r3, #0x98                     
  0x0804336E: lsrs       r4, r0, #0x20                 
  0x08043370: adds       r3, #0xa4                     
  0x08043372: lsrs       r4, r0, #0x20                 
  0x08043374: ldr        r0, [pc, #4]                  
  0x08043376: ldr        r0, [r0]                      
  0x08043378: b          #0x80433a8                    
  0x080433A8: adds       r6, r6, r0                    
  0x080433AA: adds       r0, r7, #0                    
  0x080433AC: movs       r1, #0x2f                     
  0x080433AE: movs       r2, #0                        
  0x080433B0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080433B4: adds       r4, r0, #0                    
  0x080433B6: mov        r0, r8                        
  0x080433B8: movs       r1, #0x2f                     
  0x080433BA: movs       r2, #0                        
  0x080433BC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080433C0: adds       r4, r4, r0                    
  0x080433C2: lsrs       r0, r4, #0x1f                 
  0x080433C4: adds       r4, r4, r0                    
  0x080433C6: asrs       r5, r4, #1                    
  0x080433C8: cmp        r5, #0x18                     
  0x080433CA: bgt        #0x80433dc                    
  0x080433CC: ldr        r0, [pc, #8]                  
  0x080433CE: ldr        r0, [r0]                      
  0x080433D0: b          #0x8043410                    
  0x080433DC: cmp        r5, #0x31                     
  0x080433DE: bgt        #0x80433ec                    
  0x080433E0: ldr        r0, [pc, #4]                  
  0x080433E2: ldr        r0, [r0, #4]                  
  0x080433E4: b          #0x8043410                    
  0x080433EC: cmp        r5, #0x45                     
  0x080433EE: bgt        #0x80433fc                    
  0x080433F0: ldr        r0, [pc, #4]                  
  0x080433F2: ldr        r0, [r0, #8]                  
  0x080433F4: b          #0x8043410                    
  0x080433FC: cmp        r5, #0x59                     
  0x080433FE: bgt        #0x804340c                    
  0x08043400: ldr        r0, [pc, #4]                  
  0x08043402: ldr        r0, [r0, #0xc]                
  0x08043404: b          #0x8043410                    
  0x0804340C: ldr        r0, [pc, #0x2c]                 ; = 0x081C9B10 
  0x0804340E: ldr        r0, [r0, #0x10]               
  0x08043410: adds       r6, r6, r0                    
  0x08043412: adds       r0, r7, #0                    
  0x08043414: movs       r1, #0x32                     
  0x08043416: movs       r2, #0                        
  0x08043418: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804341C: adds       r4, r0, #0                    
  0x0804341E: mov        r0, r8                        
  0x08043420: movs       r1, #0x32                     
  0x08043422: movs       r2, #0                        
  0x08043424: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043428: adds       r4, r4, r0                    
  0x0804342A: lsrs       r0, r4, #0x1f                 
  0x0804342C: adds       r4, r4, r0                    
  0x0804342E: asrs       r5, r4, #1                    
  0x08043430: cmp        r5, #0x18                     
  0x08043432: bgt        #0x8043444                    
  0x08043434: ldr        r0, [pc, #8]                  
  0x08043436: ldr        r0, [r0]                      
  0x08043438: b          #0x8043478                    
  0x08043444: cmp        r5, #0x31                     
  0x08043446: bgt        #0x8043454                    
  0x08043448: ldr        r0, [pc, #4]                  
  0x0804344A: ldr        r0, [r0, #4]                  
  0x0804344C: b          #0x8043478                    
  0x08043454: cmp        r5, #0x45                     
  0x08043456: bgt        #0x8043464                    
  0x08043458: ldr        r0, [pc, #4]                  
  0x0804345A: ldr        r0, [r0, #8]                  
  0x0804345C: b          #0x8043478                    
  0x08043464: cmp        r5, #0x59                     
  0x08043466: bgt        #0x8043474                    
  0x08043468: ldr        r0, [pc, #4]                  
  0x0804346A: ldr        r0, [r0, #0xc]                
  0x0804346C: b          #0x8043478                    
  0x08043474: ldr        r0, [pc, #0x11c]                ; = 0x081C9B24 
  0x08043476: ldr        r0, [r0, #0x10]               
  0x08043478: adds       r6, r6, r0                    
  0x0804347A: adds       r0, r7, #0                    
  0x0804347C: movs       r1, #0                        
  0x0804347E: movs       r2, #0                        
  0x08043480: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043484: adds       r4, r0, #0                    
  0x08043486: mov        r0, r8                        
  0x08043488: movs       r1, #0                        
  0x0804348A: movs       r2, #0                        
  0x0804348C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043490: subs       r4, r4, r0                    
  0x08043492: adds       r0, r4, #0                    
  0x08043494: bl         #0x8043c34                    
  0x08043498: str        r0, [sp]                      
  0x0804349A: adds       r0, r7, #0                    
  0x0804349C: movs       r1, #1                        
  0x0804349E: movs       r2, #0                        
  0x080434A0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434A4: adds       r4, r0, #0                    
  0x080434A6: mov        r0, r8                        
  0x080434A8: movs       r1, #1                        
  0x080434AA: movs       r2, #0                        
  0x080434AC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434B0: subs       r4, r4, r0                    
  0x080434B2: adds       r0, r4, #0                    
  0x080434B4: bl         #0x8043c34                    
  0x080434B8: str        r0, [sp, #4]                  
  0x080434BA: adds       r0, r7, #0                    
  0x080434BC: movs       r1, #2                        
  0x080434BE: movs       r2, #0                        
  0x080434C0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434C4: adds       r4, r0, #0                    
  0x080434C6: mov        r0, r8                        
  0x080434C8: movs       r1, #2                        
  0x080434CA: movs       r2, #0                        
  0x080434CC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434D0: subs       r4, r4, r0                    
  0x080434D2: adds       r0, r4, #0                    
  0x080434D4: bl         #0x8043c34                    
  0x080434D8: str        r0, [sp, #8]                  
  0x080434DA: adds       r0, r7, #0                    
  0x080434DC: movs       r1, #3                        
  0x080434DE: movs       r2, #0                        
  0x080434E0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434E4: adds       r4, r0, #0                    
  0x080434E6: mov        r0, r8                        
  0x080434E8: movs       r1, #3                        
  0x080434EA: movs       r2, #0                        
  0x080434EC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080434F0: subs       r4, r4, r0                    
  0x080434F2: adds       r0, r4, #0                    
  0x080434F4: bl         #0x8043c34                    
  0x080434F8: str        r0, [sp, #0xc]                
  0x080434FA: adds       r0, r7, #0                    
  0x080434FC: movs       r1, #4                        
  0x080434FE: movs       r2, #0                        
  0x08043500: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043504: adds       r4, r0, #0                    
  0x08043506: mov        r0, r8                        
  0x08043508: movs       r1, #4                        
  0x0804350A: movs       r2, #0                        
  0x0804350C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043510: subs       r4, r4, r0                    
  0x08043512: adds       r0, r4, #0                    
  0x08043514: bl         #0x8043c34                    
  0x08043518: str        r0, [sp, #0x10]               
  0x0804351A: adds       r0, r7, #0                    
  0x0804351C: movs       r1, #5                        
  0x0804351E: movs       r2, #0                        
  0x08043520: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043524: adds       r4, r0, #0                    
  0x08043526: mov        r0, r8                        
  0x08043528: movs       r1, #5                        
  0x0804352A: movs       r2, #0                        
  0x0804352C: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043530: subs       r4, r4, r0                    
  0x08043532: adds       r0, r4, #0                    
  0x08043534: bl         #0x8043c34                    
  0x08043538: str        r0, [sp, #0x14]               
  0x0804353A: mov        r4, sp                        
  0x0804353C: movs       r5, #5                        
  0x0804353E: ldr        r0, [r4]                      
  0x08043540: cmp        r0, #0x64                     
  0x08043542: bgt        #0x8043556                    
  0x08043544: subs       r0, #0x64                     
  0x08043546: bl         #0x8043c34                    
  0x0804354A: adds       r2, r6, #1                    
  0x0804354C: lsls       r1, r0, #2                    
  0x0804354E: adds       r1, r1, r0                    
  0x08043550: lsls       r1, r1, #2                    
  0x08043552: asrs       r1, r1, #8                    
  0x08043554: adds       r6, r2, r1                    
  0x08043556: adds       r4, #4                        
  0x08043558: subs       r5, #1                        
  0x0804355A: cmp        r5, #0                        
  0x0804355C: bge        #0x804353e                    
  0x0804355E: ldr        r5, [pc, #0x38]                 ; = 0x081C9A19 
  0x08043560: mov        r0, r8                        
  0x08043562: movs       r1, #0xc                      
  0x08043564: movs       r2, #0                        
  0x08043566: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804356A: adds       r4, r0, #0                    
  0x0804356C: adds       r0, r7, #0                    
  0x0804356E: movs       r1, #0xc                      
  0x08043570: movs       r2, #0                        
  0x08043572: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043576: lsls       r1, r0, #4                    
  0x08043578: subs       r1, r1, r0                    
  0x0804357A: adds       r4, r4, r1                    
  0x0804357C: adds       r4, r4, r5                    
  0x0804357E: movs       r5, #0                        
  0x08043580: ldrsb      r5, [r4, r5]                  
  0x08043582: adds       r0, r5, #2                    
  0x08043584: cmp        r0, #4                        
  0x08043586: bhi        #0x80435ea                    
  0x08043588: lsls       r0, r0, #2                    
  0x0804358A: ldr        r1, [pc, #0x10]                 ; = 0x080435A0 
  0x0804358C: adds       r0, r0, r1                    
  0x0804358E: ldr        r0, [r0]                      
  0x08043590: mov        pc, r0                        
  0x08043592: movs       r0, r0                        
  0x08043594: ldr        r3, [sp, #0x90]               
  0x08043596: lsrs       r4, r3, #0x20                 
  0x08043598: ldr        r2, [sp, #0x64]               
  0x0804359A: lsrs       r4, r3, #0x20                 
  0x0804359C: adds       r5, #0xa0                     
  0x0804359E: lsrs       r4, r0, #0x20                 
  0x080435A0: adds       r5, #0xb4                     
  0x080435A2: lsrs       r4, r0, #0x20                 
  0x080435A4: adds       r5, #0xc0                     
  0x080435A6: lsrs       r4, r0, #0x20                 
  0x080435A8: adds       r5, #0xcc                     
  0x080435AA: lsrs       r4, r0, #0x20                 
  0x080435AC: adds       r5, #0xd8                     
  0x080435AE: lsrs       r4, r0, #0x20                 
  0x080435B0: adds       r5, #0xe4                     
  0x080435B2: lsrs       r4, r0, #0x20                 
  0x080435B4: ldr        r0, [pc, #4]                  
  0x080435B6: ldr        r0, [r0]                      
  0x080435B8: b          #0x80435e8                    
  0x080435E8: adds       r6, r6, r0                    
  0x080435EA: adds       r0, r7, #0                    
  0x080435EC: movs       r1, #0x12                     
  0x080435EE: movs       r2, #0                        
  0x080435F0: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080435F4: adds       r4, r0, #0                    
  0x080435F6: mov        r0, r8                        
  0x080435F8: movs       r1, #0x12                     
  0x080435FA: movs       r2, #0                        
  0x080435FC: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043600: subs       r5, r4, r0                    
  0x08043602: cmp        r5, #0                        
  0x08043604: beq        #0x804361e                    
  0x08043606: cmp        r5, #0                        
  0x08043608: bgt        #0x8043618                    
  0x0804360A: movs       r0, #1                        
  0x0804360C: rsbs       r0, r0, #0                    
  0x0804360E: cmp        r5, r0                        
  0x08043610: beq        #0x8043622                    
  0x08043612: b          #0x8043624                    
  0x08043618: cmp        r5, #1                        
  0x0804361A: beq        #0x8043622                    
  0x0804361C: b          #0x8043624                    
  0x0804361E: adds       r6, #0xa                      
  0x08043620: b          #0x8043624                    
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