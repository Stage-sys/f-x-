.global _Init_SR_and_Stack

_Init_SR_and_Stack:
! SR.MD = 1		
! SR.BL = 1
! SR.RB = 1
! SR.IMASK = 0b1111
	mov.l	SR_Configure, r1
	ldc	r1, sr
	mov.l	Stack_Address, r15
	rts
	nop

.align 4
Stack_Address:
	.long 0x88001000
SR_Configure:
	.long 0x700000f0

	
