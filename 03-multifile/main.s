.cpu cortex-a53

.text
.p2align 2


.global _start

_start:             
  mov x0, #10
  mov x1, #1
  add x0, x0, x1
  b exit          // branch all'etichetta exit presente nel file exit.s