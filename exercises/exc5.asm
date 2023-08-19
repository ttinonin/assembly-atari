	processor 6502
	seg Code
	org $F000
Start:
	lda #$A
	ldx #%1010

	sta $80	; Store the A value inside mem addr $80
	stx $81	; Store the X value inside mem addr $81 

	lda #10

	clc	; Clear the carry before adc
	adc $80	; Add with carry to A, the value inside $80 mem addr
	adc $81

	sta $82

	org $FFFC
	.word Start
	.word Start
