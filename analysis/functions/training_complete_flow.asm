; Function at 0x08022390
; 28 instructions traced

  0x08022390: adds       r4, #0x50                     
  0x08022392: movs       r6, #0                        
  0x08022394: movs       r5, #0x1f                     
  0x08022396: strb       r6, [r4]                      
  0x08022398: adds       r0, r4, #0                    
  0x0802239A: bl         #0x80223e0                    
  0x0802239E: adds       r4, #0x2c                     
  0x080223A0: subs       r5, #1                        
  0x080223A2: cmp        r5, #0                        
  0x080223A4: bge        #0x8022396                    
  0x080223A6: ldr        r0, [pc, #0x34]                 ; = 0x0200A398 
  0x080223A8: ldr        r0, [r0]                      
  0x080223AA: movs       r1, #0xba                     
  0x080223AC: lsls       r1, r1, #3                    
  0x080223AE: adds       r4, r0, r1                    
  0x080223B0: movs       r6, #0                        
  0x080223B2: movs       r5, #7                        
  0x080223B4: strb       r6, [r4]                      
  0x080223B6: adds       r0, r4, #0                    
  0x080223B8: bl         #0x802255c                    
  0x080223BC: adds       r4, #0x14                     
  0x080223BE: subs       r5, #1                        
  0x080223C0: cmp        r5, #0                        
  0x080223C2: bge        #0x80223b4                    
  0x080223C4: add        sp, #0xc                      
  0x080223C6: pop        {r4, r5, r6}                  
  0x080223C8: pop        {r0}                          
  0x080223CA: bx         r0                            