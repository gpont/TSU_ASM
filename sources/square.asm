global is_square

section .text

is_square:
	mov  rbx, 0

.next_num:
	mov  rax, rbx
	mul  rax
	cmp  rax, rdi
	je   .yes
	ja   .no
	add  rbx, 1
	jmp  .next_num

.no:
	mov  rax, 0
	jmp  .exit

.yes:
	mov  rax, 1

.exit:
	ret