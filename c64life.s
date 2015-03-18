.segment "ZPSAVE"
.segment "STARTUP"

.include "macros.s"

.import Plot, WriteHLine, Write, chartowrite, colortowrite

.data

CURRENT_COLOR:        .byte   $00
KEY_VALUE:            .byte   $00
result:               .word   $0000

.code
    SETCOLORTOWRITE LIGHTRED

    ldx   #$00
    ldy   #$00
    jsr   Plot

    GETTEXTCOLOR CURRENT_COLOR
    SETTEXTCOLORIM LIGHTRED

    SETCHARTOWRITE $4f
    jsr   Write

    SETCHARTOWRITE $77
    ldx   #$26
    jsr   WriteHLine

    SETCHARTOWRITE $50
    jsr   Write

    SETTEXTCOLORADDR CURRENT_COLOR

    rts
