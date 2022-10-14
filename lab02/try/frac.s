	.global	main
main:
	push	{r7, lr}
	bl	getint
    mov r5, r0
    mov r4, #2
    mov r6, #1
    b   .JUDGE
.JUDGE:
    cmp r4, r5
    ble .WHILE
    b   .EXIT
.WHILE:
    mul r6, r6, r4
    add r4, r4, #1
    b   .JUDGE
.EXIT:
    mov r0, r6
    bl  putint
    pop {r7, pc}
	