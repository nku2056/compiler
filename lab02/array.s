
	.align	2
.LC0:
	.word	1
	.word	2
	.text
	.align	1
	.global	main
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #420
	add	r7, sp, #0
	ldr	r2, .L4
.LPIC1:
	add	r2, pc
	ldr	r3, .L4+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #412]
	mov	r3,#0
	adds	r3, r7, #4
	ldr	r2, .L4+8
.LPIC0:
	add	r2, pc
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	mov	r4, r7
	add	r3, r7, #12
	mov	r0, r3
	bl	getarray(PLT)
	str	r0, [r4]
	add	r3, r7, #12
	mov	r1, r3
	movs	r0, #2
	bl	putarray(PLT)
	adds	r3, r7, #4
	mov	r1, r3
	movs	r0, #2
	bl	putarray(PLT)
	movs	r3, #0
	ldr	r1, .L4+12
.LPIC2:
	add	r1, pc
	ldr	r2, .L4+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #412]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L3
	bl	__stack_chk_fail(PLT)
.L3:
	mov	r0, r3
	add	r7, r7, #420
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC0+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
