; Function at 0x0800D0F8
; 63 instructions traced

  0x0800D0F8: push       {r4, r5, r6, r7, lr}          
  0x0800D0FA: mov        r7, r8                        
  0x0800D0FC: push       {r7}                          
  0x0800D0FE: sub        sp, #8                        
  0x0800D100: mov        r8, r0                        
  0x0800D102: movs       r4, #0                        
  0x0800D104: mov        r0, r8                        
  0x0800D106: movs       r1, #0x4b                     
  0x0800D108: adds       r2, r4, #0                    
  0x0800D10A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D10E: mov        r2, sp                        
  0x0800D110: adds       r1, r2, r4                    
  0x0800D112: strb       r0, [r1]                      
  0x0800D114: adds       r4, #1                        
  0x0800D116: cmp        r4, #5                        
  0x0800D118: ble        #0x800d104                    
  0x0800D11A: movs       r4, #0                        
  0x0800D11C: mov        r6, sp                        
  0x0800D11E: adds       r6, #1                        
  0x0800D120: mov        r5, sp                        
  0x0800D122: ldrb       r0, [r5]                      
  0x0800D124: cmp        r0, #0xff                     
  0x0800D126: bne        #0x800d14c                    
  0x0800D128: adds       r1, r4, #1                    
  0x0800D12A: cmp        r1, #5                        
  0x0800D12C: bgt        #0x800d14c                    
  0x0800D12E: adds       r2, r5, #0                    
  0x0800D130: adds       r3, r6, #0                    
  0x0800D132: mov        r7, sp                        
  0x0800D134: adds       r0, r7, r1                    
  0x0800D136: ldrb       r0, [r0]                      
  0x0800D138: cmp        r0, #0xff                     
  0x0800D13A: beq        #0x800d146                    
  0x0800D13C: ldrb       r1, [r2]                      
  0x0800D13E: ldrb       r0, [r3]                      
  0x0800D140: strb       r0, [r2]                      
  0x0800D142: strb       r1, [r3]                      
  0x0800D144: b          #0x800d14c                    
  0x0800D146: adds       r1, #1                        
  0x0800D148: cmp        r1, #5                        
  0x0800D14A: ble        #0x800d132                    
  0x0800D14C: adds       r6, #1                        
  0x0800D14E: adds       r5, #1                        
  0x0800D150: adds       r4, #1                        
  0x0800D152: cmp        r4, #4                        
  0x0800D154: ble        #0x800d122                    
  0x0800D156: movs       r4, #0                        
  0x0800D158: mov        r1, sp                        
  0x0800D15A: adds       r0, r1, r4                    
  0x0800D15C: ldrb       r2, [r0]                      
  0x0800D15E: mov        r0, r8                        
  0x0800D160: movs       r1, #0x4b                     
  0x0800D162: adds       r3, r4, #0                    
  0x0800D164: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D168: adds       r4, #1                        
  0x0800D16A: cmp        r4, #5                        
  0x0800D16C: ble        #0x800d158                    
  0x0800D16E: add        sp, #8                        
  0x0800D170: pop        {r3}                          
  0x0800D172: mov        r8, r3                        
  0x0800D174: pop        {r4, r5, r6, r7}              
  0x0800D176: pop        {r0}                          
  0x0800D178: bx         r0                            