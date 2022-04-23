/*
  Gestione delle variabili.

  Programma che esegue:
  int x = -5;
  int y = 100;
  int z = 0;

  z = x + y;
*/

.cpu cortex-a53   // direttiva che specifica il tipo di CPU

.text             // Inizio della text section
.p2align 2        // l'indirizzo di memoria deve essere multipo di 2^2


.global _start    // definiamo un simbolo globale chiamato _start

_start:           // entry-point del programma

  adr x0, x       // x0 = &x
  ldr w1, [x0]    // w1 < mem[x0] (load)
  adr x0, y       // x0 = &y
  ldr w2, [x0]    // w2 < mem[x0] (load)
  add w2, w1, w1  // w2 = w1 + w2
  adr x0, z       // x0 = &c
  str w2, [x0]    // w2 > mem[x0] (store)

  /*return*/
  mov x0, #0      // Carichiamo il valore di ritorno nel registro x0
  mov x8, #93     // Specifichiamo il numero della syscall in x8
  svc #0          // Invochiamo il SO. Il valore 0 è necessario per l'istruzione, ma non utilizzato in questo caso.


/*
  Sezione dedicata alla definizione e inizializzazione delle variabili.
  Tutte le variabili vengono salvate nello Heap.
*/
.data
.p2align 2

x:  .word -5      // int32 di nome x con valore -5
y:  .word 100     // int32 di nome y con valore 100
z:  .word 0       // int32 di nome z con valore 0
w:  .word 10,20,3 // array di 3 elementi da int32
s:  .ascii "Hi\n" // stringa