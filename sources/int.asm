global change_int

section .text

change_int:
	; r8 = x / 100 * 100
	mov  rax, rdi
	mov  rbx, 100
	xor  rdx, rdx
	div  rbx
	mul  rbx
	mov  r8, rax

	; r8 += x % 10 * 10
	mov  rax, rdi		 				; rax = x
	mov  rbx, 10
	xor  rdx, rdx
	idiv rbx
	mov  rax, rdx
	mul  rbx
	add  r8, rax

	; r8 += x % 100 / 10
	mov  rax, rdi		 				; rax = x
	mov  rbx, 100
	xor  rdx, rdx
	idiv rbx
	mov  rax, rdx
	mov  rbx, 10
	xor  rdx, rdx
	div  rbx
	add  r8, rax

	mov  rax, r8
	ret
