; File: divide
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This program divides two numbers and displays the result

segment		.text
	global _start

_start:
	;----------------------------
	;
	; This uses 8 bit registers
	; for smaller numbers
	;
	;----------------------------
	mov al,"4"		; dividend
	sub al,"0"

	mov bl,"2"		; divisor
	sub bl,"0"

	div bl			; Divide
	add al,"0"

	mov [res],al		; Move result into reserved "res"

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
	mov edx,2
	int 0x80

	; formatting
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 0x80

	;--------------------------
	;
	; This uses 32 bit registers
	; for larger numbers
	;
	;--------------------------
	mov ax,"8"		; dividend
	sub ax,"0"

	mov bl,"3"		; divisor
	sub bl,"0"

	div bl			; divide

	add al,"0"
	add ah,"0"
	mov [rem],ah		; move remainder into reserved "rem"
	mov [res],al		; move result into reserved "res"

	; print the message
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80

	; print the result
	mov eax,4
	mov ebx,1
	mov ecx,res
	mov edx,2
	int 0x80

	; print remainder message
	mov eax,4
	mov ebx,1
	mov ecx,remMsg
	mov edx,remLen
	int 0x80

	; print the remainder
	mov eax,4
	mov ebx,1
	mov ecx,rem
	mov edx,2
	int 0x80

	; Exit program
	mov eax,1
	mov ebx,0
	int 0x80

segment		.bss
	res resb 2 
	rem resb 2

segment		.data
	msg db "The result is: "
	len equ $-msg

	newline db 0xA

	remMsg db " Reminder "
	remLen equ $-remMsg
