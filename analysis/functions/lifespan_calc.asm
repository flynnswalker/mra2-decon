; Function at 0x08002A98
; 27 instructions traced

  0x08002A98: push       {lr}                          
  0x08002A9A: lsls       r1, r1, #2                    
  0x08002A9C: adds       r0, r0, r1                    
  0x08002A9E: subs       r0, #0x32                     
  0x08002AA0: adds       r0, r0, r2                    
  0x08002AA2: rsbs       r1, r3, #0                    
  0x08002AA4: cmp        r3, #0                        
  0x08002AA6: ble        #0x8002aaa                    
  0x08002AA8: adds       r1, r3, #0                    
  0x08002AAA: subs       r0, r0, r1                    
  0x08002AAC: lsls       r1, r0, #1                    
  0x08002AAE: adds       r1, r1, r0                    
  0x08002AB0: lsls       r0, r1, #4                    
  0x08002AB2: subs       r0, r0, r1                    
  0x08002AB4: movs       r1, #0x64                     
  0x08002AB6: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08002ABA: movs       r1, #0x30                     
  0x08002ABC: bl         #0x81c79d4                      ; -> multiply(a, b)
  0x08002AC0: adds       r1, r0, #0                    
  0x08002AC2: lsls       r0, r1, #1                    
  0x08002AC4: adds       r0, r0, r1                    
  0x08002AC6: lsls       r0, r0, #4                    
  0x08002AC8: cmp        r0, #0x2f                     
  0x08002ACA: bgt        #0x8002ace                    
  0x08002ACC: movs       r0, #0x30                     
  0x08002ACE: pop        {r1}                          
  0x08002AD0: bx         r1                            