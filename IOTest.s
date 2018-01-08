	.file	"IOTest.c"
	.section	.rodata
.LC0:
	.string	"%d %d %d\n"
.LC1:
	.string	"select faild"
.LC2:
	.string	"select timeout"
.LC3:
	.string	"read ret = %d,%s\n"
.LC4:
	.string	"poll faild"
.LC5:
	.string	"poll timeout"
.LC6:
	.string	"stdin is ready"
.LC7:
	.string	"stdout ready"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1224, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$2, %ecx
	movl	$1, %edx
	movl	$0, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	movl	$16, %edx
	leaq	-1184(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rsi, %rdi
#APP
# 13 "IOTest.c" 1
	cld; rep; stosq
# 0 "" 2
#NO_APP
	movl	%edi, %eax
	movl	%ecx, %edx
	movl	%edx, -1232(%rbp)
	movl	%eax, -1228(%rbp)
	movq	-1184(%rbp), %rax
	orq	$1, %rax
	movq	%rax, -1184(%rbp)
	movq	$5, -1216(%rbp)
	movq	$0, -1208(%rbp)
	leaq	-1216(%rbp), %rdx
	leaq	-1184(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	select
	movl	%eax, -1224(%rbp)
	cmpl	$-1, -1224(%rbp)
	jne	.L2
	movl	$.LC1, %edi
	call	perror
	movl	$-1, %eax
	jmp	.L10
.L2:
	cmpl	$0, -1224(%rbp)
	jne	.L4
	movl	$.LC2, %edi
	call	perror
	movl	$-1, %eax
	jmp	.L10
.L4:
	movq	-1184(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	je	.L5
	movl	$1024, -1220(%rbp)
	leaq	-1056(%rbp), %rsi
	movl	$0, %eax
	movl	$128, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	movl	-1220(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	read
	movl	%eax, -1224(%rbp)
	movl	-1224(%rbp), %eax
	subl	$1, %eax
	cltq
	movb	$0, -1056(%rbp,%rax)
	leaq	-1056(%rbp), %rdx
	movl	-1224(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L5:
	movl	$0, -1200(%rbp)
	movw	$1, -1196(%rbp)
	movl	$1, -1192(%rbp)
	movw	$4, -1188(%rbp)
	leaq	-1200(%rbp), %rax
	movl	$5000, %edx
	movl	$2, %esi
	movq	%rax, %rdi
	call	poll
	movl	%eax, -1224(%rbp)
	cmpl	$-1, -1224(%rbp)
	jne	.L6
	movl	$.LC4, %edi
	call	perror
	movl	$-1, %eax
	jmp	.L10
.L6:
	cmpl	$0, -1224(%rbp)
	jne	.L7
	movl	$.LC5, %edi
	call	perror
	movl	$-1, %eax
	jmp	.L10
.L7:
	movzwl	-1194(%rbp), %eax
	cwtl
	andl	$1, %eax
	testl	%eax, %eax
	je	.L8
	movl	$.LC6, %edi
	call	puts
.L8:
	movzwl	-1186(%rbp), %eax
	cwtl
	andl	$4, %eax
	testl	%eax, %eax
	je	.L9
	movl	$.LC7, %edi
	call	puts
.L9:
	movl	$0, %eax
.L10:
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L11
	call	__stack_chk_fail
.L11:
	addq	$1224, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
