global invert

section .text

invert:
	mov rax, 0
	not rax
	mov rcx, rsi
	shl rax, cl
	not rax
	xor rax, rdi

	ret