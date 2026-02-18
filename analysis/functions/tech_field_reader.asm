; Function at 0x0806862C
; 59 instructions traced

  0x0806862C: push       {r4, r5, r6, r7, lr}          
  0x0806862E: mov        r7, sb                        
  0x08068630: mov        r6, r8                        
  0x08068632: push       {r6, r7}                      
  0x08068634: lsls       r1, r1, #0x18                 
  0x08068636: lsrs       r6, r1, #0x18                 
  0x08068638: movs       r5, #0                        
  0x0806863A: adds       r4, r0, #0                    
  0x0806863C: movs       r7, #0                        
  0x0806863E: cmp        r5, r6                        
  0x08068640: bhs        #0x8068694                    
  0x08068642: ldrh       r0, [r4]                      
  0x08068644: ldr        r2, [pc, #0x34]                 ; = 0x0000FFFD 
  0x08068646: cmp        r0, r2                        
  0x08068648: beq        #0x8068694                    
  0x0806864A: ldr        r1, [pc, #0x34]                 ; = 0x0000FFF4 
  0x0806864C: cmp        r0, r1                        
  0x0806864E: beq        #0x8068694                    
  0x08068650: mov        sb, r2                        
  0x08068652: mov        r8, r1                        
  0x08068654: adds       r0, r4, #0                    
  0x08068656: bl         #0x8068714                    
  0x0806865A: lsls       r0, r0, #0x18                 
  0x0806865C: lsrs       r0, r0, #0x18                 
  0x0806865E: adds       r0, r5, r0                    
  0x08068660: lsls       r0, r0, #0x10                 
  0x08068662: lsrs       r5, r0, #0x10                 
  0x08068664: adds       r4, #2                        
  0x08068666: adds       r0, r7, #1                    
  0x08068668: lsls       r0, r0, #0x18                 
  0x0806866A: lsrs       r7, r0, #0x18                 
  0x0806866C: cmp        r7, r6                        
  0x0806866E: bhs        #0x8068694                    
  0x08068670: ldrh       r0, [r4]                      
  0x08068672: cmp        r0, sb                        
  0x08068674: beq        #0x8068694                    
  0x08068676: cmp        r0, r8                        
  0x08068678: bne        #0x8068654                    
  0x0806867A: b          #0x8068694                    
  0x08068684: adds       r0, r4, #0                    
  0x08068686: bl         #0x8068714                    
  0x0806868A: lsls       r0, r0, #0x18                 
  0x0806868C: lsrs       r0, r0, #0x18                 
  0x0806868E: subs       r0, r5, r0                    
  0x08068690: lsls       r0, r0, #0x10                 
  0x08068692: lsrs       r5, r0, #0x10                 
  0x08068694: subs       r4, #2                        
  0x08068696: cmp        r5, #0                        
  0x08068698: beq        #0x80686a0                    
  0x0806869A: ldrh       r0, [r4]                      
  0x0806869C: cmp        r0, #0                        
  0x0806869E: beq        #0x8068684                    
  0x080686A0: adds       r0, r5, #0                    
  0x080686A2: pop        {r3, r4}                      
  0x080686A4: mov        r8, r3                        
  0x080686A6: mov        sb, r4                        
  0x080686A8: pop        {r4, r5, r6, r7}              
  0x080686AA: pop        {r1}                          
  0x080686AC: bx         r1                            