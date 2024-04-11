%include "../utils/printf32.asm"

; https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic

section .data
    num1 db 67
    num2 db 13
    num1_w dw 1349
    num2_w dw 9949
    num1_d dd 134932
    num2_d dd 994912

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; Multiplication for db
    mov al, byte [num1]
    mov bl, byte [num2]
    mul bl

    ; Print result in hexa
    PRINTF32 `Rezultatul este: 0x%hx\n\x0`, eax


   ; TODO: Implement multiplication for dw and dd data types.
   ; dw:
   mov ax, word [num1_w]
   mov bx, word [num2_w]
   mul bx

   ; Print result in hexa
   PRINTF32 `Rezultatul este: 0x%hx\x0`, edx
   PRINTF32 `%hx\n\x0`, eax

   ; dd:
   mov eax, [num1_d]
   mov ebx, [num2_d]
   mul ebx

   ; Print result in hexa
   PRINTF32 `Rezultatul este: 0x%x\x0`, edx
   PRINTF32 `%x\n\x0`, eax

    leave
    ret
