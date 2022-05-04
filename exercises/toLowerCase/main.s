.cpu cortex-a53

.text
.p2align 2


.global _start

print:  //x1 = str  x2 = ize(str)
  mov x0, #1          // Carichiamo il descrittore file che definisce lo standard output in x0
  mov x8, #64         // specifichiamo il numero di syscall in x8
  svc #0              // syscall

  ret

_start:             
  
  
  

  b exit          // branch all'etichetta exit presente nel file exit.s

.data
.p2align 2

str: .ascii "Questo È UN TEST!"