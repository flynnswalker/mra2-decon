; Function at 0x08018788
; 177 instructions traced

  0x08018788: push       {r4, r5, r6, r7, lr}          
  0x0801878A: mov        r7, sl                        
  0x0801878C: mov        r6, sb                        
  0x0801878E: mov        r5, r8                        
  0x08018790: push       {r5, r6, r7}                  
  0x08018792: sub        sp, #0x14                     
  0x08018794: str        r1, [sp, #0x10]               
  0x08018796: lsls       r2, r2, #0x18                 
  0x08018798: ldr        r0, [pc, #0x14]                 ; = 0x0300075C 
  0x0801879A: movs       r1, #0x80                     
  0x0801879C: lsls       r1, r1, #4                    
  0x0801879E: adds       r0, r0, r1                    
  0x080187A0: ldr        r7, [r0]                      
  0x080187A2: cmp        r2, #0                        
  0x080187A4: bne        #0x80187b4                    
  0x080187A6: adds       r0, r7, #0                    
  0x080187A8: movs       r1, #3                        
  0x080187AA: movs       r2, #0                        
  0x080187AC: b          #0x80187ba                    
  0x080187B4: adds       r0, r7, #0                    
  0x080187B6: movs       r1, #3                        
  0x080187B8: movs       r2, #1                        
  0x080187BA: bl         #0x8013cc8                    
  0x080187BE: adds       r7, r0, #0                    
  0x080187C0: adds       r0, r7, #0                    
  0x080187C2: bl         #0x8022278                    
  0x080187C6: adds       r7, r0, #0                    
  0x080187C8: movs       r2, #0                        
  0x080187CA: mov        r8, r2                        
  0x080187CC: add        r6, sp, #4                    
  0x080187CE: movs       r3, #0x10                     
  0x080187D0: mov        sb, r3                        
  0x080187D2: ldr        r0, [pc, #0x1c]                 ; = 0x08438AA4 
  0x080187D4: mov        sl, r0                        
  0x080187D6: mov        r1, r8                        
  0x080187D8: cmp        r1, #0                        
  0x080187DA: bne        #0x80187f4                    
  0x080187DC: movs       r0, #3                        
  0x080187DE: strh       r0, [r6]                      
  0x080187E0: mov        r2, sb                        
  0x080187E2: strh       r2, [r6, #2]                  
  0x080187E4: movs       r0, #0x17                     
  0x080187E6: strh       r0, [r6, #4]                  
  0x080187E8: strh       r2, [r6, #6]                  
  0x080187EA: movs       r0, #0xb                      
  0x080187EC: b          #0x8018804                    
  0x080187F4: movs       r0, #0x7f                     
  0x080187F6: strh       r0, [r6]                      
  0x080187F8: mov        r3, sb                        
  0x080187FA: strh       r3, [r6, #2]                  
  0x080187FC: movs       r0, #0x93                     
  0x080187FE: strh       r0, [r6, #4]                  
  0x08018800: strh       r3, [r6, #6]                  
  0x08018802: movs       r0, #0x87                     
  0x08018804: strh       r0, [r6, #8]                  
  0x08018806: movs       r0, #0x20                     
  0x08018808: strh       r0, [r6, #0xa]                
  0x0801880A: movs       r4, #0xf                      
  0x0801880C: ldr        r0, [sp, #0x10]               
  0x0801880E: cmp        r8, r0                        
  0x08018810: bne        #0x8018814                    
  0x08018812: movs       r4, #0xe                      
  0x08018814: ldr        r1, [sp, #4]                  
  0x08018816: adds       r0, r7, #0                    
  0x08018818: ldr        r2, [pc, #0xf0]                 ; = 0x0000024E 
  0x0801881A: movs       r3, #0xa                      
  0x0801881C: bl         #0x8008514                    
  0x08018820: adds       r7, r0, #0                    
  0x08018822: mov        r1, sl                        
  0x08018824: ldr        r0, [r1, #0x1c]               
  0x08018826: movs       r2, #4                        
  0x08018828: ldrsh      r1, [r6, r2]                  
  0x0801882A: movs       r3, #6                        
  0x0801882C: ldrsh      r2, [r6, r3]                  
  0x0801882E: str        r7, [sp]                      
  0x08018830: adds       r3, r4, #0                    
  0x08018832: bl         #0x80654f4                    
  0x08018836: lsls       r0, r0, #0x18                 
  0x08018838: lsrs       r0, r0, #0x15                 
  0x0801883A: adds       r7, r7, r0                    
  0x0801883C: mov        r0, sl                        
  0x0801883E: ldr        r5, [r0, #0x20]               
  0x08018840: movs       r2, #8                        
  0x08018842: ldrsh      r1, [r6, r2]                  
  0x08018844: movs       r3, #0xa                      
  0x08018846: ldrsh      r2, [r6, r3]                  
  0x08018848: str        r7, [sp]                      
  0x0801884A: adds       r0, r5, #0                    
  0x0801884C: adds       r3, r4, #0                    
  0x0801884E: bl         #0x80654f4                    
  0x08018852: lsls       r0, r0, #0x18                 
  0x08018854: lsrs       r0, r0, #0x15                 
  0x08018856: adds       r7, r7, r0                    
  0x08018858: movs       r0, #8                        
  0x0801885A: ldrsh      r1, [r6, r0]                  
  0x0801885C: ldrh       r2, [r6, #0xa]                
  0x0801885E: adds       r2, #0x10                     
  0x08018860: lsls       r2, r2, #0x10                 
  0x08018862: asrs       r2, r2, #0x10                 
  0x08018864: str        r7, [sp]                      
  0x08018866: adds       r0, r5, #0                    
  0x08018868: adds       r3, r4, #0                    
  0x0801886A: bl         #0x80654f4                    
  0x0801886E: lsls       r0, r0, #0x18                 
  0x08018870: lsrs       r0, r0, #0x15                 
  0x08018872: adds       r7, r7, r0                    
  0x08018874: movs       r2, #8                        
  0x08018876: ldrsh      r1, [r6, r2]                  
  0x08018878: ldrh       r2, [r6, #0xa]                
  0x0801887A: adds       r2, #0x20                     
  0x0801887C: lsls       r2, r2, #0x10                 
  0x0801887E: asrs       r2, r2, #0x10                 
  0x08018880: str        r7, [sp]                      
  0x08018882: adds       r0, r5, #0                    
  0x08018884: adds       r3, r4, #0                    
  0x08018886: bl         #0x80654f4                    
  0x0801888A: lsls       r0, r0, #0x18                 
  0x0801888C: lsrs       r0, r0, #0x15                 
  0x0801888E: adds       r7, r7, r0                    
  0x08018890: movs       r3, #8                        
  0x08018892: ldrsh      r1, [r6, r3]                  
  0x08018894: ldrh       r2, [r6, #0xa]                
  0x08018896: adds       r2, #0x30                     
  0x08018898: lsls       r2, r2, #0x10                 
  0x0801889A: asrs       r2, r2, #0x10                 
  0x0801889C: str        r7, [sp]                      
  0x0801889E: adds       r0, r5, #0                    
  0x080188A0: adds       r3, r4, #0                    
  0x080188A2: bl         #0x80654f4                    
  0x080188A6: lsls       r0, r0, #0x18                 
  0x080188A8: lsrs       r0, r0, #0x15                 
  0x080188AA: adds       r7, r7, r0                    
  0x080188AC: movs       r0, #8                        
  0x080188AE: ldrsh      r1, [r6, r0]                  
  0x080188B0: ldrh       r2, [r6, #0xa]                
  0x080188B2: adds       r2, #0x40                     
  0x080188B4: lsls       r2, r2, #0x10                 
  0x080188B6: asrs       r2, r2, #0x10                 
  0x080188B8: str        r7, [sp]                      
  0x080188BA: adds       r0, r5, #0                    
  0x080188BC: adds       r3, r4, #0                    
  0x080188BE: bl         #0x80654f4                    
  0x080188C2: lsls       r0, r0, #0x18                 
  0x080188C4: lsrs       r0, r0, #0x15                 
  0x080188C6: adds       r7, r7, r0                    
  0x080188C8: movs       r2, #8                        
  0x080188CA: ldrsh      r1, [r6, r2]                  
  0x080188CC: ldrh       r2, [r6, #0xa]                
  0x080188CE: adds       r2, #0x50                     
  0x080188D0: lsls       r2, r2, #0x10                 
  0x080188D2: asrs       r2, r2, #0x10                 
  0x080188D4: str        r7, [sp]                      
  0x080188D6: adds       r0, r5, #0                    
  0x080188D8: adds       r3, r4, #0                    
  0x080188DA: bl         #0x80654f4                    
  0x080188DE: lsls       r0, r0, #0x18                 
  0x080188E0: lsrs       r0, r0, #0x15                 
  0x080188E2: adds       r7, r7, r0                    
  0x080188E4: movs       r3, #1                        
  0x080188E6: add        r8, r3                        
  0x080188E8: mov        r0, r8                        
  0x080188EA: cmp        r0, #1                        
  0x080188EC: bgt        #0x80188f0                    
  0x080188EE: b          #0x80187d6                    
  0x080188F0: ldr        r0, [pc, #0x1c]                 ; = 0x0300075C 
  0x080188F2: movs       r1, #0x80                     
  0x080188F4: lsls       r1, r1, #4                    
  0x080188F6: adds       r0, r0, r1                    
  0x080188F8: str        r7, [r0]                      
  0x080188FA: add        sp, #0x14                     
  0x080188FC: pop        {r3, r4, r5}                  
  0x080188FE: mov        r8, r3                        
  0x08018900: mov        sb, r4                        
  0x08018902: mov        sl, r5                        
  0x08018904: pop        {r4, r5, r6, r7}              
  0x08018906: pop        {r0}                          
  0x08018908: bx         r0                            