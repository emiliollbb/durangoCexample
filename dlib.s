.export _setVideoMode
.export _drawPixelPair

.segment "CODE"

.proc _setVideoMode: near
    STA $df80   
.endproc

.proc _drawPixelPair: near
    ; Write first two pixel in green
    LDA #$11
    STA $6000
.endproc
