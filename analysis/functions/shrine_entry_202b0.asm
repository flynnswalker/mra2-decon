; Function at 0x080202B0
; 49 instructions traced

  0x080202B0: push       {lr}                          
  0x080202B2: bl         #0x8000310                    
  0x080202B6: cmp        r0, #0                        
  0x080202B8: beq        #0x80202c2                    
  0x080202BA: movs       r0, #1                        
  0x080202BC: movs       r1, #0                        
  0x080202BE: bl         #0x8067848                    
  0x080202C2: bl         #0x8011ed0                    
  0x080202C6: cmp        r0, #1                        
  0x080202C8: bne        #0x80202d4                    
  0x080202CA: movs       r0, #1                        
  0x080202CC: bl         #0x806de2c                    
  0x080202D0: movs       r0, #0x22                     
  0x080202D2: b          #0x8020324                    
  0x080202D4: movs       r0, #1                        
  0x080202D6: bl         #0x8022774                    
  0x080202DA: bl         #0x8008308                    
  0x080202DE: movs       r0, #1                        
  0x080202E0: bl         #0x8067d28                    
  0x080202E4: lsls       r0, r0, #0x18                 
  0x080202E6: lsrs       r1, r0, #0x18                 
  0x080202E8: cmp        r1, #1                        
  0x080202EA: beq        #0x802030c                    
  0x080202EC: cmp        r1, #1                        
  0x080202EE: bgt        #0x80202f6                    
  0x080202F0: cmp        r1, #0                        
  0x080202F2: beq        #0x80202fc                    
  0x080202F4: b          #0x8020320                    
  0x080202F6: cmp        r1, #0xfd                     
  0x080202F8: beq        #0x802031c                    
  0x080202FA: b          #0x8020320                    
  0x080202FC: ldr        r0, [pc, #8]                  
  0x080202FE: ldr        r0, [r0]                      
  0x08020300: adds       r0, #0x2c                     
  0x08020302: strb       r1, [r0]                      
  0x08020304: movs       r0, #0x10                     
  0x08020306: b          #0x8020324                    
  0x0802030C: ldr        r0, [pc, #8]                  
  0x0802030E: ldr        r0, [r0]                      
  0x08020310: adds       r0, #0x2c                     
  0x08020312: strb       r1, [r0]                      
  0x08020314: movs       r0, #0x1d                     
  0x08020316: b          #0x8020324                    
  0x0802031C: movs       r0, #0x20                     
  0x0802031E: b          #0x8020324                    
  0x08020320: movs       r0, #0x80                     
  0x08020322: lsls       r0, r0, #0x18                 
  0x08020324: pop        {r1}                          
  0x08020326: bx         r1                            