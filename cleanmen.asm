	processor 6502

	seg code
	org $F000	; Define the code origin at $F000

Start:
	sei		; Disable interupts
	cld		; Disable BCD decimal math mode
	ldx #$FF	; Loads the X register with the #$FF
	txs		; Transfer the X register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)		  ;
; Meaning the entire RAM and also the entire TIA register ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	lda #0		; A = 0
	ldx #$FF	; X = #$FF
	sta $FF		; make sure $FF is zeroed before the loop
MemLoop:
	dex		; X--
	sta $0,X	; Store the value of A inside mem addr of 0 + X
	bne MemLoop	; Loop until X == 0 (Z is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size with exactly 4KB             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	org $FFFC
	.word Start	; Reset vector at $FFFC (where the program starts)
	.word Start	; Interrupt vector at $FFFE (unsed in the VCS)
