	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"available.c"
	.text
	.comm	_sysy_start,8,4
	.comm	_sysy_end,8,4
	.comm	_sysy_l1,4096,4
	.comm	_sysy_l2,4096,4
	.comm	_sysy_h,4096,4
	.comm	_sysy_m,4096,4
	.comm	_sysy_s,4096,4
	.comm	_sysy_us,4096,4
	.comm	_sysy_idx,4,4
	.align	1
	.global	main
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
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
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	cmn	r3, #5
	blt	.L7
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bgt	.L5
	b	.L4
.L7:
	nop
.L4:
	ldr	r0, [r7, #8]
	bl	putint(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
