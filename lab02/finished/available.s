	.global	main
main:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	movs	r3, #10
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L2
.L5:
	mov	r3, #-1
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r3, #5
	ble	.L3
	subs	r3, r3, #1
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #8]
	cmn	r3, #5
	blt	.L4
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bgt	.L5
	b	.L4
.L4:
	ldr	r0, [r7, #8]
	bl	putint
	adds	r7, r7, #16
	mov	sp, r7
	pop	{r7, pc}
