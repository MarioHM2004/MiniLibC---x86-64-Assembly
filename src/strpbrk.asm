section .text
global strpbrk


strpbrk:           ; The strpbrk() function locates the first occurrence in the string s of any of the bytes in the string accept.
    XOR RAX, RAX            ; set accumulator to 0

    CMP BYTE[RDI], 0        ; check if first string (s) is empty
    JE _exit                ; exit and ret if true
    CMP BYTE[RSI], 0        ; check if second string (accept) is empty
    JE _empty               ; return len of first string if true

_loop:
    CMP BYTE[RSI], 0        ; check if end of second string (accept)
    JE _decRSI              ; jump to _decRSI func if true

    CMP BYTE[RDI], 0        ; check if end of second string (accept)
    JE _exit

    MOV R9B, BYTE[RSI]      ; move actual second arg byte to temporal register
    CMP BYTE[RDI], R9B      ; compare first arg byte  with second arg byte (temporal register)
    JE _ret

    INC RSI                 ; increase second arg (accept) index
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
    JMP _loop               ; jump to loop

_empty:
   CMP BYTE[RDI], 0         ; compare RDI byte to check if end of string
   JE _exit                 ; exit and ret if true
   INC RDI                  ; increase string actual byte
   JMP _empty               ; restart loop

_ret:
    MOV RAX, RDI            ; move actual pointer to byte to rax

_exit:
    ret
