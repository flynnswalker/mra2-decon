; Function at 0x08018914
; 62 instructions traced

  0x08018914: push       {r4, r5, r6, lr}              
  0x08018916: sub        sp, #0x28                     
  0x08018918: adds       r5, r0, #0                    
  0x0801891A: bl         #0x8002530                    
  0x0801891E: adds       r4, r0, #0                    
  0x08018920: ldr        r0, [pc, #0x7c]                 ; = 0x060149C0 
  0x08018922: ldr        r1, [pc, #0x80]                 ; = 0x0841DE00 
  0x08018924: adds       r1, #0x84                     
  0x08018926: ldr        r3, [r1]                      
  0x08018928: movs       r1, #0x18                     
  0x0801892A: str        r1, [sp]                      
  0x0801892C: movs       r6, #0x10                     
  0x0801892E: str        r6, [sp, #4]                  
  0x08018930: movs       r1, #0                        
  0x08018932: str        r1, [sp, #8]                  
  0x08018934: movs       r2, #0                        
  0x08018936: bl         #0x8067414                    
  0x0801893A: ldr        r1, [pc, #0x6c]                 ; = 0x040000D4 
  0x0801893C: ldr        r0, [pc, #0x6c]                 ; = 0x0841DD7C 
  0x0801893E: adds       r0, #0x80                     
  0x08018940: ldr        r0, [r0]                      
  0x08018942: str        r0, [r1]                      
  0x08018944: ldr        r0, [pc, #0x68]                 ; = 0x05000340 
  0x08018946: str        r0, [r1, #4]                  
  0x08018948: ldr        r0, [pc, #0x68]                 ; = 0x80000010 
  0x0801894A: str        r0, [r1, #8]                  
  0x0801894C: ldr        r0, [r1, #8]                  
  0x0801894E: adds       r0, r4, #0                    
  0x08018950: movs       r1, #0x99                     
  0x08018952: adds       r2, r5, #0                    
  0x08018954: bl         #0x8003624                    
  0x08018958: adds       r1, r0, #0                    
  0x0801895A: add        r0, sp, #0xc                  
  0x0801895C: bl         #0x8003770                    
  0x08018960: ldr        r2, [pc, #0x54]                 ; = 0x00110093 
  0x08018962: str        r2, [sp, #0x24]               
  0x08018964: movs       r5, #0xc0                     
  0x08018966: lsls       r5, r5, #0x13                 
  0x08018968: add        r4, sp, #0x24                 
  0x0801896A: ldrh       r1, [r4]                      
  0x0801896C: lsrs       r2, r2, #0x10                 
  0x0801896E: movs       r0, #0x60                     
  0x08018970: str        r0, [sp]                      
  0x08018972: str        r6, [sp, #4]                  
  0x08018974: adds       r0, r5, #0                    
  0x08018976: movs       r3, #0                        
  0x08018978: bl         #0x8067394                    
  0x0801897C: adds       r0, r4, #0                    
  0x0801897E: add        r1, sp, #0xc                  
  0x08018980: movs       r2, #0x58                     
  0x08018982: bl         #0x800836c                    
  0x08018986: ldrh       r2, [r4]                      
  0x08018988: ldrh       r3, [r4, #2]                  
  0x0801898A: movs       r0, #0x20                     
  0x0801898C: str        r0, [sp]                      
  0x0801898E: add        r0, sp, #0xc                  
  0x08018990: adds       r1, r5, #0                    
  0x08018992: bl         #0x8068158                    
  0x08018996: add        sp, #0x28                     
  0x08018998: pop        {r4, r5, r6}                  
  0x0801899A: pop        {r0}                          
  0x0801899C: bx         r0                            