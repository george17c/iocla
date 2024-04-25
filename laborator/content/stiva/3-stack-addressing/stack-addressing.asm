%include "printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    sub esp, 4
    mov dword [esp], 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are "
    sub esp, 4
    mov dword [esp], "Ana "

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov ecx, esp
print_stack:
    xor eax, eax
    mov al, [ecx]
    PRINTF32 `0x%x: %d\n\x0`, ecx, eax
    add ecx, 1
    cmp ecx, ebp
    jl print_stack

    ; TODO 3: print the string
    xor ecx, ecx
print_str:
    mov ebx, [esp + ecx]
    PRINTF32 `%c\x0`, ebx
    inc ecx
    cmp ecx, 12
    jl print_str
    PRINTF32 `\n\x0`

    ; TODO 4: print the array on the stack, element by element.
    xor ecx, ecx
print_arr:
    mov eax, [esp + 16 + 4 * ecx]
    PRINTF32 `%d \x0`, eax
    inc ecx
    cmp ecx, NUM
    jl print_arr

    PRINTF32 `\n\x0`

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
