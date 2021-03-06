; void __CALLEE__ adt_QueueDelete_callee(struct adt_Queue *q, void *delete)
; 09.2005 aralbrec

XLIB adt_QueueDelete_callee
XDEF ASMDISP_ADT_QUEUEDELETE_CALLEE

LIB adt_QueueDeleteS_callee
XREF ASMDISP_ADT_QUEUEDELETES_CALLEE

XREF _u_free

.adt_QueueDelete_callee

   pop hl
   pop de
   ex (sp),hl

.asmentry

   push hl
   call adt_QueueDeleteS_callee + ASMDISP_ADT_QUEUEDELETES_CALLEE
   pop hl
   push hl
   call _u_free                 ; free struct adt_Queue container
   pop hl
   ret

DEFC ASMDISP_ADT_QUEUEDELETE_CALLEE = asmentry - adt_QueueDelete_callee
