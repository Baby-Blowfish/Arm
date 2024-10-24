	.global main
main:
	stp x21, x30, [sp, -16]!
	mov x21, x1

top:
	ldr x0, [x21], 8
	cbz x0, bottom
	bl	puts
	b	top

bottom:
	ldp x21,x30, [sp], 16
	mov x0, xzr
	ret

	.end

