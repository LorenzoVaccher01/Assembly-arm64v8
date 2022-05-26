.cpu cortex-a53

.text
.p2align 2

func:
  

  ret

.global _start
_start:             
  

  bl func
  
  b exit   

/* varibiali */
.data
.p2align 2
