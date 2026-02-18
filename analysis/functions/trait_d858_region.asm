; Function at 0x0800D858
; 48 instructions traced

  0x0800D858: push       {r4, r5, r6, lr}              
  0x0800D85A: adds       r5, r0, #0                    
  0x0800D85C: movs       r4, #0                        
  0x0800D85E: adds       r0, r5, #0                    
  0x0800D860: movs       r1, #0x4b                     
  0x0800D862: adds       r2, r4, #0                    
  0x0800D864: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D868: cmp        r0, #0x54                     
  0x0800D86A: beq        #0x800d882                    
  0x0800D86C: adds       r4, #1                        
  0x0800D86E: cmp        r4, #5                        
  0x0800D870: ble        #0x800d85e                    
  0x0800D872: movs       r2, #1                        
  0x0800D874: rsbs       r2, r2, #0                    
  0x0800D876: movs       r6, #1                        
  0x0800D878: rsbs       r6, r6, #0                    
  0x0800D87A: cmp        r2, r6                        
  0x0800D87C: bne        #0x800d886                    
  0x0800D87E: movs       r0, #0                        
  0x0800D880: b          #0x800d8c0                    
  0x0800D882: adds       r2, r4, #0                    
  0x0800D884: b          #0x800d876                    
  0x0800D886: adds       r0, r5, #0                    
  0x0800D888: movs       r1, #0x55                     
  0x0800D88A: movs       r2, #8                        
  0x0800D88C: bl         #0x800d928                    
  0x0800D890: adds       r4, r0, #0                    
  0x0800D892: cmp        r4, r6                        
  0x0800D894: beq        #0x800d8be                    
  0x0800D896: adds       r0, r5, #0                    
  0x0800D898: movs       r1, #0x55                     
  0x0800D89A: bl         #0x800de58                    
  0x0800D89E: adds       r0, r5, #0                    
  0x0800D8A0: movs       r1, #0x4b                     
  0x0800D8A2: movs       r2, #0x55                     
  0x0800D8A4: adds       r3, r4, #0                    
  0x0800D8A6: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D8AA: adds       r0, r5, #0                    
  0x0800D8AC: movs       r1, #0x55                     
  0x0800D8AE: bl         #0x800d36c                    
  0x0800D8B2: adds       r0, r5, #0                    
  0x0800D8B4: bl         #0x800d0f8                    
  0x0800D8B8: adds       r0, r5, #0                    
  0x0800D8BA: bl         #0x800d410                    
  0x0800D8BE: movs       r0, #1                        
  0x0800D8C0: pop        {r4, r5, r6}                  
  0x0800D8C2: pop        {r1}                          
  0x0800D8C4: bx         r1                            