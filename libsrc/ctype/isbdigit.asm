; isbdigit

XLIB isbdigit
LIB asm_isbdigit

; FASTCALL

.isbdigit

   ld a,l
   call asm_isbdigit
   ld hl,0
   ret c
   inc l
   ret
