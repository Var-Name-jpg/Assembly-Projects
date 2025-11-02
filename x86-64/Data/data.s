# File: data.asm
# Author: Var-Name-jpg
# Date Created: 2025-11-2
#
# Purpose:
# 	This file uses data and divides the data

.global _start

.equ WRITE,	1
.equ STDOUT,	1

.equ EXIT,	60

.bss
	quo: .skip 4
	rem: .skip 4

	buffer: .skip 21

.data
	x: 		.long 52
	padding: 	.long 0
	y: 		.long 10

.text

.quo.message:
	.asciz "Quotient: "

.rem.message:
	.asciz " Remainder "

_start:
	# divide 'x' by 'y'
	movq x, %rax
	movq $0, %rdx
	idivq y

	# store results
	movq %rax, quo
	movq %rdx, rem

	# print quo.message
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	leaq .quo.message, %rsi
	movq $11, %rdx
	syscall

	# print quotient
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	movq $quo, %rsi
	movq $4, %rdx
	syscall

	# print rem.message
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	leaq .rem.message, %rsi
	movq $12, %rdx
	syscall

	# print remainder
	movq $WRITE, %rax
	movq $STDOUT, %rdi
	movq $rem, %rsi
	movq $4, %rdx
	syscall

	# exit program
	movq $60, %rax
	movq $0, %rdi
	syscall
