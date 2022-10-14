	.global	main
	.syntax unified
	.thumb_func
main:
	push	{r4, r7, lr}
	sub	sp, sp, #412
	add	r7, sp, #0
	ldr	r2, .L4
.LPIC0:
	add	r2, pc
	ldr	r3, .L4+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #404]
	mov	r4, r7
	adds	r3, r7, #4
	mov	r0, r3
	bl	getarray
	str	r0, [r4]
	adds	r3, r7, #4
	mov	r1, r3
	movs	r0, #2
	bl	putarray
	movs	r3, #0
	ldr	r1, .L4+8
.LPIC1:
	add	r1, pc
	ldr	r2, .L4+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #404]
	eors	r1, r2, r1
	add	r7, r7, #412
	mov	sp, r7
	pop	{r4, r7, pc}
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)

