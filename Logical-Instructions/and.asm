; File: and
; Author: Var-Name-jpg
; Date created: 2025-10-30
;
; Description:
;	This program uses the logical AND on data

segment		.text
	global _start

_start:

even:

exitProg:
	mov eax,1
	mov ebx,0
	int 0x80

segment		.data
	evenMsg db "The number is even!"
	evenLen equ $-evenMsg

	oddMsg db "The number is odd!"
	oddLen equ $-oddMsg
