	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to initialize thread manager"
.LC1:
	.string	"====================================="
.LC2:
	.string	" REAL-TIME STOCK MARKET DATA CACHE"
.LC3:
	.string	"1. Register User"
.LC4:
	.string	"2. Login"
.LC5:
	.string	"3. Exit"
.LC6:
	.string	"Enter Choice : "
.LC7:
	.string	"%d"
.LC8:
	.string	"Cache saved successfully"
.LC9:
	.string	"Unable to complete cache save"
.LC10:
	.string	"Invalid Choice"
.LC11:
	.string	" STOCK MARKET CACHE SYSTEM"
.LC12:
	.string	"1. Add Stock"
.LC13:
	.string	"2. Search Stock"
.LC14:
	.string	"3. Update Stock"
.LC15:
	.string	"4. Delete Stock"
.LC16:
	.string	"5. Display Stocks"
.LC17:
	.string	"6. View Statistics"
.LC18:
	.string	"7. Save Cache"
.LC19:
	.string	"8. Load Cache"
.LC20:
	.string	"9. Backup Cache"
.LC21:
	.string	"10. View LRU Order"
.LC22:
	.string	"11. Exit"
.LC23:
	.string	"Cache save requested"
.LC24:
	.string	"Unable to request cache save"
.LC25:
	.string	"Unable to create cache backup"
.LC26:
	.string	"Application Closed Successfully"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	initializeThreadManager@PLT
	testl	%eax, %eax
	je	.L2
	leaq	.LC0(%rip), %rdi
	movl	$1, %ebp
	call	puts@PLT
	jmp	.L1
.L2:
	movl	%eax, %ebp
	leaq	.LC1(%rip), %rbx
	call	loadStatistics@PLT
	call	loadCache@PLT
.L4:
	movl	$10, %edi
	leaq	.LC6(%rip), %r12
	leaq	4(%rsp), %r13
	call	putchar@PLT
	movq	%rbx, %rdi
	leaq	.LC7(%rip), %r14
	call	puts@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	je	.L5
.L11:
	leaq	.LC11(%rip), %r15
	jmp	.L6
.L5:
	movl	4(%rsp), %eax
	cmpl	$2, %eax
	je	.L7
	cmpl	$3, %eax
	je	.L8
	decl	%eax
	jne	.L9
	call	registerUser@PLT
	jmp	.L4
.L7:
	call	loginUser@PLT
	testl	%eax, %eax
	je	.L4
	jmp	.L11
.L8:
	call	requestCacheSaveAndWait@PLT
	leaq	.LC8(%rip), %rdi
	testl	%eax, %eax
	je	.L39
	leaq	.LC9(%rip), %rdi
.L39:
	call	puts@PLT
	call	saveStatistics@PLT
	jmp	.L15
.L9:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L28:
	call	addStock@PLT
.L6:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r15, %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L15
	movl	4(%rsp), %eax
	decl	%eax
	cmpl	$10, %eax
	ja	.L16
	leaq	.L18(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L28-.L18
	.long	.L27-.L18
	.long	.L26-.L18
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.section	.text.startup
.L27:
	call	searchStock@PLT
	jmp	.L6
.L26:
	call	updateStock@PLT
	jmp	.L6
.L25:
	call	deleteStock@PLT
	jmp	.L6
.L24:
	call	displayStocks@PLT
	jmp	.L6
.L23:
	call	displayStatistics@PLT
	jmp	.L6
.L22:
	call	signalCacheSave@PLT
	leaq	.LC23(%rip), %rdi
	testl	%eax, %eax
	je	.L41
	leaq	.LC24(%rip), %rdi
.L41:
	call	puts@PLT
	call	saveStatistics@PLT
	jmp	.L6
.L21:
	call	loadCache@PLT
	jmp	.L6
.L20:
	call	backupCache@PLT
	leaq	.LC25(%rip), %rdi
	testl	%eax, %eax
	je	.L6
	jmp	.L40
.L19:
	call	displayLRU@PLT
	jmp	.L6
.L17:
	call	requestCacheSaveAndWait@PLT
	leaq	.LC8(%rip), %rdi
	testl	%eax, %eax
	je	.L42
	leaq	.LC9(%rip), %rdi
.L42:
	call	puts@PLT
	call	saveStatistics@PLT
	call	clearCache@PLT
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	jmp	.L43
.L16:
	leaq	.LC10(%rip), %rdi
.L40:
	call	puts@PLT
	jmp	.L6
.L15:
	call	clearCache@PLT
.L43:
	call	shutdownThreadManager@PLT
.L1:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE19:
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"\n========== USER REGISTRATION =========="
.LC1:
	.string	"Enter Username : "
.LC2:
	.string	"%49s"
.LC3:
	.string	"r"
.LC4:
	.string	"%49s %49s"
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
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC2(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	16(%rsp), %rax
	movq	%r13, %rdi
	movq	%rax, 8(%rsp)
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L3
	leaq	userMutex(%rip), %rdi
	leaq	USER_FILE(%rip), %r12
	movl	%eax, %ebx
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	movq	%r12, %rdi
	leaq	.LC4(%rip), %r15
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L5
.L4:
	leaq	116(%rsp), %r14
	xorl	%eax, %eax
	movq	%r15, %rsi
	movq	%rbp, %rdi
	leaq	166(%rsp), %rcx
	movq	%r14, %rdx
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	jne	.L24
	movq	8(%rsp), %rsi
	movq	%r14, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	jmp	.L6
.L24:
	xorl	%ebx, %ebx
.L6:
	movq	%rbp, %rdi
	call	fclose@PLT
	testl	%ebx, %ebx
	je	.L5
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC5(%rip), %rdi
.L22:
	call	puts@PLT
.L3:
	xorl	%ebx, %ebx
	jmp	.L1
.L5:
	leaq	userMutex(%rip), %rdi
	leaq	66(%rsp), %rbp
	call	pthread_mutex_unlock@PLT
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, %ebx
	cmpl	$1, %eax
	jne	.L3
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movq	%r12, %rdi
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L10
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC8(%rip), %rdi
	jmp	.L22
.L10:
	movq	8(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rbp, %r8
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	testl	%eax, %eax
	js	.L11
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L12
.L11:
	leaq	.LC11(%rip), %rdi
	xorl	%ebx, %ebx
	call	puts@PLT
.L12:
	movq	%r12, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L1:
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	registerUser, .-registerUser
	.section	.rodata.str1.1
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
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC12(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	.LC2(%rip), %rbx
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	leaq	100(%rsp), %r14
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L27
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	150(%rsp), %r15
	movq	%rbx, %rdi
	xorl	%eax, %eax
	movq	%r15, %rsi
	call	__isoc99_scanf@PLT
	movl	%eax, %ebx
	cmpl	$1, %eax
	jne	.L27
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L37
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC13(%rip), %rdi
.L41:
	call	puts@PLT
.L27:
	xorl	%ebx, %ebx
	jmp	.L25
.L32:
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L42
.L37:
	movq	%rsp, %r12
	leaq	50(%rsp), %r13
	xorl	%eax, %eax
	movq	%rbp, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	leaq	.LC4(%rip), %rsi
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	je	.L32
	jmp	.L43
.L42:
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L37
	jmp	.L31
.L43:
	xorl	%ebx, %ebx
.L31:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	testl	%ebx, %ebx
	je	.L33
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L33:
	leaq	.LC15(%rip), %rdi
	jmp	.L41
.L25:
	movq	200(%rsp), %rax
	subq	%fs:40, %rax
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	addq	$216, %rsp
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	loginUser, .-loginUser
	.local	userMutex
	.comm	userMutex,40,32
	.section	.rodata
	.align 8
	.type	USER_FILE, @object
	.size	USER_FILE, 15
USER_FILE:
	.string	"data/users.dat"
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
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rbp
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L1
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	28(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L1
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	32(%rsp), %rsi
	leaq	.LC5(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L1
	movq	%rbp, %rdi
	call	validateSymbol@PLT
	testb	%al, %al
	jne	.L3
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rsi
	jmp	.L32
.L3:
	movss	28(%rsp), %xmm0
	call	validatePrice@PLT
	testb	%al, %al
	jne	.L5
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rsi
	jmp	.L32
.L5:
	movl	32(%rsp), %edi
	call	validateVolume@PLT
	testb	%al, %al
	jne	.L6
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rsi
	jmp	.L32
.L6:
	call	cacheLock@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L7
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rsi
	jmp	.L32
.L7:
	movq	%rbp, %rdi
	call	searchNode@PLT
	movq	%rax, %rdx
	leaq	hashTable(%rip), %rax
	leaq	808(%rax), %rcx
	testq	%rdx, %rdx
	je	.L11
	call	cacheUnlock@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rsi
.L32:
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L35:
	addq	$8, %rax
	cmpq	%rcx, %rax
	je	.L34
.L11:
	movq	(%rax), %rdx
.L9:
	testq	%rdx, %rdx
	je	.L35
	movq	32(%rdx), %rdx
	incl	%ebx
	jmp	.L9
.L34:
	cmpl	$9, %ebx
	jle	.L13
	call	getLRUTail@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L13
	leaq	36(%rsp), %r12
	movl	$19, %edx
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	strncpy@PLT
	movq	%rbx, %rdi
	movb	$0, 55(%rsp)
	call	removeFromLRU@PLT
	movq	%r12, %rdi
	call	deleteNode@PLT
	call	recordEviction@PLT
	movq	%r12, %rdx
	leaq	.LC17(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
.L13:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movups	40(%rsp), %xmm1
	movups	52(%rsp), %xmm2
	movups	%xmm1, (%rsp)
	movups	%xmm2, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	je	.L15
	movq	%rbp, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L16
	call	addToFront@PLT
.L16:
	call	recordInsert@PLT
	leaq	.LC8(%rip), %rdi
	movq	%rbp, %rdx
	leaq	.LC18(%rip), %rsi
	call	logStockOperation@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
.L15:
	call	cacheUnlock@PLT
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	addq	$64, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	addStock, .-addStock
	.section	.rodata.str1.1
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
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rbp
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L36
	call	cacheLock@PLT
	movq	%rbp, %rdi
	leaq	.LC8(%rip), %r12
	call	searchNode@PLT
	testq	%rax, %rax
	movq	%rax, %rbx
	jne	.L38
	call	recordMiss@PLT
	movq	%r12, %rdi
	movq	%rbp, %rdx
	leaq	.LC20(%rip), %rsi
	call	logStockOperation@PLT
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L36
.L38:
	call	recordHit@PLT
	movq	%rbx, %rdi
	call	moveToFront@PLT
	movq	%rbp, %rdx
	leaq	.LC22(%rip), %rsi
	movq	%r12, %rdi
	call	logStockOperation@PLT
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC24(%rip), %rsi
	call	__printf_chk@PLT
	leaq	.LC25(%rip), %rsi
	movl	$2, %edi
	movb	$1, %al
	cvtss2sd	20(%rbx), %xmm0
	call	__printf_chk@PLT
	movl	24(%rbx), %edx
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	call	cacheUnlock@PLT
.L36:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	je	.L40
	call	__stack_chk_fail@PLT
.L40:
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	searchStock, .-searchStock
	.section	.rodata.str1.1
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
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rbx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L42
	leaq	.LC27(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rsp, %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L42
	movss	(%rsp), %xmm0
	call	validatePrice@PLT
	leaq	.LC9(%rip), %rdi
	testb	%al, %al
	je	.L50
	call	cacheLock@PLT
	movq	%rbx, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L46
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
.L50:
	call	puts@PLT
	jmp	.L42
.L46:
	movss	(%rsp), %xmm0
	movss	%xmm0, 20(%rax)
	call	moveToFront@PLT
	call	recordUpdate@PLT
	movq	%rbx, %rdx
	leaq	.LC28(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
.L42:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	je	.L48
	call	__stack_chk_fail@PLT
.L48:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	updateStock, .-updateStock
	.section	.rodata.str1.1
.LC30:
	.string	"STOCK_DELETE"
.LC31:
	.string	"Stock Deleted Successfully"
	.text
	.globl	deleteStock
	.type	deleteStock, @function
deleteStock:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rbx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	decl	%eax
	jne	.L51
	call	cacheLock@PLT
	movq	%rbx, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L53
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L51
.L53:
	call	removeFromLRU@PLT
	movq	%rbx, %rdi
	call	deleteNode@PLT
	testl	%eax, %eax
	je	.L54
	call	recordDelete@PLT
	leaq	.LC8(%rip), %rdi
	movq	%rbx, %rdx
	leaq	.LC30(%rip), %rsi
	call	logStockOperation@PLT
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
.L54:
	call	cacheUnlock@PLT
.L51:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	je	.L56
	call	__stack_chk_fail@PLT
.L56:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	deleteStock, .-deleteStock
	.section	.rodata.str1.1
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
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC38(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	hashTable(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC32(%rip), %rbx
	leaq	808(%rbp), %r12
	pushq	%rdx
	.cfi_def_cfa_offset 48
	call	cacheLock@PLT
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC34(%rip), %r8
	xorl	%eax, %eax
	leaq	.LC35(%rip), %rcx
	leaq	.LC36(%rip), %rdx
	leaq	.LC37(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	puts@PLT
.L64:
	movq	0(%rbp), %rbx
.L62:
	testq	%rbx, %rbx
	je	.L67
	movl	24(%rbx), %ecx
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movl	$2, %edi
	movb	$1, %al
	cvtss2sd	20(%rbx), %xmm0
	call	__printf_chk@PLT
	movq	32(%rbx), %rbx
	jmp	.L62
.L67:
	addq	$8, %rbp
	cmpq	%r12, %rbp
	jne	.L64
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	cacheUnlock@PLT
	.cfi_endproc
.LFE26:
	.size	displayStocks, .-displayStocks
	.globl	clearCache
	.type	clearCache, @function
clearCache:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	call	cacheLock@PLT
	call	clearLRU@PLT
	call	clearHashTable@PLT
	popq	%rdx
	.cfi_def_cfa_offset 8
	jmp	cacheUnlock@PLT
	.cfi_endproc
.LFE27:
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
	.globl	hashFunction
	.type	hashFunction, @function
hashFunction:
.LFB21:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
.L2:
	movzbl	(%rdi), %edx
	testb	%dl, %dl
	je	.L5
	imull	$31, %eax, %eax
	incq	%rdi
	addl	%edx, %eax
	jmp	.L2
.L5:
	movl	$101, %ecx
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE21:
	.size	hashFunction, .-hashFunction
	.globl	insertNode
	.type	insertNode, @function
insertNode:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	16(%rsp), %rdi
	call	hashFunction
	movl	%eax, %ebx
	call	allocateNode@PLT
	xorl	%edx, %edx
	testq	%rax, %rax
	je	.L6
	movl	%ebx, %edx
	movups	16(%rsp), %xmm0
	movups	28(%rsp), %xmm1
	leaq	hashTable(%rip), %rcx
	movq	(%rcx,%rdx,8), %rsi
	movups	%xmm0, (%rax)
	movq	%rsi, 32(%rax)
	movups	%xmm1, 12(%rax)
	movq	%rax, (%rcx,%rdx,8)
	movl	$1, %edx
.L6:
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	insertNode, .-insertNode
	.globl	clearHashTable
	.type	clearHashTable, @function
clearHashTable:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	hashTable(%rip), %rbx
	leaq	808(%rbx), %rbp
.L14:
	movq	(%rbx), %rdi
.L12:
	testq	%rdi, %rdi
	je	.L17
	movq	32(%rdi), %r12
	call	freeNode@PLT
	movq	%r12, %rdi
	jmp	.L12
.L17:
	xorl	%eax, %eax
	addq	$8, %rbx
	movq	%rax, -8(%rbx)
	cmpq	%rbp, %rbx
	jne	.L14
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	clearHashTable, .-clearHashTable
	.globl	searchNode
	.type	searchNode, @function
searchNode:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	call	hashFunction
	leaq	hashTable(%rip), %rdx
	movl	%eax, %eax
	movq	(%rdx,%rax,8), %rbx
.L19:
	testq	%rbx, %rbx
	je	.L18
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L18
	movq	32(%rbx), %rbx
	jmp	.L19
.L18:
	movq	%rbx, %rax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	searchNode, .-searchNode
	.globl	deleteNode
	.type	deleteNode, @function
deleteNode:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	hashTable(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	call	hashFunction
	movl	%eax, %r12d
	movq	(%r14,%r12,8), %rbx
.L27:
	testq	%rbx, %rbx
	je	.L34
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	%eax, %edx
	movq	32(%rbx), %rax
	testl	%edx, %edx
	jne	.L32
	testq	%r13, %r13
	jne	.L28
	movq	%rax, (%r14,%r12,8)
	jmp	.L29
.L28:
	movq	%rax, 32(%r13)
.L29:
	movq	%rbx, %rdi
	call	freeNode@PLT
	movl	$1, %eax
	jmp	.L26
.L32:
	movq	%rbx, %r13
	movq	%rax, %rbx
	jmp	.L27
.L34:
	xorl	%eax, %eax
.L26:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	deleteNode, .-deleteNode
	.globl	hashTable
	.bss
	.align 32
	.type	hashTable, @object
	.size	hashTable, 808
hashTable:
	.zero	808
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s | [Thread %lu] | [%s] | [%s] | %s"
	.text
	.type	writeLog, @function
writeLog:
.LFB21:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$560, %rsp
	.cfi_def_cfa_offset 608
	movq	%fs:40, %rax
	movq	%rax, 552(%rsp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L5
	movq	%rdx, %rbp
	testq	%rdx, %rdx
	jne	.L2
.L5:
	orl	$-1, %eax
	jmp	.L1
.L2:
	leaq	10(%rsp), %r14
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movl	$30, %esi
	movq	%r14, %rdi
	call	getCurrentTimestamp@PLT
	testl	%eax, %eax
	jne	.L5
	call	pthread_self@PLT
	leaq	40(%rsp), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 616
	movq	%r14, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 624
	movq	%r13, %rdi
	leaq	.LC0(%rip), %r8
	movl	$512, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 632
	movl	$2, %edx
	movl	$512, %esi
	pushq	%rax
	.cfi_def_cfa_offset 640
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 608
	movq	%r13, %rdi
	call	enqueueLogEntry@PLT
.L1:
	movq	552(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	addq	$560, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	writeLog, .-writeLog
	.section	.rodata.str1.1
.LC1:
	.string	"INFO"
	.text
	.globl	logInfo
	.type	logInfo, @function
logInfo:
.LFB22:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rsi
	jmp	writeLog
	.cfi_endproc
.LFE22:
	.size	logInfo, .-logInfo
	.section	.rodata.str1.1
.LC2:
	.string	"ERROR"
	.text
	.globl	logError
	.type	logError, @function
logError:
.LFB23:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rsi
	jmp	writeLog
	.cfi_endproc
.LFE23:
	.size	logError, .-logError
	.section	.rodata.str1.1
.LC3:
	.string	"%s | %s"
.LC4:
	.string	"OPERATION"
	.text
	.globl	logStockOperation
	.type	logStockOperation, @function
logStockOperation:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$280, %rsp
	.cfi_def_cfa_offset 304
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	sete	%al
	testq	%rdx, %rdx
	sete	%cl
	orb	%cl, %al
	jne	.L14
	movq	%rdi, %rbx
	testq	%rdi, %rdi
	je	.L14
	leaq	8(%rsp), %rbp
	pushq	%rax
	.cfi_def_cfa_offset 312
	movq	%rsi, %r9
	movl	$256, %ecx
	pushq	%rdx
	.cfi_def_cfa_offset 320
	leaq	.LC3(%rip), %r8
	movl	$2, %edx
	movq	%rbp, %rdi
	movl	$256, %esi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%rbp, %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	writeLog
	popq	%rdx
	.cfi_def_cfa_offset 312
	popq	%rcx
	.cfi_def_cfa_offset 304
	jmp	.L11
.L14:
	orl	$-1, %eax
.L11:
	movq	264(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	addq	$280, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
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
.LFB12:
	.cfi_startproc
	endbr64
	movabsq	$2682541350339487008, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$96, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	movabsq	$7216223924729501989, %rax
	movq	%rdx, 78(%rsp)
	movw	$83, 86(%rsp)
	movq	%rax, 70(%rsp)
	testq	%rdi, %rdi
	je	.L5
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	jne	.L2
.L5:
	orl	$-1, %eax
	jmp	.L1
.L2:
	movq	%rdi, %rbx
	xorl	%edi, %edi
	call	time@PLT
	movq	%rax, (%rsp)
	incq	%rax
	je	.L5
	leaq	8(%rsp), %r12
	movq	%rsp, %rdi
	movq	%r12, %rsi
	call	localtime_r@PLT
	testq	%rax, %rax
	je	.L5
	leaq	70(%rsp), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strftime@PLT
	cmpq	$1, %rax
	sbbl	%eax, %eax
.L1:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	addq	$96, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
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
	.globl	addToFront
	.type	addToFront, @function
addToFront:
.LFB12:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L1
	xorl	%eax, %eax
	movq	%rax, 40(%rdi)
	movq	lruHead(%rip), %rax
	movq	%rax, 48(%rdi)
	testq	%rax, %rax
	je	.L4
	movq	%rdi, 40(%rax)
.L4:
	cmpq	$0, lruTail(%rip)
	movq	%rdi, lruHead(%rip)
	jne	.L1
	movq	%rdi, lruTail(%rip)
.L1:
	ret
	.cfi_endproc
.LFE12:
	.size	addToFront, .-addToFront
	.globl	clearLRU
	.type	clearLRU, @function
clearLRU:
.LFB13:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	movq	%rax, lruHead(%rip)
	movq	%rax, lruTail(%rip)
	ret
	.cfi_endproc
.LFE13:
	.size	clearLRU, .-clearLRU
	.globl	removeFromLRU
	.type	removeFromLRU, @function
removeFromLRU:
.LFB14:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L11
	movq	40(%rdi), %rax
	movq	48(%rdi), %rdx
	testq	%rax, %rax
	je	.L13
	movq	%rdx, 48(%rax)
	jmp	.L14
.L13:
	movq	%rdx, lruHead(%rip)
.L14:
	movq	48(%rdi), %rdx
	testq	%rdx, %rdx
	je	.L15
	movq	%rax, 40(%rdx)
	jmp	.L16
.L15:
	movq	%rax, lruTail(%rip)
.L16:
	xorl	%eax, %eax
	movq	%rax, 40(%rdi)
	movq	%rax, 48(%rdi)
.L11:
	ret
	.cfi_endproc
.LFE14:
	.size	removeFromLRU, .-removeFromLRU
	.globl	moveToFront
	.type	moveToFront, @function
moveToFront:
.LFB15:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L20
	cmpq	%rdi, lruHead(%rip)
	je	.L20
	call	removeFromLRU
	xorl	%eax, %eax
	movq	%rax, 40(%rdi)
	movq	lruHead(%rip), %rax
	movq	%rax, 48(%rdi)
	testq	%rax, %rax
	je	.L24
	movq	%rdi, 40(%rax)
.L24:
	cmpq	$0, lruTail(%rip)
	movq	%rdi, lruHead(%rip)
	jne	.L20
	movq	%rdi, lruTail(%rip)
.L20:
	ret
	.cfi_endproc
.LFE15:
	.size	moveToFront, .-moveToFront
	.globl	getLRUTail
	.type	getLRUTail, @function
getLRUTail:
.LFB16:
	.cfi_startproc
	endbr64
	movq	lruTail(%rip), %rax
	ret
	.cfi_endproc
.LFE16:
	.size	getLRUTail, .-getLRUTail
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rdx
	.cfi_def_cfa_offset 32
	call	cacheLock@PLT
	leaq	.LC0(%rip), %rdi
	movq	lruHead(%rip), %rbx
	call	puts@PLT
.L30:
	testq	%rbx, %rbx
	je	.L34
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	cmpq	$0, 48(%rbx)
	je	.L31
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L31:
	movq	48(%rbx), %rbx
	jmp	.L30
.L34:
	movl	$10, %edi
	call	putchar@PLT
	popq	%rax
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	cacheUnlock@PLT
	.cfi_endproc
.LFE17:
	.size	displayLRU, .-displayLRU
	.globl	lruTail
	.bss
	.align 8
	.type	lruTail, @object
	.size	lruTail, 8
lruTail:
	.zero	8
	.globl	lruHead
	.align 8
	.type	lruHead, @object
	.size	lruHead, 8
lruHead:
	.zero	8
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Memory Allocation Failed"
	.text
	.globl	allocateNode
	.type	allocateNode, @function
allocateNode:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	jmp	.L1
.L2:
	xorl	%eax, %eax
	movq	%rax, 32(%rbx)
	movq	%rax, 40(%rbx)
	movq	%rax, 48(%rbx)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE17:
	.size	allocateNode, .-allocateNode
	.globl	freeNode
	.type	freeNode, @function
freeNode:
.LFB18:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L6
	jmp	free@PLT
.L6:
	ret
	.cfi_endproc
.LFE18:
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
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	orl	$-1, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L1
	leaq	.LC1(%rip), %rdi
	leaq	.LC0(%rip), %rsi
	call	fopen@PLT
	leaq	hashTable(%rip), %rbp
	leaq	.LC4(%rip), %r13
	movq	%rax, %rdi
	leaq	808(%rbp), %r12
	testq	%rax, %rax
	jne	.L8
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L4
.L7:
	movl	24(%rbx), %r8d
	movq	%rbx, %rcx
	movq	%r13, %rdx
	movl	$2, %esi
	movb	$1, %al
	movq	%rdi, 8(%rsp)
	cvtss2sd	20(%rbx), %xmm0
	call	__fprintf_chk@PLT
	movq	8(%rsp), %rdi
	testl	%eax, %eax
	js	.L6
	movq	32(%rbx), %rbx
.L5:
	testq	%rbx, %rbx
	jne	.L7
	addq	$8, %rbp
	cmpq	%r12, %rbp
	je	.L16
.L8:
	movq	0(%rbp), %rbx
	jmp	.L5
.L16:
	call	fclose@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L4
	leaq	.LC5(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	jmp	.L9
.L6:
	call	fclose@PLT
.L4:
	leaq	.LC7(%rip), %rdi
	orl	$-1, %ebx
	call	puts@PLT
.L9:
	call	cacheUnlock@PLT
.L1:
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	saveCache, .-saveCache
	.section	.rodata.str1.1
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
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L18
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	%eax, %ebx
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L19
	leaq	.LC9(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	call	cacheUnlock@PLT
.L18:
	orl	$-1, %ebx
	jmp	.L17
.L19:
	call	clearHashTable@PLT
	leaq	.LC10(%rip), %r13
	call	clearLRU@PLT
.L22:
	leaq	12(%rsp), %r12
	xorl	%eax, %eax
	leaq	32(%rsp), %rcx
	movq	%r13, %rsi
	leaq	36(%rsp), %r8
	movq	%r12, %rdx
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$3, %eax
	jne	.L31
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movups	44(%rsp), %xmm0
	movups	56(%rsp), %xmm1
	movups	%xmm0, (%rsp)
	movups	%xmm1, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	je	.L22
	movq	%r12, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L22
	call	addToFront@PLT
	incl	%ebx
	jmp	.L22
.L31:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	.LC11(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	call	cacheUnlock@PLT
.L17:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	addq	$56, %rsp
	.cfi_def_cfa_offset 40
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	loadCache, .-loadCache
	.section	.rodata.str1.1
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
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L33
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L34
	leaq	.LC3(%rip), %rdi
	leaq	.LC12(%rip), %rsi
	call	logError@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
.L49:
	call	cacheUnlock@PLT
.L33:
	orl	$-1, %ebx
	jmp	.L32
.L34:
	leaq	.LC0(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L36
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L37
.L36:
	movq	%rbx, %rdi
	call	fgetc@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L50
	movq	%rbp, %rsi
	call	fputc@PLT
	incl	%eax
	jne	.L36
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L38
.L50:
	movq	%rbp, %rdi
	leaq	.LC3(%rip), %rbp
	call	fclose@PLT
	testl	%eax, %eax
	je	.L40
	leaq	.LC12(%rip), %rsi
	movq	%rbp, %rdi
	call	logError@PLT
	jmp	.L37
.L40:
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L41
	leaq	.LC12(%rip), %rsi
	movq	%rbp, %rdi
	call	logError@PLT
	jmp	.L49
.L41:
	leaq	.LC16(%rip), %rsi
	movq	%rbp, %rdi
	call	logInfo@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
	jmp	.L32
.L37:
	xorl	%r12d, %r12d
.L38:
	movq	%rbx, %rdi
	call	fclose@PLT
	testq	%r12, %r12
	je	.L49
	movq	%r12, %rdi
	call	fclose@PLT
	jmp	.L49
.L32:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
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
	.type	persistenceThreadMain, @function
persistenceThreadMain:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	persistenceMutex(%rip), %rbx
	pushq	%rsi
	.cfi_def_cfa_offset 32
.L6:
	movq	%rbx, %rdi
	leaq	persistenceCond(%rip), %rbp
	call	pthread_mutex_lock@PLT
.L2:
	cmpl	$0, saveRequested(%rip)
	movl	persistenceShutdownRequested(%rip), %eax
	jne	.L3
	testl	%eax, %eax
	jne	.L10
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	pthread_cond_wait@PLT
	jmp	.L2
.L3:
	xorl	%ecx, %ecx
	movq	%rbx, %rdi
	movl	%ecx, saveRequested(%rip)
	call	pthread_mutex_unlock@PLT
	call	saveCache@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	leaq	persistenceDoneCond(%rip), %rdi
	movl	$1, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L6
.L10:
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rdx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	persistenceThreadMain, .-persistenceThreadMain
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"a"
.LC1:
	.string	"logs/application.log"
.LC2:
	.string	"%s\n"
	.text
	.type	logThreadMain, @function
logThreadMain:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	logMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$280, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
.L12:
	movq	%rbp, %rdi
	leaq	logCond(%rip), %rbx
	call	pthread_mutex_lock@PLT
.L13:
	movl	logQueueCount(%rip), %r13d
	movl	logShutdownRequested(%rip), %eax
	testl	%r13d, %r13d
	jne	.L14
	testl	%eax, %eax
	jne	.L29
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	pthread_cond_wait@PLT
	jmp	.L13
.L14:
	jg	.L17
	jmp	.L30
.L29:
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	movq	264(%rsp), %rax
	subq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L17:
	movslq	logQueueHead(%rip), %rsi
	leaq	logQueue(%rip), %rax
	leaq	8(%rsp), %r12
	decl	%r13d
	movl	$255, %edx
	movq	%r12, %rdi
	movq	%rsi, %rbx
	salq	$8, %rsi
	addq	%rax, %rsi
	call	strncpy@PLT
	leal	1(%rbx), %eax
	movl	$64, %ecx
	movq	%rbp, %rdi
	cltd
	movb	$0, 263(%rsp)
	idivl	%ecx
	movl	%r13d, logQueueCount(%rip)
	movl	%edx, logQueueHead(%rip)
	call	pthread_mutex_unlock@PLT
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L12
	movq	%rax, %rdi
	movq	%r12, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L12
.L30:
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L12
.L21:
	addq	$280, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	logThreadMain, .-logThreadMain
	.globl	initializeThreadManager
	.type	initializeThreadManager, @function
initializeThreadManager:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	logQueue(%rip), %rdx
	xorl	%eax, %eax
	movl	$4096, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %rdi
	xorl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	logMutex(%rip), %rbx
	rep stosl
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	%eax, logQueueHead(%rip)
	movl	%eax, logQueueTail(%rip)
	movl	%eax, logQueueCount(%rip)
	movl	%eax, logShutdownRequested(%rip)
	movl	%eax, persistenceShutdownRequested(%rip)
	movl	%eax, saveRequested(%rip)
	movl	%eax, saveCompleted(%rip)
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L32
	leaq	logCond(%rip), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	je	.L33
.L43:
	movq	%rbx, %rdi
	call	pthread_mutex_destroy@PLT
.L32:
	orl	$-1, %eax
	jmp	.L31
.L33:
	leaq	persistenceMutex(%rip), %r12
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L47
	leaq	persistenceCond(%rip), %r13
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L46
	leaq	persistenceDoneCond(%rip), %r14
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L45
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	logThreadMain(%rip), %rdx
	leaq	logThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L44
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	persistenceThreadMain(%rip), %rdx
	leaq	persistenceThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L31
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movq	%rbp, %rdi
	movl	$1, logShutdownRequested(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	movq	logThread(%rip), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.L44:
	movq	%r14, %rdi
	call	pthread_cond_destroy@PLT
.L45:
	movq	%r13, %rdi
	call	pthread_cond_destroy@PLT
.L46:
	movq	%r12, %rdi
	call	pthread_mutex_destroy@PLT
.L47:
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movq	%rbp, %rdi
	call	pthread_cond_destroy@PLT
	jmp	.L43
.L31:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	initializeThreadManager, .-initializeThreadManager
	.globl	shutdownThreadManager
	.type	shutdownThreadManager, @function
shutdownThreadManager:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	persistenceCond(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	logCond(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	persistenceMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	logMutex(%rip), %rbx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movq	%r12, %rdi
	movl	$1, logShutdownRequested(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movq	%r13, %rdi
	movl	$1, persistenceShutdownRequested(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	movq	logThread(%rip), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movq	persistenceThread(%rip), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	leaq	persistenceDoneCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	movq	%r13, %rdi
	call	pthread_cond_destroy@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movq	%r12, %rdi
	call	pthread_cond_destroy@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_destroy@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	shutdownThreadManager, .-shutdownThreadManager
	.globl	enqueueLogEntry
	.type	enqueueLogEntry, @function
enqueueLogEntry:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testq	%rdi, %rdi
	jne	.L51
.L53:
	orl	$-1, %ebx
	jmp	.L50
.L51:
	leaq	logMutex(%rip), %r12
	movq	%rdi, %r14
	movq	%r12, %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L53
	movl	logQueueCount(%rip), %r13d
	cmpl	$63, %r13d
	jg	.L55
	movslq	logQueueTail(%rip), %rdx
	movl	$16384, %ecx
	leaq	logQueue(%rip), %rax
	movq	%r14, %rsi
	movq	%rdx, %rbp
	salq	$8, %rdx
	cmpq	%rcx, %rdx
	leaq	(%rdx,%rax), %rdi
	cmovnb	%rdx, %rcx
	incl	%r13d
	subq	%rdx, %rcx
	movl	$255, %edx
	call	__strncpy_chk@PLT
	movl	$64, %ecx
	leaq	logCond(%rip), %rdi
	movl	%r13d, logQueueCount(%rip)
	movb	$0, 255(%rax)
	leal	1(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, logQueueTail(%rip)
	call	pthread_cond_signal@PLT
	jmp	.L54
.L55:
	orl	$-1, %ebx
.L54:
	movq	%r12, %rdi
	call	pthread_mutex_unlock@PLT
.L50:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	enqueueLogEntry, .-enqueueLogEntry
	.globl	signalCacheSave
	.type	signalCacheSave, @function
signalCacheSave:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	persistenceMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rbp, %rdi
	orl	$-1, %ebx
	pushq	%rsi
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L57
	xorl	%ecx, %ecx
	leaq	persistenceCond(%rip), %rdi
	movl	%eax, %ebx
	movl	$1, saveRequested(%rip)
	movl	%ecx, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
.L57:
	movl	%ebx, %eax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	signalCacheSave, .-signalCacheSave
	.globl	requestCacheSaveAndWait
	.type	requestCacheSaveAndWait, @function
requestCacheSaveAndWait:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	persistenceMutex(%rip), %rbx
	pushq	%rsi
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L62
	cmpl	$0, persistenceShutdownRequested(%rip)
	je	.L63
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
.L62:
	orl	$-1, %ebp
	jmp	.L61
.L63:
	xorl	%ecx, %ecx
	leaq	persistenceCond(%rip), %rdi
	movl	$1, saveRequested(%rip)
	leaq	persistenceDoneCond(%rip), %rbp
	movl	%ecx, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
.L65:
	movl	saveCompleted(%rip), %eax
	movl	%eax, %edx
	orl	persistenceShutdownRequested(%rip), %edx
	jne	.L68
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	pthread_cond_wait@PLT
	jmp	.L65
.L68:
	cmpl	$1, %eax
	movq	%rbx, %rdi
	sbbl	%ebp, %ebp
	call	pthread_mutex_unlock@PLT
.L61:
	movl	%ebp, %eax
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	requestCacheSaveAndWait, .-requestCacheSaveAndWait
	.globl	cacheLock
	.type	cacheLock, @function
cacheLock:
.LFB34:
	.cfi_startproc
	endbr64
	leaq	cacheMutex(%rip), %rdi
	jmp	pthread_mutex_lock@PLT
	.cfi_endproc
.LFE34:
	.size	cacheLock, .-cacheLock
	.globl	cacheUnlock
	.type	cacheUnlock, @function
cacheUnlock:
.LFB35:
	.cfi_startproc
	endbr64
	leaq	cacheMutex(%rip), %rdi
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE35:
	.size	cacheUnlock, .-cacheUnlock
	.local	saveCompleted
	.comm	saveCompleted,4,4
	.local	saveRequested
	.comm	saveRequested,4,4
	.local	persistenceShutdownRequested
	.comm	persistenceShutdownRequested,4,4
	.local	logShutdownRequested
	.comm	logShutdownRequested,4,4
	.local	logQueue
	.comm	logQueue,16384,32
	.local	logQueueCount
	.comm	logQueueCount,4,4
	.local	logQueueTail
	.comm	logQueueTail,4,4
	.local	logQueueHead
	.comm	logQueueHead,4,4
	.local	persistenceDoneCond
	.comm	persistenceDoneCond,48,32
	.local	persistenceCond
	.comm	persistenceCond,48,32
	.local	persistenceMutex
	.comm	persistenceMutex,40,32
	.local	cacheMutex
	.comm	cacheMutex,40,32
	.local	logCond
	.comm	logCond,48,32
	.local	logMutex
	.comm	logMutex,40,32
	.local	persistenceThread
	.comm	persistenceThread,8,8
	.local	logThread
	.comm	logThread,8,8
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
.LFB9:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L10
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	pushq	%rcx
	.cfi_def_cfa_offset 32
	cmpb	$0, (%rdi)
	je	.L1
	call	strlen@PLT
	movq	%rax, %rdx
	xorl	%eax, %eax
	cmpq	$19, %rdx
	ja	.L1
.L3:
	movzbl	(%rbx), %ebp
	testb	%bpl, %bpl
	je	.L14
	call	__ctype_b_loc@PLT
	incq	%rbx
	movq	(%rax), %rax
	testb	$8, (%rax,%rbp,2)
	jne	.L3
	xorl	%eax, %eax
	jmp	.L1
.L14:
	movb	$1, %al
.L1:
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE9:
	.size	validateSymbol, .-validateSymbol
	.globl	validatePrice
	.type	validatePrice, @function
validatePrice:
.LFB10:
	.cfi_startproc
	endbr64
	movaps	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE10:
	.size	validatePrice, .-validatePrice
	.globl	validateVolume
	.type	validateVolume, @function
validateVolume:
.LFB11:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	notl	%eax
	shrl	$31, %eax
	ret
	.cfi_endproc
.LFE11:
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
	.globl	initializeStatistics
	.type	initializeStatistics, @function
initializeStatistics:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	xorl	%eax, %eax
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	movq	%rax, stats(%rip)
	movq	%rax, 8+stats(%rip)
	movq	%rax, 16+stats(%rip)
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE12:
	.size	initializeStatistics, .-initializeStatistics
	.globl	recordHit
	.type	recordHit, @function
recordHit:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE13:
	.size	recordHit, .-recordHit
	.globl	recordMiss
	.type	recordMiss, @function
recordMiss:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	4+stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE14:
	.size	recordMiss, .-recordMiss
	.globl	recordInsert
	.type	recordInsert, @function
recordInsert:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	8+stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE15:
	.size	recordInsert, .-recordInsert
	.globl	recordUpdate
	.type	recordUpdate, @function
recordUpdate:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	12+stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE16:
	.size	recordUpdate, .-recordUpdate
	.globl	recordDelete
	.type	recordDelete, @function
recordDelete:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	16+stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE17:
	.size	recordDelete, .-recordDelete
	.globl	recordEviction
	.type	recordEviction, @function
recordEviction:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	incl	20+stats(%rip)
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE18:
	.size	recordEviction, .-recordEviction
	.globl	getHitRatio
	.type	getHitRatio, @function
getHitRatio:
.LFB19:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	4+stats(%rip), %eax
	movl	stats(%rip), %edx
	leaq	statsMutex(%rip), %rdi
	addq	%rdx, %rax
	jne	.L16
	call	pthread_mutex_unlock@PLT
	xorps	%xmm0, %xmm0
	jmp	.L15
.L16:
	cvtsi2ssq	%rdx, %xmm0
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
	movss	%xmm0, 12(%rsp)
	call	pthread_mutex_unlock@PLT
	movss	12(%rsp), %xmm0
.L15:
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE19:
	.size	getHitRatio, .-getHitRatio
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	statsMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rbp, %rdi
	leaq	.LC2(%rip), %rbx
	pushq	%rdx
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movl	stats(%rip), %edx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	4+stats(%rip), %edx
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	8+stats(%rip), %edx
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	12+stats(%rip), %edx
	leaq	.LC7(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	16+stats(%rip), %edx
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	20+stats(%rip), %edx
	xorl	%eax, %eax
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	4+stats(%rip), %eax
	movl	stats(%rip), %edx
	xorps	%xmm0, %xmm0
	addq	%rdx, %rax
	je	.L23
	cvtsi2ssq	%rdx, %xmm0
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
.L23:
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	movb	$1, %al
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	popq	%rax
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE20:
	.size	displayStatistics, .-displayStatistics
	.section	.rodata.str1.1
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
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	statsMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rbp, %rdi
	pushq	%rcx
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	leaq	.LC11(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L33
	movq	%rax, %rbx
	movl	20+stats(%rip), %eax
	pushq	%rdx
	.cfi_def_cfa_offset 40
	movl	$2, %esi
	movl	8+stats(%rip), %r9d
	movl	4+stats(%rip), %r8d
	movq	%rbx, %rdi
	leaq	.LC13(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	16+stats(%rip), %eax
	movl	stats(%rip), %ecx
	pushq	%rax
	.cfi_def_cfa_offset 56
	movl	12+stats(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 64
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	call	fclose@PLT
.L33:
	popq	%rax
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE21:
	.size	saveStatistics, .-saveStatistics
	.section	.rodata.str1.1
.LC14:
	.string	"r"
.LC15:
	.string	"%u %u %u %u %u %u"
	.text
	.globl	loadStatistics
	.type	loadStatistics, @function
loadStatistics:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	statsMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rbp, %rdi
	pushq	%r8
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	leaq	.LC14(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	jne	.L35
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rdi
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	initializeStatistics
.L35:
	.cfi_restore_state
	movq	%rax, %rbx
	leaq	20+stats(%rip), %rax
	leaq	.LC15(%rip), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 40
	subq	$4, %rax
	movq	%rbx, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 48
	leaq	-12(%rax), %rcx
	leaq	-4(%rax), %r9
	leaq	-8(%rax), %r8
	leaq	-16(%rax), %rdx
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	popq	%rcx
	.cfi_def_cfa_offset 40
	popq	%rsi
	.cfi_def_cfa_offset 32
	cmpl	$6, %eax
	je	.L36
	xorl	%edx, %edx
	movq	%rdx, stats(%rip)
	movq	%rdx, 8+stats(%rip)
	movq	%rdx, 16+stats(%rip)
.L36:
	movq	%rbx, %rdi
	call	fclose@PLT
	popq	%rax
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE22:
	.size	loadStatistics, .-loadStatistics
	.local	statsMutex
	.comm	statsMutex,40,32
	.globl	stats
	.bss
	.align 16
	.type	stats, @object
	.size	stats, 24
stats:
	.zero	24
	.section	.rodata.cst4,"aM",@progbits,4
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
