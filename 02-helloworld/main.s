.cpu cortex-a53 //specifica il tipo di CPU

.text           // Inizio della text section
.p2align 2      // l'indirizzo deve essere multipo di 2^2

.global _start  // definiamo un simbolo globale chiamato _start

_start:         // etichetta, entry-point del programma
  // Print hellostring
  mov x0, #1          // Carichiamo il descrittore file che definisce lo standard output in x0
  adr x1, hellostring // Carichiamo in x1 l'indirizzo di hellostring
  mov x2, #12         // Carichiamo in x2 il numero di bytes da scrivere
  mov x8, #64         // specifichiamo il numero di syscall in x8
  svc #0              // syscall

  // Fine programma
  mov x0, #0          // Carichiamo il valore di ritorno nel registro x0
  mov x8, #93         // Specifichiamo il numero della syscall in x8
  svc #0              // syscall

// Dati del programma
.data
.p2align 2

.global hellostring

hellostring: .ascii "Hello World\n"