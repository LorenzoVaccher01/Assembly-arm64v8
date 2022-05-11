.cpu cortex-a53

.text
.p2align 2

doubleVect:         //x0 -> b  x1 -> a, x2 -> size
  mov x3, #0        //indice
  mov x4, #0         //ret

  cmp x3, x2
  b.ge return

  initfor:
    add x5, x0, x3, LSL #2    //out[i]
    add x6, x1, x3, LSL #2    //in[i] * 2
    ldr w6, [x6]
    add x6, xzr, x6, LSL #1
    str x6, [x5]              //out[i] = in[i] * 2
    add x4, x4, x6            //x4 += out[i]
    
    add x3, x3, #1
    cmp x3, x2
    b.lt initfor

  return:
    mov x0, x4
    ret

.global _start
_start:             
  adr x0, b
  adr x1, a
  adr x2, size
  ldr w2, [x2]

  bl doubleVect
  
  b exit           


/* varibiali */
.data
.p2align 2

a: .word 1, 2, 3, 4, 5
b: .space 20
size: .word 5