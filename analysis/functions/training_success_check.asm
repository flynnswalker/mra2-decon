; Function at 0x08001330
; 47 instructions traced

  0x08001330: push       {r4, r5, r6, lr}              
  0x08001332: adds       r5, r0, #0                    
  0x08001334: adds       r4, r1, #0                    
  0x08001336: ldr        r6, [pc, #0x24]                 ; = 0x02002B24 WRAM_PLAYER_STATE
  0x08001338: adds       r0, r6, #0                    
  0x0800133A: movs       r1, #0x9a                     
  0x0800133C: adds       r2, r5, #0                    
  0x0800133E: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[154]
  0x08001342: cmp        r0, #0                        
  0x08001344: beq        #0x8001392                    
  0x08001346: cmp        r4, #0x1d                     
  0x08001348: bgt        #0x8001360                    
  0x0800134A: adds       r0, r6, #0                    
  0x0800134C: movs       r1, #0x9a                     
  0x0800134E: adds       r2, r4, #0                    
  0x08001350: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> field[154]
  0x08001354: cmp        r0, #0                        
  0x08001356: beq        #0x8001392                    
  0x08001358: b          #0x800139c                    
  0x08001360: cmp        r4, #0x22                     
  0x08001362: ble        #0x8001372                    
  0x08001364: ldr        r1, [pc, #0x30]                 ; = 0x00000107 
  0x08001366: adds       r0, r6, #0                    
  0x08001368: adds       r2, r5, #0                    
  0x0800136A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800136E: cmp        r0, #0                        
  0x08001370: beq        #0x8001392                    
  0x08001372: adds       r0, r5, #0                    
  0x08001374: adds       r1, r4, #0                    
  0x08001376: bl         #0x80013a4                    
  0x0800137A: adds       r2, r0, #0                    
  0x0800137C: movs       r0, #1                        
  0x0800137E: rsbs       r0, r0, #0                    
  0x08001380: cmp        r2, r0                        
  0x08001382: beq        #0x800139c                    
  0x08001384: movs       r1, #0x83                     
  0x08001386: lsls       r1, r1, #1                    
  0x08001388: adds       r0, r6, #0                    
  0x0800138A: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx) | -> amount_0xF2 (offset 0x00F2)
  0x0800138E: cmp        r0, #1                        
  0x08001390: beq        #0x800139c                    
  0x08001392: movs       r0, #0                        
  0x08001394: b          #0x800139e                    
  0x0800139C: movs       r0, #1                        
  0x0800139E: pop        {r4, r5, r6}                  
  0x080013A0: pop        {r1}                          
  0x080013A2: bx         r1                            