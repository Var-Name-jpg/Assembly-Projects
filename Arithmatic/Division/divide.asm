; File: divide
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This program divides two numbers and displays the result

segment		.text
	global _start

_start:
	mov ax,"16"		; Move 16 in a 16bit register
	sub ax,"0"		; Convert to decimal

	mov bl,"8"		; Move 8 into 8bit divisor
	sub bl,"0"		; Convert to decimal

	div bl			; Divide AX by BL
	add ax,"0"		; Conversion

	mov [res],ax		; Move result into reserved "res"

	; Print the message
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80

	; Print the result
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,1
	int 0x80

	; Exit program
	mov eax,1
	mov ebx,0
	int 0x80

segment		.bss
	res resb 1

segment		.data
	msg db "The result is: "
	len equ $-msg
