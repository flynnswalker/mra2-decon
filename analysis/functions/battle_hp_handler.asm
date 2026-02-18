; Function at 0x08048128
; 237 instructions traced

  0x08048128: ldr        r1, [pc, #0x20]                 ; = 0x0200C998 
  0x0804812A: mov        r8, r1                        
  0x0804812C: lsls       r0, r6, #0x18                 
  0x0804812E: asrs       r2, r0, #0x18                 
  0x08048130: ldrb       r1, [r7]                      
  0x08048132: adds       r4, r0, #0                    
  0x08048134: cmp        r1, #0                        
  0x08048136: beq        #0x8048150                    
  0x08048138: ldrb       r3, [r7, #1]                  
  0x0804813A: cmp        r2, r3                        
  0x0804813C: beq        #0x8048154                    
  0x0804813E: b          #0x8048168                    
  0x08048150: cmp        r2, #0                        
  0x08048152: bne        #0x8048168                    
  0x08048154: asrs       r1, r4, #0x16                 
  0x08048156: add        r1, r8                        
  0x08048158: ldr        r2, [pc, #8]                  
  0x0804815A: ldrh       r0, [r2]                      
  0x0804815C: strh       r0, [r1]                      
  0x0804815E: ldrh       r0, [r2, #2]                  
  0x08048160: strh       r0, [r1, #2]                  
  0x08048162: b          #0x8048198                    
  0x08048168: mov        r1, sl                        
  0x0804816A: ldrb       r0, [r1]                      
  0x0804816C: cmp        r0, #0                        
  0x0804816E: beq        #0x8048198                    
  0x08048170: bl         #0x806ef8c                    
  0x08048174: cmp        r0, #0                        
  0x08048176: bne        #0x8048198                    
  0x08048178: bl         #0x806ee44                    
  0x0804817C: lsls       r0, r0, #0x18                 
  0x0804817E: lsrs       r0, r0, #0x18                 
  0x08048180: asrs       r2, r4, #0x18                 
  0x08048182: asrs       r0, r2                        
  0x08048184: movs       r1, #1                        
  0x08048186: ands       r0, r1                        
  0x08048188: cmp        r0, #0                        
  0x0804818A: beq        #0x8048198                    
  0x0804818C: lsls       r0, r2, #2                    
  0x0804818E: add        r0, r8                        
  0x08048190: lsrs       r2, r4, #0x18                 
  0x08048192: movs       r1, #4                        
  0x08048194: bl         #0x806ed80                    
  0x08048198: lsls       r0, r6, #0x18                 
  0x0804819A: movs       r2, #0x80                     
  0x0804819C: lsls       r2, r2, #0x11                 
  0x0804819E: adds       r0, r0, r2                    
  0x080481A0: lsrs       r6, r0, #0x18                 
  0x080481A2: asrs       r0, r0, #0x18                 
  0x080481A4: cmp        r0, #3                        
  0x080481A6: ble        #0x804812c                    
  0x080481A8: bl         #0x80635c4                    
  0x080481AC: ldr        r1, [pc, #4]                  
  0x080481AE: strh       r0, [r1, #0x1c]               
  0x080481B0: b          #0x804840a                    
  0x0804820C: movs       r0, #0xb                      
  0x0804820E: bl         #0x806de2c                    
  0x08048212: b          #0x80484b2                    
  0x0804840A: movs       r6, #0                        
  0x0804840C: ldr        r7, [pc, #0x2c]                 ; = 0x0200C9F4 
  0x0804840E: lsls       r2, r6, #0x18                 
  0x08048410: asrs       r0, r2, #0x18                 
  0x08048412: lsls       r1, r0, #1                    
  0x08048414: adds       r1, r1, r0                    
  0x08048416: lsls       r0, r1, #4                    
  0x08048418: subs       r0, r0, r1                    
  0x0804841A: lsls       r0, r0, #4                    
  0x0804841C: adds       r1, r0, r5                    
  0x0804841E: ldrh       r0, [r1, #0x3c]               
  0x08048420: adds       r4, r2, #0                    
  0x08048422: cmp        r0, #1                        
  0x08048424: bne        #0x8048440                    
  0x08048426: ldrb       r0, [r1, #0x1b]               
  0x08048428: lsls       r0, r0, #4                    
  0x0804842A: add        r0, sb                        
  0x0804842C: str        r1, [r0, #4]                  
  0x0804842E: b          #0x8048450                    
  0x08048440: ldrb       r0, [r1, #0x1b]               
  0x08048442: lsls       r0, r0, #4                    
  0x08048444: add        r0, sb                        
  0x08048446: str        r1, [r0]                      
  0x08048448: ldrb       r0, [r1, #0x1b]               
  0x0804844A: lsls       r0, r0, #4                    
  0x0804844C: add        r0, sb                        
  0x0804844E: strb       r6, [r0, #0xc]                
  0x08048450: movs       r1, #0x80                     
  0x08048452: lsls       r1, r1, #0x11                 
  0x08048454: adds       r0, r4, r1                    
  0x08048456: lsrs       r6, r0, #0x18                 
  0x08048458: asrs       r0, r0, #0x18                 
  0x0804845A: cmp        r0, #3                        
  0x0804845C: ble        #0x804840e                    
  0x0804845E: mov        r2, sb                        
  0x08048460: ldr        r0, [r2, #0x10]               
  0x08048462: str        r0, [r2, #8]                  
  0x08048464: ldrb       r0, [r2, #0x1c]               
  0x08048466: strb       r0, [r2, #0xd]                
  0x08048468: ldr        r0, [r2]                      
  0x0804846A: str        r0, [r2, #0x18]               
  0x0804846C: ldrb       r0, [r2, #0xc]                
  0x0804846E: strb       r0, [r2, #0x1d]               
  0x08048470: ldrb       r0, [r7]                      
  0x08048472: cmp        r0, #1                        
  0x08048474: beq        #0x80484b2                    
  0x08048476: movs       r6, #0xa                      
  0x08048478: ldr        r0, [pc, #0x74]                 ; = 0x03000740 
  0x0804847A: adds       r5, r7, #0                    
  0x0804847C: ldrh       r1, [r0, #4]                  
  0x0804847E: movs       r0, #0x3c                     
  0x08048480: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08048484: adds       r4, r0, #0                    
  0x08048486: lsls       r0, r6, #0x18                 
  0x08048488: asrs       r2, r0, #0x18                 
  0x0804848A: adds       r1, r2, #0                    
  0x0804848C: muls       r1, r4, r1                    
  0x0804848E: adds       r3, r1, #4                    
  0x08048490: adds       r0, r1, #0                    
  0x08048492: cmp        r1, #0                        
  0x08048494: bge        #0x8048498                    
  0x08048496: adds       r0, r1, #3                    
  0x08048498: asrs       r0, r0, #2                    
  0x0804849A: lsls       r0, r0, #2                    
  0x0804849C: subs       r0, r1, r0                    
  0x0804849E: subs       r0, r3, r0                    
  0x080484A0: ldr        r1, [r5, #4]                  
  0x080484A2: cmp        r1, r0                        
  0x080484A4: bne        #0x80484a8                    
  0x080484A6: b          #0x804820c                    
  0x080484A8: subs       r0, r2, #1                    
  0x080484AA: lsls       r0, r0, #0x18                 
  0x080484AC: lsrs       r6, r0, #0x18                 
  0x080484AE: cmp        r0, #0                        
  0x080484B0: bgt        #0x8048486                    
  0x080484B2: ldr        r0, [pc, #0x40]                 ; = 0x0200C9F4 
  0x080484B4: ldrb       r0, [r0]                      
  0x080484B6: cmp        r0, #4                        
  0x080484B8: bhi        #0x804852e                    
  0x080484BA: ldr        r7, [pc, #0x34]                 ; = 0x03000740 
  0x080484BC: ldrh       r1, [r7, #4]                  
  0x080484BE: movs       r0, #0x3c                     
  0x080484C0: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x080484C4: adds       r4, r0, #0                    
  0x080484C6: lsls       r0, r4, #1                    
  0x080484C8: movs       r1, #3                        
  0x080484CA: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x080484CE: subs       r4, r4, r0                    
  0x080484D0: ldr        r6, [pc, #0x24]                 ; = 0x0200D576 
  0x080484D2: ldrh       r0, [r6]                      
  0x080484D4: adds       r1, r0, #1                    
  0x080484D6: strh       r1, [r6]                      
  0x080484D8: lsls       r0, r0, #0x10                 
  0x080484DA: lsrs       r0, r0, #0x10                 
  0x080484DC: cmp        r4, r0                        
  0x080484DE: bne        #0x8048510                    
  0x080484E0: ldr        r0, [pc, #0x18]                 ; = 0x0200D574 
  0x080484E2: ldrb       r0, [r0]                      
  0x080484E4: cmp        r0, #0                        
  0x080484E6: beq        #0x8048500                    
  0x080484E8: movs       r3, #1                        
  0x080484EA: rsbs       r3, r3, #0                    
  0x080484EC: movs       r0, #0xe0                     
  0x080484EE: b          #0x8048506                    
  0x08048500: movs       r3, #1                        
  0x08048502: rsbs       r3, r3, #0                    
  0x08048504: movs       r0, #0xc9                     
  0x08048506: movs       r1, #0                        
  0x08048508: movs       r2, #8                        
  0x0804850A: bl         #0x806e0ac                    
  0x0804850E: b          #0x804852e                    
  0x08048510: ldrh       r5, [r6]                      
  0x08048512: ldrh       r1, [r7, #4]                  
  0x08048514: movs       r0, #0x3c                     
  0x08048516: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x0804851A: adds       r4, r0, #0                    
  0x0804851C: lsls       r0, r4, #1                    
  0x0804851E: movs       r1, #3                        
  0x08048520: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08048524: subs       r0, r4, r0                    
  0x08048526: cmp        r5, r0                        
  0x08048528: ble        #0x804852e                    
  0x0804852A: adds       r0, #1                        
  0x0804852C: strh       r0, [r6]                      
  0x0804852E: ldr        r0, [pc, #0x14]                 ; = 0x0200C9F4 
  0x08048530: ldrb       r1, [r0]                      
  0x08048532: adds       r7, r0, #0                    
  0x08048534: cmp        r1, #0xe                      
  0x08048536: bhi        #0x80485e0                    
  0x08048538: lsls       r0, r1, #2                    
  0x0804853A: ldr        r1, [pc, #0xc]                  ; = 0x0804854C 
  0x0804853C: adds       r0, r0, r1                    
  0x0804853E: ldr        r0, [r0]                      
  0x08048540: mov        pc, r0                        
  0x08048542: movs       r0, r0                        
  0x08048544: ldm        r1!, {r2, r4, r5, r6, r7}     
  0x08048546: lsls       r0, r0, #8                    
  0x08048548: strh       r4, [r1, #0x2a]               
  0x0804854A: lsrs       r4, r0, #0x20                 
  0x0804854C: strh       r0, [r4, #0x2c]               
  0x0804854E: lsrs       r4, r0, #0x20                 
  0x08048550: strh       r0, [r5, #0x2c]               
  0x08048552: lsrs       r4, r0, #0x20                 
  0x08048554: strh       r0, [r6, #0x2c]               
  0x08048556: lsrs       r4, r0, #0x20                 
  0x08048558: strh       r0, [r7, #0x2c]               
  0x0804855A: lsrs       r4, r0, #0x20                 
  0x0804855C: strh       r0, [r0, #0x2e]               
  0x0804855E: lsrs       r4, r0, #0x20                 
  0x08048560: strh       r0, [r1, #0x2e]               
  0x08048562: lsrs       r4, r0, #0x20                 
  0x08048564: strh       r0, [r1, #0x2e]               
  0x08048566: lsrs       r4, r0, #0x20                 
  0x08048568: strh       r0, [r1, #0x2e]               
  0x0804856A: lsrs       r4, r0, #0x20                 
  0x0804856C: strh       r0, [r2, #0x2c]               
  0x0804856E: lsrs       r4, r0, #0x20                 
  0x08048570: strh       r0, [r3, #0x2c]               
  0x08048572: lsrs       r4, r0, #0x20                 
  0x08048574: strh       r0, [r4, #0x2e]               
  0x08048576: lsrs       r4, r0, #0x20                 
  0x08048578: strh       r0, [r4, #0x2e]               
  0x0804857A: lsrs       r4, r0, #0x20                 
  0x0804857C: strh       r0, [r4, #0x2e]               
  0x0804857E: lsrs       r4, r0, #0x20                 
  0x08048580: strh       r0, [r4, #0x2e]               
  0x08048582: lsrs       r4, r0, #0x20                 
  0x08048584: strh       r0, [r1, #0x2c]               
  0x08048586: lsrs       r4, r0, #0x20                 
  0x08048588: ldr        r0, [pc, #0]                  
  0x0804858A: b          #0x80485e2                    
  0x080485E0: ldr        r0, [pc, #0xc]                  ; = 0x80000001 
  0x080485E2: pop        {r3, r4, r5}                  
  0x080485E4: mov        r8, r3                        
  0x080485E6: mov        sb, r4                        
  0x080485E8: mov        sl, r5                        
  0x080485EA: pop        {r4, r5, r6, r7}              
  0x080485EC: pop        {r1}                          
  0x080485EE: bx         r1                            