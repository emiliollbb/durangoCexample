; ---------------------------------------------------------------------------
; vectors.s
; ---------------------------------------------------------------------------
;
; Defines the interrupt vector table.


.segment  "VECTORS"

.addr      $C000    ; NMI vector
.addr      $C000       ; Reset vector
.addr      $C000    ; IRQ/BRK vector