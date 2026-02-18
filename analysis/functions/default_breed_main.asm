; Function at 0x0801EA6C
; 50 instructions traced

  0x0801EA6C: push       {r4, r5, r6, r7, lr}          
  0x0801EA6E: adds       r4, r0, #0                    
  0x0801EA70: adds       r6, r2, #0                    
  0x0801EA72: lsls       r1, r1, #0x10                 
  0x0801EA74: lsrs       r5, r1, #0x10                 
  0x0801EA76: ldrh       r0, [r4]                      
  0x0801EA78: adds       r0, #1                        
  0x0801EA7A: lsls       r0, r0, #0x10                 
  0x0801EA7C: lsrs       r2, r0, #0x10                 
  0x0801EA7E: movs       r3, #1                        
  0x0801EA80: ldr        r7, [pc, #0x18]                 ; = 0x081E9AD0 
  0x0801EA82: cmp        r3, r5                        
  0x0801EA84: bhs        #0x801eabe                    
  0x0801EA86: movs       r0, #1                        
  0x0801EA88: ands       r0, r3                        
  0x0801EA8A: cmp        r0, #0                        
  0x0801EA8C: beq        #0x801eaa0                    
  0x0801EA8E: lsls       r0, r3, #1                    
  0x0801EA90: adds       r0, r0, r4                    
  0x0801EA92: ldrh       r0, [r0]                      
  0x0801EA94: adds       r0, r0, r3                    
  0x0801EA96: adds       r0, #1                        
  0x0801EA98: muls       r0, r2, r0                    
  0x0801EA9A: b          #0x801eab0                    
  0x0801EAA0: lsls       r0, r3, #1                    
  0x0801EAA2: adds       r0, r0, r4                    
  0x0801EAA4: ldrh       r1, [r0]                      
  0x0801EAA6: adds       r1, r3, r1                    
  0x0801EAA8: adds       r1, #1                        
  0x0801EAAA: lsls       r0, r2, #0x10                 
  0x0801EAAC: asrs       r0, r0, #0x10                 
  0x0801EAAE: adds       r0, r0, r1                    
  0x0801EAB0: lsls       r0, r0, #0x10                 
  0x0801EAB2: lsrs       r2, r0, #0x10                 
  0x0801EAB4: adds       r0, r3, #1                    
  0x0801EAB6: lsls       r0, r0, #0x10                 
  0x0801EAB8: lsrs       r3, r0, #0x10                 
  0x0801EABA: cmp        r3, r5                        
  0x0801EABC: blo        #0x801ea86                    
  0x0801EABE: subs       r1, r2, #1                    
  0x0801EAC0: movs       r0, #0xff                     
  0x0801EAC2: ands       r1, r0                        
  0x0801EAC4: ldr        r0, [r7]                      
  0x0801EAC6: adds       r0, r0, r7                    
  0x0801EAC8: adds       r0, r0, r1                    
  0x0801EACA: ldrb       r0, [r0]                      
  0x0801EACC: strb       r0, [r6]                      
  0x0801EACE: pop        {r4, r5, r6, r7}              
  0x0801EAD0: pop        {r0}                          
  0x0801EAD2: bx         r0                            