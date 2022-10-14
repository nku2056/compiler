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
	.file	"if.c"
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r0, [r7, #4]
	bl	getint(PLT)
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #10
	bgt	.L2
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ble	.L2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r0, [r7, #4]
	bl	putint(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
