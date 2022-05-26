.cpu cortex-a53

.text
.p2align 2

sum_mul:         //x0 -> a  x1 -> a.size
  mov x2, #0       //indice array
  mov w3, #0       //somma

  cmp x2, x1
  b.ge exitfor

  initfor:
    add x4, x0, x2, LSL #2
    ldr w4, [x4]

    ands w5, w4, #3
    b.ne endif
    add w3, w3, w4

    endif:
      add x2, x2, #1   //incremento indice
      cmp x2, x1
      b.lt initfor

  exitfor:
    mov x0, x3

  ret

.global _start
_start:             
  adr x0, a         //x0 = &a
  adr x1, size
  ldr w1, [x1]

  bl sum_mul
  
  b exit            // branch all'etichetta exit presente nel file exit.s

/* varibiali */
.data
.p2align 2

a: .word 1, 2, 4, 8, 3, 1, 6, 8, 12, 10
size: .word 10