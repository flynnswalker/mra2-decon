; Function at 0x08021388
; 19 instructions traced

  0x08021388: push       {lr}                          
  0x0802138A: bl         #0x8000310                    
  0x0802138E: cmp        r0, #0                        
  0x08021390: beq        #0x80213a2                    
  0x08021392: movs       r0, #0                        
  0x08021394: bl         #0x8022768                    
  0x08021398: movs       r0, #0                        
  0x0802139A: movs       r1, #0x3f                     
  0x0802139C: movs       r2, #0                        
  0x0802139E: bl         #0x8062df8                    
  0x080213A2: bl         #0x8062fec                    
  0x080213A6: cmp        r0, #0                        
  0x080213A8: beq        #0x80213b0                    
  0x080213AA: movs       r0, #0x80                     
  0x080213AC: lsls       r0, r0, #0x18                 
  0x080213AE: b          #0x80213b2                    
  0x080213B0: movs       r0, #0x14                     
  0x080213B2: pop        {r1}                          
  0x080213B4: bx         r1                            