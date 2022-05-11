.cpu cortex-a53

.text
.p2align 2

.global exit

exit:
    mov x0, #3 
    mov x8, #93
    svc #0