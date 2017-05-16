;--------------------------------------------------------------
; ZX81 HRG library for the Memotech expansion
; by Stefano Bodrato, Feb. 2010
;--------------------------------------------------------------
;
;   Set TEXT mode
;
;	$Id: mt_hrg_off.asm,v 1.1 2010/02/10 16:15:35 stefano Exp $
;

	XLIB	mt_hrg_off

	XREF	MTCH_P1
	XREF	MTCH_P2

.mt_hrg_off

; No need to patch the shadow ROM copy back to original values
; because it will be excluded by hardware, but our custom
; interrupt handler won't. 

	ld	a,$0C			; alter PTR to D-FILE
	ld	(MTCH_P1+1),a	; patch our custom interrupt handler
	
	ld	a,25			; TEXT row counter
	ld	(MTCH_P2+2),a	; patch also our custom interrupt handler
	
	jp	$2490		; MEMOTECH BASIC command
