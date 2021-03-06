;
;       Amstrad CPC Graphics Functions
;
;	by Stefano Bodrato  - Jul 2004
;
;
;	$Id: drawr.asm,v 1.3 2009/06/22 21:44:17 dom Exp $
;

;Usage: drawr(struct *pixels)

;&BBF6 - GRA LINE ABSOLUTE - Draw a line to an absolute position
;
;Entry:
;
;DE = X coordinate of endpoint
;HL = Y coordinate of endpoint
;


        XLIB    drawr
        
        INCLUDE "cpcfirm.def"
                        
        INCLUDE	"graphics/grafix.inc"

 
.drawr
		ld      ix,0
		add     ix,sp

		ld      e,(ix+2)	;y1
		ld      d,(ix+3)

		ld      hl,maxy
		sbc     hl,de

		ld      e,(ix+4)	;x1
		ld      d,(ix+5)

		and     a		; double size (?)
		rl      l
		rl      h

		and     a
		rl      e
		rl      d
        call    firmware
        defw    gra_line_absolute
        ret
