.cpu cortex-a53

.text
.p2align 2

countNumber:  //x0 -> arr, x1 -> size, x2 -> number
  mov x3, #0  //indice array 
  mov x4, #0  //counter

  cmp x3, x1
  b.ge exitfor

  initfor:
    add x6, x0, x3, LSL #2
    ldr w6, [x6]
    cmp x6, x2
    b.ne continue
    add x4, x4, #1

    continue:
      add x3, x3, #1
      cmp x3, x1
      b.lt initfor

  exitfor:
    mov x4, x3
  ret

.global _start
_start:             
  adr x0, a
  adr x1, size
  ldr w1, [x1]
  adr x2, number
  ldr w2, [x2]

  bl countNumber

  b exit

.data
.p2align 2

a: .word 1, 10, 2, 10, 4, 10, 5, -5, 10, 10
size: .word 10
number: .word 10