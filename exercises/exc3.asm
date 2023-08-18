	processor 6502
	seg Code
	org $F000
Start:
	lda #15									

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; COMANDS TO TRANSFER VALUES FROM ONE REGISTER TO ANOTHER ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	tax	; Transfer the value from A to X
	tay	; Transfer the value from A to Y
	txa	; Transfer the value from X to A
	tya	; Transfer the value from Y to A

	ldx #6
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; IMPORTANT, THERE IS NO TXY MUST USE THE ACCUMULATOR! ;		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	txa
	tay

	jmp Start

	org $FFFC
	.word Start
	.word Start
