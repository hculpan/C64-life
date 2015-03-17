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
      num1:     .byte   $00
      num2:     .byte   $00

    .code
    ; save params
    sty   num2
    ldx   num2
    sta   num1

    ; initial setup and check for 0's
    lda   #$00
    tay

loop:
    clc
    adc   num1
    bcc   countdown
    iny

countdown:
    dex
    beq   done
    jmp   loop

done:
    rts
.endproc
