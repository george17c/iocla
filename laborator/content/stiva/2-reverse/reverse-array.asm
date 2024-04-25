%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    xor ecx, ecx
push_elem:
    cmp ecx, ARRAY_LEN
    je reset
    mov eax, [input + 4 * ecx]
    push eax
    inc ecx
    jmp push_elem

reset:
    xor ecx, ecx

pop_elem:
    cmp ecx, ARRAY_LEN
    je continue
    pop eax
    mov ebx, ecx
    shl ebx, 2
    add ebx, output
    mov [ebx], eax
    inc ecx
    jmp pop_elem

continue:
    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
