;
;       Z88 Graphics Functions - Small C+ stubs
;
;       Written around the Interlogic Standard Library
;
;	Put a pixel in the stencil vectors
;
;       Stefano Bodrato - 08/10/2009
;
;
;	$Id: w_stencil_add_point.asm,v 1.1 2010/12/24 11:59:35 stefano Exp $
;

;; void stencil_add_point(int x, int y, unsigned char *stencil)



                XLIB    stencil_add_point

                LIB     line
                LIB     stencil_add_pixel

                ;LIB     swapgfxbk
                ;XREF    swapgfxbk1

                XREF    stencil_ptr

.stencil_add_point
		ld	ix,0
		add	ix,sp

		ld	l,(ix+2)	;pointer to stencil
		ld	h,(ix+3)
		ld	(stencil_ptr),hl

		;ld	l,(ix+4)	;pointer to leftmost vector
		;ld	h,(ix+5)
		;ld	(gfx_area),hl

		ld	e,(ix+4)	;y0
		ld	d,(ix+5)	;y0
		ld	l,(ix+6)	;x0
		ld	h,(ix+7)	;x0
		; call    swapgfxbk
		
		jp	stencil_add_pixel
		
        ; jp      swapgfxbk1

