extern printf

section .data
	msg db "extern printf%1$c%1$csection .data%1$c%4$cmsg db %3$c%2$s%3$c%1$c%1$csection .text%1$c%4$cglobal main%1$c%4$cmain:%1$c%4$c%4$clea rdi, [rel msg]%1$c%4$c%4$cmov esi, 10%1$c%4$c%4$clea rdx, [rel msg]%1$c%4$c%4$cmov rcx, 34%1$c%4$c%4$cmov r8, 9%1$c%4$c%4$cxor eax, eax%1$c%4$c%4$ccall printf wrt ..plt%1$c%4$c%4$cret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits"

section .text
	global main
	main:
		lea rdi, [rel msg]
		mov esi, 10
		lea rdx, [rel msg]
		mov rcx, 34
		mov r8, 9
		xor eax, eax
		call printf wrt ..plt
		ret

section .note.GNU-stack noalloc noexec nowrite progbits