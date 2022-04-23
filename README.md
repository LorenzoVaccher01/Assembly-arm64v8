# Assembly
Gli appunti di questa repository hanno come unico scopo quello di essere un facile e veloce riassunto sui concetti principali della programmazione in assembly su architettura ARM. Lo studio diretto attraverso tali appunti è fortemente sconsigliato.

## Registri
- Ci sono **31 registri general purpose**
  - `X<n>` registri a 64bit
  - `W<n>` registri a 32bit (i meno significativi di `X<n>`)
  - `S<n>` registri floating point a 32bit
  - `D<n>` registri floating point a 64bit
- Il registro `XZR` contiene sempre il valore `0` e ignora le write
- Il registro `X28` o `SP` è usato come stack pointer
- Il registro `X29` o `FP` è usato come frame pointer
- Il registro `X30` è usato per memorizzare l’indirizzo di ritorno di una funzione, chiamato link register `LR`.

Nelle istruzioni, la scelta dei registri `X`, `W`, `V`, `S` o `D` determina la dimensione dell'operazione.

## Direttive assemblatore
- `.cpu cortex-a53` -> specifica il tipo di CPU
- `.text` -> indica la parte di codice da eseguire
- `.data` -> specifica le variabili salvate nell'Heap
  - `.float` -> inserisce un numero **float32**
  - `.ascii` -> inserisce una **stringa** (non terminata da 0)
  - `.asciiz`-> inserisce una **stringa** terminata da zero
  - `.byte` -> inserisce un **byte**
  - `.word` -> inserisce un numero **int32** (bisognerà usare i registri `w<n>`)
  - `.dword` -> inserisce un numero **int64** (bisognerà usare i registri `x<n>`)
  - `.space` -> riserva k bytes non inizializzati
- `.p2align 2` -> indica che gli indirizzi di memoria devono essere multipli di 2^2. Va specificato dopo `.text` e `.data`

## Istruzioni
### Memory Access Instructions
|Istruzione|Formato|Note|
|--|--|--|
|Load|`ldr <Rd>, [<Rn>]`|`<Rd> < MEM[<Rn>]`|
|Store|`str <Rd>, [<Rn>]`|`<Rd> > MEM[<Rn>]`|
|Address|`adr <Rd>, label`|Carica l'indirizzo di memoria in un registro (usato spesso con le variabili)|
|Swap|`swp Rd, Rm, [Rn]`|Swap Rm with location [Rn], [Rn] value placed in Rd|

### General data processing instructions
|Istruzione|Formato|Note|
|--|--|--|
|Add|`add <Rd>, <Rn>, <Operand2>`|`Rd = Rn + Operand2`|
|Sub|`sub <Rd>, <Rn>, <Operand2>`|`Rd = Rn - Operand2`|
|Multiply|`mul <Rd>, <Rn>, <Rs>`|`Rd = Rn * Rs`|
|And|`and <Rd>, <Rn>, <Operand2>`|`Rd = Rn && Operand2`|
|Or|`or <Rd>, <Rn>, <Operand2>`|`Rd = Rn \|\| Operand2`|
|Move|`mov <Rd>, <Rn>`|Copia il valore del secondo registro nel primo|
|Compare|`cmp <Rd>, <Rn>`|Compara due registri (usata per i salti condizionati)|

> **Note** sull'istruzione `cmp`: tale istruzione viene utilizzata quando abbiamo bisogno di comparare due registri per eventuali salti condizionati. Il risultato viene salvato automaticamente nel registro `APSR`.

### Conditional execution
**Formato istruzione**: `b.<cond> label` 

Salta all'indirizzo label sulla base di una conditional mnemonics, descritti attraverso la tabella che segue:

|`<cond>`|Meaning|Flags|
|--|--|--|
|`eq`|Equal|`Z == 1`|
|`ne`|Not equal|`Z == 0`|
|`hs`|Higher or same (unsigned >=)|`C == 1`|
|`lo`|Lower (unsigned < )|`C == 0`|
|`mi`|Negative|`N == 1`|
|`pl`|Positive or zero|`N == 0`|
|`vs`|Overflow|`V == 1`|
|`vc`|No overflow|`V == 0`|
|`hi`|Higher (unsigned <=)|`C == 1 && Z == 0`|
|`ls`|Lower or same (unsigned <=)|`!(C == 1 && Z == 0)`|
|`ge`|Signed >=|`N == V`|
|`lt`|Signed <|`N != V`|
|`gt`|Signed >|`Z == 0 && N == V`|
|`le`|Signed <=|`|!(Z == 0 && N == V)`|
|`al`/`nv`|Always|Always|`true`|

>**Nota**: La colonna "Flags" indica i condition codes contenuti nel registro APSR (Application Program Status Register). N (se negativo), Z (se è zero), V (se c'è stato overflow) e C (se c'è stato un carry).

### System call
**Formato istruzione**: `svc #n`

Attraverso questa operazione il controllo passa al Kernel che esegue una funzione particolare (syscall) in base al valore contenuto nel registro `x8`. Nella tabella sottostante sono ripotate alcune delle systemcall disponibili, la colonna "Numero" indica il valore che dovrà essere inserito nel registro `x8`.


| Numero | syscall name |  `x0` |  `x1` |  `x2` |  `x3` |  `x4` |  `x5` |
|--------|--------------|-------|-------|-------|-------|-------|-------|
|   63   |     read     |`unsigned int fd`|`char* buf`|`size_t count`| | | |
|   64   |     write    |`unsigned int fd`|`const char *buf`|`size_t count`||||
|   93   |     exit     |`int error_code`	|   |      |   |       |

Una lista completa di tutte le System Calls è disponibile a questo [link](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#arm64-64_bit)

## Variabili

## Costrutti

## Funzioni