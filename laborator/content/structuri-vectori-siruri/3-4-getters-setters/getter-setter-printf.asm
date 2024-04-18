%include "printf32.asm"

struc my_struct
    int_x: resb 4
    char_y: resb 1
    string_s: resb 32
endstruc

section .data
    sample_obj:
        istruc my_struct
            at int_x, dd 1000
            at char_y, db 'a'
            at string_s, db 'My string is better than yours', 0
        iend

    new_int dd 2000
    new_char db 'b'
    new_string db 'Are you sure?', 0

format_x db "int_x: %d", 10, 0
format_y db "char_y: %c", 10, 0
format_s db "string_s: %s", 10, 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    ; TODO
    ; print all three values (int_x, char_y, string_s) from simple_obj
    ; Hint: use "lea reg, [base + offset]" to save the result of
    ; "base + offset" into register "reg"

    mov eax, dword [sample_obj + int_x]
    push eax
    push format_x
    call printf
    add esp, 8

    movzx eax, byte [sample_obj + char_y]
    push eax
    push format_y
    call printf
    add esp, 8

    lea eax, [sample_obj + string_s]
    push eax
    push format_s
    call printf
    add esp, 8

    ; TODO
    ; write the equivalent of "simple_obj->int_x = new_int"

    mov eax, [new_int]
    mov dword [sample_obj + int_x], eax

    ; TODO
    ; write the equivalent of "simple_obj->char_y = new_char"

    mov eax, [new_char]
    mov byte [sample_obj + char_y], al

    ; TODO
    ; write the equivalent of "strcpy(simple_obj->string_s, new_string)"

    mov esi, new_string
    mov edi, sample_obj + string_s
    mov ecx, 0

cpy:
    mov al, [esi + ecx]
    mov [edi + ecx], al
    inc ecx
    cmp byte [esi + ecx], 0
    jne cpy
    mov byte [edi + ecx], 0

    ; TODO
    ; print all three values again to validate the results of the
    ; three set operations above

    mov eax, dword [sample_obj + int_x]
    push eax
    push format_x
    call printf
    add esp, 8

    movzx eax, byte [sample_obj + char_y]
    push eax
    push format_y
    call printf
    add esp, 8

    lea eax, [sample_obj + string_s]
    push eax
    push format_s
    call printf
    add esp, 8

    xor eax, eax
    leave
    ret
