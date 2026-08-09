	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"====================================="
	.align 8
.LC1:
	.string	" REAL-TIME STOCK MARKET DATA CACHE"
.LC2:
	.string	"1. Register User"
.LC3:
	.string	"2. Login"
.LC4:
	.string	"3. Exit"
.LC5:
	.string	"Enter Choice : "
	.text
	.type	displayLoginMenu, @function
displayLoginMenu:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	displayLoginMenu, .-displayLoginMenu
	.section	.rodata
.LC6:
	.string	" STOCK MARKET CACHE SYSTEM"
.LC7:
	.string	"1. Add Stock"
.LC8:
	.string	"2. Search Stock"
.LC9:
	.string	"3. Update Stock"
.LC10:
	.string	"4. Delete Stock"
.LC11:
	.string	"5. Display Stocks"
.LC12:
	.string	"6. View Statistics"
.LC13:
	.string	"7. Save Cache"
.LC14:
	.string	"8. Load Cache"
.LC15:
	.string	"9. Backup Cache"
.LC16:
	.string	"10. View LRU Order"
.LC17:
	.string	"11. Exit"
	.text
	.type	displayMainMenu, @function
displayMainMenu:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	displayMainMenu, .-displayMainMenu
	.section	.rodata
	.align 8
.LC18:
	.string	"Failed to initialize thread manager"
.LC19:
	.string	"%d"
.LC20:
	.string	"Cache saved successfully"
.LC21:
	.string	"Unable to complete cache save"
.LC22:
	.string	"Invalid Choice"
.LC23:
	.string	"Cache save requested"
.LC24:
	.string	"Unable to request cache save"
.LC25:
	.string	"Unable to create cache backup"
	.align 8
.LC26:
	.string	"Application Closed Successfully"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
	call	initializeThreadManager@PLT
	testl	%eax, %eax
	je	.L4
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L39
.L4:
	call	loadStatistics@PLT
	call	loadCache@PLT
.L16:
	call	displayLoginMenu
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L42
	movl	-16(%rbp), %eax
	cmpl	$3, %eax
	je	.L8
	cmpl	$3, %eax
	jg	.L9
	cmpl	$1, %eax
	je	.L10
	cmpl	$2, %eax
	je	.L11
	jmp	.L9
.L10:
	call	registerUser@PLT
	jmp	.L12
.L11:
	call	loginUser@PLT
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L43
	jmp	.L38
.L8:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L15
.L14:
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L15:
	call	saveStatistics@PLT
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
	movl	$0, %eax
	jmp	.L39
.L9:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L12
.L43:
	nop
.L12:
	jmp	.L16
.L42:
	nop
.L7:
.L38:
	call	displayMainMenu
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L44
	movl	-16(%rbp), %eax
	cmpl	$11, %eax
	ja	.L19
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L21(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L21(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L19-.L21
	.long	.L31-.L21
	.long	.L30-.L21
	.long	.L29-.L21
	.long	.L28-.L21
	.long	.L27-.L21
	.long	.L26-.L21
	.long	.L25-.L21
	.long	.L24-.L21
	.long	.L23-.L21
	.long	.L22-.L21
	.long	.L20-.L21
	.text
.L31:
	call	addStock@PLT
	jmp	.L32
.L30:
	call	searchStock@PLT
	jmp	.L32
.L29:
	call	updateStock@PLT
	jmp	.L32
.L28:
	call	deleteStock@PLT
	jmp	.L32
.L27:
	call	displayStocks@PLT
	jmp	.L32
.L26:
	call	displayStatistics@PLT
	jmp	.L32
.L25:
	call	signalCacheSave@PLT
	testl	%eax, %eax
	jne	.L33
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L34
.L33:
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L34:
	call	saveStatistics@PLT
	jmp	.L32
.L24:
	call	loadCache@PLT
	jmp	.L32
.L23:
	call	backupCache@PLT
	testl	%eax, %eax
	je	.L45
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L45
.L22:
	call	displayLRU@PLT
	jmp	.L32
.L20:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	jne	.L36
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L37
.L36:
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L37:
	call	saveStatistics@PLT
	call	clearCache@PLT
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	shutdownThreadManager@PLT
	movl	$0, %eax
	jmp	.L39
.L19:
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L32
.L45:
	nop
.L32:
	jmp	.L38
.L44:
	nop
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
	movl	$0, %eax
.L39:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"auth.c"
	.text
	.section	.rodata
	.align 8
	.type	USER_FILE, @object
	.size	USER_FILE, 15
USER_FILE:
	.string	"data/users.dat"
	.local	userMutex
	.comm	userMutex,40,32
.LC0:
	.string	"r"
.LC1:
	.string	"%49s %49s"
	.text
	.type	userExists, @function
userExists:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -124(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	USER_FILE(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L4
	movl	$0, %eax
	jmp	.L7
.L6:
	movq	-136(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	$1, -124(%rbp)
	jmp	.L5
.L4:
	leaq	-112(%rbp), %rax
	leaq	50(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	je	.L6
.L5:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	-124(%rbp), %eax
.L7:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	userExists, .-userExists
	.section	.rodata
	.align 8
.LC2:
	.string	"\n========== USER REGISTRATION =========="
.LC3:
	.string	"Enter Username : "
.LC4:
	.string	"%49s"
.LC5:
	.string	"Username Already Exists"
.LC6:
	.string	"Enter Password : "
.LC7:
	.string	"a"
.LC8:
	.string	"Unable To Open User File"
.LC9:
	.string	"%s %s\n"
.LC10:
	.string	"Registration Successful"
.LC11:
	.string	"Failed to write user to file"
	.text
	.globl	registerUser
	.type	registerUser, @function
registerUser:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -124(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L10
	movl	$0, %eax
	jmp	.L17
.L10:
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	userExists
	testl	%eax, %eax
	je	.L12
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L17
.L12:
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	addq	$50, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L13
	movl	$0, %eax
	jmp	.L17
.L13:
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	leaq	USER_FILE(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	.L14
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L17
.L14:
	leaq	-112(%rbp), %rax
	leaq	50(%rax), %rcx
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	testl	%eax, %eax
	js	.L15
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, -124(%rbp)
	jmp	.L16
.L15:
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L16:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-124(%rbp), %eax
.L17:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	registerUser, .-registerUser
	.section	.rodata
	.align 8
.LC12:
	.string	"\n========== USER LOGIN =========="
.LC13:
	.string	"No Registered Users Found"
.LC14:
	.string	"Login Successful"
.LC15:
	.string	"Invalid Username Or Password"
	.text
	.globl	loginUser
	.type	loginUser, @function
loginUser:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -252(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L20
	movl	$0, %eax
	jmp	.L30
.L20:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L22
	movl	$0, %eax
	jmp	.L30
.L22:
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	USER_FILE(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -248(%rbp)
	cmpq	$0, -248(%rbp)
	jne	.L24
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L30
.L27:
	leaq	-240(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L24
	leaq	-240(%rbp), %rax
	leaq	50(%rax), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L24
	movl	$1, -252(%rbp)
	jmp	.L26
.L24:
	leaq	-240(%rbp), %rax
	leaq	50(%rax), %rcx
	leaq	-240(%rbp), %rdx
	movq	-248(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	je	.L27
.L26:
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	cmpl	$0, -252(%rbp)
	je	.L28
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L29
.L28:
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L29:
	movl	-252(%rbp), %eax
.L30:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	loginUser, .-loginUser
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"cache_manager.c"
	.text
	.type	countCacheNodes, @function
countCacheNodes:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L5:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L4:
	addl	$1, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	jne	.L4
	addl	$1, -12(%rbp)
.L2:
	cmpl	$100, -12(%rbp)
	jle	.L5
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	countCacheNodes, .-countCacheNodes
	.section	.rodata
.LC0:
	.string	"\nEnter Stock Symbol : "
.LC1:
	.string	"%19s"
.LC2:
	.string	"Enter Stock Price : "
.LC3:
	.string	"%f"
.LC4:
	.string	"Enter Volume : "
.LC5:
	.string	"%d"
.LC6:
	.string	"Invalid Symbol"
.LC7:
	.string	"INVALID_SYMBOL"
.LC8:
	.string	"CACHE"
.LC9:
	.string	"Invalid Price"
.LC10:
	.string	"INVALID_PRICE"
.LC11:
	.string	"Invalid Volume"
.LC12:
	.string	"INVALID_VOLUME"
.LC13:
	.string	"Unable to acquire cache lock"
.LC14:
	.string	"CACHE_LOCK_FAILED"
.LC15:
	.string	"Stock Already Exists"
.LC16:
	.string	"DUPLICATE_STOCK"
.LC17:
	.string	"CACHE_EVICT"
.LC18:
	.string	"STOCK_ADD"
.LC19:
	.string	"Stock Added Successfully"
	.text
	.globl	addStock
	.type	addStock, @function
addStock:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L22
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$20, %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L23
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	addq	$24, %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L24
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	validateSymbol@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L12
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L7
.L12:
	movl	-44(%rbp), %eax
	movd	%eax, %xmm0
	call	validatePrice@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L13
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L7
.L13:
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	validateVolume@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L14
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L7
.L14:
	call	cacheLock@PLT
	testl	%eax, %eax
	je	.L15
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L7
.L15:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	testq	%rax, %rax
	je	.L16
	call	cacheUnlock@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L7
.L16:
	call	countCacheNodes
	cmpl	$9, %eax
	jle	.L17
	call	getLRUTail@PLT
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L17
	movq	-80(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movl	$19, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movb	$0, -13(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	removeFromLRU@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	deleteNode@PLT
	call	recordEviction@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
.L17:
	subq	$32, %rsp
	movq	%rsp, %rcx
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-52(%rbp), %rax
	movq	-44(%rbp), %rdx
	movq	%rax, 12(%rcx)
	movq	%rdx, 20(%rcx)
	call	insertNode@PLT
	addq	$32, %rsp
	testl	%eax, %eax
	je	.L18
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	je	.L19
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	addToFront@PLT
.L19:
	call	recordInsert@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC18(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L18:
	call	cacheUnlock@PLT
	jmp	.L7
.L22:
	nop
	jmp	.L7
.L23:
	nop
	jmp	.L7
.L24:
	nop
.L7:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	addStock, .-addStock
	.section	.rodata
.LC20:
	.string	"SEARCH_MISS"
.LC21:
	.string	"Stock Not Found"
.LC22:
	.string	"SEARCH_HIT"
.LC23:
	.string	"\nStock Found"
.LC24:
	.string	"Symbol : %s\n"
.LC25:
	.string	"Price  : %.2f\n"
.LC26:
	.string	"Volume : %d\n"
	.text
	.globl	searchStock
	.type	searchStock, @function
searchStock:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L31
	call	cacheLock@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L28
	call	recordMiss@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC20(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L25
.L28:
	call	recordHit@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	moveToFront@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC22(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movss	20(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-40(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, %esi
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	cacheUnlock@PLT
	jmp	.L25
.L31:
	nop
.L25:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	searchStock, .-searchStock
	.section	.rodata
.LC27:
	.string	"Enter New Price : "
.LC28:
	.string	"STOCK_UPDATE"
.LC29:
	.string	"Stock Updated Successfully"
	.text
	.globl	updateStock
	.type	updateStock, @function
updateStock:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L40
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L41
	movl	-44(%rbp), %eax
	movd	%eax, %xmm0
	call	validatePrice@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L36
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L32
.L36:
	call	cacheLock@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L37
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L32
.L37:
	movss	-44(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movss	%xmm0, 20(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	moveToFront@PLT
	call	recordUpdate@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC28(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
	jmp	.L32
.L40:
	nop
	jmp	.L32
.L41:
	nop
.L32:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	updateStock, .-updateStock
	.section	.rodata
.LC30:
	.string	"STOCK_DELETE"
.LC31:
	.string	"Stock Deleted Successfully"
	.text
	.globl	deleteStock
	.type	deleteStock, @function
deleteStock:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L49
	call	cacheLock@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L45
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L42
.L45:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	removeFromLRU@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	deleteNode@PLT
	testl	%eax, %eax
	je	.L46
	call	recordDelete@PLT
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	logStockOperation@PLT
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L46:
	call	cacheUnlock@PLT
	jmp	.L42
.L49:
	nop
.L42:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L48
	call	__stack_chk_fail@PLT
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	deleteStock, .-deleteStock
	.section	.rodata
	.align 8
.LC32:
	.string	"========================================="
.LC33:
	.string	"             STOCK CACHE"
.LC34:
	.string	"VOLUME"
.LC35:
	.string	"PRICE"
.LC36:
	.string	"SYMBOL"
.LC37:
	.string	"%-15s %-15s %-15s\n"
.LC38:
	.string	"%-15s %-15.2f %-15d\n"
	.text
	.globl	displayStocks
	.type	displayStocks, @function
displayStocks:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	cacheLock@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC36(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -12(%rbp)
	jmp	.L51
.L54:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L52
.L53:
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-8(%rbp), %rax
	movss	20(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %xmm0
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L52:
	cmpq	$0, -8(%rbp)
	jne	.L53
	addl	$1, -12(%rbp)
.L51:
	cmpl	$100, -12(%rbp)
	jle	.L54
	call	cacheUnlock@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	displayStocks, .-displayStocks
	.globl	clearCache
	.type	clearCache, @function
clearCache:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	cacheLock@PLT
	call	clearLRU@PLT
	call	clearHashTable@PLT
	call	cacheUnlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	clearCache, .-clearCache
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"hash_table.c"
	.text
	.globl	hashTable
	.bss
	.align 32
	.type	hashTable, @object
	.size	hashTable, 808
hashTable:
	.zero	808
	.text
	.globl	hashFunction
	.type	hashFunction, @function
hashFunction:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	sall	$5, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addl	%ecx, %eax
	movl	%eax, -4(%rbp)
	addq	$1, -24(%rbp)
.L2:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	imulq	$1148159575, %rax, %rax
	shrq	$32, %rax
	movl	%edx, %ecx
	subl	%eax, %ecx
	shrl	%ecx
	addl	%ecx, %eax
	shrl	$6, %eax
	imull	$101, %eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	hashFunction, .-hashFunction
	.globl	insertNode
	.type	insertNode, @function
insertNode:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	16(%rbp), %rdi
	call	hashFunction
	movl	%eax, -12(%rbp)
	call	allocateNode@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	movq	-8(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	28(%rbp), %rax
	movq	36(%rbp), %rdx
	movq	%rax, 12(%rcx)
	movq	%rdx, 20(%rcx)
	movl	-12(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movl	-12(%rbp), %eax
	leaq	0(,%rax,8), %rcx
	leaq	hashTable(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
	movl	$1, %eax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	insertNode, .-insertNode
	.globl	clearHashTable
	.type	clearHashTable, @function
clearHashTable:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, -20(%rbp)
	jmp	.L9
.L12:
	movl	-20(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L10
.L11:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	freeNode@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
.L10:
	cmpq	$0, -16(%rbp)
	jne	.L11
	movl	-20(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	$0, (%rdx,%rax)
	addl	$1, -20(%rbp)
.L9:
	cmpl	$100, -20(%rbp)
	jbe	.L12
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	clearHashTable, .-clearHashTable
	.globl	searchNode
	.type	searchNode, @function
searchNode:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	hashFunction
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L14
.L17:
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L15
	movq	-8(%rbp), %rax
	jmp	.L16
.L15:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L14:
	cmpq	$0, -8(%rbp)
	jne	.L17
	movl	$0, %eax
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	searchNode, .-searchNode
	.globl	deleteNode
	.type	deleteNode, @function
deleteNode:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	hashFunction
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L19
.L24:
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L20
	cmpq	$0, -8(%rbp)
	jne	.L21
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movl	-20(%rbp), %edx
	leaq	0(,%rdx,8), %rcx
	leaq	hashTable(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	jmp	.L22
.L21:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
.L22:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	freeNode@PLT
	movl	$1, %eax
	jmp	.L23
.L20:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
.L19:
	cmpq	$0, -16(%rbp)
	jne	.L24
	movl	$0, %eax
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	deleteNode, .-deleteNode
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"logger.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"%s | [Thread %lu] | [%s] | [%s] | %s"
	.text
	.type	writeLog, @function
writeLog:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$608, %rsp
	movq	%rdi, -584(%rbp)
	movq	%rsi, -592(%rbp)
	movq	%rdx, -600(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -584(%rbp)
	je	.L2
	cmpq	$0, -592(%rbp)
	je	.L2
	cmpq	$0, -600(%rbp)
	jne	.L3
.L2:
	movl	$-1, %eax
	jmp	.L6
.L3:
	leaq	-560(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	getCurrentTimestamp@PLT
	testl	%eax, %eax
	je	.L5
	movl	$-1, %eax
	jmp	.L6
.L5:
	call	pthread_self@PLT
	movq	%rax, -568(%rbp)
	movq	-592(%rbp), %rsi
	movq	-568(%rbp), %rcx
	leaq	-560(%rbp), %rdx
	leaq	-528(%rbp), %rax
	pushq	-600(%rbp)
	pushq	-584(%rbp)
	movq	%rsi, %r9
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC0(%rip), %rdx
	movl	$512, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	addq	$16, %rsp
	leaq	-528(%rbp), %rax
	movq	%rax, %rdi
	call	enqueueLogEntry@PLT
.L6:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	writeLog, .-writeLog
	.section	.rodata
.LC1:
	.string	"INFO"
	.text
	.globl	logInfo
	.type	logInfo, @function
logInfo:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writeLog
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	logInfo, .-logInfo
	.section	.rodata
.LC2:
	.string	"ERROR"
	.text
	.globl	logError
	.type	logError, @function
logError:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writeLog
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	logError, .-logError
	.section	.rodata
.LC3:
	.string	"%s | %s"
.LC4:
	.string	"OPERATION"
	.text
	.globl	logStockOperation
	.type	logStockOperation, @function
logStockOperation:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movq	%rdi, -280(%rbp)
	movq	%rsi, -288(%rbp)
	movq	%rdx, -296(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpq	$0, -280(%rbp)
	je	.L13
	cmpq	$0, -288(%rbp)
	je	.L13
	cmpq	$0, -296(%rbp)
	jne	.L14
.L13:
	movl	$-1, %eax
	jmp	.L16
.L14:
	movq	-296(%rbp), %rcx
	movq	-288(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	.LC3(%rip), %rdx
	movl	$256, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-272(%rbp), %rdx
	movq	-280(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	writeLog
.L16:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	logStockOperation, .-logStockOperation
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"timestamp.c"
	.text
	.globl	getCurrentTimestamp
	.type	getCurrentTimestamp, @function
getCurrentTimestamp:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$7216223924729501989, %rax
	movabsq	$2682541350339487008, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movw	$83, -16(%rbp)
	cmpq	$0, -120(%rbp)
	je	.L2
	cmpq	$0, -128(%rbp)
	jne	.L3
.L2:
	movl	$-1, %eax
	jmp	.L8
.L3:
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	cmpq	$-1, %rax
	jne	.L5
	movl	$-1, %eax
	jmp	.L8
.L5:
	leaq	-96(%rbp), %rdx
	leaq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	localtime_r@PLT
	testq	%rax, %rax
	jne	.L6
	movl	$-1, %eax
	jmp	.L8
.L6:
	leaq	-96(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	movq	-128(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strftime@PLT
	testq	%rax, %rax
	jne	.L7
	movl	$-1, %eax
	jmp	.L8
.L7:
	movl	$0, %eax
.L8:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	getCurrentTimestamp, .-getCurrentTimestamp
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"lru_cache.c"
	.text
	.globl	lruHead
	.bss
	.align 8
	.type	lruHead, @object
	.size	lruHead, 8
lruHead:
	.zero	8
	.globl	lruTail
	.align 8
	.type	lruTail, @object
	.size	lruTail, 8
lruTail:
	.zero	8
	.text
	.globl	addToFront
	.type	addToFront, @function
addToFront:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L5
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	lruHead(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	lruHead(%rip), %rax
	testq	%rax, %rax
	je	.L4
	movq	lruHead(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 40(%rax)
.L4:
	movq	-8(%rbp), %rax
	movq	%rax, lruHead(%rip)
	movq	lruTail(%rip), %rax
	testq	%rax, %rax
	jne	.L1
	movq	-8(%rbp), %rax
	movq	%rax, lruTail(%rip)
	jmp	.L1
.L5:
	nop
.L1:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	addToFront, .-addToFront
	.globl	clearLRU
	.type	clearLRU, @function
clearLRU:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$0, lruHead(%rip)
	movq	$0, lruTail(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	clearLRU, .-clearLRU
	.globl	removeFromLRU
	.type	removeFromLRU, @function
removeFromLRU:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L14
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L10
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	48(%rdx), %rdx
	movq	%rdx, 48(%rax)
	jmp	.L11
.L10:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, lruHead(%rip)
.L11:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	je	.L12
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	40(%rdx), %rdx
	movq	%rdx, 40(%rax)
	jmp	.L13
.L12:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, lruTail(%rip)
.L13:
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	jmp	.L7
.L14:
	nop
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	removeFromLRU, .-removeFromLRU
	.globl	moveToFront
	.type	moveToFront, @function
moveToFront:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L20
	movq	lruHead(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L21
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	removeFromLRU
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	lruHead(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
	movq	lruHead(%rip), %rax
	testq	%rax, %rax
	je	.L19
	movq	lruHead(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 40(%rax)
.L19:
	movq	-8(%rbp), %rax
	movq	%rax, lruHead(%rip)
	movq	lruTail(%rip), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-8(%rbp), %rax
	movq	%rax, lruTail(%rip)
	jmp	.L15
.L20:
	nop
	jmp	.L15
.L21:
	nop
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	moveToFront, .-moveToFront
	.globl	getLRUTail
	.type	getLRUTail, @function
getLRUTail:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	lruTail(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	getLRUTail, .-getLRUTail
	.section	.rodata
.LC0:
	.string	"\n===== LRU ORDER ====="
.LC1:
	.string	"%s"
.LC2:
	.string	" -> "
	.text
	.globl	displayLRU
	.type	displayLRU, @function
displayLRU:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	cacheLock@PLT
	movq	lruHead(%rip), %rax
	movq	%rax, -8(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L25
.L27:
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	je	.L26
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L26:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -8(%rbp)
.L25:
	cmpq	$0, -8(%rbp)
	jne	.L27
	movl	$10, %edi
	call	putchar@PLT
	call	cacheUnlock@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	displayLRU, .-displayLRU
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"memory_manager.c"
	.text
	.section	.rodata
.LC0:
	.string	"Memory Allocation Failed"
	.text
	.globl	allocateNode
	.type	allocateNode, @function
allocateNode:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	allocateNode, .-allocateNode
	.globl	freeNode
	.type	freeNode, @function
freeNode:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L6
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L6:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	freeNode, .-freeNode
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"storage.c"
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"data/cache_data.dat"
.LC2:
	.string	"CACHE_SAVE_FAILED"
.LC3:
	.string	"CACHE"
.LC4:
	.string	"%s %.2f %d\n"
.LC5:
	.string	"CACHE_SAVED"
.LC6:
	.string	"Cache Saved Successfully"
.LC7:
	.string	"Unable To Save Cache"
	.text
	.globl	saveCache
	.type	saveCache, @function
saveCache:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$-1, -20(%rbp)
	call	cacheLock@PLT
	testl	%eax, %eax
	je	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L5
.L4:
	movl	$0, -24(%rbp)
	jmp	.L6
.L10:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	hashTable(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L7
.L9:
	movq	-8(%rbp), %rax
	movl	24(%rax), %ecx
	movq	-8(%rbp), %rax
	movss	20(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rsi
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rsi, %xmm0
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	testl	%eax, %eax
	js	.L14
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L7:
	cmpq	$0, -8(%rbp)
	jne	.L9
	addl	$1, -24(%rbp)
.L6:
	cmpl	$100, -24(%rbp)
	jle	.L10
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	je	.L11
	movq	$0, -16(%rbp)
	jmp	.L5
.L11:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logInfo@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L12
.L14:
	nop
.L5:
	cmpq	$0, -16(%rbp)
	je	.L13
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L13:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L12:
	call	cacheUnlock@PLT
	movl	-20(%rbp), %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	saveCache, .-saveCache
	.section	.rodata
.LC8:
	.string	"r"
.LC9:
	.string	"CACHE_LOAD_FAILED"
.LC10:
	.string	"%19s %f %d"
.LC11:
	.string	"CACHE_LOADED"
	.text
	.globl	loadCache
	.type	loadCache, @function
loadCache:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -68(%rbp)
	call	cacheLock@PLT
	testl	%eax, %eax
	je	.L16
	movl	$-1, %eax
	jmp	.L23
.L16:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L18
	leaq	.LC9(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	call	cacheUnlock@PLT
	movl	$-1, %eax
	jmp	.L23
.L18:
	call	clearHashTable@PLT
	call	clearLRU@PLT
	jmp	.L19
.L22:
	subq	$32, %rsp
	movq	%rsp, %rcx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	-36(%rbp), %rax
	movq	-28(%rbp), %rdx
	movq	%rax, 12(%rcx)
	movq	%rdx, 20(%rcx)
	call	insertNode@PLT
	addq	$32, %rsp
	testl	%eax, %eax
	je	.L25
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	searchNode@PLT
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L19
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	addToFront@PLT
	addl	$1, -68(%rbp)
	jmp	.L19
.L25:
	nop
.L19:
	leaq	-48(%rbp), %rax
	leaq	24(%rax), %rsi
	leaq	-48(%rbp), %rax
	leaq	20(%rax), %rcx
	leaq	-48(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rsi, %r8
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$3, %eax
	je	.L22
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logInfo@PLT
	call	cacheUnlock@PLT
	movl	-68(%rbp), %eax
.L23:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	loadCache, .-loadCache
	.section	.rodata
.LC12:
	.string	"CACHE_BACKUP_FAILED"
.LC13:
	.string	"No Cache Data Available"
.LC14:
	.string	"data/backup.dat"
.LC15:
	.string	"Backup Failed"
.LC16:
	.string	"CACHE_BACKUP_CREATED"
.LC17:
	.string	"Backup Created Successfully"
	.text
	.globl	backupCache
	.type	backupCache, @function
backupCache:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	movl	$-1, -24(%rbp)
	call	cacheLock@PLT
	testl	%eax, %eax
	je	.L27
	movl	$-1, %eax
	jmp	.L28
.L27:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L29
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
	movl	$-1, %eax
	jmp	.L28
.L29:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L32
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L31
.L33:
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	cmpl	$-1, %eax
	jne	.L32
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L31
.L32:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L33
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	je	.L34
	movq	$0, -8(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L31
.L34:
	movq	$0, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	je	.L35
	movq	$0, -16(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logError@PLT
	jmp	.L31
.L35:
	movq	$0, -16(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	logInfo@PLT
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -24(%rbp)
	call	cacheUnlock@PLT
	movl	-24(%rbp), %eax
	jmp	.L28
.L31:
	cmpq	$0, -16(%rbp)
	je	.L36
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L36:
	cmpq	$0, -8(%rbp)
	je	.L37
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L37:
	call	cacheUnlock@PLT
	movl	-24(%rbp), %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	backupCache, .-backupCache
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"thread_manager.c"
	.text
	.local	logThread
	.comm	logThread,8,8
	.local	persistenceThread
	.comm	persistenceThread,8,8
	.local	logMutex
	.comm	logMutex,40,32
	.local	logCond
	.comm	logCond,48,32
	.local	cacheMutex
	.comm	cacheMutex,40,32
	.local	persistenceMutex
	.comm	persistenceMutex,40,32
	.local	persistenceCond
	.comm	persistenceCond,48,32
	.local	persistenceDoneCond
	.comm	persistenceDoneCond,48,32
	.local	logQueueHead
	.comm	logQueueHead,4,4
	.local	logQueueTail
	.comm	logQueueTail,4,4
	.local	logQueueCount
	.comm	logQueueCount,4,4
	.local	logQueue
	.comm	logQueue,16384,32
	.local	logShutdownRequested
	.comm	logShutdownRequested,4,4
	.local	persistenceShutdownRequested
	.comm	persistenceShutdownRequested,4,4
	.local	saveRequested
	.comm	saveRequested,4,4
	.local	saveCompleted
	.comm	saveCompleted,4,4
	.type	enqueueLogEntryInternal, @function
enqueueLogEntryInternal:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	logQueueCount(%rip), %eax
	cmpl	$63, %eax
	jle	.L4
	movl	$-1, %eax
	jmp	.L3
.L4:
	movl	logQueueTail(%rip), %eax
	cltq
	salq	$8, %rax
	movq	%rax, %rdx
	leaq	logQueue(%rip), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rax
	movl	$255, %edx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	strncpy@PLT
	movl	logQueueTail(%rip), %eax
	cltq
	salq	$8, %rax
	movq	%rax, %rdx
	leaq	255+logQueue(%rip), %rax
	movb	$0, (%rdx,%rax)
	movl	logQueueTail(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %edx
	andl	$63, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, logQueueTail(%rip)
	movl	logQueueCount(%rip), %eax
	addl	$1, %eax
	movl	%eax, logQueueCount(%rip)
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	enqueueLogEntryInternal, .-enqueueLogEntryInternal
	.section	.rodata
.LC0:
	.string	"a"
.LC1:
	.string	"logs/application.log"
.LC2:
	.string	"%s\n"
	.text
	.type	logThreadMain, @function
logThreadMain:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movq	%rdi, -296(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L14:
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	jmp	.L6
.L8:
	leaq	logMutex(%rip), %rax
	movq	%rax, %rsi
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_wait@PLT
.L6:
	movl	logQueueCount(%rip), %eax
	testl	%eax, %eax
	jne	.L7
	movl	logShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L8
.L7:
	movl	logShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L9
	movl	logQueueCount(%rip), %eax
	testl	%eax, %eax
	jne	.L9
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	jmp	.L17
.L9:
	movl	logQueueCount(%rip), %eax
	testl	%eax, %eax
	jle	.L11
	movl	logQueueHead(%rip), %eax
	cltq
	salq	$8, %rax
	movq	%rax, %rdx
	leaq	logQueue(%rip), %rax
	leaq	(%rdx,%rax), %rcx
	leaq	-272(%rbp), %rax
	movl	$256, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movb	$0, -17(%rbp)
	movl	logQueueHead(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %edx
	andl	$63, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, logQueueHead(%rip)
	movl	logQueueCount(%rip), %eax
	subl	$1, %eax
	movl	%eax, logQueueCount(%rip)
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -280(%rbp)
	cmpq	$0, -280(%rbp)
	je	.L14
	leaq	-272(%rbp), %rdx
	movq	-280(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L14
.L11:
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L14
.L17:
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	logThreadMain, .-logThreadMain
	.type	persistenceThreadMain, @function
persistenceThreadMain:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
.L24:
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	jmp	.L19
.L21:
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rsi
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_wait@PLT
.L19:
	movl	saveRequested(%rip), %eax
	testl	%eax, %eax
	jne	.L20
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L21
.L20:
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L22
	movl	saveRequested(%rip), %eax
	testl	%eax, %eax
	jne	.L22
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L26
.L22:
	movl	$0, saveRequested(%rip)
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	call	saveCache@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, saveCompleted(%rip)
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L24
.L26:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	persistenceThreadMain, .-persistenceThreadMain
	.globl	initializeThreadManager
	.type	initializeThreadManager, @function
initializeThreadManager:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16384, %edx
	movl	$0, %esi
	leaq	logQueue(%rip), %rax
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, logQueueHead(%rip)
	movl	$0, logQueueTail(%rip)
	movl	$0, logQueueCount(%rip)
	movl	$0, logShutdownRequested(%rip)
	movl	$0, persistenceShutdownRequested(%rip)
	movl	$0, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	movl	$0, %esi
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L28
	movl	$-1, %eax
	jmp	.L29
.L28:
	movl	$0, %esi
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_init@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L30
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L30:
	movl	$0, %esi
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_init@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L31
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L31:
	movl	$0, %esi
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_init@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L32
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L32:
	movl	$0, %esi
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_init@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L33
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L33:
	movl	$0, %ecx
	leaq	logThreadMain(%rip), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	leaq	logThread(%rip), %rax
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L34
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L34:
	movl	$0, %ecx
	leaq	persistenceThreadMain(%rip), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	leaq	persistenceThread(%rip), %rax
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L35
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, logShutdownRequested(%rip)
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	logThread(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L29
.L35:
	movl	$0, %eax
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	initializeThreadManager, .-initializeThreadManager
	.globl	shutdownThreadManager
	.type	shutdownThreadManager, @function
shutdownThreadManager:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, logShutdownRequested(%rip)
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, persistenceShutdownRequested(%rip)
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movq	logThread(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	persistenceThread(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	shutdownThreadManager, .-shutdownThreadManager
	.globl	enqueueLogEntry
	.type	enqueueLogEntry, @function
enqueueLogEntry:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L39
	movl	$-1, %eax
	jmp	.L40
.L39:
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L41
	movl	$-1, %eax
	jmp	.L40
.L41:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	enqueueLogEntryInternal
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L42
	leaq	logCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
.L42:
	leaq	logMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-4(%rbp), %eax
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	enqueueLogEntry, .-enqueueLogEntry
	.globl	signalCacheSave
	.type	signalCacheSave, @function
signalCacheSave:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L44
	movl	$-1, %eax
	jmp	.L45
.L44:
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, %eax
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	signalCacheSave, .-signalCacheSave
	.globl	requestCacheSaveAndWait
	.type	requestCacheSaveAndWait, @function
requestCacheSaveAndWait:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L47
	movl	$-1, %eax
	jmp	.L48
.L47:
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L49
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %eax
	jmp	.L48
.L49:
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	leaq	persistenceCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_signal@PLT
	jmp	.L50
.L52:
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rsi
	leaq	persistenceDoneCond(%rip), %rax
	movq	%rax, %rdi
	call	pthread_cond_wait@PLT
.L50:
	movl	saveCompleted(%rip), %eax
	testl	%eax, %eax
	jne	.L51
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L52
.L51:
	movl	saveCompleted(%rip), %eax
	testl	%eax, %eax
	je	.L53
	movl	$0, %eax
	jmp	.L54
.L53:
	movl	$-1, %eax
.L54:
	movl	%eax, -4(%rbp)
	leaq	persistenceMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movl	-4(%rbp), %eax
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	requestCacheSaveAndWait, .-requestCacheSaveAndWait
	.globl	cacheLock
	.type	cacheLock, @function
cacheLock:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cacheLock, .-cacheLock
	.globl	cacheUnlock
	.type	cacheUnlock, @function
cacheUnlock:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	cacheMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cacheUnlock, .-cacheUnlock
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"validator.c"
	.text
	.globl	validateSymbol
	.type	validateSymbol, @function
validateSymbol:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	movl	$0, %eax
	jmp	.L3
.L4:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$19, %rax
	jbe	.L5
	movl	$0, %eax
	jmp	.L3
.L5:
	movl	$0, -4(%rbp)
	jmp	.L6
.L8:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8, %eax
	testl	%eax, %eax
	jne	.L7
	movl	$0, %eax
	jmp	.L3
.L7:
	addl	$1, -4(%rbp)
.L6:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L8
	movl	$1, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	validateSymbol, .-validateSymbol
	.globl	validatePrice
	.type	validatePrice, @function
validatePrice:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	seta	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	validatePrice, .-validatePrice
	.globl	validateVolume
	.type	validateVolume, @function
validateVolume:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	notl	%eax
	shrl	$31, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	validateVolume, .-validateVolume
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
	.file	"analytics.c"
	.text
	.globl	stats
	.bss
	.align 16
	.type	stats, @object
	.size	stats, 24
stats:
	.zero	24
	.local	statsMutex
	.comm	statsMutex,40,32
	.text
	.globl	initializeStatistics
	.type	initializeStatistics, @function
initializeStatistics:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$0, stats(%rip)
	movl	$0, 4+stats(%rip)
	movl	$0, 8+stats(%rip)
	movl	$0, 12+stats(%rip)
	movl	$0, 16+stats(%rip)
	movl	$0, 20+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	initializeStatistics, .-initializeStatistics
	.globl	recordHit
	.type	recordHit, @function
recordHit:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	recordHit, .-recordHit
	.globl	recordMiss
	.type	recordMiss, @function
recordMiss:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	4+stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, 4+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	recordMiss, .-recordMiss
	.globl	recordInsert
	.type	recordInsert, @function
recordInsert:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	8+stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, 8+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	recordInsert, .-recordInsert
	.globl	recordUpdate
	.type	recordUpdate, @function
recordUpdate:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	12+stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, 12+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	recordUpdate, .-recordUpdate
	.globl	recordDelete
	.type	recordDelete, @function
recordDelete:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	16+stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, 16+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	recordDelete, .-recordDelete
	.globl	recordEviction
	.type	recordEviction, @function
recordEviction:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	20+stats(%rip), %eax
	addl	$1, %eax
	movl	%eax, 20+stats(%rip)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	recordEviction, .-recordEviction
	.globl	getHitRatio
	.type	getHitRatio, @function
getHitRatio:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	stats(%rip), %eax
	movl	%eax, %edx
	movl	4+stats(%rip), %eax
	movl	%eax, %eax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L9
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	pxor	%xmm0, %xmm0
	jmp	.L10
.L9:
	movl	stats(%rip), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L11
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L12
.L11:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L12:
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	js	.L13
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm1
	jmp	.L14
.L13:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
.L14:
	movaps	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	movss	.LC1(%rip), %xmm0
	mulss	%xmm2, %xmm0
	movss	%xmm0, -12(%rbp)
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	movss	-12(%rbp), %xmm0
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	getHitRatio, .-getHitRatio
	.section	.rodata
	.align 8
.LC2:
	.string	"====================================="
.LC3:
	.string	"         CACHE STATISTICS"
.LC4:
	.string	"Cache Hits     : %u\n"
.LC5:
	.string	"Cache Misses   : %u\n"
.LC6:
	.string	"Insertions     : %u\n"
.LC7:
	.string	"Updates        : %u\n"
.LC8:
	.string	"Deletions      : %u\n"
.LC9:
	.string	"Evictions      : %u\n"
.LC10:
	.string	"Hit Ratio      : %.2f%%\n"
	.text
	.globl	displayStatistics
	.type	displayStatistics, @function
displayStatistics:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	4+stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	8+stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	12+stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	16+stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	20+stats(%rip), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	stats(%rip), %eax
	movl	%eax, %edx
	movl	4+stats(%rip), %eax
	movl	%eax, %eax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L16
	movl	stats(%rip), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L17
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	jmp	.L18
.L17:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	addss	%xmm0, %xmm0
.L18:
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	js	.L19
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm1
	jmp	.L20
.L19:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rdx, %xmm1
	addss	%xmm1, %xmm1
.L20:
	movaps	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	movss	.LC1(%rip), %xmm0
	mulss	%xmm2, %xmm0
	jmp	.L21
.L16:
	pxor	%xmm0, %xmm0
.L21:
	movss	%xmm0, -12(%rbp)
	pxor	%xmm3, %xmm3
	cvtss2sd	-12(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	displayStatistics, .-displayStatistics
	.section	.rodata
.LC11:
	.string	"w"
.LC12:
	.string	"data/statistics.dat"
.LC13:
	.string	"%u %u %u %u %u %u\n"
	.text
	.globl	saveStatistics
	.type	saveStatistics, @function
saveStatistics:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L23
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L22
.L23:
	movl	20+stats(%rip), %edi
	movl	16+stats(%rip), %esi
	movl	12+stats(%rip), %r9d
	movl	8+stats(%rip), %r8d
	movl	4+stats(%rip), %ecx
	movl	stats(%rip), %edx
	movq	-8(%rbp), %rax
	pushq	%rdi
	pushq	%rsi
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	saveStatistics, .-saveStatistics
	.section	.rodata
.LC14:
	.string	"r"
.LC15:
	.string	"%u %u %u %u %u %u"
	.text
	.globl	loadStatistics
	.type	loadStatistics, @function
loadStatistics:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L26
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
	call	initializeStatistics
	jmp	.L25
.L26:
	movq	-8(%rbp), %rax
	leaq	20+stats(%rip), %rdx
	pushq	%rdx
	leaq	16+stats(%rip), %rdx
	pushq	%rdx
	leaq	12+stats(%rip), %r9
	leaq	8+stats(%rip), %r8
	leaq	4+stats(%rip), %rdx
	movq	%rdx, %rcx
	leaq	stats(%rip), %rdx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$16, %rsp
	cmpl	$6, %eax
	je	.L28
	movl	$0, stats(%rip)
	movl	$0, 4+stats(%rip)
	movl	$0, 8+stats(%rip)
	movl	$0, 12+stats(%rip)
	movl	$0, 16+stats(%rip)
	movl	$0, 20+stats(%rip)
.L28:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	statsMutex(%rip), %rax
	movq	%rax, %rdi
	call	pthread_mutex_unlock@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	loadStatistics, .-loadStatistics
	.section	.rodata
	.align 4
.LC1:
	.long	1120403456
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
