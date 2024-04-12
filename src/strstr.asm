section .text
global strstr

strstr:             ;  The strstr() function finds the first occurrence of the substring needle in the string haystack.
    XOR RAX, RAX            ; set accumulator to 0
    XOR RCX, RCX            ; set counter to 0

_loop:      ; main loop
    CMP BYTE[RDI], 0        ; check if end of string (meaning that there is not equal substring)
    JE _exit                ; ret and exit

    MOV R8B, BYTE[RDI]      ; move string byte to suplementary register
    MOV R9B, BYTE[RSI]      ; move substring byte to suplementary register

    CMP R8B, R9B            ; cmp if bytes are equal
    JE _ret                 ; if equal jump to _ret


    INC RDI                 ; increase string byte
    JMP _loop               ; restart loop

_ret:       ; it just returns the actual byte to RAX
    MOV RAX, RDI            ; mov actual byte to accumulator
    JMP _subStr             ; jumps to subString loop


_subStr:    ; checks if substring has been found in string
    MOV R8B, BYTE[RDI]      ; move string byte to suplementary register
    MOV R9B, BYTE[RSI]      ; move substring byte to suplementary register

    CMP BYTE[RSI], 0        ; check substring byte is 0 (meaning that the substring was found)
    JE _exit                ; ret and exit

    CMP R8B, R9B            ; cmp if bytes are equal
    JNE _Bttf               ; if not equal jumps to Bttf


    INC RDI
    INC RSI
    INC RCX                 ; increase len counter
    JMP _subStr

_Bttf:      ; Bttf reset RDI byte to byte found in _loop
    MOV R8B, BYTE[RDI]      ; move string byte to suplementary register
    MOV R9B, BYTE[RSI]      ; move substring byte to suplementary register

    CMP RCX, 0              ; checks if counter is 0
    JE _inc                 ; if true jumps to _inc

    DEC RDI                 ; decrease string
    DEC RCX                 ; decrease counter till 0
    DEC RSI                 ; decrease substring to begining
    JMP _Bttf               ; restart loop

_inc:       ; increments string actual byte in order to not entring infinte loop
    MOV RAX, 0
    INC RDI                 ; next byte
    JMP _loop               ; jumps to main loop to keep checking the string

_exit:
    ret
