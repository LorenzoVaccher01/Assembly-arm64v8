.cpu cortex-a53

.text
.p2align 2

/*funzioni esterne*/
.global print_int_c

.global _start

_start:             
  adr x0, #4
  bl print_int_c    
  
  mov x0, #3 
  mov x8, #93
  svc #0