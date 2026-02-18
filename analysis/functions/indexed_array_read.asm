; Function at 0x0801E388
; 39 instructions traced

  0x0801E388: push       {r4, r5, r6, r7, lr}          
  0x0801E38A: adds       r7, r1, #0                    
  0x0801E38C: adds       r4, r2, #0                    
  0x0801E38E: lsls       r0, r0, #0x18                 
  0x0801E390: lsrs       r6, r0, #0x18                 
  0x0801E392: movs       r5, #1                        
  0x0801E394: rsbs       r5, r5, #0                    
  0x0801E396: movs       r1, #0                        
  0x0801E398: lsls       r0, r1, #0x10                 
  0x0801E39A: asrs       r3, r0, #0x10                 
  0x0801E39C: adds       r1, r7, r3                    
  0x0801E39E: ldrb       r1, [r1]                      
  0x0801E3A0: adds       r2, r0, #0                    
  0x0801E3A2: cmp        r1, #0                        
  0x0801E3A4: beq        #0x801e3c0                    
  0x0801E3A6: adds       r0, r3, #1                    
  0x0801E3A8: lsls       r0, r0, #1                    
  0x0801E3AA: adds       r0, r4, r0                    
  0x0801E3AC: ldrh       r0, [r0]                      
  0x0801E3AE: adds       r1, r4, r0                    
  0x0801E3B0: ldrb       r0, [r1]                      
  0x0801E3B2: adds       r1, #1                        
  0x0801E3B4: cmp        r6, r0                        
  0x0801E3B6: bne        #0x801e3c0                    
  0x0801E3B8: ldrb       r0, [r1]                      
  0x0801E3BA: cmp        r5, r0                        
  0x0801E3BC: bge        #0x801e3c0                    
  0x0801E3BE: adds       r5, r0, #0                    
  0x0801E3C0: movs       r1, #0x80                     
  0x0801E3C2: lsls       r1, r1, #9                    
  0x0801E3C4: adds       r0, r2, r1                    
  0x0801E3C6: lsrs       r1, r0, #0x10                 
  0x0801E3C8: asrs       r0, r0, #0x10                 
  0x0801E3CA: cmp        r0, #0x4b                     
  0x0801E3CC: ble        #0x801e398                    
  0x0801E3CE: adds       r0, r5, #0                    
  0x0801E3D0: pop        {r4, r5, r6, r7}              
  0x0801E3D2: pop        {r1}                          
  0x0801E3D4: bx         r1                            