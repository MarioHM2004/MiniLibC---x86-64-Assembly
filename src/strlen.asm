section	.text
   global strlen

strlen:
   XOR RAX, RAX         ; set accumulator to 0

_loop:
   CMP BYTE[RDI], 0     ; compare RDI byte to check if end of string
   JE _exit             ; exit and ret if true
   INC RAX              ; increase accumulator (length value)
   INC RDI              ; increase string actual byte
   JMP _loop            ; restart loop

_exit:
   ret                  ; return accumulator (RAX)
