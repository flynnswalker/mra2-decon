; Function at 0x080213E8
; 30 instructions traced

  0x080213E8: push       {r4, r5, lr}                  
  0x080213EA: adds       r4, r0, #0                    
  0x080213EC: bl         #0x8002530                    
  0x080213F0: movs       r1, #0x71                     
  0x080213F2: movs       r2, #0                        
  0x080213F4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x080213F8: adds       r5, r0, #0                    
  0x080213FA: adds       r0, r4, #0                    
  0x080213FC: bl         #0x8000310                    
  0x08021400: cmp        r0, #0                        
  0x08021402: beq        #0x8021416                    
  0x08021404: ldr        r0, [pc, #0x24]                 ; = 0x0200A398 
  0x08021406: ldr        r1, [r0]                      
  0x08021408: adds       r1, #0x30                     
  0x0802140A: adds       r0, r5, #0                    
  0x0802140C: bl         #0x800048c                    
  0x08021410: ldr        r0, [pc, #0x1c]                 ; = 0x081171AE 
  0x08021412: bl         #0x80682b4                    
  0x08021416: movs       r0, #0                        
  0x08021418: bl         #0x8022774                    
  0x0802141C: bl         #0x80682e0                    
  0x08021420: cmp        r0, #1                        
  0x08021422: beq        #0x8021434                    
  0x08021424: movs       r0, #0x80                     
  0x08021426: lsls       r0, r0, #0x18                 
  0x08021428: b          #0x8021436                    
  0x08021434: movs       r0, #9                        
  0x08021436: pop        {r4, r5}                      
  0x08021438: pop        {r1}                          
  0x0802143A: bx         r1                            