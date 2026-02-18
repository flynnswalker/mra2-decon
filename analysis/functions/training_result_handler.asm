; Function at 0x0802016C
; 49 instructions traced

  0x0802016C: cmp        r0, #0                        
  0x0802016E: beq        #0x8020174                    
  0x08020170: bl         #0x801fcfc                    
  0x08020174: adds       r0, r4, #0                    
  0x08020176: movs       r1, #0x18                     
  0x08020178: movs       r2, #0                        
  0x0802017A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0802017E: cmp        r0, #3                        
  0x08020180: beq        #0x80201a8                    
  0x08020182: cmp        r0, #3                        
  0x08020184: bgt        #0x802018c                    
  0x08020186: cmp        r0, #1                        
  0x08020188: beq        #0x8020196                    
  0x0802018A: b          #0x80201b2                    
  0x0802018C: cmp        r0, #4                        
  0x0802018E: beq        #0x80201ac                    
  0x08020190: cmp        r0, #6                        
  0x08020192: beq        #0x80201b0                    
  0x08020194: b          #0x80201b2                    
  0x08020196: ldr        r0, [pc, #0xc]                  ; = 0x0200A2F3 
  0x08020198: ldrb       r0, [r0]                      
  0x0802019A: movs       r5, #0                        
  0x0802019C: cmp        r0, #1                        
  0x0802019E: bne        #0x80201b2                    
  0x080201A0: movs       r5, #1                        
  0x080201A2: b          #0x80201b2                    
  0x080201A8: movs       r5, #2                        
  0x080201AA: b          #0x80201b2                    
  0x080201AC: movs       r5, #3                        
  0x080201AE: b          #0x80201b2                    
  0x080201B0: movs       r5, #4                        
  0x080201B2: movs       r1, #0x80                     
  0x080201B4: lsls       r1, r1, #1                    
  0x080201B6: adds       r0, r4, #0                    
  0x080201B8: movs       r2, #0x11                     
  0x080201BA: movs       r3, #3                        
  0x080201BC: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080201C0: ldr        r1, [pc, #0x18]                 ; = 0x00000101 
  0x080201C2: adds       r0, r4, #0                    
  0x080201C4: adds       r2, r5, #0                    
  0x080201C6: movs       r3, #3                        
  0x080201C8: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x080201CC: adds       r0, r6, #0                    
  0x080201CE: movs       r1, #0                        
  0x080201D0: bl         #0x80003b8                    
  0x080201D4: ldr        r0, [pc, #8]                  
  0x080201D6: pop        {r4, r5, r6}                  
  0x080201D8: pop        {r1}                          
  0x080201DA: bx         r1                            