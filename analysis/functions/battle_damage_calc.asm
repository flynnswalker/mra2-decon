; Function at 0x08043B48
; 37 instructions traced

  0x08043B40: adds       r4, #0x58                     
  0x08043B42: cmp        r4, r7                        
  0x08043B44: bgt        #0x8043b54                    
  0x08043B46: adds       r0, r5, #0                    
  0x08043B48: adds       r1, r4, #0                    
  0x08043B4A: bl         #0x8043c40                    
  0x08043B4E: cmp        r0, #0                        
  0x08043B50: beq        #0x8043b40                    
  0x08043B52: adds       r6, #1                        
  0x08043B54: movs       r5, #0                        
  0x08043B56: mov        r4, sb                        
  0x08043B58: b          #0x8043b5e                    
  0x08043B5A: adds       r4, #0x58                     
  0x08043B5C: adds       r5, #1                        
  0x08043B5E: cmp        r5, #9                        
  0x08043B60: bgt        #0x8043b70                    
  0x08043B62: mov        r0, r8                        
  0x08043B64: adds       r1, r4, #0                    
  0x08043B66: bl         #0x8043c40                    
  0x08043B6A: cmp        r0, #0                        
  0x08043B6C: beq        #0x8043b5a                    
  0x08043B6E: adds       r6, #1                        
  0x08043B70: cmp        r6, #0                        
  0x08043B72: bne        #0x8043b78                    
  0x08043B74: movs       r0, #2                        
  0x08043B76: b          #0x8043b82                    
  0x08043B78: cmp        r6, #1                        
  0x08043B7A: beq        #0x8043b80                    
  0x08043B7C: movs       r0, #0                        
  0x08043B7E: b          #0x8043b82                    
  0x08043B80: movs       r0, #1                        
  0x08043B82: pop        {r3, r4}                      
  0x08043B84: mov        r8, r3                        
  0x08043B86: mov        sb, r4                        
  0x08043B88: pop        {r4, r5, r6, r7}              
  0x08043B8A: pop        {r1}                          
  0x08043B8C: bx         r1                            