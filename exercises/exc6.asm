	processor 6502
	seg Code
	org $F000
Start:
	lda #1
	ldx #2
	ldy #3

	inx	; Increment X
	iny	; Increment Y

	clc	; CLear the carry before adc
	adc #1	; There is no increment A comand in 6502

	dex 	; Decrement X
	dey	; Decrement Y

	sec
	sbc #1	; There is no decrement A comand in 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Such there is increment and decrement comands for X and Y ;
; They are great choices for loops			    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	org $FFFC
	.word Start
	.word Start
