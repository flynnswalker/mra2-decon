; Function at 0x080223E0
; 89 instructions traced

  0x080223E0: push       {r4, r5, lr}                  
  0x080223E2: adds       r4, r0, #0                    
  0x080223E4: bl         #0x806354c                      ; -> prng()
  0x080223E8: lsls       r0, r0, #0x10                 
  0x080223EA: lsrs       r0, r0, #0x10                 
  0x080223EC: movs       r1, #0x30                     
  0x080223EE: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x080223F2: lsls       r0, r0, #0x10                 
  0x080223F4: lsrs       r5, r0, #0x10                 
  0x080223F6: cmp        r5, #0                        
  0x080223F8: bne        #0x802249c                    
  0x080223FA: ldr        r0, [pc, #0xa8]                 ; = 0x087253B0 
  0x080223FC: ldr        r1, [r0, #0x24]               
  0x080223FE: movs       r0, #1                        
  0x08022400: strb       r0, [r4]                      
  0x08022402: ldr        r0, [r1]                      
  0x08022404: ldr        r1, [r1, #4]                  
  0x08022406: str        r0, [r4, #0x24]               
  0x08022408: str        r1, [r4, #0x28]               
  0x0802240A: movs       r0, #0xf0                     
  0x0802240C: lsls       r0, r0, #0xf                  
  0x0802240E: str        r0, [r4, #4]                  
  0x08022410: movs       r0, #0xa0                     
  0x08022412: lsls       r0, r0, #0xf                  
  0x08022414: str        r0, [r4, #8]                  
  0x08022416: bl         #0x8063588                    
  0x0802241A: lsls       r0, r0, #0x18                 
  0x0802241C: lsrs       r0, r0, #0x18                 
  0x0802241E: adds       r1, r0, #0                    
  0x08022420: subs       r1, #0x80                     
  0x08022422: lsls       r0, r1, #2                    
  0x08022424: adds       r0, r0, r1                    
  0x08022426: movs       r1, #3                        
  0x08022428: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0802242C: adds       r0, #0x78                     
  0x0802242E: lsls       r0, r0, #0x10                 
  0x08022430: str        r0, [r4, #0xc]                
  0x08022432: bl         #0x8063588                    
  0x08022436: lsls       r0, r0, #0x18                 
  0x08022438: lsrs       r0, r0, #0x18                 
  0x0802243A: adds       r1, r0, #0                    
  0x0802243C: subs       r1, #0x80                     
  0x0802243E: lsls       r0, r1, #2                    
  0x08022440: adds       r0, r0, r1                    
  0x08022442: movs       r1, #3                        
  0x08022444: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08022448: adds       r0, #0x50                     
  0x0802244A: lsls       r2, r0, #0x10                 
  0x0802244C: str        r2, [r4, #0x10]               
  0x0802244E: ldr        r0, [r4, #0xc]                
  0x08022450: movs       r1, #0x80                     
  0x08022452: lsls       r1, r1, #0xd                  
  0x08022454: adds       r0, r0, r1                    
  0x08022456: movs       r1, #0x88                     
  0x08022458: lsls       r1, r1, #0x11                 
  0x0802245A: cmp        r0, r1                        
  0x0802245C: bhi        #0x802246e                    
  0x0802245E: movs       r0, #0x80                     
  0x08022460: lsls       r0, r0, #0xd                  
  0x08022462: adds       r1, r2, r0                    
  0x08022464: movs       r0, #0xc0                     
  0x08022466: lsls       r0, r0, #0x10                 
  0x08022468: cmp        r1, r0                        
  0x0802246A: bhi        #0x802246e                    
  0x0802246C: strb       r5, [r4]                      
  0x0802246E: movs       r0, #0                        
  0x08022470: str        r0, [r4, #0x14]               
  0x08022472: str        r0, [r4, #0x18]               
  0x08022474: bl         #0x806354c                      ; -> prng()
  0x08022478: ldr        r1, [r4, #4]                  
  0x0802247A: ldr        r2, [r4, #0xc]                
  0x0802247C: subs       r1, r1, r2                    
  0x0802247E: lsls       r0, r0, #0x10                 
  0x08022480: lsrs       r0, r0, #0x10                 
  0x08022482: adds       r1, r1, r0                    
  0x08022484: asrs       r1, r1, #0xb                  
  0x08022486: str        r1, [r4, #0x1c]               
  0x08022488: bl         #0x806354c                      ; -> prng()
  0x0802248C: ldr        r1, [r4, #8]                  
  0x0802248E: ldr        r2, [r4, #0x10]               
  0x08022490: subs       r1, r1, r2                    
  0x08022492: lsls       r0, r0, #0x10                 
  0x08022494: lsrs       r0, r0, #0x10                 
  0x08022496: adds       r1, r1, r0                    
  0x08022498: asrs       r1, r1, #0xb                  
  0x0802249A: str        r1, [r4, #0x20]               
  0x0802249C: pop        {r4, r5}                      
  0x0802249E: pop        {r0}                          
  0x080224A0: bx         r0                            