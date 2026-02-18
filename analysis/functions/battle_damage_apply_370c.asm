; Function at 0x0804370C
; 248 instructions traced

  0x0804370C: push       {r4, r5, r6, r7, lr}          
  0x0804370E: mov        r7, sl                        
  0x08043710: mov        r6, sb                        
  0x08043712: mov        r5, r8                        
  0x08043714: push       {r5, r6, r7}                  
  0x08043716: sub        sp, #0x18                     
  0x08043718: mov        sb, r0                        
  0x0804371A: adds       r0, r1, #0                    
  0x0804371C: adds       r5, r2, #0                    
  0x0804371E: lsls       r3, r3, #0x10                 
  0x08043720: lsrs       r6, r3, #0x10                 
  0x08043722: adds       r7, r0, #0                    
  0x08043724: bl         #0x8002530                    
  0x08043728: adds       r4, r0, #0                    
  0x0804372A: movs       r1, #0x8b                     
  0x0804372C: movs       r2, #1                        
  0x0804372E: movs       r3, #0                        
  0x08043730: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08043734: adds       r0, r4, #0                    
  0x08043736: movs       r1, #0x8b                     
  0x08043738: movs       r2, #0                        
  0x0804373A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804373E: cmp        r0, #0x14                     
  0x08043740: bne        #0x804374e                    
  0x08043742: adds       r0, r4, #0                    
  0x08043744: movs       r1, #0xb2                     
  0x08043746: movs       r2, #2                        
  0x08043748: movs       r3, #0x13                     
  0x0804374A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0804374E: ldr        r0, [pc, #0x138]                ; = 0x00000594 
  0x08043750: adds       r2, r7, r0                    
  0x08043752: str        r6, [sp]                      
  0x08043754: mov        r0, sb                        
  0x08043756: movs       r1, #0x4d                     
  0x08043758: movs       r3, #0x10                     
  0x0804375A: bl         #0x800363c                    
  0x0804375E: str        r6, [sp]                      
  0x08043760: mov        r0, sb                        
  0x08043762: movs       r1, #0x4e                     
  0x08043764: adds       r2, r7, #0                    
  0x08043766: movs       r3, #0x10                     
  0x08043768: bl         #0x800363c                    
  0x0804376C: movs       r1, #0x82                     
  0x0804376E: lsls       r1, r1, #1                    
  0x08043770: adds       r0, r7, r1                    
  0x08043772: ldrb       r2, [r0]                      
  0x08043774: mov        r0, sb                        
  0x08043776: movs       r1, #0x50                     
  0x08043778: adds       r3, r6, #0                    
  0x0804377A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0804377E: ldr        r2, [pc, #0x10c]                ; = 0x00000105 
  0x08043780: adds       r0, r7, r2                    
  0x08043782: ldrb       r2, [r0]                      
  0x08043784: mov        r0, sb                        
  0x08043786: movs       r1, #0x51                     
  0x08043788: adds       r3, r6, #0                    
  0x0804378A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0804378E: adds       r0, r7, #0                    
  0x08043790: movs       r1, #0x14                     
  0x08043792: adds       r2, r6, #0                    
  0x08043794: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08043798: adds       r2, r0, #0                    
  0x0804379A: mov        r0, sb                        
  0x0804379C: movs       r1, #0x52                     
  0x0804379E: adds       r3, r6, #0                    
  0x080437A0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080437A4: adds       r0, r7, #0                    
  0x080437A6: movs       r1, #0x12                     
  0x080437A8: adds       r2, r6, #0                    
  0x080437AA: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080437AE: adds       r2, r0, #0                    
  0x080437B0: mov        r0, sb                        
  0x080437B2: movs       r1, #0x53                     
  0x080437B4: adds       r3, r6, #0                    
  0x080437B6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080437BA: lsls       r2, r5, #0x10                 
  0x080437BC: lsrs       r2, r2, #0x10                 
  0x080437BE: mov        r0, sb                        
  0x080437C0: movs       r1, #0x54                     
  0x080437C2: adds       r3, r6, #0                    
  0x080437C4: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080437C8: adds       r0, r7, #0                    
  0x080437CA: movs       r1, #0xc                      
  0x080437CC: adds       r2, r6, #0                    
  0x080437CE: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080437D2: adds       r2, r0, #0                    
  0x080437D4: mov        r0, sb                        
  0x080437D6: movs       r1, #0x55                     
  0x080437D8: adds       r3, r6, #0                    
  0x080437DA: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080437DE: adds       r0, r7, #0                    
  0x080437E0: adds       r0, #0x68                     
  0x080437E2: str        r0, [sp, #4]                  
  0x080437E4: ldrh       r0, [r0]                      
  0x080437E6: movs       r1, #0x6a                     
  0x080437E8: adds       r1, r1, r7                    
  0x080437EA: mov        r8, r1                        
  0x080437EC: ldrh       r1, [r1]                      
  0x080437EE: adds       r0, r0, r1                    
  0x080437F0: adds       r1, r7, #0                    
  0x080437F2: adds       r1, #0xab                     
  0x080437F4: ldrb       r1, [r1]                      
  0x080437F6: lsls       r1, r1, #0x18                 
  0x080437F8: asrs       r1, r1, #0x18                 
  0x080437FA: adds       r0, r0, r1                    
  0x080437FC: adds       r1, r7, #0                    
  0x080437FE: adds       r1, #0xac                     
  0x08043800: ldrb       r1, [r1]                      
  0x08043802: lsls       r1, r1, #0x18                 
  0x08043804: asrs       r1, r1, #0x18                 
  0x08043806: adds       r0, r0, r1                    
  0x08043808: lsrs       r1, r0, #0x1f                 
  0x0804380A: adds       r0, r0, r1                    
  0x0804380C: asrs       r0, r0, #1                    
  0x0804380E: mov        sl, r0                        
  0x08043810: movs       r2, #0x70                     
  0x08043812: adds       r2, r2, r7                    
  0x08043814: mov        ip, r2                        
  0x08043816: ldrh       r0, [r2]                      
  0x08043818: adds       r4, r7, #0                    
  0x0804381A: adds       r4, #0x6e                     
  0x0804381C: ldrh       r1, [r4]                      
  0x0804381E: adds       r0, r0, r1                    
  0x08043820: adds       r1, r7, #0                    
  0x08043822: adds       r1, #0xaf                     
  0x08043824: ldrb       r1, [r1]                      
  0x08043826: lsls       r1, r1, #0x18                 
  0x08043828: asrs       r1, r1, #0x18                 
  0x0804382A: adds       r0, r0, r1                    
  0x0804382C: adds       r1, r7, #0                    
  0x0804382E: adds       r1, #0xae                     
  0x08043830: ldrb       r1, [r1]                      
  0x08043832: lsls       r1, r1, #0x18                 
  0x08043834: asrs       r1, r1, #0x18                 
  0x08043836: adds       r0, r0, r1                    
  0x08043838: lsrs       r1, r0, #0x1f                 
  0x0804383A: adds       r0, r0, r1                    
  0x0804383C: asrs       r5, r0, #1                    
  0x0804383E: adds       r3, r7, #0                    
  0x08043840: adds       r3, #0x6c                     
  0x08043842: ldrh       r0, [r3]                      
  0x08043844: adds       r2, r7, #0                    
  0x08043846: adds       r2, #0x72                     
  0x08043848: ldrh       r1, [r2]                      
  0x0804384A: adds       r0, r0, r1                    
  0x0804384C: adds       r1, r7, #0                    
  0x0804384E: adds       r1, #0xad                     
  0x08043850: ldrb       r1, [r1]                      
  0x08043852: lsls       r1, r1, #0x18                 
  0x08043854: asrs       r1, r1, #0x18                 
  0x08043856: adds       r0, r0, r1                    
  0x08043858: adds       r1, r7, #0                    
  0x0804385A: adds       r1, #0xb0                     
  0x0804385C: ldrb       r1, [r1]                      
  0x0804385E: lsls       r1, r1, #0x18                 
  0x08043860: asrs       r1, r1, #0x18                 
  0x08043862: adds       r0, r0, r1                    
  0x08043864: lsrs       r1, r0, #0x1f                 
  0x08043866: adds       r0, r0, r1                    
  0x08043868: asrs       r0, r0, #1                    
  0x0804386A: ldr        r1, [sp, #4]                  
  0x0804386C: str        r1, [sp, #8]                  
  0x0804386E: mov        r1, ip                        
  0x08043870: str        r1, [sp, #0x10]               
  0x08043872: str        r4, [sp, #0xc]                
  0x08043874: adds       r4, r3, #0                    
  0x08043876: str        r2, [sp, #0x14]               
  0x08043878: cmp        sl, r5                        
  0x0804387A: ble        #0x8043890                    
  0x0804387C: movs       r2, #2                        
  0x0804387E: cmp        sl, r0                        
  0x08043880: ble        #0x8043898                    
  0x08043882: movs       r2, #0                        
  0x08043884: b          #0x8043898                    
  0x08043890: movs       r2, #2                        
  0x08043892: cmp        r5, r0                        
  0x08043894: ble        #0x8043898                    
  0x08043896: movs       r2, #1                        
  0x08043898: mov        r0, sb                        
  0x0804389A: movs       r1, #0x56                     
  0x0804389C: adds       r3, r6, #0                    
  0x0804389E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080438A2: ldr        r2, [sp, #8]                  
  0x080438A4: ldrh       r1, [r2]                      
  0x080438A6: mov        r2, r8                        
  0x080438A8: ldrh       r0, [r2]                      
  0x080438AA: cmp        r1, r0                        
  0x080438AC: bne        #0x80438b8                    
  0x080438AE: bl         #0x806354c                      ; -> prng()
  0x080438B2: movs       r2, #1                        
  0x080438B4: ands       r2, r0                        
  0x080438B6: b          #0x80438c0                    
  0x080438B8: movs       r2, #1                        
  0x080438BA: cmp        r1, r0                        
  0x080438BC: bls        #0x80438c0                    
  0x080438BE: movs       r2, #0                        
  0x080438C0: mov        r0, sb                        
  0x080438C2: movs       r1, #0x57                     
  0x080438C4: adds       r3, r6, #0                    
  0x080438C6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080438CA: ldrh       r2, [r4]                      
  0x080438CC: mov        r0, sb                        
  0x080438CE: movs       r1, #0x58                     
  0x080438D0: adds       r3, r6, #0                    
  0x080438D2: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080438D6: ldr        r1, [sp, #8]                  
  0x080438D8: ldrh       r0, [r1]                      
  0x080438DA: mov        r2, r8                        
  0x080438DC: ldrh       r1, [r2]                      
  0x080438DE: adds       r0, r0, r1                    
  0x080438E0: ldrh       r4, [r4]                      
  0x080438E2: adds       r0, r0, r4                    
  0x080438E4: ldr        r2, [sp, #0xc]                
  0x080438E6: ldrh       r1, [r2]                      
  0x080438E8: adds       r0, r0, r1                    
  0x080438EA: ldr        r1, [sp, #0x10]               
  0x080438EC: ldrh       r1, [r1]                      
  0x080438EE: adds       r0, r0, r1                    
  0x080438F0: ldr        r2, [sp, #0x14]               
  0x080438F2: ldrh       r1, [r2]                      
  0x080438F4: adds       r2, r0, r1                    
  0x080438F6: mov        r0, sb                        
  0x080438F8: movs       r1, #0x59                     
  0x080438FA: adds       r3, r6, #0                    
  0x080438FC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08043900: adds       r0, r7, #0                    
  0x08043902: movs       r1, #0x64                     
  0x08043904: movs       r2, #0                        
  0x08043906: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0804390A: adds       r2, r0, #0                    
  0x0804390C: mov        r0, sb                        
  0x0804390E: movs       r1, #0x4f                     
  0x08043910: adds       r3, r6, #0                    
  0x08043912: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08043916: adds       r3, r6, #0                    
  0x08043918: adds       r3, #0xa                      
  0x0804391A: mov        r0, sb                        
  0x0804391C: movs       r1, #0x11                     
  0x0804391E: movs       r2, #1                        
  0x08043920: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08043924: add        sp, #0x18                     
  0x08043926: pop        {r3, r4, r5}                  
  0x08043928: mov        r8, r3                        
  0x0804392A: mov        sb, r4                        
  0x0804392C: mov        sl, r5                        
  0x0804392E: pop        {r4, r5, r6, r7}              
  0x08043930: pop        {r0}                          
  0x08043932: bx         r0                            