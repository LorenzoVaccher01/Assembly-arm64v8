.cpu cortex-a53

.text
.p2align 2


.global _start
_start:             
  
  
  

  b exit          // branch all'etichetta exit presente nel file exit.s

.data
.p2align 2

str: .ascii "Questo È UN TEST!"