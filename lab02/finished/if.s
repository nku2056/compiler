	.global	main
main:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r0, [r7, #4]
	bl	getint
	str	r0, [r7, #4]
	cmp	r0, #10
	bgt	.L2
	cmp	r0, #0
	ble	.L2
	adds	r0, r0, #1
	str	r0, [r7, #4]
.L2:
	bl	putint
	adds	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
