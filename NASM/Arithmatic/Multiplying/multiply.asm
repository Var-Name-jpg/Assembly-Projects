; File: multiply
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This program takes two db numbers and multiplies them together
;	I still don't really understand the AL, AH, DX, and AX registers
;	EDIT: I understand the registers now

segment		.text
	global _start

_start:

	; Store '3' in EAX and convert to decimal
	mov	eax,"3"
	sub	eax,"0"

	; Store '2' in EBX and convert to decimal
	mov	ebx,"2"
	sub	ebx,"0"

	; Multiply EBX by EAX
	mul	eax,ebx
	add	eax,"0"

	; Move EAX into [res]
	mov [res],eax

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
