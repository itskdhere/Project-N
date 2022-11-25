	.file	"main.c"
	.text
	.globl	head
	.bss
	.align 8
head:
	.space 8
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "\12\12*********Main Menu*********\0"
	.align 8
.LC1:
	.ascii "\12Choose one option from the following list ...\0"
	.align 8
.LC2:
	.ascii "\12===============================================\0"
	.align 8
.LC3:
	.ascii "\12"
	.ascii "0. Exit :(\12"
	.ascii "1. Create\12"
	.ascii "2. Delete\12"
	.ascii "3. Search\12"
	.ascii "4. Show All Contacts\0"
.LC4:
	.ascii "\12Enter your choice?\0"
.LC5:
	.ascii "\12%d\0"
.LC6:
	.ascii "Please enter valid choice..\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
.L10:
	leaq	.LC0(%rip), %rcx
	call	puts
	leaq	.LC1(%rip), %rcx
	call	puts
	leaq	.LC2(%rip), %rcx
	call	puts
	leaq	.LC3(%rip), %rcx
	call	puts
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	-4(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	scanf
	movl	-4(%rbp), %eax
	cmpl	$4, %eax
	ja	.L2
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L4(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L4(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L4:
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L8:
	movl	$0, %ecx
	call	exit
.L7:
	call	createContact
	jmp	.L9
.L6:
	call	deleteContact
	jmp	.L9
.L5:
	call	searchContact
	jmp	.L9
.L3:
	call	showAllContacts
	jmp	.L9
.L2:
	leaq	.LC6(%rip), %rcx
	call	printf
.L9:
	movl	-4(%rbp), %eax
	testl	%eax, %eax
	jne	.L10
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "\12OVERFLOW\0"
.LC8:
	.ascii "Enter Name: \0"
.LC9:
	.ascii "Enter Phone: \0"
.LC10:
	.ascii "\12Node inserted\0"
	.text
	.globl	createContact
	.def	createContact;	.scl	2;	.type	32;	.endef
	.seh_proc	createContact
createContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movl	$8, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L13
	leaq	.LC7(%rip), %rcx
	call	printf
	jmp	.L14
.L13:
	leaq	.LC8(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r8
	movl	$25, %edx
	movq	%rax, %rcx
	call	fgets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC9(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-58(%rbp), %rax
	movq	%rdx, %r8
	movl	$10, %edx
	movq	%rax, %rcx
	call	fgets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC10(%rip), %rcx
	call	printf
.L14:
	movq	-8(%rbp), %rax
	leaq	-48(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leaq	-58(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	head(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, head(%rip)
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	deleteContact
	.def	deleteContact;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteContact
deleteContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "\12List is Empty !!\0"
	.text
	.globl	searchContact
	.def	searchContact;	.scl	2;	.type	32;	.endef
	.seh_proc	searchContact
searchContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L18
	leaq	.LC11(%rip), %rcx
	call	printf
.L18:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "No Contacts Found !!\0"
.LC13:
	.ascii "Showing All Contacts...\0"
.LC14:
	.ascii "%s - %s\0"
	.text
	.globl	showAllContacts
	.def	showAllContacts;	.scl	2;	.type	32;	.endef
	.seh_proc	showAllContacts
showAllContacts:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L20
	leaq	.LC12(%rip), %rcx
	call	printf
	jmp	.L21
.L20:
	leaq	.LC13(%rip), %rcx
	call	printf
	jmp	.L22
.L23:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L22:
	cmpq	$0, -8(%rbp)
	jne	.L23
.L21:
	movq	$0, -8(%rbp)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
