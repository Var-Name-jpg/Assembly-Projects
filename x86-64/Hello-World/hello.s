# File: hello.asm
# Author: Var-Name-jpg
# Date Created: 2025-11-1
#
# Purpose:
# 	This file outputs hello world and utilizes constants and procedures

.global _start

# define the message to print
.hello.text:
	.asciz "Hello!\n"

.text

# setting my constants for ease of use
.equ WRITE,	1
.equ STDOUT,	1
.equ EXIT,	60

# procedure that prints the message to the terminal
printMessage:
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	leaq .hello.text, %rsi
	movq $8, %rdx
	syscall

# procedure that exits the program
exitProgram:
	movq $EXIT, %rax
	movq $0, %rdi
	syscall

# call procedures in _start
_start:
	call printMessage
	call exitProgram
