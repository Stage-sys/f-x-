.section .text.entry
.global _Entry
.align 2

_Entry:
	mov.l	.SR_Configure, r0
	ldc	r0, sr
	mov.l	.Stack_End, r15
	mov.l   .Start, r0 
	jmp	@r0
	nop

.align 4

.Stack_End:
	.long 0x8c002000 

.SR_Configure:
	.long 0x700000f0

.Start:
	.long _start 
