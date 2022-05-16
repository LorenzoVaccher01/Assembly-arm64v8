.cpu cortex-a53

.text
.p2align 2

strncpy: //x0 -> dest, x1 -> source, x2 -> n
  mov x3, #0  //indice
  mov x4, #0  //last

  initdo:
    ldrb w4, [x1]
    strb w4, [x0]

    add x0, x0, #1   //dest++
    add x1, x1, #1   //source++
    add x3, x3, #1   //i++

    cmp x3, x2
    b.eq  exitwhile   //break

    cmp w4, wzr
    b.ne initdo
  
  exitwhile:
    mov x3, x0  //return i
    ret

.global _start
_start:             
  adr x0, b
  adr x1, a
  adr x2, n
  ldr w2, [x2]

  bl strncpy
  
  b exit            // branch all'etichetta exit presente nel file exit.s

/* varibiali */
.data
.p2align 2

a: .ascii "Test\n"
b: .space 5
n: .word 100