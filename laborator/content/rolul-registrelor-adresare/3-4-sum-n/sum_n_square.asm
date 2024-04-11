%include "../utils/printf32.asm"

section .data
    num dd 4
    sum dd 0          ; Use sum to store the sum

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, [num]     ; Use ecx as counter for computing the sum.

add_to_sum:
    mov eax, ecx
    mov ebx, ecx
    mul ebx
    add [sum], eax
    loop add_to_sum    ; Decrement ecx.

    mov ecx, [num]
    PRINTF32 `Sum(%u): %d\n\x0`, ecx, [sum]

    leave
    ret
