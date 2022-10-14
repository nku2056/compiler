	.global	main
main:
	push	{r7, lr}
	mov	r0, #6
	mov	r1, #0
	b	.JUDGE
.JUDGE:
	cmp	r0, r1
	bne	.WHILE
    b   .EXIT
.WHILE:
	sub	r0, r0, #1
    b   .JUDGE
.EXIT:
	bl	putint
	pop	{r7, pc}

