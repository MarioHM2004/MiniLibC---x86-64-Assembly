section .text
global strncmp

strncmp:
    XOR RAX, RAX            ; set accumulator to 0

_loop:
    CMP RDX, 0              ; check if index is already 0
    JE _exit                ; exit and ret if true

    MOVZX R8, BYTE[RDI]     ; store RDI byte on R8 byte (R8B)
    MOVZX R9, BYTE[RSI]     ; store RSI byte on R9 byte (R89)
    ADD RAX, R8             ; insert R8 value on accumulator
    SUB RAX, R9             ; insert substraction of R9 - RAX in accumulator

    CMP RSI, 0
    JE _exit
    CMP RDI, 0
    JE _exit

    CMP R8, R9              ; CMP if bytes are equal
    JNE _exit               ; exit and ret if false

    CMP RDI, RSI            ; CMP if strings are equal
    JE _exit                ; exit and ret if true

    DEC RDX
    INC RDI                 ; increase first arg
    INC RSI                 ; increase second arg
    JMP _loop               ; restart loop

_exit:
    ret                     ; return accumulator (RAX)
