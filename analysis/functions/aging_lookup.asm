; Function at 0x08024DA8
; 22 instructions traced

  0x08024DA8: push       {r4, r5, lr}                  
  0x08024DAA: adds       r5, r0, #0                    
  0x08024DAC: adds       r4, r1, #0                    
  0x08024DAE: bl         #0x8002530                    
  0x08024DB2: movs       r1, #0x71                     
  0x08024DB4: movs       r2, #0                        
  0x08024DB6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x08024DBA: movs       r1, #0x3e                     
  0x08024DBC: bl         #0x800d3a8                    
  0x08024DC0: movs       r1, #1                        
  0x08024DC2: rsbs       r1, r1, #0                    
  0x08024DC4: cmp        r0, r1                        
  0x08024DC6: beq        #0x8024dca                    
  0x08024DC8: movs       r4, #1                        
  0x08024DCA: ldr        r0, [pc, #0x10]                 ; = 0x083F3E20 
  0x08024DCC: lsls       r1, r5, #4                    
  0x08024DCE: adds       r1, r4, r1                    
  0x08024DD0: adds       r1, r1, r0                    
  0x08024DD2: ldrb       r0, [r1]                      
  0x08024DD4: pop        {r4, r5}                      
  0x08024DD6: pop        {r1}                          
  0x08024DD8: bx         r1                            