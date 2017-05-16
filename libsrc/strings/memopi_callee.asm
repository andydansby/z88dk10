; void __CALLEE__ *memopi(void *dst, void *src, uint n, uint op)
; *dst = *src OP *dst, increasing src and dst addresses
; OP: 0=load, 1=or, 2=xor, 3=and, 4=add, 5 = adc, 6=sub, 7 = sbc, 8 = rls, 9 = rrs else address of OP function
; 05.2007 aralbrec

XLIB memopi_callee
XDEF ASMDISP_MEMOPI_CALLEE

LIB l_jpix, memops

.memopi_callee

   pop hl
   pop ix
   pop bc
   pop de
   ex (sp),hl

.asmentry

   ; enter : ix = OP
   ;         bc = uint n
   ;         de = src
   ;         hl = dst

   ld a,b
   or c
   ret z

   push hl
   
   ld a,ixh
   or a
   jr nz, func
   
   ld a,ixl
   cp 10
   jr nc, func

   add a,a
   add a,memops%256
   ld ixl,a
   ld a,0
   adc a,memops/256
   ld ixh,a

   ; ix = addr of op function
   
.loop

   ld a,(de)
   call l_jpix

.return

   ld (hl),a
   inc hl
   inc de
   
   dec bc                      ; must not mess with carry flag in loop
   inc c
   dec c
   jp nz, loop
   
   inc b
   djnz loop
   
   pop hl
   ret

.func

   push bc
   push de
   push hl
   ld a,(de)
   ld e,a
   ld d,0
   ld l,(hl)
   ld h,d
   push hl
   push de
   call l_jpix                 ; (func)(uchar dst_byte, uchar src_byte)
   ld a,l
   pop de
   pop hl
   pop hl
   pop de
   pop bc

   ld (hl),a
   inc hl
   inc de
   
   dec bc                      ; must not mess with carry flag in loop
   inc c
   dec c
   jp nz, func
   
   inc b
   djnz func
      
   pop hl
   ret

DEFC ASMDISP_MEMOPI_CALLEE = asmentry - memopi_callee
