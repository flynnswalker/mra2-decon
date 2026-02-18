; Function at 0x0800D604
; 44 instructions traced

  0x0800D604: push       {r4, r5, lr}                  
  0x0800D606: adds       r5, r0, #0                    
  0x0800D608: movs       r4, #0                        
  0x0800D60A: adds       r0, r5, #0                    
  0x0800D60C: movs       r1, #0x4b                     
  0x0800D60E: adds       r2, r4, #0                    
  0x0800D610: bl         #0x80035bc                      ; -> field_read(base, field_idx, arr_idx)
  0x0800D614: cmp        r0, #0x2b                     
  0x0800D616: beq        #0x800d622                    
  0x0800D618: adds       r4, #1                        
  0x0800D61A: cmp        r4, #5                        
  0x0800D61C: ble        #0x800d60a                    
  0x0800D61E: movs       r4, #1                        
  0x0800D620: rsbs       r4, r4, #0                    
  0x0800D622: movs       r0, #1                        
  0x0800D624: rsbs       r0, r0, #0                    
  0x0800D626: cmp        r4, r0                        
  0x0800D628: beq        #0x800d63c                    
  0x0800D62A: adds       r0, r5, #0                    
  0x0800D62C: bl         #0x8002830                    
  0x0800D630: cmp        r0, #0                        
  0x0800D632: beq        #0x800d63c                    
  0x0800D634: cmp        r0, #2                        
  0x0800D636: beq        #0x800d63c                    
  0x0800D638: cmp        r0, #4                        
  0x0800D63A: bne        #0x800d640                    
  0x0800D63C: movs       r0, #0                        
  0x0800D63E: b          #0x800d660                    
  0x0800D640: adds       r3, r4, #0                    
  0x0800D642: cmp        r3, #5                        
  0x0800D644: ble        #0x800d648                    
  0x0800D646: movs       r3, #0                        
  0x0800D648: adds       r0, r5, #0                    
  0x0800D64A: movs       r1, #0x4b                     
  0x0800D64C: movs       r2, #0xff                     
  0x0800D64E: bl         #0x80035d0                      ; -> field_write(base, field_idx, value, arr_idx)
  0x0800D652: adds       r0, r5, #0                    
  0x0800D654: bl         #0x800d410                    
  0x0800D658: adds       r0, r5, #0                    
  0x0800D65A: bl         #0x800d0f8                    
  0x0800D65E: movs       r0, #1                        
  0x0800D660: pop        {r4, r5}                      
  0x0800D662: pop        {r1}                          
  0x0800D664: bx         r1                            