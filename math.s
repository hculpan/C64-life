.export Multi_8_8

;----------------------------------
; Multi_8_8
;
; Multiplies two 8-bit values and
; returns a 16-bit value
;
; Input:
;   A = num1
;   Y = num2
;
; Output:
;   A = low byte
;   Y = high byte
;----------------------------------
.proc    Multi_8_8
    .data
      multiplier:   .byte   $00
      multiplicand: .byte   $00
      product:      .word   $00

    .code
    ; save params
    sty   multiplier
    sta   multiplicand

    ; initial setup and check for 0's
    lda   #$00
    sta   product
    ldx   #$08

shift:
    asl   a
    rol   product + 1
    asl   multiplier
    bcc   chcnt
    clc
    adc   multiplicand
    bcc   chcnt
    inc   product + 1

chcnt:
    dex
    bne   shift
    sta   product

done:
    lda   product
    ldy   product + 1
    rts
.endproc
