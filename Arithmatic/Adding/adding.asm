; File: adding
; Author: Var-Name-jpg
; Date Created: 2025-10-30
;
; Description:
;	This program takes two numbers from the user and adds them together

SYS_EXIT	equ 1
SYS_READ	equ 3
SYS_WRITE	equ 4
STDIN		equ 0
STDOUT		equ 1

segment		.data

	msg1 db "Enter the first digit: ", 0xA,0XD
	len1 equ $-msg1

	msg2 db "Enter the second Digit: ", 0xA,0xD
	len2 equ $-msg2

	msg3 db "The sum is: "
	len3 equ $-msg3

segment		.bss

	num1	resb 2
	num2	resb 2
	sum	resb 1

segment		.text
	global _start

_start:
	; Get the two numbers
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg1
	mov edx,len1
	int 0x80

	mov eax,SYS_READ
	mov ebx,STDIN
	mov ecx,num1
	mov edx,2
	int 0x80

	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,msg2
	mov edx,len2
	int 0x80

	mov eax,SYS_READ
	mov ebx,STDIN
	mov ecx,num2
	mov edx,2
	int 0x80

	; Add the numbers together

	; Move numbers to EAX and EBX registers 
	; and subtract 0 to convert to decimal
	mov eax,[num1]
	mov ebx,[num2]

	sub eax,"0"
	sub ebx,"0"

	; Add EAX and EBX
	add eax,ebx

	; Add 0 to convert to ASCII
	add eax,"0"

	; Store sum in memory location "sum"
	mov [sum],eax

	; Print the sum
	mov eax,SYS_WRITE
	mov ebx,STDOUT
	mov ecx,sum
	mov edx,1
	int 0x80

	; Exit program
	mov eax,SYS_EXIT
	mov ebx,0
	int 0x80
