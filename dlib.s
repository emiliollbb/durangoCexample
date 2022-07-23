.export _setVideoMode
.export _drawPixelPair
.exportzp _drawPixelPair_data: near

.zeropage
_drawPixelPair_data: .res 2, $00 ;  Reserve a local zero page pointer


.segment "CODE"

.proc _setVideoMode: near
    STA $df80   
.endproc

.proc _drawPixelPair: near
    ; Write struct pointer to zero page
    STA _drawPixelPair_data
    STX _drawPixelPair_data+1
        
    ; Load first argument, x coord
    LDY #$00
    LDA (_drawPixelPair_data), Y
    
    ; Load next argument, y coord
    INY
    LDA (_drawPixelPair_data), Y
    
    ; Load next argument, color
    INY
    LDA (_drawPixelPair_data), Y
    
    ; Write first two pixel in green
    STA $6000
.endproc
