.export _setVideoMode
.export _drawPixelPair
.exportzp _drawPixelPair_data: near

.zeropage
_drawPixelPair_data: .res 2, $00 ;  Reserve a local zero page pointer
_drawPixelPair_screen: .res 2, $00 ;  Reserve a local zero page pointer for screen position


.segment "CODE"

.proc _setVideoMode: near
    STA $df80
    RTS
.endproc

.proc _drawPixelPair: near
    ; Write struct pointer to zero page
    STA _drawPixelPair_data
    STX _drawPixelPair_data+1
    
    ; Initialize screen position
    LDA #$60
    STA _drawPixelPair_screen+1
    LDA #$00
    STA _drawPixelPair_screen
        
    ; Load first argument, x coord
    LDY #$00
    LDA (_drawPixelPair_data), Y
    ; Add screen pos coord
    ADC _drawPixelPair_screen
    STA _drawPixelPair_screen
    
    ; Load next argument, y coord
    INY
    LDA (_drawPixelPair_data), Y
    ; Add screen pos coord
    ADC _drawPixelPair_screen
    STA _drawPixelPair_screen
    
    ; Load next argument, color
    INY
    LDA (_drawPixelPair_data), Y
    
    ; Write first two pixel in green
    LDY #$00
    STA (_drawPixelPair_screen), Y
    RTS
.endproc

.proc _virtualSerialOut: near
    STA $df93
    RTS
.endproc
