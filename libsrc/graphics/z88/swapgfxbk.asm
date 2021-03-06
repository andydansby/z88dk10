;
;       Z88 Graphics Functions - Small C+ stubs
;
;       Written around the Interlogic Standard Library
;
;       Stubs Written by D Morris - 15/10/98
;
;
;       Page the graphics bank in/out - used by all gfx functions
;       Simply does a swap...

;
;	$Id: swapgfxbk.asm,v 1.4 2002/01/27 22:28:52 dom Exp $
;


                XLIB    swapgfxbk

                XREF    gfx_bank
		XDEF	swapgfxbk1


		INCLUDE	"graphics/grafix.inc"

.swapgfxbk
.swapgfxbk1
                push    hl
                push    de
                ld      hl,map_bk       ;$4Dx
                ld      e,(hl)
                ld      a,(gfx_bank)    ;in crt0
                ld      (hl),a
                out     (map_bk-$400),a
                ld      a,e
                ld      (gfx_bank),a
                pop     de
                pop     hl
                ret






