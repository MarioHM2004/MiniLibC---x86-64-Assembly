section .text
global memset

memset:             ; The memset() function fills the first n bytes of the memory area pointed to by s with the constant byte c.
    XOR RAX, RAX
    MOV RCX, 0

_loop:
    CMP RDX, RCX            ; compare counter with n bytes
    JE _exit

    CMP RDI, 0              ; check if end of dest
    JE _exit

    MOV R8B, SIL            ; copy src byte to R8B 8bytes register
    MOV [RDI + RCX], R8B    ; insert src value to destination actual byte

    INC RCX
    JMP _loop

_exit:
    MOV RAX, RDI            ; returns a pointer to the memory area of dest
    ret                     ; return accumulator (RAX)
