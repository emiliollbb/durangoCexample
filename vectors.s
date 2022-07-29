; ---------------------------------------------------------------------------
; vectors.s
; ---------------------------------------------------------------------------
;
; Defines the interrupt vector table.
.import _init

.segment  "VECTORS"

.addr      _init    ; NMI vector
.addr      _init       ; Reset vector
.addr      _init    ; IRQ/BRK vector
