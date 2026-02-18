; Function at 0x0801E9DC
; 69 instructions traced

  0x0801E9DC: push       {r4, r5, r6, r7, lr}          
  0x0801E9DE: mov        r7, sb                        
  0x0801E9E0: mov        r6, r8                        
  0x0801E9E2: push       {r6, r7}                      
  0x0801E9E4: adds       r6, r0, #0                    
  0x0801E9E6: mov        r8, r1                        
  0x0801E9E8: lsls       r2, r2, #0x10                 
  0x0801E9EA: lsrs       r4, r2, #0x10                 
  0x0801E9EC: movs       r0, #8                        
  0x0801E9EE: subs       r0, r0, r4                    
  0x0801E9F0: lsls       r0, r0, #1                    
  0x0801E9F2: add        r0, r8                        
  0x0801E9F4: ldrh       r0, [r0]                      
  0x0801E9F6: adds       r1, r4, #1                    
  0x0801E9F8: mov        ip, r1                        
  0x0801E9FA: ldr        r1, [pc, #0x54]                 ; = 0x0000FFFF 
  0x0801E9FC: mov        sb, r1                        
  0x0801E9FE: mov        r1, r8                        
  0x0801EA00: adds       r2, r1, r0                    
  0x0801EA02: movs       r3, #0                        
  0x0801EA04: lsls       r7, r4, #1                    
  0x0801EA06: cmp        r3, ip                        
  0x0801EA08: bge        #0x801ea2c                    
  0x0801EA0A: ldrh       r0, [r6]                      
  0x0801EA0C: ldrh       r1, [r2]                      
  0x0801EA0E: cmp        r0, r1                        
  0x0801EA10: bne        #0x801ea2c                    
  0x0801EA12: mov        r5, ip                        
  0x0801EA14: adds       r0, r3, #1                    
  0x0801EA16: lsls       r0, r0, #0x10                 
  0x0801EA18: lsrs       r3, r0, #0x10                 
  0x0801EA1A: cmp        r3, r5                        
  0x0801EA1C: bge        #0x801ea2c                    
  0x0801EA1E: lsls       r0, r3, #1                    
  0x0801EA20: adds       r1, r0, r6                    
  0x0801EA22: adds       r0, r0, r2                    
  0x0801EA24: ldrh       r1, [r1]                      
  0x0801EA26: ldrh       r0, [r0]                      
  0x0801EA28: cmp        r1, r0                        
  0x0801EA2A: beq        #0x801ea14                    
  0x0801EA2C: cmp        r4, r3                        
  0x0801EA2E: bne        #0x801ea54                    
  0x0801EA30: movs       r3, #0                        
  0x0801EA32: cmp        r3, r4                        
  0x0801EA34: bhs        #0x801ea4a                    
  0x0801EA36: ldr        r0, [pc, #0x18]                 ; = 0x0000FFFF 
  0x0801EA38: adds       r1, r0, #0                    
  0x0801EA3A: lsls       r0, r3, #1                    
  0x0801EA3C: adds       r0, r0, r6                    
  0x0801EA3E: strh       r1, [r0]                      
  0x0801EA40: adds       r0, r3, #1                    
  0x0801EA42: lsls       r0, r0, #0x10                 
  0x0801EA44: lsrs       r3, r0, #0x10                 
  0x0801EA46: cmp        r3, r4                        
  0x0801EA48: blo        #0x801ea3a                    
  0x0801EA4A: adds       r0, r7, #2                    
  0x0801EA4C: adds       r0, r2, r0                    
  0x0801EA4E: b          #0x801ea5e                    
  0x0801EA54: adds       r0, r7, r2                    
  0x0801EA56: ldrh       r0, [r0]                      
  0x0801EA58: cmp        r0, sb                        
  0x0801EA5A: bne        #0x801e9fe                    
  0x0801EA5C: movs       r0, #0                        
  0x0801EA5E: pop        {r3, r4}                      
  0x0801EA60: mov        r8, r3                        
  0x0801EA62: mov        sb, r4                        
  0x0801EA64: pop        {r4, r5, r6, r7}              
  0x0801EA66: pop        {r1}                          
  0x0801EA68: bx         r1                            