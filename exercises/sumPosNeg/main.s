.cpu cortex-a53

.text
.p2align 2

sumPosNeg:  //x0 -> arr, x1 -> size, x2 -> sum_pos, x3 -> sum_neg
  mov x4, #0  //indice

  cmp x4, x1
  b.ge exitfor

  initfor:
    add x5, x0, x4, LSL #2
    ldr w5, [x5]

    cmp w5, #0
    b.gt checkneg
    add w3, w3, w5  //numero negativo
    b continue

    checkneg:
      b.lt continue
      add w2, w2, w5  //numero positivo

    continue:
      add x4, x4, #1
      cmp x4, x1
      b.lt initfor

  exitfor:
    ret

.global _start
_start:             
  adr x0, arr
  adr x1, size
  ldr w1, [x1]
  mov x2, xzr
  mov x3, xzr

  bl sumPosNeg

  b exit

.data
.p2align 2

arr: .word 1, 2, 3, -1, -2, 1, -2
size: .word 7