sys_exit        equ     1
sys_read		equ		3
sys_write       equ     4
stdin			equ		0
stdout          equ     1
endl			equ		'\n'
ends 			equ		0

section .data
	firstCoordsMsg 		db 'Enter first coords: \n'
	lenFirstCoordsMsg 	equ $-firstCoordsMsg
	secondCoordsMsg 	db 'Enter second coords: \n'
	lenSecondCoordsMsg 	equ $-secondCoordsMsg

section .bss
	coordx1:			resb 1
	coordy1:			resb 1
	coordx2:			resb 1
	coordy2:			resb 1
	i:					resb 1
	numString: 			resb 256

section .text
	global _start

; @param1: char* - string
; @return: int   - length string
read_coords:
	mov  [i], 0
	pop  rcx
.read_char:
	mov  rax, sys_read
	mov  rbx, stdin
	mov  rdx, 1							; count chars
	int  80h

	mov  rax, [i]						; ++i
	inc  rax
	mov  [i], rax
	
	mov  rax, [rcx]						; mov to eax current char
	inc  rcx							; mov to next char for read
	mov  rbx, endl
	test rax, rbx
	jne  .read_char

	inc  rcx, 1
	mov  [rcx], 0						; add ends to string
	mov  rax, [i]
	ret

_start:
	mov  [coordx1], 0
	mov  [coordy1], 0
	mov  [coordx2], 0
	mov  [coordy2], 0

	mov  rax, sys_write 				; system call number
	mov  rbx, stdout					; file descriptor
	mov  rcx, firstCoordsMsg
	mov  rdx, lenFirstCoordsMsg
	int  80h							; call kernel

	push numString
	call read_coords

	mov  rcx, rax
str_to_int:
	;;;
	dec  rcx
	loop str_to_int


	mov  rax, 4							; system call number (sys_write)
	mov  rbx, 1							; file descriptor (stdout)
	mov  rcx, secondCoordsMsg
	mov  rdx, lenSecondCoordsMsg
	int  80h							; call kernel


	mov  rax,[rsp+8]   ; rax = x1
	mov  rbx,[rsp+16]  ; rbx = x2

	sub  rax,[rsp+24]  ; rax -= x3

.abs_rax:
	neg  rax
	js   .abs_rax 	   ; if (SF=1 (rax < 0)) goto abs_rax

	sub  rbx,[rsp+32]  ; rbx -= x4

.abs_rbx:
	neg  rbx
	js   .abs_rbx 	   ; if (SF=1 (rbx < 0)) goto abs_rax 

	cmp  rax,1		   ; if(rax == 1)
	je   .if_x1_sub_x3_eq_1

	cmp  rax,2		   ; if(rax == 2)
	je   .if_x1_sub_x3_eq_2

	jmp  .not_bitten

.if_x1_sub_x3_eq_1:
	cmp  rbx,2
	je   .bitten 	   ; if(ecx == 2)
	jmp  .not_bitten

.if_x1_sub_x3_eq_2:
	cmp  rbx,1
	je   .bitten 	   ; if(ecx == 1)
	jmp  .not_bitten

.bitten:
	mov  rax,1

.not_bitten:
	mov  rax,0

.exit:
	mov	eax, sys_exit 					; system call number
	int	0x80							; call kernel