section .text
global strcspn

strcspn:            ; The strspn() function calculates the length (in bytes) of the initial segment of s which consists entirely of bytes in accept
    XOR RAX, RAX            ; set accumulator to 0

    CMP BYTE[RDI], 0        ; check if first string (s) is empty
    JE _exit                ; exit and ret if true
    CMP BYTE[RSI], 0        ; check if second string (c) is empty
    JE _empty               ; return len of first string if true

_loop:
    CMP BYTE[RSI], 0        ; check if end of second string (c)
    JE _decRSI              ; jump to _decRSI func if true

    MOV R9B, BYTE[RSI]      ; move actual second arg byte to temporal register
    CMP BYTE[RDI], R9B      ; compare first arg byte  with second arg byte (temporal register)
    JE _exit

    INC RSI                 ; increase second arg (c) index
    INC R8                  ; increase counter
    JMP _loop               ; restart loop

_decRSI:          ; decrease index of second argument till first one
    CMP R8, 0               ; compare if R8 (counter) is 0
    JE _incRDI              ; if true jumps tu _incRDI
    DEC RSI                 ; decrease second arg index
    DEC R8                  ; decrease counter
    JMP _decRSI             ; restart loop

_incRDI:          ; increase index of first argument and accumulator
    INC RDI                 ; increase first arg index
    INC RAX                 ; increase accumulator
    JMP _loop               ; jump to loop

_empty:
   CMP BYTE[RDI], 0         ; compare RDI byte to check if end of string
   JE _exit                 ; exit and ret if true
   INC RAX                  ; increase accumulator (length value)
   INC RDI                  ; increase string actual byte
   JMP _empty               ; restart loop

_exit:
    ret
