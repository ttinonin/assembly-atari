	processor 6502
	seg Code
	org $F000
Start:
	lda #100
	clc	; Clear the carry to use ADC without the cary value
	adc #5
	
	sec	; Always set the carry flag to use the sbc
	sbc #10	; Subtract the 10 decimal value from the acumulator

	org $FFFC
	.word Start
	.word Start
