; Function at 0x0800D2B0
; 45 instructions traced

  0x0800D2B0: push       {r4, r5, r6, r7, lr}          
  0x0800D2B2: mov        r7, r8                        
  0x0800D2B4: push       {r7}                          
  0x0800D2B6: adds       r5, r0, #0                    
  0x0800D2B8: adds       r4, r1, #0                    
  0x0800D2BA: lsls       r2, r2, #0x18                 
  0x0800D2BC: lsrs       r2, r2, #0x18                 
  0x0800D2BE: movs       r0, #0                        
  0x0800D2C0: mov        r8, r0                        
  0x0800D2C2: cmp        r4, #0x56                     
  0x0800D2C4: ble        #0x800d2c8                    
  0x0800D2C6: movs       r4, #0                        
  0x0800D2C8: lsls       r0, r4, #0x18                 
  0x0800D2CA: lsrs       r7, r0, #0x18                 
  0x0800D2CC: adds       r0, r5, #0                    
  0x0800D2CE: adds       r1, r7, #0                    
  0x0800D2D0: bl         #0x800d928                    
  0x0800D2D4: adds       r6, r0, #0                    
  0x0800D2D6: movs       r0, #1                        
  0x0800D2D8: rsbs       r0, r0, #0                    
  0x0800D2DA: cmp        r6, r0                        
  0x0800D2DC: beq        #0x800d30a                    
  0x0800D2DE: adds       r0, r5, #0                    
  0x0800D2E0: adds       r1, r7, #0                    
  0x0800D2E2: bl         #0x800de58                    
  0x0800D2E6: adds       r0, r5, #0                    
  0x0800D2E8: movs       r1, #0x4b                     
  0x0800D2EA: adds       r2, r4, #0                    
  0x0800D2EC: adds       r3, r6, #0                    
  0x0800D2EE: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D2F2: adds       r0, r5, #0                    
  0x0800D2F4: adds       r1, r4, #0                    
  0x0800D2F6: bl         #0x800d36c                    
  0x0800D2FA: adds       r0, r5, #0                    
  0x0800D2FC: bl         #0x800d0f8                    
  0x0800D300: adds       r0, r5, #0                    
  0x0800D302: bl         #0x800d410                    
  0x0800D306: movs       r0, #1                        
  0x0800D308: mov        r8, r0                        
  0x0800D30A: mov        r0, r8                        
  0x0800D30C: pop        {r3}                          
  0x0800D30E: mov        r8, r3                        
  0x0800D310: pop        {r4, r5, r6, r7}              
  0x0800D312: pop        {r1}                          
  0x0800D314: bx         r1                            