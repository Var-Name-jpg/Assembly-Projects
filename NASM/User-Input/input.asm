; File: input.asm
; Author: Var-Name-jpg
; Date Created: 2025-10-29
;
; Description:
;	This program takes user input and prints it to the console

segment .data						; Data segment
	userMsg db "Please enter a number: "		; Ask the user to enter a number
	lenUserMsg equ $-userMsg			; Length of user message
	dispMsg db "You have entered: "
	lenDispMsg equ $-dispMsg

segment .bss						; Uninitialized data
	num resb 5

segment .text						; Code segment
	global _start

_start:
	; Prompt user for input
	mov eax,4					; sys_write
	mov ebx,1					; Descriptor stdout
	mov ecx,userMsg					; string to display
	mov edx,lenUserMsg				; length of string
	int 0x80				; call kernal

	; Read and store user input
	mov eax,3					; sys_read
	mov ebx,2					; Descriptor stdin
	mov ecx,num					; uninitialized number
	mov edx,5					; 5 bytes (1 for sign)
	int 0x80				; call kernal

	; Output the message
	mov eax,4					; sys_write
	mov ebx,1					; Descriptor stdout
	mov ecx,dispMsg					; string to display
	mov edx,lenDispMsg				; length of string
	int 0x80				; call kernal

	; Output the number
	mov eax,4					; sys_write
	mov ebx,1					; Descriptor stdout
	mov ecx,num					; User input
	mov edx,5					; length of user input
	int 0x80				; call kernal

	; Exit the program
	mov eax,1					; sys_exit
	mov ebx,0					; No descriptor
	int 0x80				; call kernal
