	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Failed to initialize thread manager"
	.align 8
.LC1:
	.string	"====================================="
	.align 8
.LC2:
	.string	" REAL-TIME STOCK MARKET DATA CACHE"
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Application Closed Successfully"
	.text
	.globl	main
	.type	main, @function
main:
.LFB30:
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
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	initializeThreadManager@PLT
	testl	%eax, %eax
	jne	.L35
	movl	%eax, %ebp
	call	loadStatistics@PLT
	call	loadCache@PLT
	leaq	.LC1(%rip), %rbx
	leaq	.LC2(%rip), %r14
	leaq	.LC3(%rip), %r13
	leaq	.LC4(%rip), %r12
.L4:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r14, %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r13, %rdi
	call	puts@PLT
	movq	%r12, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	4(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L11
	movl	4(%rsp), %eax
	cmpl	$2, %eax
	je	.L7
	cmpl	$3, %eax
	je	.L8
	cmpl	$1, %eax
	jne	.L9
	call	registerUser@PLT
	jmp	.L4
.L35:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$1, %ebp
	jmp	.L1
.L7:
	call	loginUser@PLT
	testl	%eax, %eax
	je	.L4
.L11:
	leaq	.LC1(%rip), %rbx
	leaq	.LC11(%rip), %r14
	leaq	.LC12(%rip), %r13
	leaq	.LC13(%rip), %r12
.L6:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r14, %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r13, %rdi
	call	puts@PLT
	movq	%r12, %rdi
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
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	4(%rsp), %rsi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L14
	cmpl	$11, 4(%rsp)
	ja	.L15
	movl	4(%rsp), %eax
	leaq	.L17(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L17:
	.long	.L15-.L17
	.long	.L27-.L17
	.long	.L26-.L17
	.long	.L25-.L17
	.long	.L24-.L17
	.long	.L23-.L17
	.long	.L22-.L17
	.long	.L21-.L17
	.long	.L20-.L17
	.long	.L19-.L17
	.long	.L18-.L17
	.long	.L16-.L17
	.text
.L8:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	jne	.L12
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L13:
	call	saveStatistics@PLT
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
.L1:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	movl	%ebp, %eax
	addq	$16, %rsp
	.cfi_remember_state
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
.L12:
	.cfi_restore_state
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L9:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L27:
	call	addStock@PLT
	jmp	.L6
.L26:
	call	searchStock@PLT
	jmp	.L6
.L25:
	call	updateStock@PLT
	jmp	.L6
.L24:
	call	deleteStock@PLT
	jmp	.L6
.L23:
	call	displayStocks@PLT
	jmp	.L6
.L22:
	call	displayStatistics@PLT
	jmp	.L6
.L21:
	call	signalCacheSave@PLT
	testl	%eax, %eax
	jne	.L29
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
.L30:
	call	saveStatistics@PLT
	jmp	.L6
.L29:
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
	jmp	.L30
.L20:
	call	loadCache@PLT
	jmp	.L6
.L19:
	call	backupCache@PLT
	testl	%eax, %eax
	je	.L6
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L18:
	call	displayLRU@PLT
	jmp	.L6
.L16:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	jne	.L31
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L32:
	call	saveStatistics@PLT
	call	clearCache@PLT
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	call	shutdownThreadManager@PLT
	jmp	.L1
.L31:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L32
.L15:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L14:
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
	jmp	.L1
.L36:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE30:
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\n========== USER REGISTRATION =========="
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Enter Username : "
.LC2:
	.string	"%49s"
.LC3:
	.string	"r"
.LC4:
	.string	"%49s %49s"
.LC5:
	.string	"Enter Password : "
.LC6:
	.string	"a"
.LC7:
	.string	"Unable To Open User File"
.LC8:
	.string	"%s %s\n"
.LC9:
	.string	"Registration Successful"
.LC10:
	.string	"Failed to write user to file"
.LC11:
	.string	"Username Already Exists"
	.text
	.globl	registerUser
	.type	registerUser, @function
registerUser:
.LFB29:
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
	subq	$224, %rsp
	.cfi_def_cfa_offset 256
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rsp, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %ebx
	cmpl	$1, %eax
	je	.L16
.L1:
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	movl	%ebx, %eax
	addq	$224, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L3
	leaq	.LC4(%rip), %r12
.L4:
	leaq	112(%rsp), %rdx
	leaq	162(%rsp), %rcx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	jne	.L18
	movq	%rsp, %rsi
	leaq	112(%rsp), %rdi
	call	strcmp@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L4
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L1
.L20:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC6(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L19
	movq	%rsp, %rcx
	leaq	50(%rsp), %r8
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	testl	%eax, %eax
	js	.L9
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
.L10:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L1
.L19:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebx
	jmp	.L1
.L9:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebx
	jmp	.L10
.L18:
	movq	%rbp, %rdi
	call	fclose@PLT
.L3:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	50(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, %ebx
	cmpl	$1, %eax
	je	.L20
	movl	$0, %ebx
	jmp	.L1
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE29:
	.size	registerUser, .-registerUser
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"\n========== USER LOGIN =========="
	.section	.rodata.str1.1
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
.LFB30:
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
	subq	$240, %rsp
	.cfi_def_cfa_offset 272
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	112(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, %ebx
	cmpl	$1, %eax
	je	.L35
.L21:
	movq	232(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	movl	%ebx, %eax
	addq	$240, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	176(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, %ebx
	cmpl	$1, %eax
	je	.L37
	movl	$0, %ebx
	jmp	.L21
.L37:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L32
	leaq	.LC4(%rip), %r12
.L30:
	movq	%rsp, %rdx
	leaq	50(%rsp), %rcx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	jne	.L38
	movq	%rsp, %rsi
	leaq	112(%rsp), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	leaq	50(%rsp), %rsi
	leaq	176(%rsp), %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L21
.L32:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebx
	jmp	.L21
.L38:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$0, %ebx
	jmp	.L21
.L36:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE30:
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
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	%rsp, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L20
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	20(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L1
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	24(%rsp), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L1
	movq	%rsp, %rdi
	call	validateSymbol@PLT
	testb	%al, %al
	je	.L22
	movss	20(%rsp), %xmm0
	call	validatePrice@PLT
	testb	%al, %al
	je	.L23
	movl	24(%rsp), %edi
	call	validateVolume@PLT
	testb	%al, %al
	je	.L24
	call	cacheLock@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L25
	movq	%rsp, %rdi
	call	searchNode@PLT
	leaq	hashTable(%rip), %rdx
	leaq	808(%rdx), %rcx
	testq	%rax, %rax
	je	.L10
	call	cacheUnlock@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L22:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L23:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L24:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L25:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L9:
	addl	$1, %ebx
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L9
.L8:
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	je	.L26
.L10:
	movq	(%rdx), %rax
	testq	%rax, %rax
	jne	.L9
	jmp	.L8
.L26:
	cmpl	$9, %ebx
	jg	.L27
.L11:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movdqa	32(%rsp), %xmm1
	movups	%xmm1, (%rsp)
	movdqu	44(%rsp), %xmm2
	movups	%xmm2, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	jne	.L28
.L12:
	call	cacheUnlock@PLT
	jmp	.L1
.L27:
	call	getLRUTail@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L11
	leaq	32(%rsp), %rbp
	movl	$19, %edx
	movq	%rax, %rsi
	movq	%rbp, %rdi
	call	strncpy@PLT
	movb	$0, 51(%rsp)
	movq	%rbx, %rdi
	call	removeFromLRU@PLT
	movq	%rbp, %rdi
	call	deleteNode@PLT
	call	recordEviction@PLT
	movq	%rbp, %rdx
	leaq	.LC17(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	jmp	.L11
.L28:
	movq	%rsp, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L13
	call	addToFront@PLT
.L13:
	call	recordInsert@PLT
	movq	%rsp, %rdx
	leaq	.LC18(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L12
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE28:
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
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	%rsp, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L35
.L29:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	call	cacheLock@PLT
	movq	%rsp, %rdi
	call	searchNode@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L37
	call	recordHit@PLT
	movq	%rbx, %rdi
	call	moveToFront@PLT
	movq	%rsp, %rdx
	leaq	.LC22(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdx
	leaq	.LC24(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	cvtss2sd	20(%rbx), %xmm0
	leaq	.LC25(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	24(%rbx), %edx
	leaq	.LC26(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	call	cacheUnlock@PLT
	jmp	.L29
.L37:
	call	recordMiss@PLT
	movq	%rsp, %rdx
	leaq	.LC20(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L36:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE29:
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
.LFB30:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	leaq	16(%rsp), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L45
.L38:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L46
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L45:
	.cfi_restore_state
	leaq	.LC27(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	12(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L38
	movss	12(%rsp), %xmm0
	call	validatePrice@PLT
	testb	%al, %al
	je	.L47
	call	cacheLock@PLT
	leaq	16(%rsp), %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L48
	movss	12(%rsp), %xmm0
	movss	%xmm0, 20(%rax)
	call	moveToFront@PLT
	call	recordUpdate@PLT
	leaq	16(%rsp), %rdx
	leaq	.LC28(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
	jmp	.L38
.L47:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L38
.L48:
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L38
.L46:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE30:
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
.LFB31:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movq	%rsp, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L56
.L49:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L57
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L56:
	.cfi_restore_state
	call	cacheLock@PLT
	movq	%rsp, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L58
	call	removeFromLRU@PLT
	movq	%rsp, %rdi
	call	deleteNode@PLT
	testl	%eax, %eax
	jne	.L59
.L52:
	call	cacheUnlock@PLT
	jmp	.L49
.L58:
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L49
.L59:
	call	recordDelete@PLT
	movq	%rsp, %rdx
	leaq	.LC30(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	jmp	.L52
.L57:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE31:
	.size	deleteStock, .-deleteStock
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC32:
	.string	"========================================="
	.section	.rodata.str1.1
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
.LFB32:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	cacheLock@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC32(%rip), %rbx
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC33(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC34(%rip), %r8
	leaq	.LC35(%rip), %rcx
	leaq	.LC36(%rip), %rdx
	leaq	.LC37(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	hashTable(%rip), %r12
	leaq	808(%r12), %r13
	leaq	.LC38(%rip), %rbp
	jmp	.L63
.L61:
	addq	$8, %r12
	cmpq	%r13, %r12
	je	.L67
.L63:
	movq	(%r12), %rbx
	testq	%rbx, %rbx
	je	.L61
.L62:
	movl	24(%rbx), %ecx
	pxor	%xmm0, %xmm0
	cvtss2sd	20(%rbx), %xmm0
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L62
	jmp	.L61
.L67:
	call	cacheUnlock@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
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
.LFE32:
	.size	displayStocks, .-displayStocks
	.globl	clearCache
	.type	clearCache, @function
clearCache:
.LFB33:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	cacheLock@PLT
	call	clearLRU@PLT
	call	clearHashTable@PLT
	call	cacheUnlock@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
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
.LFB27:
	.cfi_startproc
	endbr64
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L4
	movl	$0, %ecx
.L3:
	movl	%ecx, %edx
	sall	$5, %edx
	subl	%ecx, %edx
	movzbl	%al, %eax
	leal	(%rax,%rdx), %ecx
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L3
.L2:
	movl	%ecx, %edx
	imulq	$1148159575, %rdx, %rdx
	shrq	$32, %rdx
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$6, %eax
	imull	$101, %eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	ret
.L4:
	movl	$0, %ecx
	jmp	.L2
	.cfi_endproc
.LFE27:
	.size	hashFunction, .-hashFunction
	.globl	insertNode
	.type	insertNode, @function
insertNode:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	16(%rsp), %rdi
	call	hashFunction
	movl	%eax, %ebx
	call	allocateNode@PLT
	testq	%rax, %rax
	je	.L8
	movdqu	16(%rsp), %xmm0
	movups	%xmm0, (%rax)
	movdqu	28(%rsp), %xmm1
	movups	%xmm1, 12(%rax)
	leaq	hashTable(%rip), %rcx
	movl	%ebx, %edx
	movq	(%rcx,%rdx,8), %rsi
	movq	%rsi, 32(%rax)
	movq	%rax, (%rcx,%rdx,8)
	movl	$1, %eax
.L6:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movl	$0, %eax
	jmp	.L6
	.cfi_endproc
.LFE28:
	.size	insertNode, .-insertNode
	.globl	clearHashTable
	.type	clearHashTable, @function
clearHashTable:
.LFB29:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	leaq	hashTable(%rip), %rbp
	leaq	808(%rbp), %r13
	jmp	.L13
.L11:
	movq	$0, (%r12)
	addq	$8, %rbp
	cmpq	%r13, %rbp
	je	.L17
.L13:
	movq	%rbp, %r12
	movq	0(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L11
.L12:
	movq	%rbx, %rdi
	movq	32(%rbx), %rbx
	call	freeNode@PLT
	testq	%rbx, %rbx
	jne	.L12
	jmp	.L11
.L17:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
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
.LFE29:
	.size	clearHashTable, .-clearHashTable
	.globl	searchNode
	.type	searchNode, @function
searchNode:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	call	hashFunction
	movl	%eax, %eax
	leaq	hashTable(%rip), %rdx
	movq	(%rdx,%rax,8), %rbx
	testq	%rbx, %rbx
	je	.L18
.L20:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L18
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L20
.L18:
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	searchNode, .-searchNode
	.globl	deleteNode
	.type	deleteNode, @function
deleteNode:
.LFB31:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbp
	call	hashFunction
	movl	%eax, %r13d
	movl	%eax, %edx
	leaq	hashTable(%rip), %rax
	movq	(%rax,%rdx,8), %rbx
	testq	%rbx, %rbx
	je	.L29
	movl	$0, %r12d
	jmp	.L28
.L30:
	movq	%rax, %rbx
.L28:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L32
	movq	32(%rbx), %rax
	movq	%rbx, %r12
	testq	%rax, %rax
	jne	.L30
	jmp	.L23
.L32:
	testq	%r12, %r12
	je	.L33
	movq	32(%rbx), %rax
	movq	%rax, 32(%r12)
.L27:
	movq	%rbx, %rdi
	call	freeNode@PLT
	movl	$1, %eax
.L23:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L33:
	.cfi_restore_state
	movq	32(%rbx), %rdx
	movl	%r13d, %r13d
	leaq	hashTable(%rip), %rax
	movq	%rdx, (%rax,%r13,8)
	jmp	.L27
.L29:
	movl	$0, %eax
	jmp	.L23
	.cfi_endproc
.LFE31:
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"%s | [Thread %lu] | [%s] | [%s] | %s"
	.text
	.type	writeLog, @function
writeLog:
.LFB28:
	.cfi_startproc
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
	subq	$568, %rsp
	.cfi_def_cfa_offset 608
	movq	%rdx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 552(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	sete	%al
	testq	%rdx, %rdx
	sete	%dl
	orb	%dl, %al
	jne	.L4
	movq	%rdi, %r12
	movq	%rsi, %rbx
	testq	%rdi, %rdi
	je	.L4
	movq	%rsp, %rdi
	movl	$30, %esi
	call	getCurrentTimestamp@PLT
	testl	%eax, %eax
	jne	.L5
	call	pthread_self@PLT
	leaq	32(%rsp), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 616
	pushq	%r12
	.cfi_def_cfa_offset 624
	pushq	%rbx
	.cfi_def_cfa_offset 632
	pushq	%rax
	.cfi_def_cfa_offset 640
	leaq	32(%rsp), %r9
	leaq	.LC0(%rip), %r8
	movl	$512, %ecx
	movl	$2, %edx
	movl	$512, %esi
	movq	%r13, %rdi
	movl	$0, %eax
	call	__snprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 608
	movq	%r13, %rdi
	call	enqueueLogEntry@PLT
.L1:
	movq	552(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7
	addq	$568, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L1
.L5:
	movl	$-1, %eax
	jmp	.L1
.L7:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE28:
	.size	writeLog, .-writeLog
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"INFO"
	.text
	.globl	logInfo
	.type	logInfo, @function
logInfo:
.LFB29:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rsi
	call	writeLog
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	logInfo, .-logInfo
	.section	.rodata.str1.1
.LC2:
	.string	"ERROR"
	.text
	.globl	logError
	.type	logError, @function
logError:
.LFB30:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rsi
	call	writeLog
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
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
.LFB31:
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
	jne	.L15
	movq	%rdi, %rbx
	movq	%rsi, %r9
	testq	%rdi, %rdi
	je	.L15
	movq	%rsp, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 312
	pushq	%rdx
	.cfi_def_cfa_offset 320
	leaq	.LC3(%rip), %r8
	movl	$256, %ecx
	movl	$2, %edx
	movl	$256, %esi
	movq	%rbp, %rdi
	movl	$0, %eax
	call	__snprintf_chk@PLT
	movq	%rbp, %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	writeLog
	movq	%rbp, %rsp
	.cfi_def_cfa_offset 304
.L12:
	movq	264(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L17
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L12
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE31:
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
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$120, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movabsq	$7216223924729501989, %rax
	movabsq	$2682541350339487008, %rdx
	movq	%rax, 80(%rsp)
	movq	%rdx, 88(%rsp)
	movw	$83, 96(%rsp)
	testq	%rdi, %rdi
	je	.L4
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L4
	movl	$0, %edi
	call	time@PLT
	movq	%rax, 8(%rsp)
	cmpq	$-1, %rax
	je	.L5
	leaq	16(%rsp), %rsi
	leaq	8(%rsp), %rdi
	call	localtime_r@PLT
	testq	%rax, %rax
	je	.L6
	leaq	16(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strftime@PLT
	cmpq	$1, %rax
	sbbl	%eax, %eax
.L1:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L8
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L1
.L5:
	movl	$-1, %eax
	jmp	.L1
.L6:
	movl	$-1, %eax
	jmp	.L1
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE18:
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
.LFB18:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L1
	movq	$0, 40(%rdi)
	movq	lruHead(%rip), %rax
	movq	%rax, 48(%rdi)
	testq	%rax, %rax
	je	.L3
	movq	%rdi, 40(%rax)
.L3:
	movq	%rdi, lruHead(%rip)
	cmpq	$0, lruTail(%rip)
	je	.L4
.L1:
	ret
.L4:
	movq	%rdi, lruTail(%rip)
	ret
	.cfi_endproc
.LFE18:
	.size	addToFront, .-addToFront
	.globl	clearLRU
	.type	clearLRU, @function
clearLRU:
.LFB19:
	.cfi_startproc
	endbr64
	movq	$0, lruHead(%rip)
	movq	$0, lruTail(%rip)
	ret
	.cfi_endproc
.LFE19:
	.size	clearLRU, .-clearLRU
	.globl	removeFromLRU
	.type	removeFromLRU, @function
removeFromLRU:
.LFB20:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L6
	movq	40(%rdi), %rax
	testq	%rax, %rax
	je	.L8
	movq	48(%rdi), %rdx
	movq	%rdx, 48(%rax)
.L9:
	movq	48(%rdi), %rax
	testq	%rax, %rax
	je	.L10
	movq	40(%rdi), %rdx
	movq	%rdx, 40(%rax)
.L11:
	movq	$0, 40(%rdi)
	movq	$0, 48(%rdi)
.L6:
	ret
.L8:
	movq	48(%rdi), %rax
	movq	%rax, lruHead(%rip)
	jmp	.L9
.L10:
	movq	40(%rdi), %rax
	movq	%rax, lruTail(%rip)
	jmp	.L11
	.cfi_endproc
.LFE20:
	.size	removeFromLRU, .-removeFromLRU
	.globl	moveToFront
	.type	moveToFront, @function
moveToFront:
.LFB21:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L16
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	cmpq	%rdi, lruHead(%rip)
	je	.L12
	call	removeFromLRU
	movq	$0, 40(%rbx)
	movq	lruHead(%rip), %rax
	movq	%rax, 48(%rbx)
	testq	%rax, %rax
	je	.L14
	movq	%rbx, 40(%rax)
.L14:
	movq	%rbx, lruHead(%rip)
	cmpq	$0, lruTail(%rip)
	je	.L19
.L12:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movq	%rbx, lruTail(%rip)
	jmp	.L12
.L16:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE21:
	.size	moveToFront, .-moveToFront
	.globl	getLRUTail
	.type	getLRUTail, @function
getLRUTail:
.LFB22:
	.cfi_startproc
	endbr64
	movq	lruTail(%rip), %rax
	ret
	.cfi_endproc
.LFE22:
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
	call	cacheLock@PLT
	movq	lruHead(%rip), %rbx
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	testq	%rbx, %rbx
	je	.L22
	leaq	.LC1(%rip), %rbp
	leaq	.LC2(%rip), %r12
	jmp	.L23
.L26:
	movq	%r12, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movq	48(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L22
.L23:
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	cmpq	$0, 48(%rbx)
	jne	.L26
.L22:
	movl	$10, %edi
	call	putchar@PLT
	call	cacheUnlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
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
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$56, %edi
	call	malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L5
	movq	$0, 32(%rax)
	movq	$0, 40(%rax)
	movq	$0, 48(%rax)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	jmp	.L1
	.cfi_endproc
.LFE28:
	.size	allocateNode, .-allocateNode
	.globl	freeNode
	.type	freeNode, @function
freeNode:
.LFB29:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L9
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	free@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L9:
	ret
	.cfi_endproc
.LFE29:
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
.LFB18:
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
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L10
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L14
	leaq	hashTable(%rip), %r13
	leaq	808(%r13), %r14
	leaq	.LC4(%rip), %r12
	jmp	.L8
.L14:
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L4
.L5:
	addq	$8, %r13
	cmpq	%r14, %r13
	je	.L15
.L8:
	movq	0(%r13), %rbx
	testq	%rbx, %rbx
	je	.L5
.L7:
	pxor	%xmm0, %xmm0
	cvtss2sd	20(%rbx), %xmm0
	movl	24(%rbx), %r8d
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	call	__fprintf_chk@PLT
	testl	%eax, %eax
	js	.L6
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L7
	jmp	.L5
.L15:
	movq	%rbp, %rdi
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
	movq	%rbp, %rdi
	call	fclose@PLT
.L4:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$-1, %ebx
.L9:
	call	cacheUnlock@PLT
.L1:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
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
.L10:
	.cfi_restore_state
	movl	$-1, %ebx
	jmp	.L1
	.cfi_endproc
.LFE18:
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
.LFB19:
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
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L24
	movl	%eax, %r12d
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L28
	call	clearHashTable@PLT
	call	clearLRU@PLT
	leaq	.LC10(%rip), %rbp
.L20:
	movq	%rsp, %rdx
	leaq	20(%rsp), %rcx
	leaq	24(%rsp), %r8
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	cmpl	$3, %eax
	jne	.L29
	subq	$32, %rsp
	.cfi_def_cfa_offset 112
	movdqa	32(%rsp), %xmm0
	movups	%xmm0, (%rsp)
	movdqu	44(%rsp), %xmm1
	movups	%xmm1, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 80
	testl	%eax, %eax
	je	.L20
	movq	%rsp, %rdi
	call	searchNode@PLT
	testq	%rax, %rax
	je	.L20
	movq	%rax, %rdi
	call	addToFront@PLT
	addl	$1, %r12d
	jmp	.L20
.L28:
	leaq	.LC9(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	call	cacheUnlock@PLT
	movl	$-1, %r12d
	jmp	.L16
.L29:
	movq	%rbx, %rdi
	call	fclose@PLT
	leaq	.LC11(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	call	cacheUnlock@PLT
.L16:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L30
	movl	%r12d, %eax
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movl	$-1, %r12d
	jmp	.L16
.L30:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE19:
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
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L40
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L44
	leaq	.LC0(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L45
.L34:
	movq	%rbx, %rdi
	call	fgetc@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L46
	movq	%rbp, %rsi
	call	fputc@PLT
	cmpl	$-1, %eax
	jne	.L34
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L36:
	call	cacheUnlock@PLT
	movl	$-1, %ebx
	jmp	.L31
.L44:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
	movl	$-1, %ebx
	jmp	.L31
.L45:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L35
.L46:
	movq	%rbp, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	jne	.L47
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L48
	leaq	.LC16(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
.L31:
	movl	%ebx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L47:
	.cfi_restore_state
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
.L35:
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L36
.L48:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L36
.L40:
	movl	$-1, %ebx
	jmp	.L31
	.cfi_endproc
.LFE20:
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
.LFB40:
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
	leaq	persistenceMutex(%rip), %rbx
	leaq	persistenceCond(%rip), %rbp
	leaq	persistenceDoneCond(%rip), %r12
	jmp	.L5
.L3:
	movl	$0, saveRequested(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	call	saveCache@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, saveCompleted(%rip)
	movq	%r12, %rdi
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
.L5:
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	cmpl	$0, saveRequested(%rip)
	jne	.L3
.L2:
	cmpl	$0, persistenceShutdownRequested(%rip)
	jne	.L10
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	pthread_cond_wait@PLT
	cmpl	$0, saveRequested(%rip)
	je	.L2
	jmp	.L3
.L10:
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
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
.LFB39:
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
	subq	$272, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	leaq	logMutex(%rip), %rbp
	leaq	logCond(%rip), %r12
	leaq	logQueue(%rip), %r14
	jmp	.L12
.L24:
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	movq	264(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
	movl	$0, %eax
	addq	$272, %rsp
	.cfi_remember_state
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
.L14:
	.cfi_restore_state
	testl	%ebx, %ebx
	jle	.L16
	movl	logQueueHead(%rip), %r13d
	movslq	%r13d, %rsi
	salq	$8, %rsi
	addq	%r14, %rsi
	movq	%rsp, %rdi
	movl	$255, %edx
	call	strncpy@PLT
	movb	$0, 255(%rsp)
	addl	$1, %r13d
	movl	%r13d, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %r13d
	andl	$63, %r13d
	subl	%eax, %r13d
	movl	%r13d, logQueueHead(%rip)
	subl	$1, %ebx
	movl	%ebx, logQueueCount(%rip)
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L12
	movq	%rsp, %rcx
	leaq	.LC2(%rip), %rdx
	movl	$2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
.L12:
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movl	logQueueCount(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L14
.L13:
	cmpl	$0, logShutdownRequested(%rip)
	jne	.L24
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	pthread_cond_wait@PLT
	movl	logQueueCount(%rip), %ebx
	testl	%ebx, %ebx
	je	.L13
	jmp	.L14
.L16:
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L12
.L23:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	logThreadMain, .-logThreadMain
	.globl	initializeThreadManager
	.type	initializeThreadManager, @function
initializeThreadManager:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$16384, %edx
	movl	$0, %esi
	leaq	logQueue(%rip), %rdi
	call	memset@PLT
	movl	$0, logQueueHead(%rip)
	movl	$0, logQueueTail(%rip)
	movl	$0, logQueueCount(%rip)
	movl	$0, logShutdownRequested(%rip)
	movl	$0, persistenceShutdownRequested(%rip)
	movl	$0, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	movl	$0, %esi
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L32
	movl	$0, %esi
	leaq	logCond(%rip), %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L34
	movl	$0, %esi
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L35
	movl	$0, %esi
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L36
	movl	$0, %esi
	leaq	persistenceDoneCond(%rip), %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L37
	movl	$0, %ecx
	leaq	logThreadMain(%rip), %rdx
	movl	$0, %esi
	leaq	logThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L38
	movl	$0, %ecx
	leaq	persistenceThreadMain(%rip), %rdx
	movl	$0, %esi
	leaq	persistenceThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L39
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L34:
	.cfi_restore_state
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L35:
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L36:
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L37:
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L38:
	leaq	persistenceDoneCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	logCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L39:
	leaq	logMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, logShutdownRequested(%rip)
	leaq	logCond(%rip), %rbp
	movq	%rbp, %rdi
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, %esi
	movq	logThread(%rip), %rdi
	call	pthread_join@PLT
	leaq	persistenceDoneCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_destroy@PLT
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movq	%rbp, %rdi
	call	pthread_cond_destroy@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_destroy@PLT
	movl	$-1, %eax
	jmp	.L25
.L32:
	movl	$-1, %eax
	jmp	.L25
	.cfi_endproc
.LFE41:
	.size	initializeThreadManager, .-initializeThreadManager
	.globl	shutdownThreadManager
	.type	shutdownThreadManager, @function
shutdownThreadManager:
.LFB42:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	leaq	logMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, logShutdownRequested(%rip)
	leaq	logCond(%rip), %r12
	movq	%r12, %rdi
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	leaq	persistenceMutex(%rip), %rbp
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, persistenceShutdownRequested(%rip)
	leaq	persistenceCond(%rip), %r13
	movq	%r13, %rdi
	call	pthread_cond_signal@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0, %esi
	movq	logThread(%rip), %rdi
	call	pthread_join@PLT
	movl	$0, %esi
	movq	persistenceThread(%rip), %rdi
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
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
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
.LFE42:
	.size	shutdownThreadManager, .-shutdownThreadManager
	.globl	enqueueLogEntry
	.type	enqueueLogEntry, @function
enqueueLogEntry:
.LFB43:
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
	je	.L45
	movq	%rdi, %r14
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L46
	movl	logQueueCount(%rip), %r12d
	cmpl	$63, %r12d
	jg	.L47
	movl	logQueueTail(%rip), %ebx
	movslq	%ebx, %rax
	salq	$8, %rax
	movl	$16384, %ecx
	cmpq	%rcx, %rax
	cmovnb	%rax, %rcx
	subq	%rax, %rcx
	leaq	logQueue(%rip), %rdx
	leaq	(%rax,%rdx), %r13
	movl	$255, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	__strncpy_chk@PLT
	movb	$0, 255(%r13)
	addl	$1, %ebx
	movl	%ebx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %ebx
	andl	$63, %ebx
	subl	%eax, %ebx
	movl	%ebx, logQueueTail(%rip)
	addl	$1, %r12d
	movl	%r12d, logQueueCount(%rip)
	leaq	logCond(%rip), %rdi
	call	pthread_cond_signal@PLT
.L44:
	leaq	logMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L42:
	movl	%ebp, %eax
	popq	%rbx
	.cfi_remember_state
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
.L47:
	.cfi_restore_state
	movl	$-1, %ebp
	jmp	.L44
.L45:
	movl	$-1, %ebp
	jmp	.L42
.L46:
	movl	$-1, %ebp
	jmp	.L42
	.cfi_endproc
.LFE43:
	.size	enqueueLogEntry, .-enqueueLogEntry
	.globl	signalCacheSave
	.type	signalCacheSave, @function
signalCacheSave:
.LFB44:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L51
	movl	%eax, %ebx
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_signal@PLT
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L49:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L51:
	.cfi_restore_state
	movl	$-1, %ebx
	jmp	.L49
	.cfi_endproc
.LFE44:
	.size	signalCacheSave, .-signalCacheSave
	.globl	requestCacheSaveAndWait
	.type	requestCacheSaveAndWait, @function
requestCacheSaveAndWait:
.LFB45:
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
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L59
	cmpl	$0, persistenceShutdownRequested(%rip)
	jne	.L63
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	leaq	persistenceCond(%rip), %rdi
	call	pthread_cond_signal@PLT
	movl	saveCompleted(%rip), %r12d
	leaq	persistenceMutex(%rip), %rbp
	leaq	persistenceDoneCond(%rip), %rbx
	testl	%r12d, %r12d
	jne	.L57
.L56:
	cmpl	$0, persistenceShutdownRequested(%rip)
	jne	.L57
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	pthread_cond_wait@PLT
	movl	saveCompleted(%rip), %eax
	testl	%eax, %eax
	je	.L56
	movl	%eax, %r12d
.L57:
	cmpl	$1, %r12d
	sbbl	%ebx, %ebx
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L53:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L63:
	.cfi_restore_state
	leaq	persistenceMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	movl	$-1, %ebx
	jmp	.L53
.L59:
	movl	$-1, %ebx
	jmp	.L53
	.cfi_endproc
.LFE45:
	.size	requestCacheSaveAndWait, .-requestCacheSaveAndWait
	.globl	cacheLock
	.type	cacheLock, @function
cacheLock:
.LFB46:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE46:
	.size	cacheLock, .-cacheLock
	.globl	cacheUnlock
	.type	cacheUnlock, @function
cacheUnlock:
.LFB47:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE47:
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
.LFB11:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L4
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	movzbl	(%rdi), %ebx
	movl	$0, %eax
	testb	%bl, %bl
	je	.L1
	call	strlen@PLT
	movq	%rax, %rdx
	movl	$0, %eax
	cmpq	$19, %rdx
	ja	.L1
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	leaq	1(%rbp), %rdi
.L3:
	movzbl	%bl, %ebx
	testb	$8, (%rax,%rbx,2)
	je	.L7
	addq	$1, %rdi
	movzbl	-1(%rdi), %ebx
	testb	%bl, %bl
	jne	.L3
	movl	$1, %eax
	jmp	.L1
.L4:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$0, %eax
	ret
.L7:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movl	$0, %eax
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	validateSymbol, .-validateSymbol
	.globl	validatePrice
	.type	validatePrice, @function
validatePrice:
.LFB12:
	.cfi_startproc
	endbr64
	movaps	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE12:
	.size	validatePrice, .-validatePrice
	.globl	validateVolume
	.type	validateVolume, @function
validateVolume:
.LFB13:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	notl	%eax
	shrl	$31, %eax
	ret
	.cfi_endproc
.LFE13:
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
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movl	$0, stats(%rip)
	movl	$0, 4+stats(%rip)
	movl	$0, 8+stats(%rip)
	movl	$0, 12+stats(%rip)
	movl	$0, 16+stats(%rip)
	movl	$0, 20+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE19:
	.size	initializeStatistics, .-initializeStatistics
	.globl	recordHit
	.type	recordHit, @function
recordHit:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE20:
	.size	recordHit, .-recordHit
	.globl	recordMiss
	.type	recordMiss, @function
recordMiss:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, 4+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	recordMiss, .-recordMiss
	.globl	recordInsert
	.type	recordInsert, @function
recordInsert:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, 8+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	recordInsert, .-recordInsert
	.globl	recordUpdate
	.type	recordUpdate, @function
recordUpdate:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, 12+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	recordUpdate, .-recordUpdate
	.globl	recordDelete
	.type	recordDelete, @function
recordDelete:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, 16+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	recordDelete, .-recordDelete
	.globl	recordEviction
	.type	recordEviction, @function
recordEviction:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	addl	$1, 20+stats(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	recordEviction, .-recordEviction
	.globl	getHitRatio
	.type	getHitRatio, @function
getHitRatio:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	stats(%rip), %edx
	movl	4+stats(%rip), %eax
	movl	%edx, %ecx
	addq	%rcx, %rax
	je	.L23
	movl	%edx, %edx
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rdx, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rax, %xmm0
	divss	%xmm0, %xmm1
	mulss	.LC1(%rip), %xmm1
	movd	%xmm1, %ebx
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L15:
	movd	%ebx, %xmm0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	movl	$0x00000000, %ebx
	jmp	.L15
	.cfi_endproc
.LFE26:
	.size	getHitRatio, .-getHitRatio
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"====================================="
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	.LC2(%rip), %rbx
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movl	stats(%rip), %edx
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	4+stats(%rip), %edx
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	8+stats(%rip), %edx
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	12+stats(%rip), %edx
	leaq	.LC7(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	16+stats(%rip), %edx
	leaq	.LC8(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	20+stats(%rip), %edx
	leaq	.LC9(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	stats(%rip), %edx
	movl	4+stats(%rip), %eax
	movl	%edx, %ecx
	pxor	%xmm0, %xmm0
	addq	%rcx, %rax
	je	.L25
	movl	%edx, %edx
	pxor	%xmm0, %xmm0
	cvtsi2ssq	%rdx, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
.L25:
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
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
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC11(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L36
	movq	%rax, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	20+stats(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 32
	movl	16+stats(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 40
	movl	12+stats(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	8+stats(%rip), %r9d
	movl	4+stats(%rip), %r8d
	movl	stats(%rip), %ecx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	movq	%rbx, %rdi
	call	fclose@PLT
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L32:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L36:
	.cfi_restore_state
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L32
	.cfi_endproc
.LFE28:
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
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC14(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L42
	movq	%rax, %rbx
	leaq	20+stats(%rip), %rax
	pushq	%rax
	.cfi_def_cfa_offset 24
	leaq	-4(%rax), %rax
	pushq	%rax
	.cfi_def_cfa_offset 32
	leaq	-4(%rax), %r9
	leaq	-8(%rax), %r8
	leaq	-12(%rax), %rcx
	leaq	-16(%rax), %rdx
	leaq	.LC15(%rip), %rsi
	movq	%rbx, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$6, %eax
	je	.L40
	movl	$0, stats(%rip)
	movl	$0, 4+stats(%rip)
	movl	$0, 8+stats(%rip)
	movl	$0, 12+stats(%rip)
	movl	$0, 16+stats(%rip)
	movl	$0, 20+stats(%rip)
.L40:
	movq	%rbx, %rdi
	call	fclose@PLT
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
.L37:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L42:
	.cfi_restore_state
	leaq	statsMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	call	initializeStatistics
	jmp	.L37
	.cfi_endproc
.LFE29:
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
