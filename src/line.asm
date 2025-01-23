
lineMacro .macro x1, y1, x2, y2
    lda #<\x1
    ldx #>\x1
    jsr setOrginX

    lda #<\y1
    ldx #>\y1
    jsr setOrginY

    lda #<\x2
    ldx #>\x2
    jsr setDestX

    lda #<\y2
    ldx #>\y2
    jsr setDestY
    jsr do_line
.endmacro

drawLines

    lda #<319
    sta l_x1
    lda #>319
    sta l_x1 + 1

    lda #<239
    sta l_y1
    lda #>239
    sta l_y1 + 1

    jsr putPixel

    #lineMacro 0,119,319,119 ;y axis
    #lineMacro 159,239,159,0 ;x axis
    #lineMacro 0,0,319,239  ;diag
    #lineMacro 319,239,0,0 ;
    #lineMacro 0,239,319,0
    #lineMacro 159,120,240,239
    #lineMacro 159,120,80,239
    #lineMacro 159,120,240,0
    #lineMacro 159,120,80,0
    #lineMacro 159,120,0,60
    #lineMacro 159,120,0,180
    #lineMacro 159,120,320,60
    #lineMacro 159,120,320,180

    #lineMacro 0,239,159,0
    #lineMacro 319,239,159,0
    #lineMacro 319,239,0,59
    #lineMacro 0,59,319,59
    #lineMacro 319,59,0,239

    jsr debug
    rts