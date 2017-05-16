;
;       Z88 Graphics Functions - Small C+ stubs
;
;       Written around the Interlogic Standard Library
;
;       Stubs Written by D Morris - 30/9/98
;
;
;	$Id: drawr.asm,v 1.4 2008/06/30 16:43:00 stefano Exp $
;


;Usage: drawr(struct *pixels)


                XLIB    drawr
                LIB     swapgfxbk
                XREF	swapgfxbk1

                LIB     line_r
                LIB     plotpixel



.drawr
		ld	ix,0
		add	ix,sp
		ld	e,(ix+2)	;py
		ld	d,(ix+3)
		ld	l,(ix+4)	;px
		ld	h,(ix+5)

                call    swapgfxbk
                ld      ix,plotpixel
                call    line_r
                jp      swapgfxbk1

