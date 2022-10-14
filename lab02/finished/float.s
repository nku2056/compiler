	.global	main
main:
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, #1069547520
	str	r3, [r7, #4]
	vldr.32	s15, [r7, #8]
	vcvt.f64.f32	d7, s15
	vmov.f64	d0, d7
	bl	getfloat
	vstr.32	s0, [r7, #8]
	vldr.32	s14, [r7, #4]
	vldr.32	s15, [r7, #8]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r7, #12]
	vldr.32	s0, [r7, #12]
	bl	putfloat
	adds	r7, r7, #16
	mov	sp, r7
	pop	{r7, pc}
	
