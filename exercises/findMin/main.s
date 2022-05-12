.cpu cortex-a53

.text
.p2align 2

findMin:  //x0 -> v, x1 -> n, x2 -> min
  mov x3, #1  //indice
  mov x4, #0  //min

  ldr w5, [x0]
  mov w4, w5

  cmp x3, x1
  b.ge exitfor

  initfor:
    add x6, x0, x3, LSL #2
    ldr w5, [x6]
    cmp w5, w4    //w5 >= w4 => *v >= m
    b.ge exitif
    mov w4, w5

    exitif:
      add x3, x3, #1
      cmp x3, x1
      b.lt initfor

  exitfor:
    str x4, [x2]

  ret

.global _start
_start:             
  adr x0, v
  adr x1, size
  ldr w1, [x1]
  adr x2, min

  bl findMin

  b exit

.data
.p2align 2

v: .word 1, 10, 2, 10, 4, 10, 5, -5, 10, 10
size: .word 10
min: .space 1