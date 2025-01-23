*=$1000
.dsection code
*=$900
.dsection variables

.section code
start
    jmp main

.include "../api/api_psg.asm"
.include "../api/consts.asm"
.include "../api/api_line.asm"
.include "../api/api_bitmap.asm"
.include "../api/api_video.asm"
.include "../api/api_math.asm"
.include "../api/api_clut.asm"
.include "../api/api_mmu.asm"
.include "psg.asm"
.include "line.asm"
main
    lda #0
    sta MMU_IO_CTRL
    jsr clearExtMem
    jsr clearScreenMemory

    jsr loadDefaultPalette
    jsr setBackgroundColor
    jsr setForegroungColor

    jsr clut_load_0

    lda #0
    jsr setBitmapNumber

    lda #<$10000
    ldx #>$10000
    ldy #`$10000
    jsr setBitmapAddress

    jsr clearVideo
    jsr enableText
    jsr enableBitmap
    jsr enableGrafix
    jsr setVideo

    jsr enableBitmapLayer0
    jsr setLayers

    lda #0
    jsr setBitmapNumber
    jsr showBitmap

    jsr drawLines
    jsr playA
_loop
  nop
  jsr debug
  bra _loop
  rts

mMMU
   .byte $0

.endsection
*= $a000
.binary "../assets/default.pal"

