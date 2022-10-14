.data
    ary:.word 1, 2
.text
    .global main
main:
    push	{r7, lr}
    sub sp, sp, #400
    mov r7, sp
    mov r0, r7
    ldr r4, =ary
    bl getarray
    mov r0, #2
    mov r1, r7
    bl putarray
    mov r0, #2
    mov r1, r4
    bl putarray
    add r7, r7, #400
    mov sp, r7
    pop	{r7, pc}

