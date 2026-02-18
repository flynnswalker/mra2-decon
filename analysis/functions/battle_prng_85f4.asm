; Function at 0x080485F4
; 78 instructions traced

  0x080485F4: push       {r4, lr}                      
  0x080485F6: bl         #0x806354c                      ; -> prng()
  0x080485FA: ldr        r4, [pc, #0x10]                 ; = 0x0200C9F4 
  0x080485FC: ldrb       r0, [r4, #2]                  
  0x080485FE: cmp        r0, #1                        
  0x08048600: beq        #0x8048650                    
  0x08048602: cmp        r0, #1                        
  0x08048604: bgt        #0x8048610                    
  0x08048606: cmp        r0, #0                        
  0x08048608: beq        #0x8048616                    
  0x0804860A: b          #0x80486b4                    
  0x08048610: cmp        r0, #2                        
  0x08048612: beq        #0x8048688                    
  0x08048614: b          #0x80486b4                    
  0x08048616: bl         #0x805024c                    
  0x0804861A: cmp        r0, #0                        
  0x0804861C: beq        #0x80486b4                    
  0x0804861E: ldr        r0, [pc, #0x28]                 ; = 0x03000718 
  0x08048620: ldrh       r1, [r0, #2]                  
  0x08048622: movs       r0, #1                        
  0x08048624: ands       r0, r1                        
  0x08048626: cmp        r0, #0                        
  0x08048628: beq        #0x80486b4                    
  0x0804862A: ldr        r1, [pc, #0x20]                 ; = 0x00003F10 
  0x0804862C: movs       r2, #1                        
  0x0804862E: rsbs       r2, r2, #0                    
  0x08048630: movs       r0, #5                        
  0x08048632: bl         #0x8062df8                    
  0x08048636: movs       r0, #0xd6                     
  0x08048638: movs       r1, #0                        
  0x0804863A: movs       r2, #8                        
  0x0804863C: bl         #0x806df38                    
  0x08048640: ldrb       r0, [r4, #2]                  
  0x08048642: adds       r0, #1                        
  0x08048644: strb       r0, [r4, #2]                  
  0x08048646: b          #0x80486b4                    
  0x08048650: bl         #0x8062fec                    
  0x08048654: cmp        r0, #0                        
  0x08048656: bne        #0x80486b4                    
  0x08048658: ldr        r1, [pc, #0x28]                 ; = 0x00003F1E 
  0x0804865A: movs       r2, #1                        
  0x0804865C: rsbs       r2, r2, #0                    
  0x0804865E: movs       r0, #4                        
  0x08048660: bl         #0x8062df8                    
  0x08048664: ldrb       r0, [r4, #2]                  
  0x08048666: adds       r0, #1                        
  0x08048668: strb       r0, [r4, #2]                  
  0x0804866A: movs       r0, #3                        
  0x0804866C: bl         #0x8050410                    
  0x08048670: movs       r0, #0                        
  0x08048672: movs       r1, #1                        
  0x08048674: bl         #0x80644ac                    
  0x08048678: movs       r0, #1                        
  0x0804867A: movs       r1, #1                        
  0x0804867C: bl         #0x80644ac                    
  0x08048680: b          #0x80486b4                    
  0x08048688: bl         #0x8062fec                    
  0x0804868C: adds       r1, r0, #0                    
  0x0804868E: cmp        r1, #0                        
  0x08048690: bne        #0x80486a2                    
  0x08048692: movs       r0, #8                        
  0x08048694: strb       r0, [r4]                      
  0x08048696: strb       r0, [r4, #3]                  
  0x08048698: strb       r1, [r4, #2]                  
  0x0804869A: movs       r0, #0                        
  0x0804869C: bl         #0x8050410                    
  0x080486A0: b          #0x80486b4                    
  0x080486A2: bl         #0x80630ac                    
  0x080486A6: lsls       r0, r0, #0x10                 
  0x080486A8: lsrs       r0, r0, #0x10                 
  0x080486AA: cmp        r0, #8                        
  0x080486AC: bne        #0x80486b4                    
  0x080486AE: movs       r0, #4                        
  0x080486B0: bl         #0x8050410                    
  0x080486B4: movs       r0, #1                        
  0x080486B6: pop        {r4}                          
  0x080486B8: pop        {r1}                          
  0x080486BA: bx         r1                            