/*
  Il programma in questione non fa nulla, si limita a chiamare la 
  system call 93 che specifica la terminazione del programma.
*/

.cpu cortex-a53   // direttiva che specifica il tipo di CPU

.text             // Inizio della text section
.p2align 2        // l'indirizzo di memoria deve essere multipo di 2^2


.global _start    // definiamo un simbolo globale chiamato _start

_start:           // entry-point del programma

  mov x0, #0      // Carichiamo il valore di ritorno nel registro x0
  mov x8, #93     // Specifichiamo il numero della syscall in x8
  svc #0          // Invochiamo il SO. Il valore 0 è necessario per l'istruzione, ma non utilizzato in questo caso.
