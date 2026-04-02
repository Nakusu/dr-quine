extern dprintf
extern sprintf
extern system
extern access

section .data
    i dd 5
	file_format db "Sully_%d.s", 0
    cmd_format db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc Sully_%1$d.o -o Sully_%1$d && rm -rf Sully_%1$d.o && ./Sully_%1$d", 0
	content db "extern dprintf%1$cextern sprintf%1$cextern system%1$c%1$csection .data%1$c	i dd %4$d%1$c	file_format db %3$cSully_%%d.s%3$c, 0%1$c	cmd_format db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc Sully_%%1$d.o -o Sully_%%1$d && rm -rf Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%1$c	content db %3$c%2$s%3$c, 0%1$c%1$c; Hi there%1$csection .text%1$c%1$c	exec:%1$c		mov rax, 0%1$c		lea rdi, [rel cmd]%1$c		call system wrt ..plt%1$c		ret%1$c%1$c	format:%1$c		mov rax, 0%1$c		lea rdi, [rel filename]%1$c		lea rsi, [rel file_format]%1$c		mov edx, [rel j]%1$c		call sprintf wrt ..plt%1$c%1$c		mov rax, 0%1$c		lea rdi, [rel cmd]%1$c		lea rsi, [rel cmd_format]%1$c		mov edx, [rel j]%1$c		call sprintf wrt ..plt%1$c		ret%1$c%1$c	openfile:%1$c		mov rax, 2%1$c		lea rdi, [rel filename]%1$c		mov rsi, 577%1$c		mov rdx, 0644o%1$c		syscall%1$c		lea rcx, [rel fd]%1$c		mov [rcx], rax%1$c		ret%1$c%1$c	writecontent:%1$c		mov eax, [rel j]%1$c		mov r9, [rel j]%1$c%1$c		mov rdi, [rel fd]%1$c		lea rsi, [rel content]%1$c		mov rdx, 10%1$c		lea rcx, [rel content]%1$c		mov r8, 34%1$c		mov rax, 0%1$c		call dprintf wrt ..plt%1$c		ret%1$c%1$c	closefile:%1$c		mov rax, 3%1$c		mov rdi, [rel fd]%1$c		syscall%1$c		ret%1$c%1$c	global main%1$c	main:%1$c		mov al, [rel i]%1$c		dec al,%1$c		mov [rel j], al%1$c		mov eax, [rel j]%1$c%1$c		cmp eax, 0%1$c		jl .skip_exec%1$c%1$c		call format%1$c		call openfile%1$c		call writecontent%1$c		call closefile%1$c%1$c		mov eax, [rel j]%1$c		cmp eax, 0%1$c		jle .skip_exec%1$c		call exec%1$c%1$c		.skip_exec:%1$c		ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c%1$csection .bss%1$c	filename resb 32%1$c	cmd resb 128%1$c	fd resq 1%1$c	j resq 1%1$c", 0

; Hi there
section .text

    exec:
        mov rax, 0
        lea rdi, [rel cmd]
        call system wrt ..plt
        ret

    format:
		mov rax, 0
        lea rdi, [rel cfilename]
        lea rsi, [rel file_format]
        mov edx, [rel j]
        call sprintf wrt ..plt

        mov rax, 0
        lea rdi, [rel filename]
        lea rsi, [rel file_format]
        mov edx, [rel j]
        call sprintf wrt ..plt
        
        mov rax, 0
        lea rdi, [rel cmd]
        lea rsi, [rel cmd_format]
        mov edx, [rel j]
        call sprintf wrt ..plt
        ret

	openfile:
		push rbx

		mov rax, 2
		mov rsi, 577
		mov rdx, 0644o
		syscall
		mov [rbx], rax

		pop rbx

		ret

	writecontent:
		lea rsi, [rel content]
		mov rdx, 10
		lea rcx, [rel content]
		mov r8, 34
		mov r9, [rel j]
		mov rax, 0
		call dprintf wrt ..plt
		ret

	closefile:
		mov rax, 3
		mov rdi, [rel fd]
		syscall
		ret

	global main
	main:
		mov al, [rel i]
		dec al,
		mov [rel j], al

		mov eax, [rel j]
		cmp eax, 0
		jl .skip_exec

        call format
		lea rdi, [rel filename]
		lea rbx, [rel fd]
		call openfile
		mov rdi, [rel fd]
		call writecontent
		call closefile

		mov eax, [rel j]
		cmp eax, 0
		jle .skip_exec
		call exec

		.skip_exec:
			ret

section .note.GNU-stack noalloc noexec nowrite progbits

section .bss
	cfilename resb 32
    filename resb 32
    cmd resb 128
	fd resq 1
	j resq 1
