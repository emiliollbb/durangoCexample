.export _setVideoMode

.segment "CODE"

.proc _setVideoMode: near
    STA $df80

    ; Write first two pixel in green
    LDA #$11
    STA $6000

.endproc
