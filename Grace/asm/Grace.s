extern dprintf

section .data
	filename db "Grace_kid.s", 0
	msg db "extern dprintf%1$c%1$csection .data%1$c%4$cfilename db %3$cGrace_kid.s%3$c, 0%1$c%4$cmsg db %3$c%2$s%3$c%1$c%1$c; Hi there%1$csection .text%1$c%1$c%4$c%%macro openfile 0%1$c%4$c%4$cmov rax, 2%1$c%4$c%4$clea rdi, [rel filename]%1$c%4$c%4$cmov rsi, 577%1$c%4$c%4$cmov rdx, 0644o%1$c%4$c%4$csyscall%1$c%4$c%4$clea rcx, [rel fd]%1$c%4$c%4$cmov [rcx], rax%1$c%4$c%%endmacro%1$c%1$c%4$c%%macro writecontent 0%1$c%4$c%4$cmov rdi, [rel fd]%1$c%4$c%4$clea rsi, [rel msg]%1$c%4$c%4$cmov rdx, 10%1$c%4$c%4$clea rcx, [rel msg]%1$c%4$c%4$cmov r8, 34%1$c%4$c%4$cmov r9, 9%1$c%4$c%4$cmov rax, 0%1$c%4$c%4$csub rsp, 8%1$c%4$c%4$ccall dprintf wrt ..plt%1$c%4$c%4$cadd rsp, 8%1$c%4$c%%endmacro%1$c%1$c%4$c%%macro closefile 0%1$c%4$c%4$cmov rax, 3%1$c%4$c%4$cmov rdi, [rel fd]%1$c%4$c%4$csyscall%1$c%4$c%%endmacro%1$c%1$c%4$cglobal main%1$c%4$cmain:%1$c%4$c%4$copenfile%1$c%4$c%4$cwritecontent%1$c%4$c%4$cclosefile%1$c%4$c%4$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c%1$csection .bss%1$c%4$cfd resq 1%1$c"

; Hi there
section .text

	%macro openfile 0
		mov rax, 2
		lea rdi, [rel filename]
		mov rsi, 577
		mov rdx, 0644o
		syscall
		lea rcx, [rel fd]
		mov [rcx], rax
	%endmacro

	%macro writecontent 0
		mov rdi, [rel fd]
		lea rsi, [rel msg]
		mov rdx, 10
		lea rcx, [rel msg]
		mov r8, 34
		mov r9, 9
		mov rax, 0
		sub rsp, 8
		call dprintf wrt ..plt
		add rsp, 8
	%endmacro

	%macro closefile 0
		mov rax, 3
		mov rdi, [rel fd]
		syscall
	%endmacro

	global main
	main:
		openfile
		writecontent
		closefile
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

section .bss
	fd resq 1
