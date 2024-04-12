section .text
global memcpy

memcpy:             ; The memcpy() function copies n bytes from memory area src to memory area dest.
    XOR RAX, RAX
    MOV RCX, 0

_loop:
    CMP RDX, RCX            ; compare counter with n bytes
    JE _exit

    CMP RSI, 0              ; check if end of src
    JE _exit

    MOV R8B, [RSI + RCX]    ; copy src bytes to R8B 8bytes register
    MOV [RDI + RCX], R8B    ; insert src actual value to destination actual byte

    INC RCX
    JMP _loop

_exit:
    MOV RAX, RDI
    ret
