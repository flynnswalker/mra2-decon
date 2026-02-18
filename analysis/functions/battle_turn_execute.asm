; Function at 0x08041938
; 48 instructions traced

  0x08041938: push       {r4, lr}                      
  0x0804193A: bl         #0x8000310                    
  0x0804193E: cmp        r0, #0                        
  0x08041940: beq        #0x804197e                    
  0x08041942: bl         #0x80310dc                    
  0x08041946: ldr        r4, [pc, #0x50]                 ; = 0x0200C8D4 
  0x08041948: ldrb       r0, [r4, #1]                  
  0x0804194A: movs       r1, #0                        
  0x0804194C: bl         #0x8031324                    
  0x08041950: lsls       r0, r0, #0x18                 
  0x08041952: lsrs       r0, r0, #0x14                 
  0x08041954: adds       r1, r4, #0                    
  0x08041956: adds       r1, #0x1c                     
  0x08041958: adds       r0, r0, r1                    
  0x0804195A: ldr        r3, [r0]                      
  0x0804195C: ldrb       r0, [r4, #1]                  
  0x0804195E: movs       r1, #0                        
  0x08041960: cmp        r0, #0                        
  0x08041962: bne        #0x8041966                    
  0x08041964: movs       r1, #4                        
  0x08041966: lsls       r0, r1, #4                    
  0x08041968: adds       r1, r4, #0                    
  0x0804196A: adds       r1, #0x14                     
  0x0804196C: adds       r0, r0, r1                    
  0x0804196E: ldr        r1, [r0]                      
  0x08041970: ldr        r2, [pc, #0x28]                 ; = 0x0000FFFF 
  0x08041972: adds       r0, r3, #0                    
  0x08041974: bl         #0x8043ac8                    
  0x08041978: movs       r0, #1                        
  0x0804197A: bl         #0x8036694                    
  0x0804197E: bl         #0x80366b4                    
  0x08041982: adds       r1, r0, #0                    
  0x08041984: movs       r0, #0x10                     
  0x08041986: rsbs       r0, r0, #0                    
  0x08041988: cmp        r1, r0                        
  0x0804198A: beq        #0x80419a0                    
  0x0804198C: adds       r0, #1                        
  0x0804198E: cmp        r1, r0                        
  0x08041990: beq        #0x80419a4                    
  0x08041992: movs       r0, #0x80                     
  0x08041994: lsls       r0, r0, #0x18                 
  0x08041996: b          #0x80419a6                    
  0x080419A0: movs       r0, #4                        
  0x080419A2: b          #0x80419a6                    
  0x080419A4: movs       r0, #0xe                      
  0x080419A6: pop        {r4}                          
  0x080419A8: pop        {r1}                          
  0x080419AA: bx         r1                            