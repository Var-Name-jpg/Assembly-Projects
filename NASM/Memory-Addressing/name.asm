; File: name.asm
; Author: Var-Name-jpg
; Date Created: 2025-10-29
;
; Description:
;	This program stores and outputs a string, then changes the string and outputs the new value

segment .text
	global _start

_start:
	; Output the initial name
	mov eax,4			; sys_write
	mov ebx,1			; Descriptor stdout
	mov ecx,name			; string to display
	mov edx,10			; length of string
	int 0x80		; call kernal

	mov [name], dword "Bobb"	; Change the variable

	; Output the new name
	mov eax,4			; sys_write
	mov ebx,1			; Descriptor stdout
	mov ecx,name			; string to display
	mov edx,8			; length of string
	int 0x80		; call kernal

	; Exit program
	mov eax,1			; sys_exit
	mov ebx,0			; No descriptor
	int 0x80		; call kernal

segment .data
	name db "Bill Ted "
