	.global	main
main:
	push	{r7, lr}
	bl	getint
	cmp	r0, #10
	bgt	.ELSE
	cmp	r0, #0
	ble	.ELSE
	add	r0, r0, #1
.ELSE:
	bl	putint
	pop	{r7, pc}
