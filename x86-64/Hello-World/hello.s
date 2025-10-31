.global _start

.hello.str:
	.asciz "Hello!!!\n"

.equ sys_write,1
.equ stdout,1
.equ sys_exit,60

.text

_writeHello:
	movq $sys_write, %rax
	movq $stdout, %rdi
	leaq .hello.str, %rsi
	movq $10, %rdx
	syscall

_exitProgram:
	movq $sys_exit, %rax
	movq $0, %rdi
	syscall

_start:
	call _writeHello
	call _exitProgram
