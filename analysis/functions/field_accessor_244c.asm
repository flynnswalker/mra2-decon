; Function at 0x0800244C
; 109 instructions traced

  0x0800244C: push       {r4, r5, r6, r7, lr}          
  0x0800244E: mov        r7, sb                        
  0x08002450: mov        r6, r8                        
  0x08002452: push       {r6, r7}                      
  0x08002454: sub        sp, #0x18                     
  0x08002456: adds       r7, r0, #0                    
  0x08002458: adds       r5, r2, #0                    
  0x0800245A: mov        sb, r3                        
  0x0800245C: movs       r6, #0                        
  0x0800245E: movs       r3, #0xf                      
  0x08002460: mov        r0, sb                        
  0x08002462: ands       r3, r0                        
  0x08002464: lsls       r0, r1, #0x10                 
  0x08002466: lsrs       r0, r0, #0x10                 
  0x08002468: mov        r8, r0                        
  0x0800246A: lsrs       r0, r1, #0x10                 
  0x0800246C: cmp        r5, #0                        
  0x0800246E: bge        #0x800249e                    
  0x08002470: mov        r1, sp                        
  0x08002472: mov        r2, r8                        
  0x08002474: subs       r0, r0, r2                    
  0x08002476: strh       r0, [r1]                      
  0x08002478: movs       r6, #1                        
  0x0800247A: rsbs       r5, r5, #0                    
  0x0800247C: b          #0x800249e                    
  0x0800247E: lsls       r0, r6, #1                    
  0x08002480: mov        r1, sp                        
  0x08002482: adds       r4, r1, r0                    
  0x08002484: adds       r0, r5, #0                    
  0x08002486: movs       r1, #0xa                      
  0x08002488: str        r3, [sp, #0x14]               
  0x0800248A: bl         #0x81c7a6c                    
  0x0800248E: strh       r0, [r4]                      
  0x08002490: adds       r6, #1                        
  0x08002492: adds       r0, r5, #0                    
  0x08002494: movs       r1, #0xa                      
  0x08002496: bl         #0x81c79d4                      ; -> __aeabi_idiv(a, b)
  0x0800249A: adds       r5, r0, #0                    
  0x0800249C: ldr        r3, [sp, #0x14]               
  0x0800249E: cmp        r5, #9                        
  0x080024A0: bgt        #0x800247e                    
  0x080024A2: lsls       r0, r6, #1                    
  0x080024A4: add        r0, sp, r0                    
  0x080024A6: strh       r5, [r0]                      
  0x080024A8: cmp        r3, #0                        
  0x080024AA: bne        #0x80024d0                    
  0x080024AC: movs       r2, #0                        
  0x080024AE: cmp        r2, r6                        
  0x080024B0: bgt        #0x8002512                    
  0x080024B2: lsls       r0, r6, #1                    
  0x080024B4: mov        r2, sp                        
  0x080024B6: adds       r3, r0, r2                    
  0x080024B8: adds       r1, r7, #0                    
  0x080024BA: adds       r2, r6, #1                    
  0x080024BC: ldrh       r0, [r3]                      
  0x080024BE: add        r0, r8                        
  0x080024C0: strh       r0, [r1]                      
  0x080024C2: subs       r3, #2                        
  0x080024C4: adds       r1, #2                        
  0x080024C6: subs       r2, #1                        
  0x080024C8: cmp        r2, #0                        
  0x080024CA: bne        #0x80024bc                    
  0x080024CC: adds       r2, r6, #1                    
  0x080024CE: b          #0x8002512                    
  0x080024D0: movs       r2, #0                        
  0x080024D2: cmp        r2, r3                        
  0x080024D4: bge        #0x8002512                    
  0x080024D6: subs       r0, r3, r6                    
  0x080024D8: subs       r4, r0, #1                    
  0x080024DA: cmp        r4, r2                        
  0x080024DC: ble        #0x80024fc                    
  0x080024DE: movs       r1, #0x80                     
  0x080024E0: lsls       r1, r1, #0x17                 
  0x080024E2: mov        r0, sb                        
  0x080024E4: ands       r1, r0                        
  0x080024E6: cmp        r1, #0                        
  0x080024E8: beq        #0x80024f2                    
  0x080024EA: lsls       r0, r2, #1                    
  0x080024EC: adds       r0, r0, r7                    
  0x080024EE: movs       r1, #0x35                     
  0x080024F0: b          #0x80024f6                    
  0x080024F2: lsls       r0, r2, #1                    
  0x080024F4: adds       r0, r0, r7                    
  0x080024F6: strh       r1, [r0]                      
  0x080024F8: adds       r2, #1                        
  0x080024FA: b          #0x800250e                    
  0x080024FC: lsls       r1, r2, #1                    
  0x080024FE: adds       r1, r1, r7                    
  0x08002500: adds       r2, #1                        
  0x08002502: subs       r0, r3, r2                    
  0x08002504: lsls       r0, r0, #1                    
  0x08002506: add        r0, sp, r0                    
  0x08002508: ldrh       r0, [r0]                      
  0x0800250A: add        r0, r8                        
  0x0800250C: strh       r0, [r1]                      
  0x0800250E: cmp        r2, r3                        
  0x08002510: blt        #0x80024da                    
  0x08002512: lsls       r0, r2, #1                    
  0x08002514: adds       r0, r0, r7                    
  0x08002516: ldr        r2, [pc, #0x14]                 ; = 0x0000FFFD 
  0x08002518: adds       r1, r2, #0                    
  0x0800251A: strh       r1, [r0]                      
  0x0800251C: add        sp, #0x18                     
  0x0800251E: pop        {r3, r4}                      
  0x08002520: mov        r8, r3                        
  0x08002522: mov        sb, r4                        
  0x08002524: pop        {r4, r5, r6, r7}              
  0x08002526: pop        {r0}                          
  0x08002528: bx         r0                            