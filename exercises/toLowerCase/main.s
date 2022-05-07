.cpu cortex-a53

.text
.p2align 2


toLowerCase:  //void, x0 -> &(str), x1 -> size
  mov x2, #0  //indice array

  cmp x2, x1
  b.ge exitfor

  initfor:
    add x3, x0, x2 //TODO: vedere se è giusto
    ldr w4, [x3]

    // if (w4 >= 65 && w4 <= 90) => eseguire operazione lower case
    cmp w4, #65
    b.lt exitif 
    cmp w4, #90
    b.gt exitif

    add w5, w4, #-32 
    str w5, [x3]

    exitif:
      add x2, x2, #1    // x2 += 1
      cmp x2, x1
      b.lt initfor

  exitfor:
    ret

.global _start
_start:             
  adr x0, str        //x0 = &str
  adr x1, size
  ldr w1, [x1]

  bl toLowerCase
  
  mov x2, x1          // Carichiamo in x2 il numero di bytes da scrivere
  mov x1, x0          // carico l'indirizzo in x1 per stampare str
  mov x0, #1
  mov x8, #64         //syscall
  svc #0              //call

  b exit              // branch all'etichetta exit presente nel file exit.s

.data
.p2align 2

str: .ascii "Questo È UN TEST!\n"
size: .word 18