	.file	"main.c"
	.text
	.comm	head, 8, 3
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
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	-4(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC5(%rip), %rcx
	call	scanf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
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
	call	createContactm
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
	.ascii "\12Can't Allocate Memory\0"
.LC8:
	.ascii "Enter Name: \0"
.LC9:
	.ascii "Enter Phone: \0"
.LC10:
	.ascii "\12Contact Created Successfully\0"
	.text
	.globl	createContactm
	.def	createContactm;	.scl	2;	.type	32;	.endef
	.seh_proc	createContactm
createContactm:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movl	$8, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L13
	leaq	.LC7(%rip), %rcx
	call	printf
	jmp	.L18
.L13:
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC8(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	gets
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
	leaq	-59(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	movq	-16(%rbp), %rax
	leaq	-48(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	movq	-16(%rbp), %rax
	leaq	25(%rax), %rcx
	leaq	-59(%rbp), %rax
	movq	%rax, %rdx
	call	strcpy
	leaq	head(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	leaq	head(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	leaq	.LC10(%rip), %rcx
	call	printf
	jmp	.L18
.L15:
	leaq	head(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L16
.L17:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L16:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L17
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	leaq	.LC10(%rip), %rcx
	call	printf
.L18:
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "\12OVERFLOW\0"
.LC12:
	.ascii "\12Enter Contact Number?\0"
.LC13:
	.ascii "\12Enter Name?\0"
.LC14:
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
	movl	$48, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L20
	leaq	.LC11(%rip), %rcx
	call	printf
	jmp	.L25
.L20:
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC12(%rip), %rcx
	call	puts
	leaq	-26(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	.LC13(%rip), %rcx
	call	puts
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	gets
	movq	-16(%rbp), %rax
	leaq	25(%rax), %rcx
	leaq	-26(%rbp), %rax
	movq	%rax, %rdx
	call	strcpy
	movq	-16(%rbp), %rax
	leaq	-64(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	leaq	head(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L22
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	leaq	head(%rip), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	leaq	.LC14(%rip), %rcx
	call	printf
	jmp	.L25
.L22:
	leaq	head(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L23
.L24:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L23:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L24
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	leaq	.LC14(%rip), %rcx
	call	printf
.L25:
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "delete lol\0"
	.text
	.globl	deleteContact
	.def	deleteContact;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteContact
deleteContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC15(%rip), %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC16:
	.ascii "search lol\0"
	.text
	.globl	searchContact
	.def	searchContact;	.scl	2;	.type	32;	.endef
	.seh_proc	searchContact
searchContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC16(%rip), %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "\12Showing All Contacts...\0"
.LC18:
	.ascii "\12Phone Number Name\0"
.LC19:
	.ascii "\12%s\11%s\0"
.LC20:
	.ascii "\12No Contacts Found !!\0"
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
	leaq	head(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L29
	leaq	.LC17(%rip), %rcx
	call	puts
	leaq	.LC18(%rip), %rcx
	call	puts
	jmp	.L30
.L31:
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	$25, %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L30:
	cmpq	$0, -8(%rbp)
	jne	.L31
	jmp	.L33
.L29:
	leaq	.LC20(%rip), %rcx
	call	printf
.L33:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	gets;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
