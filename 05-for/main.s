/*
  Programma che stampa a video gli elementi di arr.
*/

.cpu cortex-a53

.text
.p2align 2

.global _start

.extern printf

_start:  
  /*inizializzazione dei registri*/           
  adr x13, arr     // x13 = &arr (indirizzo di memoria)
  adr x16, size    // x14 = &size (indirizzo di memoria)
  ldr x14, [x16]   // w14 < mem[x16]
  mov x15, #0      // w15 = 0  (indice dell'array)

  /* controllo condizione ciclo for*/
  cmp x14, x15
  b.eq exitfor

  initfor:
    /* verifica condizione di uscita for */
    cmp x14, x15
    b.eq exitfor

    /* inizio body for */
    mov x0, #1          // Carichiamo il descrittore file che definisce lo standard output in x0
    adr x1, hellostring // Carichiamo in x1 l'indirizzo di hellostring
    mov x2, #12         // Carichiamo in x2 il numero di bytes da scrivere
    mov x8, #64         // specifichiamo il numero di syscall in x8
    svc #0              // syscall
    /* fine body for */
    
    add x15, x15, #1    // incremento contatore
    b initfor

  exitfor:
    mov x13, #0

  b exit          // fine programma


.data
.p2align 2

arr:    .dword 10, 20, 30, 40, 50
size:   .dword 2
count:  .dword 0
hellostring: .ascii "Hello World\n"