playA

     ;jsr psg_mono
    jsr initPSG
    lda #$ff
    sta mTimer
    lda #<$4B6
    ldx #>$4B6
    jsr psg_1_freq_left
    
    lda #0
    jsr psg_1_volume_left
    rts

mTimer
    .byte $00

;dx 40
;dy 30

;ai 60
;bi ffec
debug
    phy
    lda #2
    sta MMU_IO_CTRL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda mSteep + 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C000

    lda mSteep + 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    and #$0F
     tay
    lda mHex, y
    sta $C001

    lda mSteep  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lsr
    lsr 
    lsr
    lsr
    tay
    lda mHex, y
    sta $C002

    lda mSteep  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    and #$0F
    tay
    lda mHex, y
    sta $C003

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   lda l_d + 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   lsr
   lsr 
   lsr
   lsr
   tay
   lda mHex, y
   sta $C005

   lda l_d + 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   and #$0F
    tay
   lda mHex, y
   sta $C006
    ply
    stz MMU_IO_CTRL
    rts

mHex
    .text '0123456789ABCDEF'