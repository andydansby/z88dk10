; int __CALLEE__ vprintf_callee(const char *format, void *arg_ptr)
; 05.2008 aralbrec

XLIB vprintf_callee
XDEF ASMDISP_VPRINTF_CALLEE

LIB vfprintf_callee
XREF ASMDISP_VFPRINTF_CALLEE, _stdout

.vprintf_callee

   pop hl
   pop bc
   pop de
   push hl

.asmentry

   ; enter : de  = format string
   ;         bc  = & parameter list (arg_ptr)
   ; exit  : hl  = number of chars output to stream
   ;         carry if stream error: ERRNO set and hl=-1

   ld ix,(_stdout)
   jp vfprintf_callee + ASMDISP_VFPRINTF_CALLEE

defc ASMDISP_VPRINTF_CALLEE = asmentry - vprintf_callee
