;
;Based on the SG C Tools 1.7
;(C) 1993 Steve Goldsmith
;
;$Id: playzb4sid.asm,v 1.2 2008/07/11 15:10:57 stefano Exp $
;

; extern void __LIB__ playzb4sid(uchar *SamStart, ushort SamLen);
; play 4 bit pulse wave encoded data using sid master volume

	XLIB	playzb4sid

playzb4sid:

;call    csv
;ld      l,(ix+6)        ;sample start addr
;ld      h,(ix+7)
;ld      e,(ix+8)        ;sample length
;ld      d,(ix+9)

pop	bc
pop	de	;sample length
pop	hl	;sample start addr
push	hl
push	de
push	bc

;-----
; Stefano Bodrato - fix for new SID, version 8580
push	de
ld	e,7	; voice address offset
ld	bc,$d406
ld	a,$ff
out	(c),a	; Set sustain to $F
add	c,e	; next voice
out	(c),a
add	c,e	; next voice..
out	(c),a

ld	bc,$d404
ld	a,$49	; Set SID test bit
out	(c),a
add	c,e	; next voice
out	(c),a
add	c,e	; next voice..
out	(c),a
pop	de
;-----

rep1:                   ;repeat

ld      bc,0dd0dh       ; bc = timea2 addr

rep2:                   ; repeat

in      a,(c)           ;  a = timer lo
bit     0,a             ;
jr      z,rep2          ; until interrupt flag set
ld      a,(hl)          ; a = sample byte
rrca                    ; a = a div 16
rrca                    ;
rrca                    ;
rrca                    ;
and     0fh             ; 4 bit nibble
ld      bc,0d418h       ; bc = sidvol addr
out     (c),a           ; set volume
ld      bc,0dd0dh       ; bc = cia 2 icr

rep3:                   ; repeat

in      a,(c)           ;  a = timer lo
bit     0,a             ;
jr      z,rep3          ; until interrupt flag set
ld      a,(hl)          ; a = sample byte
and     0fh             ; a = a and 15
ld      bc,0d418h       ; bc = sidvol addr
out     (c),a           ; set volume
inc     hl              ; hl = hl+1
dec     e               ;
jr      nz,rep1         ;
dec     d               ; de = de-1
jr      nz,rep1         ;until de = 0

;-----
; Stefano Bodrato - fix for new SID, version 8580
ld	bc,$d404
ld	e,0
resetsid:
out	(c),e
inc	c
ld	a,c
cp	$15	; loop up to $d414 (all three oscillators)
jr	nz,resetsid
;-----

ret
