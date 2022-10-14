	.global	main
main:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r0, #6
	str	r0, [r7]
	b	.L2
.L3:
	subs	r0, r0, #1
	str	r0, [r7]
.L2:
	cmp	r0, r3
	bne	.L3
	bl	putint
	adds	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
