.cpu cortex-a53

.text
.p2align 2

.global exit

exit:             // return del programma
  mov x0, #0 
  mov x8, #93
  svc #0