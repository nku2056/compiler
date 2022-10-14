	.global	__aeabi_idivmod
	.global	f
	.global	main
f:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	bl	__aeabi_idivmod
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	orrs	r0, r3, r2
	add	r0, r0, r1
	adds	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}

main:
	push	{r7, lr}
    mov r0, #16
    mov r1, #32
	bl	f
	bl	putint
	pop	{r7, pc}
	