section .text
global strcasecmp

strcasecmp:         ; The strcasecmp() function performs a byte-by-byte comparison of the strings s1 and s2, ignoring the case of the characters.
    XOR RAX, RAX
    MOV RCX, 0

_check_first_str:         ; check if first str is uppercase
    MOV R8B, [RDI + RCX]

    CMP R8B, 65
    JL _check_second_str        ; jump to second str check if lowercase
    CMP R8B, 90
    JG _check_second_str
    ADD R8B, 32                 ; convert to lowercase if its uppercase

_check_second_str:        ; check if second str is uppercase
    MOV R9B, [RSI + RCX]

    CMP R9B, 65
    JL _check_is_end            ; jump to check is end function if lowercase
    CMP R9B, 90
    JG _check_is_end
    ADD R9B, 32                 ; conver to lowercase if its uppercase

_check_is_end:            ; check if end of program

    CMP R8B, R9B                ; if characters are no equal means that string are not equal
    JNE _exit

    CMP R8B, 0                  ; check if end of first str
    JE _exit
    CMP R9B, 0                  ; check if end of second str
    JE _exit

    INC RCX
    JMP _check_first_str

_exit:
    MOVZX R8, R8B
    MOVZX R9, R9B
    ADD rax, R8             ; insert R8 value on accumulator
    SUB rax, R9             ; insert substraction of R9 - RAX in accumulator
    ret
