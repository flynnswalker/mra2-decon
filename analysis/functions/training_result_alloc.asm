; Function at 0x08020B54
; 33 instructions traced

  0x08020B54: movs       r1, #0x2b                     
  0x08020B56: movs       r3, #0                        
  0x08020B58: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x08020B5C: movs       r2, #0xe                      
  0x08020B5E: ldrsb      r2, [r5, r2]                  
  0x08020B60: adds       r0, r6, #0                    
  0x08020B62: movs       r1, #0x16                     
  0x08020B64: movs       r3, #0                        
  0x08020B66: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08020B6A: movs       r2, #0xe                      
  0x08020B6C: ldrsb      r2, [r5, r2]                  
  0x08020B6E: adds       r0, r6, #0                    
  0x08020B70: movs       r1, #0x17                     
  0x08020B72: movs       r3, #0                        
  0x08020B74: bl         #0x80035e4                      ; -> field_modify(base, field_idx, delta, arr_idx)
  0x08020B78: movs       r4, #0                        
  0x08020B7A: adds       r0, r5, #0                    
  0x08020B7C: adds       r0, #0x10                     
  0x08020B7E: adds       r1, r0, r4                    
  0x08020B80: ldrb       r0, [r1]                      
  0x08020B82: cmp        r0, #0xff                     
  0x08020B84: beq        #0x8020b90                    
  0x08020B86: adds       r1, r0, #0                    
  0x08020B88: adds       r0, r6, #0                    
  0x08020B8A: movs       r2, #0                        
  0x08020B8C: bl         #0x800d2b0                    
  0x08020B90: adds       r4, #1                        
  0x08020B92: cmp        r4, #3                        
  0x08020B94: ble        #0x8020b7a                    
  0x08020B96: movs       r0, #1                        
  0x08020B98: pop        {r4, r5, r6}                  
  0x08020B9A: pop        {r1}                          
  0x08020B9C: bx         r1                            