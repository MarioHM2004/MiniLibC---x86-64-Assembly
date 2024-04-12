section .text
global strchr

strchr:             ; The strchr() function returns a pointer to the first occurrence of the character c in the string s.
    XOR RAX, RAX            ; set accumulator to 0

_loop:
    CMP BYTE[RDI], 0
    JE _exit_is_null

    CMP BYTE[RDI], SIL      ; compare given char with actual string byte
    JE _exit                ; exit an ret if true
    INC RDI                 ; increase first string actual byte
    JMP _loop               ; restart loop

_exit:
    MOV RAX, RDI            ; move char to accumulator
    ret                     ; ret accumulator (RAX)

_exit_is_null:
    ret                     ; ret accumulator (RAX)
