	.file	"main.c"
	.text
	.globl	head
	.bss
	.align 8
head:
	.space 8
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12\12\12------------Main Menu------------\0"
	.align 8
.LC1:
	.ascii "\12Choose one option from the following list..\0"
	.align 8
.LC2:
	.ascii "\12"
	.ascii "0 = Exit :(\12"
	.ascii "1 = Create New Contact\0"
	.align 8
.LC3:
	.ascii "\12"
	.ascii "2 = Search A Contact\12"
	.ascii "3 = Delete A Contact\0"
.LC4:
	.ascii "\12"
	.ascii "4 = Show All Contacts\0"
.LC5:
	.ascii "\12Enter your choice: \0"
.LC6:
	.ascii "%d\0"
.LC7:
	.ascii "Please Enter A Valid Choice..\0"
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
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
.L10:
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	.LC2(%rip), %rcx
	call	printf
	leaq	.LC3(%rip), %rcx
	call	printf
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	.LC5(%rip), %rcx
	call	printf
	leaq	-4(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rcx
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
	call	createContact
	jmp	.L9
.L6:
	call	searchContact
	jmp	.L9
.L5:
	call	deleteContact
	jmp	.L9
.L3:
	call	showAllContacts
	jmp	.L9
.L2:
	leaq	.LC7(%rip), %rcx
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
.LC8:
	.ascii "\12Can't Allocate Memory\0"
.LC9:
	.ascii "Enter Name: \0"
.LC10:
	.ascii "Enter Phone: \0"
.LC11:
	.ascii "\12Contact Created Successfully\0"
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
	jne	.L13
	leaq	.LC8(%rip), %rcx
	call	printf
	jmp	.L12
.L13:
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
	leaq	.LC10(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-59(%rbp), %rax
	movq	%rdx, %r8
	movl	$11, %edx
	movq	%rax, %rcx
	call	fgets
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
	movq	head(%rip), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, head(%rip)
	leaq	.LC11(%rip), %rcx
	call	printf
	jmp	.L12
.L15:
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L17
.L18:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L17:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L18
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	leaq	.LC11(%rip), %rcx
	call	printf
	nop
.L12:
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "\12Contact List is Empty !!\0"
	.align 8
.LC13:
	.ascii "\12Enter Phone Number to Delete: \0"
.LC14:
	.ascii "Contact Deleted: %s\11%s\0"
	.text
	.globl	deleteContact
	.def	deleteContact;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteContact
deleteContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	head(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L20
	leaq	.LC12(%rip), %rcx
	call	printf
	jmp	.L19
.L20:
	leaq	.LC13(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-27(%rbp), %rax
	movq	%rdx, %r8
	movl	$11, %edx
	movq	%rax, %rcx
	call	fgets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	-27(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	subq	$1, %rax
	movb	$0, -27(%rbp,%rax)
	jmp	.L22
.L25:
	leaq	-27(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	25(%rax), %rcx
	leaq	-27(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	strncmp
	testl	%eax, %eax
	jne	.L23
	movq	-16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	$25, %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC14(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rax
	movq	40(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 40(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	$0, -16(%rbp)
	jmp	.L19
.L23:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -16(%rbp)
.L22:
	cmpq	$0, -16(%rbp)
	jne	.L25
.L19:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC15:
	.ascii "\12Enter Phone Number or Name to Search: \0"
	.align 8
.LC16:
	.ascii "Searching for Phone Number: '%s'\0"
.LC17:
	.ascii "\12Contact Found: \0"
.LC18:
	.ascii "%s -- %s\0"
.LC19:
	.ascii "\12Contact NOT Found\0"
.LC20:
	.ascii "Searching for Name: '%s'\0"
.LC21:
	.ascii "Error !\0"
	.text
	.globl	searchContact
	.def	searchContact;	.scl	2;	.type	32;	.endef
	.seh_proc	searchContact
searchContact:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rsp, %rax
	movq	%rax, %rsi
	movq	head(%rip), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L27
	leaq	.LC12(%rip), %rcx
	call	printf
	movq	%rsi, %rsp
	jmp	.L26
.L27:
	leaq	.LC15(%rip), %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %r8
	movl	$25, %edx
	movq	%rax, %rcx
	call	fgets
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%rax, %r12
	movl	$0, %r13d
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	32(%rsp), %rax
	addq	$0, %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rax, %rcx
	call	strcpy
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-48(%rbp), %rax
	movb	$0, (%rax,%rdx)
	movl	$0, -4(%rbp)
	movl	$1, -20(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L29
.L34:
	movb	$48, -21(%rbp)
	jmp	.L30
.L33:
	movq	-48(%rbp), %rdx
	movl	-28(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	cmpb	%al, -21(%rbp)
	jne	.L31
	movl	$0, -4(%rbp)
	jmp	.L32
.L31:
	movl	$1, -4(%rbp)
	movzbl	-21(%rbp), %eax
	addl	$1, %eax
	movb	%al, -21(%rbp)
.L30:
	cmpb	$56, -21(%rbp)
	jle	.L33
.L32:
	addl	$1, -28(%rbp)
.L29:
	movl	-28(%rbp), %eax
	movslq	%eax, %rbx
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	%rax, %rbx
	jb	.L34
	cmpl	$0, -4(%rbp)
	jne	.L35
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC16(%rip), %rcx
	call	printf
	jmp	.L36
.L39:
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rcx
	addq	$25, %rcx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	strncmp
	testl	%eax, %eax
	jne	.L37
	leaq	.LC17(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	$25, %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	printf
	movl	$1, -20(%rbp)
	jmp	.L38
.L37:
	movl	$0, -20(%rbp)
.L38:
	movq	-16(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -16(%rbp)
.L36:
	cmpq	$0, -16(%rbp)
	jne	.L39
	cmpl	$0, -20(%rbp)
	jne	.L40
	leaq	.LC19(%rip), %rcx
	call	printf
	jmp	.L40
.L35:
	cmpl	$1, -4(%rbp)
	jne	.L41
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC20(%rip), %rcx
	call	printf
	jmp	.L42
.L45:
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	strncmp
	testl	%eax, %eax
	jne	.L43
	leaq	.LC17(%rip), %rcx
	call	printf
	movq	-16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	$25, %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rcx
	call	printf
	movl	$1, -20(%rbp)
	jmp	.L44
.L43:
	movl	$0, -20(%rbp)
.L44:
	movq	-16(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -16(%rbp)
.L42:
	cmpq	$0, -16(%rbp)
	jne	.L45
	cmpl	$0, -20(%rbp)
	jne	.L40
	leaq	.LC19(%rip), %rcx
	call	printf
	jmp	.L40
.L41:
	leaq	.LC21(%rip), %rcx
	call	printf
.L40:
	movq	%rsi, %rsp
.L26:
	movq	%rbp, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC22:
	.ascii "\12Showing All Contacts...\0"
.LC23:
	.ascii "------------------------\0"
.LC24:
	.ascii "\12|   Number   |   Name   |\0"
.LC25:
	.ascii "\12------------------------\0"
.LC26:
	.ascii "\12| %s | %s\0"
.LC27:
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
	movq	head(%rip), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L47
	leaq	.LC22(%rip), %rcx
	call	puts
	leaq	.LC23(%rip), %rcx
	call	printf
	leaq	.LC24(%rip), %rcx
	call	printf
	leaq	.LC25(%rip), %rcx
	call	printf
	jmp	.L48
.L49:
	movq	-8(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	$25, %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -8(%rbp)
.L48:
	cmpq	$0, -8(%rbp)
	jne	.L49
	leaq	.LC25(%rip), %rcx
	call	printf
	jmp	.L51
.L47:
	leaq	.LC27(%rip), %rcx
	call	printf
.L51:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
