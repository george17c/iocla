%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    myString2: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 1

for:
    cmp eax, ecx
    jg print2                     ; TODO1: eax > ebx?
    cmp eax, ebx
    jge print1

continue:
    inc eax
    jmp for

print1:
    PRINTF32 `%s\n\x0`, myString
    jmp continue

print2:
    PRINTF32 `%s\n\x0`, myString2
                                    ; TODO2.2: afisati "Hello, World!" de N ori
                                    ; TODO2.1: afisati "Goodbye, World!"

    ret
