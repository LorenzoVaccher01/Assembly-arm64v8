/*
  Tradurre in assembly MIPS la porzione di codice C presente nel file main.c, dove la funzione sum even pos 
  somma gli elementi in posizione pari di un array di interi.
*/

.cpu cortex-a53

.text
.p2align 2

/*funzioni esterne*/
.extern print_int_c

sum_even_pos:     //x0 -> ar  x1 -> size_ar
  mov x2, #0      //Indice arr = 0
  mov x3, #0      //Valore da ritornare
  mov x5, #0      //Valore da prendere dall'array

  cmp x2, x1
  b.eq exitfor

  initfor:
    cmp x2, x1
    b.eq exitfor
    /* body for */
    add x5, x0, x2, LSL #2  //x5=(x0+x2)*4
    ldr w4, [x5]            //x4 = $(A[x5])
    add w3, w3, w4

    add x2, x2, #2   //incremento indice

  exitfor:
    mov w0, w3      //Carico nel registro x0 il valore da ritornare

  ret

.global _start
_start:             
  adr x0, ar
  mov x1, #10       //Size dell'array

  bl sum_even_pos   //In x0 è presente il return

  b print_int_c    
  
  b exit            // branch all'etichetta exit presente nel file exit.s

/* varibiali */
.data
.p2align 2

ar: .word 1, -1, 2, -2, 4, -4, 5, -5, 6, -6 //Array