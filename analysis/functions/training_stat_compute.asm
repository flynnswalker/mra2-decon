; Function at 0x08020C70
; 40 instructions traced

  0x08020C70: add        r4, sp, #0x320                
  0x08020C72: lsrs       r4, r3, #0x20                 
  0x08020C74: push       {r4, r5, lr}                  
  0x08020C76: bl         #0x8000310                    
  0x08020C7A: cmp        r0, #0                        
  0x08020C7C: beq        #0x8020ca6                    
  0x08020C7E: ldr        r5, [pc, #0x44]                 ; = 0x0200A398 
  0x08020C80: movs       r4, #0xce                     
  0x08020C82: lsls       r4, r4, #3                    
  0x08020C84: movs       r0, #1                        
  0x08020C86: adds       r1, r4, #0                    
  0x08020C88: bl         #0x8063280                    
  0x08020C8C: str        r0, [r5]                      
  0x08020C8E: movs       r1, #0                        
  0x08020C90: adds       r2, r4, #0                    
  0x08020C92: bl         #0x81c770c                      ; -> memset(dst, val, len)
  0x08020C96: ldr        r1, [r5]                      
  0x08020C98: ldr        r0, [pc, #0x2c]                 ; = 0x0000FFFD 
  0x08020C9A: strh       r0, [r1, #0x30]               
  0x08020C9C: bl         #0x80226f4                    
  0x08020CA0: movs       r0, #0                        
  0x08020CA2: bl         #0x8011e98                    
  0x08020CA6: bl         #0x8062fec                    
  0x08020CAA: cmp        r0, #0                        
  0x08020CAC: bne        #0x8020cd0                    
  0x08020CAE: bl         #0x8002530                    
  0x08020CB2: movs       r1, #0xb3                     
  0x08020CB4: movs       r2, #1                        
  0x08020CB6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08020CBA: cmp        r0, #0                        
  0x08020CBC: bne        #0x8020ccc                    
  0x08020CBE: movs       r0, #1                        
  0x08020CC0: b          #0x8020cd4                    
  0x08020CCC: movs       r0, #2                        
  0x08020CCE: b          #0x8020cd4                    
  0x08020CD0: movs       r0, #0x80                     
  0x08020CD2: lsls       r0, r0, #0x18                 
  0x08020CD4: pop        {r4, r5}                      
  0x08020CD6: pop        {r1}                          
  0x08020CD8: bx         r1                            