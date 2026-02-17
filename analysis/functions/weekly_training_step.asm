; Function at 0x08020328
; 65 instructions traced

  0x08020328: push       {r4, r5, lr}                  
  0x0802032A: adds       r4, r0, #0                    
  0x0802032C: bl         #0x8002530                    
  0x08020330: movs       r1, #0x71                     
  0x08020332: movs       r2, #0                        
  0x08020334: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field_113 (offset None)
  0x08020338: adds       r5, r0, #0                    
  0x0802033A: adds       r0, r4, #0                    
  0x0802033C: bl         #0x8000310                    
  0x08020340: cmp        r0, #0                        
  0x08020342: beq        #0x80203a6                    
  0x08020344: ldr        r4, [pc, #0x18]                 ; = 0x0200A398 
  0x08020346: ldr        r1, [r4]                      
  0x08020348: ldrb       r0, [r1, #0x18]               
  0x0802034A: ldrb       r1, [r1, #0x19]               
  0x0802034C: bl         #0x8001330                    
  0x08020350: adds       r1, r0, #0                    
  0x08020352: cmp        r1, #0                        
  0x08020354: beq        #0x8020364                    
  0x08020356: ldr        r0, [r4]                      
  0x08020358: adds       r0, #0x2d                     
  0x0802035A: movs       r1, #1                        
  0x0802035C: b          #0x8020368                    
  0x08020364: ldr        r0, [r4]                      
  0x08020366: adds       r0, #0x2d                     
  0x08020368: strb       r1, [r0]                      
  0x0802036A: ldr        r4, [pc, #0x54]                 ; = 0x0200A398 
  0x0802036C: ldr        r1, [r4]                      
  0x0802036E: ldrb       r0, [r1, #0x18]               
  0x08020370: ldrb       r1, [r1, #0x19]               
  0x08020372: bl         #0x8002b28                      ; -> combine_breed_ids(main, sub)
  0x08020376: adds       r1, r0, #0                    
  0x08020378: adds       r0, r5, #0                    
  0x0802037A: bl         #0x8020774                    
  0x0802037E: adds       r0, r5, #0                    
  0x08020380: bl         #0x80028e8                    
  0x08020384: ldr        r1, [r4]                      
  0x08020386: adds       r1, #0x18                     
  0x08020388: adds       r0, r5, #0                    
  0x0802038A: bl         #0x8020ab0                    
  0x0802038E: adds       r0, r5, #0                    
  0x08020390: bl         #0x8002648                    
  0x08020394: movs       r2, #2                        
  0x08020396: rsbs       r2, r2, #0                    
  0x08020398: movs       r0, #0                        
  0x0802039A: movs       r1, #0x3f                     
  0x0802039C: bl         #0x8062df8                    
  0x080203A0: ldr        r1, [pc, #0x20]                 ; = 0x0200A2F8 
  0x080203A2: movs       r0, #0                        
  0x080203A4: str        r0, [r1]                      
  0x080203A6: ldr        r4, [pc, #0x1c]                 ; = 0x0200A2F8 
  0x080203A8: adds       r0, r4, #0                    
  0x080203AA: bl         #0x802278c                    
  0x080203AE: cmp        r0, #0                        
  0x080203B0: beq        #0x80203c8                    
  0x080203B2: ldr        r0, [r4]                      
  0x080203B4: adds       r0, #1                        
  0x080203B6: str        r0, [r4]                      
  0x080203B8: movs       r0, #0x80                     
  0x080203BA: lsls       r0, r0, #0x18                 
  0x080203BC: b          #0x80203ca                    
  0x080203C8: movs       r0, #0x16                     
  0x080203CA: pop        {r4, r5}                      
  0x080203CC: pop        {r1}                          
  0x080203CE: bx         r1                            