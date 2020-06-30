%include "stdio.asm"
%include "system.asm"

section .data

    hello_nasm      db      "Hello, Nasm!", 0x0
    .len            equ     $ - hello_nasm - 1
  align 8
    newline_char    db      0xa, 0x0
    .len            equ     $ - newline_char - 1

section .bss

  align 8
    exit_status     resb    1

section .text

    global _start:

_start:

    ; Set exit status to failure. Change to success only at the end.
    mov byte[exit_status], _EXIT_FAILURE

    ; Print 'Hello, Nasm!' to standard output.
    mov rsi, hello_nasm
    mov rdx, hello_nasm.len
    call stdio.print_string
    ; Test if all bytes were written to standard output. If not exit with
    ; failure.
    cmp rax, rdx
    jne exit

    ; Print a newline character to standard output.
    mov rsi, newline_char
    mov rdx, newline_char.len
    call stdio.print_string
    ; Test if newline was written to standard output. If not exit with failure.
    cmp rax, rdx
    jne exit

    ; Obviously, no error has occured until now, so set exit status to success.
    mov byte [exit_status], _EXIT_SUCCESS

  align 16
exit:
    xor rdi, rdi
    mov dl, byte [exit_status]
    call system.exit
