# File: input.asm
# Author: Var-Name-jpg
# Date Created: 2025-11-2
#
# Purpose:
# 	This file takes user input and displays it to the terminal

.global _start

.equ EXIT,	60

.equ READ,	0
.equ STDIN,	0

.equ WRITE,	1
.equ STDOUT,	1

.bss
	name: .skip 16		# allocated 16 bytes into 'name'

# code segment
.text

_printName:
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	movq $name, %rsi
	movq $16, %rdx
	syscall
	ret

_getName:
	movq $READ, %rax
	movq $STDIN, %rdi
	movq $name, %rsi
	movq $16, %rdx
	syscall
	ret

_exitProgram:
	movq $EXIT, %rax
	movq $0, %rdi
	syscall
	ret

_start:
	call _getName
	call _printName
	call _exitProgram
