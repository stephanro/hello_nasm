; hello_world.asm

%define _STDOUT 0x1
%define _WRITE 0x1

section .data
section .bss
section .text

    global stdio

stdio:

    align 16
  .print_string:

      ; Function prologue.
      push rbp
      mov rbp, rsp

      ; Write string to standard output.
      mov rax, _WRITE
      mov rdi, _STDOUT
      syscall

  leave
  ret
