extern printf

section .data
    msg db "extern printf", 0

section .text
global main

main:
    ;; Specify the number of the system call (1 is `sys_write`).
    mov rax, 1
    ;; Set the first argument of `sys_write` to 1 (`stdout`).
    mov rdi, 1
    ;; Set the second argument of `sys_write` to the reference of the `msg` variable.
    mov rsi, msg
    ;; Set the third argument of `sys_write` to the length of the `msg` variable's value (14 bytes).
    mov rdx, 9
    ;; Call the `sys_write` system call.
    syscall