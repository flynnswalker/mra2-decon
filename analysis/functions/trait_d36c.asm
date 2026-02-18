; Function at 0x0800D36C
; 27 instructions traced

  0x0800D36C: push       {lr}                          
  0x0800D36E: cmp        r1, #0x35                     
  0x0800D370: beq        #0x800d38e                    
  0x0800D372: cmp        r1, #0x35                     
  0x0800D374: bgt        #0x800d37c                    
  0x0800D376: cmp        r1, #0x33                     
  0x0800D378: beq        #0x800d382                    
  0x0800D37A: b          #0x800d3a4                    
  0x0800D37C: cmp        r1, #0x55                     
  0x0800D37E: beq        #0x800d39a                    
  0x0800D380: b          #0x800d3a4                    
  0x0800D382: movs       r1, #0xfa                     
  0x0800D384: movs       r2, #8                        
  0x0800D386: movs       r3, #0                        
  0x0800D388: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D38C: b          #0x800d3a4                    
  0x0800D38E: movs       r1, #0xfa                     
  0x0800D390: movs       r2, #8                        
  0x0800D392: movs       r3, #1                        
  0x0800D394: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D398: b          #0x800d3a4                    
  0x0800D39A: movs       r1, #0xfa                     
  0x0800D39C: movs       r2, #0x18                     
  0x0800D39E: movs       r3, #2                        
  0x0800D3A0: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D3A4: pop        {r0}                          
  0x0800D3A6: bx         r0                            