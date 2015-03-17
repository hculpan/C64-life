; screen.s

.include "macros.s"

.export Plot, WriteXY, chartowrite, Write, WriteHLine

.import Multi_8_8

.zeropage
  chartowrite:    .byte   $00
  videoxy:        .word   $0000

.code

;----------------------------------
; Write
;
; Writes chartowrite to screen memory.
; Assumes that Plot has been called to
; set location to write.
;
; Input:
;   chartowrite
;
; Output:
;   none
;----------------------------------
.proc   Write
    lda chartowrite
    ldy #$00
    sta (videoxy),y
    inc videoxy
    rts
.endproc

;----------------------------------
; WriteHLine
;
; Writes chartowrite to screen memory
; X times. Assumes that Plot has been
; called to set location to write.
;
; Input:
;   X = length
;   chartowrite
;
; Output:
;   none
;----------------------------------
.proc   WriteHLine
    lda chartowrite
    ldy #$00
loop:
    sta (videoxy),y
    inc videoxy
    bcc countdown
    inc videoxy + 1

countdown:
    dex
    bne loop

    rts
.endproc

;----------------------------------
; Plot
;
; Sets screen point to location in
; screen memory, in preparation for
; follow-up call to write
;
; Input:
;   X = x coordinate
;   Y = y coordinate
;
; Output:
;   none
;----------------------------------

.proc    Plot
    .data
      xloc:       .byte   $00

    .code
    stx   xloc        ; store incoming X
    tya               ; move Y arg to A for multiplication
    ldy   #$28        ; width of line
    jsr   Multi_8_8

    clc
    adc xloc
    bcc storeresults
    iny

storeresults:
    sta videoxy
    tya
    clc
    adc #$04
    sta videoxy+1

done:
    rts
.endproc

;----------------------------------
; WriteXY
;
; Writes to give screen coordinate
; using screen memory
;
; Input:
;   X = x coordinate
;   Y = y coordinate
;   chartowrite = character to output
;
; Output:
;   none
;----------------------------------
.proc   WriteXY
    jsr Plot          ; parameters should already be setup
    lda chartowrite
    jsr Write
    rts
.endproc
