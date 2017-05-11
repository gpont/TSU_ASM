global chess

section .text

chess:
	mov  rax, rdi		 				; rax = x1
	mov  rbx, rsi		 				; rbx = x2

	sub  rax, rdx		 				; rax -= x3

.abs_rax:
	neg  rax
	js   .abs_rax 						; if (SF=1 (rax < 0)) goto abs_rax

	sub  rbx, rcx		 				; rbx -= x4

.abs_rbx:
	neg  rbx
	js   .abs_rbx 						; if (SF=1 (rbx < 0)) goto abs_rax 

	cmp  rax, 1 						; if(rax == 1)
	je   .if_x1_sub_x3_eq_1

	cmp  rax, 2 						; if(rax == 2)
	je   .if_x1_sub_x3_eq_2

	jmp  .not_bitten

.if_x1_sub_x3_eq_1:
	cmp  rbx, 2
	je   .bitten 						; if(ecx == 2)
	jmp  .not_bitten

.if_x1_sub_x3_eq_2:
	cmp  rbx, 1
	je   .bitten 						; if(ecx == 1)
	jmp  .not_bitten

.bitten:
	mov  rax, 1
	jmp  .exit

.not_bitten:
	mov  rax, 0

.exit:
	ret
