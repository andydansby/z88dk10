	INCLUDE	"graphics/grafix.inc"
	
	XLIB	w_Line

	LIB	w_Line_r

	XREF	COORDS

;
;	$Id: w_line.asm,v 1.2 2010/12/24 11:59:35 stefano Exp $
;

; ******************************************************************************
;
;	Draw a pixel line from (x0,y0) defined in COORDS (word,word) - the starting point coordinate,
;	to the end point (HL,DE).
;
;       Wide resolution (WORD based parameters) version by Stefano Bodrato
;

.w_Line
		ex	de,hl
		ld	bc,(COORDS+2)
		or	a
		sbc	hl,bc
		ex	de,hl

		ld	bc,(COORDS)
		or	a
		sbc	hl,bc
.nocrossx
		jp	w_line_r
