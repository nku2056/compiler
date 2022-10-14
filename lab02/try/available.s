    .global main
main:
    push    {r3, lr}    
    mov r0, #10
    mov r1, #0
    b   .JUDGE
.JUDGE:
    cmp r0, #0
    bgt .WHILE
    b   .EXIT
.WHILE:
    mov r2, #-1
    cmp r0, #5
    bgt .IF1
    add r1, r1, r2
    cmn r1, #5
    blt .IF2
    b   .WHILE
.IF1:
    sub r0, r0, #1
    b   .JUDGE
.IF2:
    b   .EXIT
.EXIT:
    mov r0, r1
    bl  putint
    pop	{r3, pc}
