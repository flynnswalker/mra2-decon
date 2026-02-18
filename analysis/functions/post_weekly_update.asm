; Function at 0x0801FFD0
; 41 instructions traced

  0x0801FFD0: lsls       r7, r1, #6                    
  0x0801FFD2: movs       r0, r0                        
  0x0801FFD4: adr        r2, #0x3cc                    
  0x0801FFD6: lsls       r0, r0, #8                    
  0x0801FFD8: push       {r4, r5, lr}                  
  0x0801FFDA: adds       r4, r0, #0                    
  0x0801FFDC: bl         #0x8002530                    
  0x0801FFE0: movs       r1, #0x71                     
  0x0801FFE2: movs       r2, #0                        
  0x0801FFE4: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_113 (offset None)
  0x0801FFE8: adds       r5, r0, #0                    
  0x0801FFEA: adds       r0, r4, #0                    
  0x0801FFEC: bl         #0x8000310                    
  0x0801FFF0: adds       r0, r5, #0                    
  0x0801FFF2: movs       r1, #0x18                     
  0x0801FFF4: movs       r2, #0                        
  0x0801FFF6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_24 (offset 0x0098)
  0x0801FFFA: cmp        r0, #4                        
  0x0801FFFC: bgt        #0x8020008                    
  0x0801FFFE: cmp        r0, #3                        
  0x08020000: bge        #0x8020024                    
  0x08020002: cmp        r0, #1                        
  0x08020004: beq        #0x802000e                    
  0x08020006: b          #0x8020028                    
  0x08020008: cmp        r0, #6                        
  0x0802000A: beq        #0x8020024                    
  0x0802000C: b          #0x8020028                    
  0x0802000E: ldr        r0, [pc, #0xc]                  ; = 0x0200A2F3 
  0x08020010: ldrb       r0, [r0]                      
  0x08020012: cmp        r0, #1                        
  0x08020014: bne        #0x8020020                    
  0x08020016: movs       r0, #2                        
  0x08020018: b          #0x802002a                    
  0x08020020: movs       r0, #1                        
  0x08020022: b          #0x802002a                    
  0x08020024: movs       r0, #3                        
  0x08020026: b          #0x802002a                    
  0x08020028: movs       r0, #4                        
  0x0802002A: pop        {r4, r5}                      
  0x0802002C: pop        {r1}                          
  0x0802002E: bx         r1                            