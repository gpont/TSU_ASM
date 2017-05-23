global is_progression

section .text

; rax = arr[i]
; @param1: i
%macro arr 1
	mov  rax, %1				; rax = [rdi+%1*4]
	mov  rbx, 4
	mul  rbx
	add  rax, rdi
	mov  eax, [rax]
%endmacro

is_progression:
	mov  r9, 0					; r9  - index of min
	mov  r10, 0					; r10 - index of max

	sub  rsi, 1
	mov  rcx, rsi				; rcx = N-1 (rcx - iterator)
.find_min_max:
	mov  r8, rcx				; r8 = arr[i]
	arr  r8
	mov  r8, rax
	
	arr  r9						; r11 = arr[imin]
	mov  r11, rax

	arr  r10
	mov  r12, rax				; r12 = arr[imax]

	cmp  r8, r11
	jae  .nlower
	mov  r9, rcx				; r9 = rcx

.nlower:
	cmp  r8, r12
	jbe  .nbigger
	mov  r10, rcx				; r10 = rcx

.nbigger:
	loop .find_min_max

	; r9 - index of min, r10 - index of max

	cmp  r9, r10				; if imin > imax
	jbe  .iminleimax
	mov  rax, r9				; swap imin and imax
	mov  r9, r10
	mov  r10, rax

.iminleimax:
	mov  rcx, r10				; rcx = imax-imin
	sub  rcx, r9

	arr  r9						; rbx = arr[imin]
	mov  rbx, rax
	add  r9, 4					; rax = arr[imin+1]
	arr  r9
	sub  r9, 4

	div  rbx					; r8 = rax/rbx
	mov  r8, rax
.find_prog_loop:
	mov  r11, r10				; r11 = imax-i
	sub  r11, rcx

	arr  r11					; rbx = arr[curr]
	mov  rbx, rax
	add  r9, 4					; rax = arr[curr+1]
	arr  r9
	sub  r9, 4
	div  rbx					; rax = arr[curr+1]/arr[curr]

	cmp  r8, rax
	jne  .nprog

	loop .find_prog_loop
	jmp  .prog

.nprog:
	mov  rax, 0
	jmp  .exit

.prog:
	mov  rax, 1

.exit:
	ret
