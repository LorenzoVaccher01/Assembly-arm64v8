.cpu cortex-a53

.text
.p2align 2

remove_neg:         //x0 -> a  x1 -> a.size
  mov x2, #0       //indice array
  mov w3, #0       //somma negativi

  cmp x2, x1
  b.ge exitfor

  initfor:
    /* body for */
    add x5, x0, x2, LSL #2  //x5=x0+x2*4
    ldr w4, [x5]

    cmp w4, #0
    b.ge endif

    add w3, w3, w4    // w3 +=  w4
    str xzr, [x5]     // xzr > &(x5)

    endif:
      add x2, x2, #1   //incremento indice
      cmp x2, x1
      b.lt initfor

  exitfor:
    mov w0, w3      //load risultato in x0

  ret

.global _start
_start:             
  adr x0, a         //x0 = &a
  mov x1, #5        //a.size - 1

  bl remove_neg
  
  b exit            // branch all'etichetta exit presente nel file exit.s

/* varibiali */
.data
.p2align 2

a: .word 1, 2, -3, -3, 5 //Array