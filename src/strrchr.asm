section .text
global strrchr

strrchr:            ; The strrchr() function returns a pointer to the last occurrence of the character c in the string s.
    XOR RAX, RAX            ; set accumulator to 0

_last:
    CMP BYTE[RDI], 0        ; compare RDI byte to check if end of string
    JE _loop                ; exit and ret if true
    INC RDI                 ; increase string actual byte
    JMP _last               ; restart loop

_loop:
    CMP BYTE[RDI], SIL      ; compare given char with actual string byte
    JE _exit                ; exit an ret if true
    DEC RDI                 ; decrease first string actual byte
    JMP _loop               ; restart loop

_exit:
    MOV RAX, RDI            ; move char to accumulator
    ret                     ; ret accumulator (RAX)
