; Function at 0x0801E560
; 293 instructions traced

  0x0801E560: push       {r4, r5, r6, r7, lr}          
  0x0801E562: mov        r7, sl                        
  0x0801E564: mov        r6, sb                        
  0x0801E566: mov        r5, r8                        
  0x0801E568: push       {r5, r6, r7}                  
  0x0801E56A: sub        sp, #0x28                     
  0x0801E56C: str        r0, [sp, #0x10]               
  0x0801E56E: str        r1, [sp, #0x14]               
  0x0801E570: adds       r5, r3, #0                    
  0x0801E572: movs       r6, #0                        
  0x0801E574: ldr        r2, [pc, #0x54]                 ; = 0x0000FFFD 
  0x0801E576: lsls       r0, r6, #1                    
  0x0801E578: mov        r3, sp                        
  0x0801E57A: adds       r1, r3, r0                    
  0x0801E57C: ldr        r3, [sp, #0x10]               
  0x0801E57E: adds       r0, r0, r3                    
  0x0801E580: ldrh       r0, [r0]                      
  0x0801E582: strh       r0, [r1]                      
  0x0801E584: lsls       r0, r0, #0x10                 
  0x0801E586: lsrs       r0, r0, #0x10                 
  0x0801E588: cmp        r0, r2                        
  0x0801E58A: beq        #0x801e596                    
  0x0801E58C: adds       r0, r6, #1                    
  0x0801E58E: lsls       r0, r0, #0x10                 
  0x0801E590: lsrs       r6, r0, #0x10                 
  0x0801E592: cmp        r6, #7                        
  0x0801E594: bls        #0x801e576                    
  0x0801E596: mov        r8, r6                        
  0x0801E598: movs       r6, #0                        
  0x0801E59A: adds       r0, r5, #0                    
  0x0801E59C: adds       r0, #0x10                     
  0x0801E59E: str        r0, [sp, #0x24]               
  0x0801E5A0: adds       r2, r0, #0                    
  0x0801E5A2: movs       r3, #0xff                     
  0x0801E5A4: adds       r0, r2, r6                    
  0x0801E5A6: ldrb       r1, [r0]                      
  0x0801E5A8: orrs       r1, r3                        
  0x0801E5AA: strb       r1, [r0]                      
  0x0801E5AC: adds       r0, r6, #1                    
  0x0801E5AE: lsls       r0, r0, #0x10                 
  0x0801E5B0: lsrs       r6, r0, #0x10                 
  0x0801E5B2: cmp        r6, #3                        
  0x0801E5B4: bls        #0x801e5a4                    
  0x0801E5B6: movs       r1, #0                        
  0x0801E5B8: str        r1, [sp, #0x1c]               
  0x0801E5BA: mov        sl, r1                        
  0x0801E5BC: mov        sb, r1                        
  0x0801E5BE: movs       r2, #0                        
  0x0801E5C0: str        r2, [sp, #0x18]               
  0x0801E5C2: mov        r3, r8                        
  0x0801E5C4: cmp        r3, #0                        
  0x0801E5C6: bne        #0x801e5d0                    
  0x0801E5C8: movs       r0, #0                        
  0x0801E5CA: b          #0x801e7b2                    
  0x0801E5D0: mov        r0, r8                        
  0x0801E5D2: cmp        r0, #1                        
  0x0801E5D4: bhi        #0x801e5d8                    
  0x0801E5D6: b          #0x801e74a                    
  0x0801E5D8: mov        r6, r8                        
  0x0801E5DA: movs       r7, #0                        
  0x0801E5DC: mov        r1, r8                        
  0x0801E5DE: subs       r0, r1, r6                    
  0x0801E5E0: adds       r1, r0, #1                    
  0x0801E5E2: str        r0, [sp, #0x20]               
  0x0801E5E4: cmp        r7, r1                        
  0x0801E5E6: blt        #0x801e5ea                    
  0x0801E5E8: b          #0x801e73e                    
  0x0801E5EA: adds       r1, r7, #0                    
  0x0801E5EC: adds       r3, r7, r6                    
  0x0801E5EE: cmp        r7, r3                        
  0x0801E5F0: bge        #0x801e614                    
  0x0801E5F2: lsls       r0, r7, #1                    
  0x0801E5F4: add        r0, sp, r0                    
  0x0801E5F6: ldrh       r0, [r0]                      
  0x0801E5F8: ldr        r2, [pc, #0x4c]                 ; = 0x0000FFFF 
  0x0801E5FA: cmp        r0, r2                        
  0x0801E5FC: beq        #0x801e614                    
  0x0801E5FE: adds       r4, r3, #0                    
  0x0801E600: adds       r0, r1, #1                    
  0x0801E602: lsls       r0, r0, #0x10                 
  0x0801E604: lsrs       r1, r0, #0x10                 
  0x0801E606: cmp        r1, r4                        
  0x0801E608: bge        #0x801e614                    
  0x0801E60A: lsls       r0, r1, #1                    
  0x0801E60C: add        r0, sp, r0                    
  0x0801E60E: ldrh       r0, [r0]                      
  0x0801E610: cmp        r0, r2                        
  0x0801E612: bne        #0x801e600                    
  0x0801E614: cmp        r1, r3                        
  0x0801E616: beq        #0x801e61a                    
  0x0801E618: b          #0x801e72e                    
  0x0801E61A: lsls       r0, r7, #1                    
  0x0801E61C: add        r0, sp, r0                    
  0x0801E61E: ldr        r1, [sp, #0x14]               
  0x0801E620: adds       r2, r6, #0                    
  0x0801E622: bl         #0x801e9dc                    
  0x0801E626: adds       r2, r0, #0                    
  0x0801E628: cmp        r2, #0                        
  0x0801E62A: bne        #0x801e62e                    
  0x0801E62C: b          #0x801e72e                    
  0x0801E62E: movs       r4, #1                        
  0x0801E630: ldrb       r0, [r2]                      
  0x0801E632: adds       r2, #1                        
  0x0801E634: cmp        r0, #2                        
  0x0801E636: beq        #0x801e676                    
  0x0801E638: cmp        r0, #2                        
  0x0801E63A: bgt        #0x801e64c                    
  0x0801E63C: cmp        r0, #0                        
  0x0801E63E: beq        #0x801e656                    
  0x0801E640: cmp        r0, #1                        
  0x0801E642: beq        #0x801e666                    
  0x0801E644: b          #0x801e5c8                    
  0x0801E64C: cmp        r0, #3                        
  0x0801E64E: beq        #0x801e694                    
  0x0801E650: cmp        r0, #0xff                     
  0x0801E652: beq        #0x801e6f2                    
  0x0801E654: b          #0x801e5c8                    
  0x0801E656: mov        r3, sb                        
  0x0801E658: cmp        r3, #0                        
  0x0801E65A: bne        #0x801e690                    
  0x0801E65C: ldrb       r0, [r2]                      
  0x0801E65E: strb       r0, [r5]                      
  0x0801E660: movs       r0, #1                        
  0x0801E662: mov        sb, r0                        
  0x0801E664: b          #0x801e690                    
  0x0801E666: mov        r1, sl                        
  0x0801E668: cmp        r1, #0                        
  0x0801E66A: bne        #0x801e690                    
  0x0801E66C: ldrb       r0, [r2]                      
  0x0801E66E: strb       r0, [r5, #1]                  
  0x0801E670: movs       r3, #1                        
  0x0801E672: mov        sl, r3                        
  0x0801E674: b          #0x801e690                    
  0x0801E676: ldr        r1, [sp, #0x18]               
  0x0801E678: lsls       r0, r1, #0x18                 
  0x0801E67A: asrs       r3, r0, #0x18                 
  0x0801E67C: cmp        r3, #2                        
  0x0801E67E: bgt        #0x801e690                    
  0x0801E680: ldr        r0, [sp, #0x24]               
  0x0801E682: adds       r1, r0, r3                    
  0x0801E684: ldrb       r0, [r2]                      
  0x0801E686: strb       r0, [r1]                      
  0x0801E688: adds       r0, r3, #1                    
  0x0801E68A: lsls       r0, r0, #0x18                 
  0x0801E68C: lsrs       r0, r0, #0x18                 
  0x0801E68E: str        r0, [sp, #0x18]               
  0x0801E690: adds       r2, #1                        
  0x0801E692: b          #0x801e6f6                    
  0x0801E694: ldr        r1, [sp, #0x1c]               
  0x0801E696: cmp        r1, #0                        
  0x0801E698: bne        #0x801e6ee                    
  0x0801E69A: ldrb       r0, [r2]                      
  0x0801E69C: strb       r0, [r5, #2]                  
  0x0801E69E: adds       r2, #1                        
  0x0801E6A0: ldrb       r0, [r2]                      
  0x0801E6A2: strb       r0, [r5, #3]                  
  0x0801E6A4: adds       r2, #1                        
  0x0801E6A6: ldrb       r0, [r2]                      
  0x0801E6A8: strb       r0, [r5, #4]                  
  0x0801E6AA: adds       r2, #1                        
  0x0801E6AC: ldrb       r0, [r2]                      
  0x0801E6AE: strb       r0, [r5, #5]                  
  0x0801E6B0: adds       r2, #1                        
  0x0801E6B2: ldrb       r0, [r2]                      
  0x0801E6B4: strb       r0, [r5, #6]                  
  0x0801E6B6: adds       r2, #1                        
  0x0801E6B8: ldrb       r0, [r2]                      
  0x0801E6BA: strb       r0, [r5, #7]                  
  0x0801E6BC: adds       r2, #1                        
  0x0801E6BE: ldrb       r0, [r2]                      
  0x0801E6C0: strb       r0, [r5, #8]                  
  0x0801E6C2: adds       r2, #1                        
  0x0801E6C4: ldrb       r0, [r2]                      
  0x0801E6C6: strb       r0, [r5, #9]                  
  0x0801E6C8: adds       r2, #1                        
  0x0801E6CA: ldrb       r0, [r2]                      
  0x0801E6CC: strb       r0, [r5, #0xa]                
  0x0801E6CE: adds       r2, #1                        
  0x0801E6D0: ldrb       r0, [r2]                      
  0x0801E6D2: strb       r0, [r5, #0xb]                
  0x0801E6D4: adds       r2, #1                        
  0x0801E6D6: ldrb       r0, [r2]                      
  0x0801E6D8: strb       r0, [r5, #0xc]                
  0x0801E6DA: adds       r2, #1                        
  0x0801E6DC: ldrb       r0, [r2]                      
  0x0801E6DE: strb       r0, [r5, #0xd]                
  0x0801E6E0: adds       r2, #1                        
  0x0801E6E2: ldrb       r0, [r2]                      
  0x0801E6E4: strb       r0, [r5, #0xe]                
  0x0801E6E6: adds       r2, #1                        
  0x0801E6E8: movs       r3, #1                        
  0x0801E6EA: str        r3, [sp, #0x1c]               
  0x0801E6EC: b          #0x801e6f6                    
  0x0801E6EE: adds       r2, #0xd                      
  0x0801E6F0: b          #0x801e6f6                    
  0x0801E6F2: movs       r4, #0                        
  0x0801E6F4: b          #0x801e6fa                    
  0x0801E6F6: cmp        r4, #0                        
  0x0801E6F8: bne        #0x801e630                    
  0x0801E6FA: mov        r1, sb                        
  0x0801E6FC: mov        r0, sl                        
  0x0801E6FE: lsls       r4, r0, #0x18                 
  0x0801E700: cmp        r1, #1                        
  0x0801E702: beq        #0x801e70a                    
  0x0801E704: asrs       r0, r4, #0x18                 
  0x0801E706: cmp        r0, #1                        
  0x0801E708: bne        #0x801e72e                    
  0x0801E70A: cmp        r1, #0                        
  0x0801E70C: bne        #0x801e71c                    
  0x0801E70E: ldr        r0, [sp, #0x10]               
  0x0801E710: mov        r1, r8                        
  0x0801E712: adds       r2, r5, #0                    
  0x0801E714: bl         #0x801ea6c                    
  0x0801E718: movs       r1, #1                        
  0x0801E71A: mov        sb, r1                        
  0x0801E71C: cmp        r4, #0                        
  0x0801E71E: bne        #0x801e72e                    
  0x0801E720: ldr        r0, [sp, #0x10]               
  0x0801E722: mov        r1, r8                        
  0x0801E724: adds       r2, r5, #0                    
  0x0801E726: bl         #0x801e7c8                    
  0x0801E72A: movs       r2, #1                        
  0x0801E72C: mov        sl, r2                        
  0x0801E72E: adds       r0, r7, #1                    
  0x0801E730: lsls       r0, r0, #0x10                 
  0x0801E732: lsrs       r7, r0, #0x10                 
  0x0801E734: ldr        r0, [sp, #0x20]               
  0x0801E736: adds       r0, #1                        
  0x0801E738: cmp        r7, r0                        
  0x0801E73A: bge        #0x801e73e                    
  0x0801E73C: b          #0x801e5ea                    
  0x0801E73E: subs       r0, r6, #1                    
  0x0801E740: lsls       r0, r0, #0x10                 
  0x0801E742: lsrs       r6, r0, #0x10                 
  0x0801E744: cmp        r6, #1                        
  0x0801E746: bls        #0x801e74a                    
  0x0801E748: b          #0x801e5da                    
  0x0801E74A: mov        r3, sb                        
  0x0801E74C: cmp        r3, #0                        
  0x0801E74E: bne        #0x801e75a                    
  0x0801E750: ldr        r0, [sp, #0x10]               
  0x0801E752: mov        r1, r8                        
  0x0801E754: adds       r2, r5, #0                    
  0x0801E756: bl         #0x801ea6c                    
  0x0801E75A: mov        r0, sl                        
  0x0801E75C: cmp        r0, #0                        
  0x0801E75E: bne        #0x801e76a                    
  0x0801E760: ldr        r0, [sp, #0x10]               
  0x0801E762: mov        r1, r8                        
  0x0801E764: adds       r2, r5, #0                    
  0x0801E766: bl         #0x801e7c8                    
  0x0801E76A: ldr        r1, [sp, #0x1c]               
  0x0801E76C: cmp        r1, #0                        
  0x0801E76E: bne        #0x801e77a                    
  0x0801E770: ldr        r0, [sp, #0x10]               
  0x0801E772: mov        r1, r8                        
  0x0801E774: adds       r2, r5, #0                    
  0x0801E776: bl         #0x801e86c                    
  0x0801E77A: ldr        r2, [sp, #0x18]               
  0x0801E77C: cmp        r2, #0                        
  0x0801E77E: bne        #0x801e78a                    
  0x0801E780: ldr        r0, [sp, #0x10]               
  0x0801E782: mov        r1, r8                        
  0x0801E784: adds       r2, r5, #0                    
  0x0801E786: bl         #0x801e960                    
  0x0801E78A: ldrb       r0, [r5, #1]                  
  0x0801E78C: cmp        r0, #0x27                     
  0x0801E78E: bls        #0x801e794                    
  0x0801E790: ldrb       r0, [r5]                      
  0x0801E792: strb       r0, [r5, #1]                  
  0x0801E794: ldr        r2, [pc, #0x2c]                 ; = 0x081E88C0 BREED_COMBO_TABLE
  0x0801E796: ldrb       r1, [r5, #1]                  
  0x0801E798: lsls       r1, r1, #1                    
  0x0801E79A: ldrb       r3, [r5]                      
  0x0801E79C: lsls       r0, r3, #2                    
  0x0801E79E: adds       r0, r0, r3                    
  0x0801E7A0: lsls       r0, r0, #4                    
  0x0801E7A2: adds       r1, r1, r0                    
  0x0801E7A4: adds       r1, r1, r2                    
  0x0801E7A6: movs       r2, #0                        
  0x0801E7A8: ldrsh      r0, [r1, r2]                  
  0x0801E7AA: cmp        r0, #0                        
  0x0801E7AC: bne        #0x801e7b0                    
  0x0801E7AE: strb       r3, [r5, #1]                  
  0x0801E7B0: movs       r0, #1                        
  0x0801E7B2: add        sp, #0x28                     
  0x0801E7B4: pop        {r3, r4, r5}                  
  0x0801E7B6: mov        r8, r3                        
  0x0801E7B8: mov        sb, r4                        
  0x0801E7BA: mov        sl, r5                        
  0x0801E7BC: pop        {r4, r5, r6, r7}              
  0x0801E7BE: pop        {r1}                          
  0x0801E7C0: bx         r1                            