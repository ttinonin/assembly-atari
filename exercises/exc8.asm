	processor 6502
	seg Code
	org $F000
Start:
	ldy #10

Loop:
	tya		; Transfer Y to A
	sta $80,Y	; Store the value of A inside $80+Y
	dey
	bpl Loop	; If the last operation results in positive, restart the loop

	org $FFFC
	.word Start
	.word Start
