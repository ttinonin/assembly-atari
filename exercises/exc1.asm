	processor 6502
	seg code	; Define a new segment named Code
	org $F000	; Define the origin of the ROM code at mem addr $F00
Start:
	lda #$82	; Load the A register with the literal hex value of 82
	ldx #82		; Load the X register with the literal decimal value of 82
	ldy $82		; Load the Y register with the value inside the mem pos $82

	org $FFFC
	.word Start
	.word Start 
