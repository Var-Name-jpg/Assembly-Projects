; File: hello.asm
; Author: Var-Name-jpg
; Date Created: 2025-10-29
;
; Description:
;	This program prints "Hello, World!" to the console

segment .text		; Code segment
	global _start	; Link to entry point

_start:			; Entry point
	mov edx,len		; Move the string length to the Data Register
	mov ecx,msg		; Move the string to the Count Register
	mov ebx,1		; File descriptor (stdout)
	mov eax,4		; System call (sys_write)
	int 0x80	; Call kernal

	mov eax,1		; System call (sys_exit)
	int 0x80	; Call kernal

segment .data		; Data segment
	msg db "Hello, World!", 0xa	; String with a hex newline character
	len equ $ - msg			; Length of the string
