; Function at 0x0800D17C
; 63 instructions traced

  0x0800D17C: push       {r4, r5, r6, r7, lr}          
  0x0800D17E: mov        r7, r8                        
  0x0800D180: push       {r7}                          
  0x0800D182: sub        sp, #8                        
  0x0800D184: mov        r8, r0                        
  0x0800D186: movs       r4, #0                        
  0x0800D188: mov        r0, r8                        
  0x0800D18A: movs       r1, #0xe0                     
  0x0800D18C: adds       r2, r4, #0                    
  0x0800D18E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D192: mov        r2, sp                        
  0x0800D194: adds       r1, r2, r4                    
  0x0800D196: strb       r0, [r1]                      
  0x0800D198: adds       r4, #1                        
  0x0800D19A: cmp        r4, #5                        
  0x0800D19C: ble        #0x800d188                    
  0x0800D19E: movs       r4, #0                        
  0x0800D1A0: mov        r6, sp                        
  0x0800D1A2: adds       r6, #1                        
  0x0800D1A4: mov        r5, sp                        
  0x0800D1A6: ldrb       r0, [r5]                      
  0x0800D1A8: cmp        r0, #0xff                     
  0x0800D1AA: bne        #0x800d1d0                    
  0x0800D1AC: adds       r1, r4, #1                    
  0x0800D1AE: cmp        r1, #5                        
  0x0800D1B0: bgt        #0x800d1d0                    
  0x0800D1B2: adds       r2, r5, #0                    
  0x0800D1B4: adds       r3, r6, #0                    
  0x0800D1B6: mov        r7, sp                        
  0x0800D1B8: adds       r0, r7, r1                    
  0x0800D1BA: ldrb       r0, [r0]                      
  0x0800D1BC: cmp        r0, #0xff                     
  0x0800D1BE: beq        #0x800d1ca                    
  0x0800D1C0: ldrb       r1, [r2]                      
  0x0800D1C2: ldrb       r0, [r3]                      
  0x0800D1C4: strb       r0, [r2]                      
  0x0800D1C6: strb       r1, [r3]                      
  0x0800D1C8: b          #0x800d1d0                    
  0x0800D1CA: adds       r1, #1                        
  0x0800D1CC: cmp        r1, #5                        
  0x0800D1CE: ble        #0x800d1b6                    
  0x0800D1D0: adds       r6, #1                        
  0x0800D1D2: adds       r5, #1                        
  0x0800D1D4: adds       r4, #1                        
  0x0800D1D6: cmp        r4, #4                        
  0x0800D1D8: ble        #0x800d1a6                    
  0x0800D1DA: movs       r4, #0                        
  0x0800D1DC: mov        r1, sp                        
  0x0800D1DE: adds       r0, r1, r4                    
  0x0800D1E0: ldrb       r2, [r0]                      
  0x0800D1E2: mov        r0, r8                        
  0x0800D1E4: movs       r1, #0xe0                     
  0x0800D1E6: adds       r3, r4, #0                    
  0x0800D1E8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D1EC: adds       r4, #1                        
  0x0800D1EE: cmp        r4, #5                        
  0x0800D1F0: ble        #0x800d1dc                    
  0x0800D1F2: add        sp, #8                        
  0x0800D1F4: pop        {r3}                          
  0x0800D1F6: mov        r8, r3                        
  0x0800D1F8: pop        {r4, r5, r6, r7}              
  0x0800D1FA: pop        {r0}                          
  0x0800D1FC: bx         r0                            