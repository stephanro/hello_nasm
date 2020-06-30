%define _EXIT 0x3c
%define _EXIT_SUCCESS 0x0
%define _EXIT_FAILURE 0x1

section .data
section .bss
section .text

    global system

system:

    align 16
  .exit:

      ; Function prologue.
      push rbp
      mov rbp, rsp

      ; Exit program.
      mov rax, _EXIT
      syscall

      ; Function epilogue is never reached.
  leave
  ret
    
