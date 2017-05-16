/*
 *  z88dk z80 multi-task library
 *
 *  $Id: thread_manager_start.c,v 1.3 2009/09/30 23:03:03 dom Exp $
 *
 *  Start the task manager up - creating a task for the thread we started on
 */



#include <threading/preempt.h>

void thread_manager_start()
{
#asm
        push    af
        push    bc
        push    de
        push    hl
	push	ix
        ex      af,af
        exx
        push    af      
        push    bc
        push    de     
        push    hl
        push    iy
	ex	af,af
	exx
        ; Now setup the thread table - the main thread is always thread 0
.stack_done
        ld      ix,_threadbase + threads
        ld      (ix + thread_pid),0		; Fake number
        ld      (ix + thread_priority),1        ; Might as well...
        ld      (ix + thread_nice),0 
	ld	(ix + thread_flags),130		; System - cannot exit
        ld      hl,0
        add     hl,sp
        ld      (ix + thread_sp),l              ; Store the stack
        ld      (ix + thread_sp+1),h
        ld      hl,(_threadbase + scheduler)    ; Setup task options
        inc     hl
        inc     hl
        inc     hl
        ld      c,0				; Nice adjustment
        call    l_jphl
	ld	(_threadbase + current),ix
        jp      thread_manager_first_entry

	LIB	thread_manager_first_entry
#endasm
}
