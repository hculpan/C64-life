.segment "ZPSAVE"
.segment "STARTUP"

.include "macros.s"

.data

CURRENT_COLOR:  .byte   0
KEY_VALUE:      .byte   0

.code

    GETTEXTCOLOR CURRENT_COLOR
    SETTEXTCOLORIM RED
    CHOUT $2a
    SETTEXTCOLORIM LIGHTGREEN
    CHOUT $2a
    SETTEXTCOLORADDR CURRENT_COLOR
    GETIN KEY_VALUE
    rts
