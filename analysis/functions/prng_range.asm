; Function at 0x08053564
; 14 instructions traced

  0x08053564: push       {r4, lr}                      
  0x08053566: adds       r4, r0, #0                    
  0x08053568: lsls       r4, r4, #0x18                 
  0x0805356A: lsrs       r4, r4, #0x18                 
  0x0805356C: bl         #0x806354c                      ; -> prng()
  0x08053570: lsls       r0, r0, #0x18                 
  0x08053572: lsrs       r0, r0, #0x18                 
  0x08053574: adds       r1, r4, #0                    
  0x08053576: bl         #0x81c7c24                      ; -> divmod(a, b)
  0x0805357A: lsls       r0, r0, #0x18                 
  0x0805357C: lsrs       r0, r0, #0x18                 
  0x0805357E: pop        {r4}                          
  0x08053580: pop        {r1}                          
  0x08053582: bx         r1                            