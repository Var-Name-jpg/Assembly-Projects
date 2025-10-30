; File: multiply
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This program takes two db numbers and multiplies them together
;	I still don't really understand the AL, AH, DX, and AX registers

segment		.text
	global _start

_start:

	; Store '3' in AL and convert to decimal
	mov	al,"3"
	sub	al,"0"

	; Store '2' in BL and convert to decimal
	mov	bl,"2"
	sub	bl,"0"

	; Multiply AL by BL
	mul	bl
	add	al,"0"

	; Move AL into [res]
	mov  [res],al

	; Print the message
	mov eax,4		; sys_write
	mov ebx,1		; stdout
	mov ecx,msg		; string to print
	mov edx,len		; length of string
	int 0x80	; call kernal

	; Print the result
	mov eax,4		; sys_write
	mov ebx,1		; stdout
	mov ecx,res		; number to print
	mov edx,2		; size of number
	int 0x80	; call kernal

	; Exit program
	mov eax,1		; sys_exit
	mov ebx,0		; exit code 0
	int 0x80

segment		.bss
	res resb 2

segment		.data
	msg db "The answer is: "
	len equ $-msg
