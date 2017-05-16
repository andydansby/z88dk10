;       Z88 Small C+ Run time Library
;       Moved functions over to proper libdefs
;       To make startup code smaller and neater!
;
;       6/9/98  djm

                XLIB    l_xor


; "xor" HL and DE into HL
.l_xor 
        ld a,l
        xor   e
        ld l,a
        ld a,h
        xor   d
        ld h,a
        ret