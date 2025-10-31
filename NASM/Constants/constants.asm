; File: constants
; Author: Var-Name-jpg
; Date Created: 2025-10-29
;
; Description:
;	This program uses constants for system calls
;	Not too many comments because now the calls are readable

SYS_EXIT	equ 1
SYS_WRITE	equ 4
STDOUT		equ 1

segment		.text
	global _start

_start:
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg		; String to output
	mov edx,len		; Length of string
	int 0x80	; call kernal

	; Exit program
	mov eax,SYS_EXIT
	mov ebx,0		; Exit code 0
	int 0x80	; call kernal

segment		.data
msg db "Hello, World!",0xA
len equ $-msg
