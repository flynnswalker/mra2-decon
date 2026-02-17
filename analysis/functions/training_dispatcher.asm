; Function at 0x08001FDC
; 81 instructions traced

  0x08001FDC: push       {r4, r5, lr}                  
  0x08001FDE: ldr        r5, [pc, #0x20]                 ; = 0x02002B24 WRAM_PLAYER_STATE
  0x08001FE0: adds       r0, r5, #0                    
  0x08001FE2: movs       r1, #0xb5                     
  0x08001FE4: movs       r2, #0                        
  0x08001FE6: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[181]
  0x08001FEA: lsls       r0, r0, #0x18                 
  0x08001FEC: lsrs       r0, r0, #0x18                 
  0x08001FEE: adds       r1, r0, #0                    
  0x08001FF0: cmp        r0, #1                        
  0x08001FF2: beq        #0x800203c                    
  0x08001FF4: cmp        r0, #1                        
  0x08001FF6: bgt        #0x8002004                    
  0x08001FF8: cmp        r0, #0                        
  0x08001FFA: beq        #0x800200a                    
  0x08001FFC: b          #0x800208e                    
  0x08002004: cmp        r1, #2                        
  0x08002006: beq        #0x8002074                    
  0x08002008: b          #0x800208e                    
  0x0800200A: adds       r0, r5, #0                    
  0x0800200C: movs       r1, #0xb3                     
  0x0800200E: movs       r2, #0x19                     
  0x08002010: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[179]
  0x08002014: cmp        r0, #0                        
  0x08002016: bne        #0x800208e                    
  0x08002018: adds       r0, r5, #0                    
  0x0800201A: movs       r1, #0xc1                     
  0x0800201C: movs       r2, #0                        
  0x0800201E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[193]
  0x08002022: adds       r4, r0, #0                    
  0x08002024: movs       r0, #0x3c                     
  0x08002026: bl         #0x8002a84                    
  0x0800202A: adds       r1, r0, #0                    
  0x0800202C: adds       r0, r4, #0                    
  0x0800202E: movs       r2, #2                        
  0x08002030: bl         #0x8001bec                    
  0x08002034: adds       r0, r5, #0                    
  0x08002036: movs       r1, #0xb3                     
  0x08002038: movs       r2, #1                        
  0x0800203A: b          #0x800206c                    
  0x0800203C: adds       r0, r5, #0                    
  0x0800203E: movs       r1, #0xb3                     
  0x08002040: movs       r2, #0x19                     
  0x08002042: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[179]
  0x08002046: cmp        r0, #1                        
  0x08002048: bne        #0x800208e                    
  0x0800204A: adds       r0, r5, #0                    
  0x0800204C: movs       r1, #0xc1                     
  0x0800204E: movs       r2, #2                        
  0x08002050: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[193]
  0x08002054: adds       r4, r0, #0                    
  0x08002056: movs       r0, #0x3d                     
  0x08002058: bl         #0x8002a84                    
  0x0800205C: adds       r1, r0, #0                    
  0x0800205E: adds       r0, r4, #0                    
  0x08002060: movs       r2, #2                        
  0x08002062: bl         #0x8001bec                    
  0x08002066: adds       r0, r5, #0                    
  0x08002068: movs       r1, #0xb3                     
  0x0800206A: movs       r2, #2                        
  0x0800206C: movs       r3, #0x19                     
  0x0800206E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[179]
  0x08002072: b          #0x800208e                    
  0x08002074: adds       r0, r5, #0                    
  0x08002076: movs       r1, #0xb3                     
  0x08002078: movs       r2, #0x19                     
  0x0800207A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[179]
  0x0800207E: cmp        r0, #2                        
  0x08002080: bne        #0x800208e                    
  0x08002082: adds       r0, r5, #0                    
  0x08002084: movs       r1, #0xb3                     
  0x08002086: movs       r2, #3                        
  0x08002088: movs       r3, #0x19                     
  0x0800208A: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx) | -> field[179]
  0x0800208E: adds       r0, r5, #0                    
  0x08002090: movs       r1, #0xb3                     
  0x08002092: movs       r2, #0x19                     
  0x08002094: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[179]
  0x08002098: pop        {r4, r5}                      
  0x0800209A: pop        {r0}                          
  0x0800209C: bx         r0                            