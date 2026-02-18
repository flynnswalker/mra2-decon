; Function at 0x0800CD60
; 57 instructions traced

  0x0800CD60: lsls       r0, r0, #0x18                 
  0x0800CD62: lsrs       r7, r0, #0x18                 
  0x0800CD64: movs       r0, #0x64                     
  0x0800CD66: bl         #0x8053564                    
  0x0800CD6A: lsls       r0, r0, #0x18                 
  0x0800CD6C: lsrs       r6, r0, #0x18                 
  0x0800CD6E: movs       r4, #0x32                     
  0x0800CD70: mov        r0, r8                        
  0x0800CD72: movs       r1, #0x15                     
  0x0800CD74: bl         #0x800d3a8                    
  0x0800CD78: movs       r5, #1                        
  0x0800CD7A: rsbs       r5, r5, #0                    
  0x0800CD7C: cmp        r0, r5                        
  0x0800CD7E: beq        #0x800cd82                    
  0x0800CD80: movs       r4, #0x50                     
  0x0800CD82: mov        r0, r8                        
  0x0800CD84: movs       r1, #0x16                     
  0x0800CD86: bl         #0x800d3a8                    
  0x0800CD8A: cmp        r0, r5                        
  0x0800CD8C: beq        #0x800cd90                    
  0x0800CD8E: movs       r4, #0x14                     
  0x0800CD90: cmp        r6, r4                        
  0x0800CD92: bhs        #0x800cd9c                    
  0x0800CD94: ldr        r1, [pc, #0]                  
  0x0800CD96: b          #0x800cd9e                    
  0x0800CD9C: ldr        r1, [pc, #8]                  
  0x0800CD9E: lsls       r0, r7, #2                    
  0x0800CDA0: adds       r0, r0, r1                    
  0x0800CDA2: ldr        r2, [r0]                      
  0x0800CDA4: movs       r4, #0                        
  0x0800CDA6: b          #0x800cdba                    
  0x0800CDAC: mov        r3, sp                        
  0x0800CDAE: adds       r0, r3, r4                    
  0x0800CDB0: strb       r1, [r0]                      
  0x0800CDB2: adds       r0, r4, #1                    
  0x0800CDB4: lsls       r0, r0, #0x18                 
  0x0800CDB6: lsrs       r4, r0, #0x18                 
  0x0800CDB8: adds       r2, #1                        
  0x0800CDBA: ldrb       r1, [r2]                      
  0x0800CDBC: adds       r0, r1, #0                    
  0x0800CDBE: cmp        r0, #0xff                     
  0x0800CDC0: bne        #0x800cdac                    
  0x0800CDC2: bl         #0x806354c                      ; -> prng()
  0x0800CDC6: lsls       r0, r0, #0x10                 
  0x0800CDC8: lsrs       r0, r0, #0x10                 
  0x0800CDCA: adds       r1, r4, #0                    
  0x0800CDCC: bl         #0x81c7a6c                    
  0x0800CDD0: lsls       r0, r0, #0x18                 
  0x0800CDD2: lsrs       r0, r0, #0x18                 
  0x0800CDD4: add        r0, sp, r0                    
  0x0800CDD6: ldrb       r0, [r0]                      
  0x0800CDD8: add        sp, #0xc                      
  0x0800CDDA: pop        {r3}                          
  0x0800CDDC: mov        r8, r3                        
  0x0800CDDE: pop        {r4, r5, r6, r7}              
  0x0800CDE0: pop        {r1}                          
  0x0800CDE2: bx         r1                            