.global _start

.hello.str:
	.ascii "Hello!!!\n"

.text

_start:

	movq $1, %rax
	movq $1, %rdi
	leaq .hello.str, %rsi
	movq $9, %rdx
	syscall

	movq $60, %rax
	movq $0, %rdi
	syscall
