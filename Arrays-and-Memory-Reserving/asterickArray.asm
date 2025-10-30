; File: asterickArray
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This file uses an array to output '*' nine times

segment .text
	global _start

_start:
	mov eax,4		; sys_write
	mov ebx,1		; Descriptor stdout
	mov ecx,stars		; Array to print
	mov edx,9		; Size of array
	int 0x80	; call kernal

	; Exit program
	mov eax,1		; sys_exit
	mov ebx,0		; No descriptor
	int 0x80	; call kernal

segment .data
	stars times 9 db "*"
