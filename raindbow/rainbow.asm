	processor 6502
	
	include "vcs.h"
	include "macro.h"

	seg code
	org $F000

Start:
	CLEAN_START	; Macro safetly clear memory and TIA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Start a new frame by turning on VBLANK and VSYNC ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NextFrame:
	lda #2
	sta VBLANK 	; Turn on VBLANK
	sta VSYNC	; Turn on VSYNC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generate the three times of VSYNC ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	sta WSYNC	; First scanline
	sta WSYNC	; Second scanline
	sta WSYNC	; Third scanline

	lda #0
	sta VSYNC	; Turn of VSYNC

	ldx #37		; X = 37 (count 37 scanlines)
LoopVBlank:
	sta WSYNC
	dex
	bne LoopVBlank
