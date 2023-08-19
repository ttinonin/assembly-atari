	processor 6502
	seg Code
	org $F000
Start:
	lda #1

Loop:
	clc		; Clear the carry
	adc #1		; Increment A
	cmp #10		; Compare the accumulator value with decimal 10
	bne Loop	; Branch if the comparison was not equals (zero)

	org $FFFC
	.word Start
	.word Start
