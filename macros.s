.ifndef   _TEXT_ROUTINES_S_

.define   _TEXT_ROUTINES_S_

.define   BLACK       0
.define   WHITE       1
.define   RED         2
.define   CYAN        3
.define   VIOLET      4
.define   GREEN       5
.define   BLUE        6
.define   YELLOW      7
.define   ORANGE      8
.define   BROWN       9
.define   LIGHTRED    10
.define   DARKGRAY    11
.define   GRAY        12
.define   LIGHTGREEN  13
.define   LIGHTBLUE   14
.define   LIGHTGRAY   15

.code

.macro    GETTEXTCOLOR addr
    lda   $0286
    sta   addr
.endmacro

.macro    SETTEXTCOLORIM textcolor
    lda   #textcolor
    sta   $0286
.endmacro

.macro    SETTEXTCOLORAC
    sta   $0286
.endmacro

.macro    SETTEXTCOLORADDR addr
    lda   addr
    sta   $0286
.endmacro

.macro    CHOUT char
    lda   #char
    jsr   $ffd2
.endmacro

.macro    GETIN addr
loop:
    jsr   $ffe4
    beq   loop
.endmacro

.endif
