	.global	main
main:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #1069547520
	str	r0, [r7, #4]
	bl	getfloat
	vldr.32	s1, [r7, #4]
	vmov.f32	s2, s0
	vadd.f32	s2, s1, s2
	vmov.f32	s0, s2
	bl	putfloat
	adds	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
	
