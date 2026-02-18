; Function at 0x0800D410
; 20 instructions traced

  0x0800D410: push       {r4, r5, r6, r7, lr}          
  0x0800D412: adds       r5, r0, #0                    
  0x0800D414: ldr        r1, [pc, #0x24]                 ; = 0x08202C00 
  0x0800D416: bl         #0x800df80                    
  0x0800D41A: adds       r6, r0, #0                    
  0x0800D41C: movs       r4, #0                        
  0x0800D41E: movs       r7, #1                        
  0x0800D420: adds       r2, r6, #0                    
  0x0800D422: lsrs       r2, r4                        
  0x0800D424: ands       r2, r7                        
  0x0800D426: adds       r0, r5, #0                    
  0x0800D428: movs       r1, #0x4c                     
  0x0800D42A: adds       r3, r4, #0                    
  0x0800D42C: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D430: adds       r4, #1                        
  0x0800D432: cmp        r4, #0x19                     
  0x0800D434: bls        #0x800d420                    
  0x0800D436: pop        {r4, r5, r6, r7}              
  0x0800D438: pop        {r0}                          
  0x0800D43A: bx         r0                            