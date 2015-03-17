.segment "ZPSAVE"
.segment "STARTUP"

.include "macros.s"

.import Multi_8_8

.data

CURRENT_COLOR:        .byte   0
KEY_VALUE:            .byte   0
lengthcounter:        .byte   $00
ylocation:            .byte   $00
chartowrite:          .byte   $00
result:               .word   $00

.code
    lda   #255
    ldy   #255
    jsr   Multi_8_8
    sta   result
    sty   result + 1
    rts

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

;.proc    WriteXY
;    lda   #$00
;    ldy   #$28        ; width of line
;    Multi_8_8
;
;    clc
;    adc #xloc
;    bcc storeresults
;    iny
;
;storeresults:
;    sta videoxy
;    tya
;    clc
;    adc #$04
;    sta videoxy+1
;
;    ldy #$00
;    lda #char
;    sta (videoxy),y
;
;done:
;    rts
;.endproc
