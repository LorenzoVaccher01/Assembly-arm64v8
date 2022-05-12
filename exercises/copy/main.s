.cpu cortex-a53

.text
.p2align 2

copy:  //x0 -> b, x1 -> a
  mov x2, #0  //indice

  ldr w3, [x0]
  cmp w3, #0
  b.eq exitwhile

  initwhile:
  add x3, x0, x2, LSL #2
  ldr w5, [x3]
  add x4, x1, x2, LSL #2
  str x5, [x4]

  add x2, x2, #1  //incremento

  cmp w5, wzr
  b.ne initwhile

  exitwhile:
    add x3, x0, x2, LSL #2
    str xzr, [x3]
    mov x0, x2

  ret

.global _start
_start:             
  adr x0, b
  adr x1, a

  bl copy

  b exit

.data
.p2align 2

b: .word 1, 10, 2, 10, 4, 10, 0, -5, 10, 10
a: .space 10