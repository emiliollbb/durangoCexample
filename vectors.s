; ---------------------------------------------------------------------------
; vectors.s
; ---------------------------------------------------------------------------
;
; Defines the interrupt vector table.


.segment  "VECTORS"

.addr      $8000    ; NMI vector
.addr      $8000       ; Reset vector
.addr      $8000    ; IRQ/BRK vector
