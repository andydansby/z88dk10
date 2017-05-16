;
;	Small C z88 Character functions
;	Written by Dominic Morris <djm@jb.man.ac.uk>
;	22 August 1998
;
;	$Id: toupper.asm,v 1.4 2008/06/29 06:38:24 aralbrec Exp $
;

XLIB toupper
LIB asm_toupper

; FASTCALL

.toupper

   ld a,l
   call asm_toupper
   ld l,a
   ld h,0
   ret
