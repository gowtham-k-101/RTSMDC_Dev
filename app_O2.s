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
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB30:
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
	jne	.L40
	movl	%eax, %r13d
	leaq	.LC1(%rip), %rbx
	leaq	.LC2(%rip), %r15
	call	loadStatistics@PLT
	leaq	.LC3(%rip), %r14
	leaq	4(%rsp), %rbp
	call	loadCache@PLT
	leaq	.LC5(%rip), %r12
.L4:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r15, %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r14, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movq	%r12, %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
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
.L7:
	call	loginUser@PLT
	testl	%eax, %eax
	je	.L4
.L11:
	leaq	.LC12(%rip), %r14
	leaq	.LC13(%rip), %r15
	leaq	.L18(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movq	%r14, %rdi
	call	puts@PLT
	movq	%r15, %rdi
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
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	leaq	.LC7(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L15
	cmpl	$11, 4(%rsp)
	ja	.L16
	movl	4(%rsp), %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L16-.L18
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
.L9:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L4
.L8:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	je	.L41
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
.L13:
	call	saveStatistics@PLT
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
.L1:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L42
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %eax
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
.L41:
	.cfi_restore_state
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L40:
	leaq	.LC0(%rip), %rdi
	movl	$1, %r13d
	call	puts@PLT
	jmp	.L1
.L17:
	call	requestCacheSaveAndWait@PLT
	testl	%eax, %eax
	je	.L43
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
.L33:
	call	saveStatistics@PLT
	call	clearCache@PLT
	leaq	.LC26(%rip), %rdi
	call	puts@PLT
	call	shutdownThreadManager@PLT
	jmp	.L1
.L19:
	call	displayLRU@PLT
	jmp	.L6
.L20:
	call	backupCache@PLT
	testl	%eax, %eax
	je	.L6
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L21:
	call	loadCache@PLT
	jmp	.L6
.L22:
	call	signalCacheSave@PLT
	testl	%eax, %eax
	je	.L44
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
.L31:
	call	saveStatistics@PLT
	jmp	.L6
.L23:
	call	displayStatistics@PLT
	jmp	.L6
.L24:
	call	displayStocks@PLT
	jmp	.L6
.L25:
	call	deleteStock@PLT
	jmp	.L6
.L26:
	call	updateStock@PLT
	jmp	.L6
.L27:
	call	searchStock@PLT
	jmp	.L6
.L28:
	call	addStock@PLT
	jmp	.L6
.L16:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L44:
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	jmp	.L31
.L43:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L33
.L15:
	call	clearCache@PLT
	call	shutdownThreadManager@PLT
	jmp	.L1
.L42:
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
	.p2align 4
	.globl	registerUser
	.type	registerUser, @function
registerUser:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	leaq	.LC2(%rip), %r15
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L21
.L3:
	xorl	%ebx, %ebx
.L1:
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L22
	addq	$232, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L4
	leaq	112(%rsp), %rbx
	leaq	162(%rsp), %r14
	leaq	.LC4(%rip), %r13
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L6
.L5:
	xorl	%eax, %eax
	movq	%r14, %rcx
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	je	.L7
	movq	%r12, %rdi
	call	fclose@PLT
.L4:
	leaq	userMutex(%rip), %rdi
	leaq	50(%rsp), %r12
	call	pthread_mutex_unlock@PLT
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%r12, %rsi
	movq	%r15, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, %ebx
	cmpl	$1, %eax
	jne	.L3
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC6(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L23
	movq	%rax, %rdi
	movq	%r12, %r8
	xorl	%eax, %eax
	movq	%rbp, %rcx
	leaq	.LC8(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	testl	%eax, %eax
	js	.L12
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
.L13:
	movq	%r13, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L12:
	leaq	.LC10(%rip), %rdi
	xorl	%ebx, %ebx
	call	puts@PLT
	jmp	.L13
.L22:
	call	__stack_chk_fail@PLT
.L23:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L3
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
	.string	"Invalid Username Or Password"
.LC15:
	.string	"Login Successful"
	.text
	.p2align 4
	.globl	loginUser
	.type	loginUser, @function
loginUser:
.LFB30:
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
	leaq	.LC2(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 248(%rsp)
	xorl	%eax, %eax
	leaq	128(%rsp), %rbx
	call	puts@PLT
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L38
.L26:
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L24:
	movq	248(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L39
	addq	$264, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
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
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	192(%rsp), %rax
	movq	%rbp, %rdi
	movq	%rax, 8(%rsp)
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	%eax, %r12d
	cmpl	$1, %eax
	jne	.L26
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_lock@PLT
	leaq	.LC3(%rip), %rsi
	leaq	USER_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L36
	leaq	16(%rsp), %rbp
	leaq	66(%rsp), %r13
	leaq	.LC4(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L35:
	xorl	%eax, %eax
	movq	%r13, %rcx
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$2, %eax
	jne	.L40
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L35
	movq	8(%rsp), %rdi
	movq	%r13, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L35
	movq	%r14, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L40:
	movq	%r14, %rdi
	call	fclose@PLT
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L26
.L39:
	call	__stack_chk_fail@PLT
.L36:
	leaq	userMutex(%rip), %rdi
	call	pthread_mutex_unlock@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L26
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
	.p2align 4
	.globl	addStock
	.type	addStock, @function
addStock:
.LFB28:
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
	movq	%rsp, %rbp
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbp, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L37
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L38
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	20(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L1
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	24(%rsp), %rsi
	leaq	.LC5(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L1
	movq	%rbp, %rdi
	call	validateSymbol@PLT
	testb	%al, %al
	je	.L39
	movss	20(%rsp), %xmm0
	call	validatePrice@PLT
	testb	%al, %al
	je	.L40
	movl	24(%rsp), %edi
	call	validateVolume@PLT
	testb	%al, %al
	je	.L41
	call	cacheLock@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L42
	movq	%rbp, %rdi
	call	searchNode@PLT
	leaq	hashTable(%rip), %rdx
	leaq	808(%rdx), %rcx
	testq	%rax, %rax
	jne	.L43
	.p2align 4,,10
	.p2align 3
.L11:
	movq	(%rdx), %rax
	testq	%rax, %rax
	je	.L9
	.p2align 4,,10
	.p2align 3
.L10:
	movq	32(%rax), %rax
	addl	$1, %ebx
	testq	%rax, %rax
	jne	.L10
.L9:
	addq	$8, %rdx
	cmpq	%rcx, %rdx
	jne	.L11
	cmpl	$9, %ebx
	jg	.L44
.L13:
	subq	$32, %rsp
	.cfi_def_cfa_offset 128
	movdqa	32(%rsp), %xmm1
	movdqu	44(%rsp), %xmm2
	movups	%xmm1, (%rsp)
	movups	%xmm2, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	testl	%eax, %eax
	jne	.L45
.L15:
	call	cacheUnlock@PLT
	jmp	.L1
.L39:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L40:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L41:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L42:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	leaq	.LC14(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L43:
	call	cacheUnlock@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	leaq	.LC16(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logError@PLT
	jmp	.L1
.L45:
	movq	%rbp, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L16
	call	addToFront@PLT
.L16:
	call	recordInsert@PLT
	movq	%rbp, %rdx
	leaq	.LC18(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L15
.L44:
	call	getLRUTail@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L13
	leaq	32(%rsp), %r12
	movl	$19, %edx
	movq	%rax, %rsi
	movq	%r12, %rdi
	call	strncpy@PLT
	movq	%rbx, %rdi
	movb	$0, 51(%rsp)
	call	removeFromLRU@PLT
	movq	%r12, %rdi
	call	deleteNode@PLT
	call	recordEviction@PLT
	movq	%r12, %rdx
	leaq	.LC17(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	jmp	.L13
.L38:
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
	.p2align 4
	.globl	searchStock
	.type	searchStock, @function
searchStock:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L52
.L46:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L53
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	call	cacheLock@PLT
	movq	%rbx, %rdi
	call	searchNode@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L54
	call	recordHit@PLT
	movq	%rbp, %rdi
	call	moveToFront@PLT
	movq	%rbx, %rdx
	leaq	.LC22(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC23(%rip), %rdi
	call	puts@PLT
	movq	%rbp, %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC24(%rip), %rsi
	call	__printf_chk@PLT
	leaq	.LC25(%rip), %rsi
	movl	$2, %edi
	pxor	%xmm0, %xmm0
	movl	$1, %eax
	cvtss2sd	20(%rbp), %xmm0
	call	__printf_chk@PLT
	movl	24(%rbp), %edx
	movl	$2, %edi
	xorl	%eax, %eax
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	call	cacheUnlock@PLT
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L54:
	call	recordMiss@PLT
	movq	%rbx, %rdx
	leaq	.LC20(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L46
.L53:
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
	.p2align 4
	.globl	updateStock
	.type	updateStock, @function
updateStock:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L63
.L55:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L64
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
	leaq	.LC27(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	leaq	.LC3(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L55
	movss	12(%rsp), %xmm0
	call	validatePrice@PLT
	testb	%al, %al
	je	.L65
	call	cacheLock@PLT
	movq	%rbx, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L66
	movss	12(%rsp), %xmm0
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
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L65:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L66:
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L55
.L64:
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
	.p2align 4
	.globl	deleteStock
	.type	deleteStock, @function
deleteStock:
.LFB31:
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
	movq	%rsp, %rbx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.L77
.L67:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L78
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	.cfi_restore_state
	call	cacheLock@PLT
	movq	%rbx, %rdi
	call	searchNode@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L79
	call	removeFromLRU@PLT
	movq	%rbx, %rdi
	call	deleteNode@PLT
	testl	%eax, %eax
	jne	.L80
.L70:
	call	cacheUnlock@PLT
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L80:
	call	recordDelete@PLT
	movq	%rbx, %rdx
	leaq	.LC30(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	logStockOperation@PLT
	leaq	.LC31(%rip), %rdi
	call	puts@PLT
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L79:
	call	cacheUnlock@PLT
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	jmp	.L67
.L78:
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
	.p2align 4
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
	leaq	hashTable(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	808(%r12), %r13
	leaq	.LC38(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC32(%rip), %rbx
	subq	$8, %rsp
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
	.p2align 4,,10
	.p2align 3
.L84:
	movq	(%r12), %rbx
	testq	%rbx, %rbx
	je	.L82
	.p2align 4,,10
	.p2align 3
.L83:
	movl	24(%rbx), %ecx
	movq	%rbx, %rdx
	pxor	%xmm0, %xmm0
	movq	%rbp, %rsi
	movl	$2, %edi
	movl	$1, %eax
	cvtss2sd	20(%rbx), %xmm0
	call	__printf_chk@PLT
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L83
.L82:
	addq	$8, %r12
	cmpq	%r13, %r12
	jne	.L84
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
	jmp	cacheUnlock@PLT
	.cfi_endproc
.LFE32:
	.size	displayStocks, .-displayStocks
	.p2align 4
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
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	cacheUnlock@PLT
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
	.p2align 4
	.globl	hashFunction
	.type	hashFunction, @function
hashFunction:
.LFB27:
	.cfi_startproc
	endbr64
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L4
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%ecx, %edx
	addq	$1, %rdi
	sall	$5, %edx
	subl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L3
	movl	%ecx, %edx
	movl	%ecx, %eax
	imulq	$1148159575, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$6, %eax
	imull	$101, %eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	hashFunction, .-hashFunction
	.p2align 4
	.globl	insertNode
	.type	insertNode, @function
insertNode:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movzbl	16(%rsp), %eax
	testb	%al, %al
	je	.L11
	leaq	16(%rsp), %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%ecx, %edx
	addq	$1, %rsi
	sall	$5, %edx
	subl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	movzbl	(%rsi), %eax
	testb	%al, %al
	jne	.L9
	movl	%ecx, %eax
	movl	%ecx, %ebx
	imulq	$1148159575, %rax, %rax
	shrq	$32, %rax
	subl	%eax, %ebx
	shrl	%ebx
	addl	%eax, %ebx
	shrl	$6, %ebx
	imull	$101, %ebx, %eax
	movl	%ecx, %ebx
	subl	%eax, %ebx
.L8:
	call	allocateNode@PLT
	testq	%rax, %rax
	je	.L12
	leaq	hashTable(%rip), %rdx
	movdqu	16(%rsp), %xmm0
	movdqu	28(%rsp), %xmm1
	movq	(%rdx,%rbx,8), %rcx
	movups	%xmm0, (%rax)
	movq	%rcx, 32(%rax)
	movups	%xmm1, 12(%rax)
	movq	%rax, (%rdx,%rbx,8)
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L8
	.cfi_endproc
.LFE28:
	.size	insertNode, .-insertNode
	.p2align 4
	.globl	clearHashTable
	.type	clearHashTable, @function
clearHashTable:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	hashTable(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	808(%rbp), %r12
	.p2align 4,,10
	.p2align 3
.L18:
	movq	0(%rbp), %rbx
	testq	%rbx, %rbx
	je	.L16
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbx, %rdi
	movq	32(%rbx), %rbx
	call	freeNode@PLT
	testq	%rbx, %rbx
	jne	.L17
.L16:
	movq	$0, 0(%rbp)
	addq	$8, %rbp
	cmpq	%r12, %rbp
	jne	.L18
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	clearHashTable, .-clearHashTable
	.p2align 4
	.globl	searchNode
	.type	searchNode, @function
searchNode:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L30
	movq	%rdi, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L27:
	movl	%ecx, %edx
	addq	$1, %rsi
	sall	$5, %edx
	subl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	movzbl	(%rsi), %eax
	testb	%al, %al
	jne	.L27
	movl	%ecx, %edx
	movl	%ecx, %eax
	imulq	$1148159575, %rdx, %rdx
	shrq	$32, %rdx
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$6, %eax
	imull	$101, %eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
.L26:
	leaq	hashTable(%rip), %rdx
	movq	(%rdx,%rax,8), %rbx
	testq	%rbx, %rbx
	jne	.L29
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L40:
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L25
.L29:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L40
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L26
	.cfi_endproc
.LFE30:
	.size	searchNode, .-searchNode
	.p2align 4
	.globl	deleteNode
	.type	deleteNode, @function
deleteNode:
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
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L49
	movq	%rdi, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L43:
	movl	%ecx, %edx
	addq	$1, %rsi
	sall	$5, %edx
	subl	%ecx, %edx
	leal	(%rax,%rdx), %ecx
	movzbl	(%rsi), %eax
	testb	%al, %al
	jne	.L43
	movl	%ecx, %eax
	movl	%ecx, %r12d
	imulq	$1148159575, %rax, %rax
	shrq	$32, %rax
	subl	%eax, %r12d
	shrl	%r12d
	addl	%eax, %r12d
	shrl	$6, %r12d
	imull	$101, %r12d, %eax
	subl	%eax, %ecx
	movl	%ecx, %r12d
.L42:
	leaq	hashTable(%rip), %r14
	movq	(%r14,%r12,8), %rbx
	testq	%rbx, %rbx
	je	.L50
	xorl	%r13d, %r13d
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%rbx, %r13
	testq	%rax, %rax
	je	.L41
	movq	%rax, %rbx
.L48:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	%eax, %edx
	movq	32(%rbx), %rax
	testl	%edx, %edx
	jne	.L45
	testq	%r13, %r13
	je	.L54
	movq	%rax, 32(%r13)
.L47:
	movq	%rbx, %rdi
	call	freeNode@PLT
	movl	$1, %eax
.L41:
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
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	movq	%rax, (%r14,%r12,8)
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L49:
	xorl	%r12d, %r12d
	jmp	.L42
.L50:
	xorl	%eax, %eax
	jmp	.L41
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
	.p2align 4
	.type	writeLog, @function
writeLog:
.LFB28:
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
	je	.L5
	movq	%rsp, %r12
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movl	$30, %esi
	movq	%r12, %rdi
	call	getCurrentTimestamp@PLT
	testl	%eax, %eax
	jne	.L5
	call	pthread_self@PLT
	leaq	32(%rsp), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 616
	movq	%r12, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 624
	movq	%r13, %rdi
	leaq	.LC0(%rip), %r8
	movl	$512, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 632
	movl	$2, %edx
	movl	$512, %esi
	pushq	%rax
	.cfi_def_cfa_offset 640
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%r12, %rsp
	.cfi_def_cfa_offset 608
	movq	%r13, %rdi
	call	enqueueLogEntry@PLT
.L1:
	movq	552(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L9
	addq	$560, %rsp
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
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L1
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE28:
	.size	writeLog, .-writeLog
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"INFO"
	.text
	.p2align 4
	.globl	logInfo
	.type	logInfo, @function
logInfo:
.LFB29:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	leaq	.LC1(%rip), %rsi
	jmp	writeLog
	.cfi_endproc
.LFE29:
	.size	logInfo, .-logInfo
	.section	.rodata.str1.1
.LC2:
	.string	"ERROR"
	.text
	.p2align 4
	.globl	logError
	.type	logError, @function
logError:
.LFB30:
	.cfi_startproc
	endbr64
	movq	%rsi, %rdx
	leaq	.LC2(%rip), %rsi
	jmp	writeLog
	.cfi_endproc
.LFE30:
	.size	logError, .-logError
	.section	.rodata.str1.1
.LC3:
	.string	"%s | %s"
.LC4:
	.string	"OPERATION"
	.text
	.p2align 4
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
	testq	%rdi, %rdi
	je	.L15
	movq	%rsp, %rbp
	subq	$8, %rsp
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
	.p2align 4,,10
	.p2align 3
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
	.p2align 4
	.globl	getCurrentTimestamp
	.type	getCurrentTimestamp, @function
getCurrentTimestamp:
.LFB18:
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
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	movdqa	.LC0(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	$83, %eax
	movw	%ax, 96(%rsp)
	movaps	%xmm0, 80(%rsp)
	testq	%rdi, %rdi
	je	.L5
	movq	%rsi, %rbp
	testq	%rsi, %rsi
	je	.L5
	movq	%rdi, %rbx
	xorl	%edi, %edi
	call	time@PLT
	movq	%rax, 8(%rsp)
	cmpq	$-1, %rax
	je	.L5
	leaq	16(%rsp), %r12
	leaq	8(%rsp), %rdi
	movq	%r12, %rsi
	call	localtime_r@PLT
	testq	%rax, %rax
	je	.L5
	leaq	80(%rsp), %rdx
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	strftime@PLT
	cmpq	$1, %rax
	sbbl	%eax, %eax
.L1:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L15
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L1
.L15:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE18:
	.size	getCurrentTimestamp, .-getCurrentTimestamp
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	7216223924729501989
	.quad	2682541350339487008
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
	.p2align 4
	.globl	addToFront
	.type	addToFront, @function
addToFront:
.LFB18:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L1
	movq	lruHead(%rip), %rax
	movq	$0, 40(%rdi)
	movq	%rax, 48(%rdi)
	testq	%rax, %rax
	je	.L4
	movq	%rdi, 40(%rax)
.L4:
	cmpq	$0, lruTail(%rip)
	movq	%rdi, lruHead(%rip)
	je	.L10
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rdi, lruTail(%rip)
	ret
	.cfi_endproc
.LFE18:
	.size	addToFront, .-addToFront
	.p2align 4
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
	.p2align 4
	.globl	removeFromLRU
	.type	removeFromLRU, @function
removeFromLRU:
.LFB20:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L12
	movq	40(%rdi), %rax
	movq	48(%rdi), %rdx
	testq	%rax, %rax
	je	.L14
	movq	%rdx, 48(%rax)
	testq	%rdx, %rdx
	je	.L16
.L21:
	movq	%rax, 40(%rdx)
.L17:
	pxor	%xmm0, %xmm0
	movups	%xmm0, 40(%rdi)
.L12:
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rdx, lruHead(%rip)
	testq	%rdx, %rdx
	jne	.L21
.L16:
	movq	%rax, lruTail(%rip)
	jmp	.L17
	.cfi_endproc
.LFE20:
	.size	removeFromLRU, .-removeFromLRU
	.p2align 4
	.globl	moveToFront
	.type	moveToFront, @function
moveToFront:
.LFB21:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L22
	movq	lruHead(%rip), %rax
	cmpq	%rdi, %rax
	je	.L22
	movq	40(%rdi), %rdx
	movq	48(%rdi), %rcx
	testq	%rdx, %rdx
	je	.L26
	movq	%rcx, 48(%rdx)
	testq	%rcx, %rcx
	je	.L28
.L35:
	movq	%rdx, 40(%rcx)
	movq	lruTail(%rip), %rdx
.L29:
	movq	$0, 40(%rdi)
	movq	%rax, 48(%rdi)
	testq	%rax, %rax
	je	.L30
	movq	%rdi, 40(%rax)
.L30:
	movq	%rdi, lruHead(%rip)
	testq	%rdx, %rdx
	je	.L34
.L22:
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	movq	%rdi, lruTail(%rip)
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rcx, %rax
	testq	%rcx, %rcx
	jne	.L35
.L28:
	movq	%rdx, lruTail(%rip)
	jmp	.L29
	.cfi_endproc
.LFE21:
	.size	moveToFront, .-moveToFront
	.p2align 4
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
	.p2align 4
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
	je	.L38
	leaq	.LC1(%rip), %rbp
	leaq	.LC2(%rip), %r12
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	48(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L38
.L39:
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	cmpq	$0, 48(%rbx)
	jne	.L45
.L38:
	movl	$10, %edi
	call	putchar@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	cacheUnlock@PLT
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
	.p2align 4
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
	je	.L6
	movq	$0, 48(%rax)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 32(%rax)
.L1:
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	jmp	.L1
	.cfi_endproc
.LFE28:
	.size	allocateNode, .-allocateNode
	.p2align 4
	.globl	freeNode
	.type	freeNode, @function
freeNode:
.LFB29:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L7
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L7:
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
	.p2align 4
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
	je	.L18
	leaq	hashTable(%rip), %r13
	leaq	.LC4(%rip), %r12
	leaq	808(%r13), %r14
.L8:
	movq	0(%r13), %rbx
	testq	%rbx, %rbx
	jne	.L7
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L19:
	movq	32(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L5
.L7:
	movl	24(%rbx), %r8d
	pxor	%xmm0, %xmm0
	movq	%rbx, %rcx
	movq	%r12, %rdx
	movl	$2, %esi
	movq	%rbp, %rdi
	movl	$1, %eax
	cvtss2sd	20(%rbx), %xmm0
	call	__fprintf_chk@PLT
	testl	%eax, %eax
	jns	.L19
.L6:
	movq	%rbp, %rdi
	call	fclose@PLT
.L4:
	leaq	.LC7(%rip), %rdi
	movl	$-1, %ebx
	call	puts@PLT
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
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	addq	$8, %r13
	cmpq	%r14, %r13
	jne	.L8
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
.L10:
	movl	$-1, %ebx
	jmp	.L1
.L18:
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L4
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
	.p2align 4
	.globl	loadCache
	.type	loadCache, @function
loadCache:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	cacheLock@PLT
	testl	%eax, %eax
	jne	.L21
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	%eax, %r15d
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L34
	call	clearHashTable@PLT
	movq	%rsp, %rbx
	leaq	24(%rsp), %r14
	leaq	20(%rsp), %r13
	call	clearLRU@PLT
	leaq	.LC10(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L25:
	xorl	%eax, %eax
	movq	%r14, %r8
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$3, %eax
	jne	.L35
	subq	$32, %rsp
	.cfi_def_cfa_offset 144
	movdqa	32(%rsp), %xmm0
	movdqu	44(%rsp), %xmm1
	movups	%xmm0, (%rsp)
	movups	%xmm1, 12(%rsp)
	call	insertNode@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	testl	%eax, %eax
	je	.L25
	movq	%rbx, %rdi
	call	searchNode@PLT
	testq	%rax, %rax
	je	.L25
	movq	%rax, %rdi
	addl	$1, %r15d
	call	addToFront@PLT
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rbp, %rdi
	call	fclose@PLT
	leaq	.LC11(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	call	cacheUnlock@PLT
.L20:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r15d, %eax
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
.L34:
	.cfi_restore_state
	leaq	.LC9(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	call	cacheUnlock@PLT
.L21:
	orl	$-1, %r15d
	jmp	.L20
.L36:
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
	.p2align 4
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
	jne	.L38
	leaq	.LC8(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L50
	leaq	.LC0(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L41
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L43:
	movq	%rbp, %rsi
	call	fputc@PLT
	cmpl	$-1, %eax
	je	.L52
.L41:
	movq	%rbx, %rdi
	call	fgetc@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	jne	.L43
	movq	%rbp, %rdi
	call	fclose@PLT
	testl	%eax, %eax
	jne	.L53
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L54
	leaq	.LC16(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logInfo@PLT
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	call	cacheUnlock@PLT
.L37:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L49:
	call	cacheUnlock@PLT
.L38:
	orl	$-1, %ebx
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L53:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L49
.L54:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	jmp	.L49
.L50:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L49
.L51:
	leaq	.LC12(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	logError@PLT
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L49
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
	.p2align 4
	.type	persistenceThreadMain, @function
persistenceThreadMain:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	persistenceDoneCond(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	persistenceCond(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	persistenceMutex(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movl	saveRequested(%rip), %ecx
	testl	%ecx, %ecx
	je	.L2
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	pthread_cond_wait@PLT
	movl	saveRequested(%rip), %edx
	testl	%edx, %edx
	jne	.L3
.L2:
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L4
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	movl	$0, saveRequested(%rip)
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	call	saveCache@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	movq	%r12, %rdi
	movl	$1, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L5
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
	.p2align 4
	.type	logThreadMain, @function
logThreadMain:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	logQueue(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	logCond(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	logMutex(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movl	logQueueCount(%rip), %ebx
	testl	%ebx, %ebx
	je	.L13
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	pthread_cond_wait@PLT
	movl	logQueueCount(%rip), %ebx
	testl	%ebx, %ebx
	jne	.L14
.L13:
	movl	logShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L15
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	movq	264(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L27
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	testl	%ebx, %ebx
	jle	.L16
	movslq	logQueueHead(%rip), %rsi
	movq	%rsp, %r13
	movl	$255, %edx
	subl	$1, %ebx
	movq	%r13, %rdi
	movq	%rsi, %r14
	salq	$8, %rsi
	addq	%r15, %rsi
	call	strncpy@PLT
	leal	1(%r14), %ecx
	movq	%rbp, %rdi
	movl	%ebx, logQueueCount(%rip)
	movl	%ecx, %eax
	movb	$0, 255(%rsp)
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %ecx
	andl	$63, %ecx
	subl	%eax, %ecx
	movl	%ecx, logQueueHead(%rip)
	call	pthread_mutex_unlock@PLT
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L12
	movq	%rax, %rdi
	movq	%r13, %rcx
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	jmp	.L12
.L16:
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	jmp	.L12
.L27:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	logThreadMain, .-logThreadMain
	.p2align 4
	.globl	initializeThreadManager
	.type	initializeThreadManager, @function
initializeThreadManager:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%esi, %esi
	leaq	logQueue(%rip), %rdi
	movl	$16384, %edx
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
	leaq	logMutex(%rip), %rbx
	call	memset@PLT
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movl	$0, logQueueHead(%rip)
	movl	$0, logQueueTail(%rip)
	movl	$0, logQueueCount(%rip)
	movl	$0, logShutdownRequested(%rip)
	movl	$0, persistenceShutdownRequested(%rip)
	movl	$0, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L29
	leaq	logCond(%rip), %rbp
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L44
	leaq	persistenceMutex(%rip), %r12
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L42
	leaq	persistenceCond(%rip), %r13
	xorl	%esi, %esi
	movq	%r13, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L43
	leaq	persistenceDoneCond(%rip), %r14
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	pthread_cond_init@PLT
	testl	%eax, %eax
	jne	.L41
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	logThreadMain(%rip), %rdx
	leaq	logThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L40
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	leaq	persistenceThreadMain(%rip), %rdx
	leaq	persistenceThread(%rip), %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L45
.L28:
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
.L45:
	.cfi_restore_state
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
.L40:
	movq	%r14, %rdi
	call	pthread_cond_destroy@PLT
.L41:
	movq	%r13, %rdi
	call	pthread_cond_destroy@PLT
.L43:
	movq	%r12, %rdi
	call	pthread_mutex_destroy@PLT
.L42:
	leaq	cacheMutex(%rip), %rdi
	call	pthread_mutex_destroy@PLT
	movq	%rbp, %rdi
	call	pthread_cond_destroy@PLT
	movq	%rbx, %rdi
	call	pthread_mutex_destroy@PLT
.L29:
	movl	$-1, %eax
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%rbx, %rdi
	call	pthread_mutex_destroy@PLT
	jmp	.L29
	.cfi_endproc
.LFE41:
	.size	initializeThreadManager, .-initializeThreadManager
	.p2align 4
	.globl	shutdownThreadManager
	.type	shutdownThreadManager, @function
shutdownThreadManager:
.LFB42:
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
	movq	%rbx, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
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
	addq	$8, %rsp
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
.LFE42:
	.size	shutdownThreadManager, .-shutdownThreadManager
	.p2align 4
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
	je	.L51
	leaq	logMutex(%rip), %r12
	movq	%rdi, %r14
	movq	%r12, %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L51
	movl	logQueueCount(%rip), %r13d
	cmpl	$63, %r13d
	jg	.L53
	movslq	logQueueTail(%rip), %rax
	movl	$16384, %ecx
	leaq	logQueue(%rip), %rdx
	movq	%r14, %rsi
	movq	%rax, %rbx
	salq	$8, %rax
	cmpq	%rcx, %rax
	leaq	(%rax,%rdx), %rdi
	movl	$255, %edx
	cmovnb	%rax, %rcx
	addl	$1, %ebx
	addl	$1, %r13d
	subq	%rax, %rcx
	call	__strncpy_chk@PLT
	leaq	logCond(%rip), %rdi
	movl	%r13d, logQueueCount(%rip)
	movb	$0, 255(%rax)
	movl	%ebx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %ebx
	andl	$63, %ebx
	subl	%eax, %ebx
	movl	%ebx, logQueueTail(%rip)
	call	pthread_cond_signal@PLT
.L52:
	movq	%r12, %rdi
	call	pthread_mutex_unlock@PLT
.L48:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	movl	$-1, %ebp
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$-1, %ebp
	jmp	.L52
	.cfi_endproc
.LFE43:
	.size	enqueueLogEntry, .-enqueueLogEntry
	.p2align 4
	.globl	signalCacheSave
	.type	signalCacheSave, @function
signalCacheSave:
.LFB44:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L57
	leaq	persistenceCond(%rip), %rdi
	movl	%eax, %ebx
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
.L55:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore_state
	movl	$-1, %ebx
	jmp	.L55
	.cfi_endproc
.LFE44:
	.size	signalCacheSave, .-signalCacheSave
	.p2align 4
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
	leaq	persistenceMutex(%rip), %rbx
	movq	%rbx, %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L60
	movl	persistenceShutdownRequested(%rip), %r12d
	testl	%r12d, %r12d
	jne	.L70
	leaq	persistenceCond(%rip), %rdi
	leaq	persistenceDoneCond(%rip), %rbp
	movl	$1, saveRequested(%rip)
	movl	$0, saveCompleted(%rip)
	call	pthread_cond_signal@PLT
	movl	saveCompleted(%rip), %ecx
	testl	%ecx, %ecx
	je	.L63
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	pthread_cond_wait@PLT
	movl	saveCompleted(%rip), %edx
	testl	%edx, %edx
	jne	.L65
.L63:
	movl	persistenceShutdownRequested(%rip), %eax
	testl	%eax, %eax
	je	.L66
	movl	$-1, %r12d
.L65:
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
.L59:
	movl	%r12d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L70:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
.L60:
	movl	$-1, %r12d
	jmp	.L59
	.cfi_endproc
.LFE45:
	.size	requestCacheSaveAndWait, .-requestCacheSaveAndWait
	.p2align 4
	.globl	cacheLock
	.type	cacheLock, @function
cacheLock:
.LFB46:
	.cfi_startproc
	endbr64
	leaq	cacheMutex(%rip), %rdi
	jmp	pthread_mutex_lock@PLT
	.cfi_endproc
.LFE46:
	.size	cacheLock, .-cacheLock
	.p2align 4
	.globl	cacheUnlock
	.type	cacheUnlock, @function
cacheUnlock:
.LFB47:
	.cfi_startproc
	endbr64
	leaq	cacheMutex(%rip), %rdi
	jmp	pthread_mutex_unlock@PLT
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
	.p2align 4
	.globl	validateSymbol
	.type	validateSymbol, @function
validateSymbol:
.LFB11:
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
	testq	%rdi, %rdi
	je	.L7
	movzbl	(%rdi), %ebx
	movq	%rdi, %rbp
	xorl	%r12d, %r12d
	testb	%bl, %bl
	je	.L1
	call	strlen@PLT
	cmpq	$19, %rax
	ja	.L1
	call	__ctype_b_loc@PLT
	leaq	1(%rbp), %rdi
	movq	(%rax), %rax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L13:
	movzbl	(%rdi), %ebx
	addq	$1, %rdi
	testb	%bl, %bl
	je	.L12
.L3:
	testb	$8, (%rax,%rbx,2)
	jne	.L13
.L7:
	xorl	%r12d, %r12d
.L1:
	movl	%r12d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	movl	$1, %r12d
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	validateSymbol, .-validateSymbol
	.p2align 4
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
	.p2align 4
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
	.p2align 4
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
	pxor	%xmm0, %xmm0
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	movq	$0, 16+stats(%rip)
	movaps	%xmm0, stats(%rip)
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE19:
	.size	initializeStatistics, .-initializeStatistics
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE20:
	.size	recordHit, .-recordHit
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE21:
	.size	recordMiss, .-recordMiss
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE22:
	.size	recordInsert, .-recordInsert
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE23:
	.size	recordUpdate, .-recordUpdate
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE24:
	.size	recordDelete, .-recordDelete
	.p2align 4
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
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE25:
	.size	recordEviction, .-recordEviction
	.p2align 4
	.globl	getHitRatio
	.type	getHitRatio, @function
getHitRatio:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	statsMutex(%rip), %rbx
	movq	%rbx, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	movl	4+stats(%rip), %eax
	movl	stats(%rip), %edx
	addq	%rdx, %rax
	je	.L22
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	%rbx, %rdi
	cvtsi2ssq	%rdx, %xmm0
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
	movss	%xmm0, 12(%rsp)
	call	pthread_mutex_unlock@PLT
	movss	12(%rsp), %xmm0
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	pthread_mutex_unlock@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	pxor	%xmm0, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	getHitRatio, .-getHitRatio
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"====================================="
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"         CACHE STATISTICS"
.LC5:
	.string	"Cache Hits     : %u\n"
.LC6:
	.string	"Cache Misses   : %u\n"
.LC7:
	.string	"Insertions     : %u\n"
.LC8:
	.string	"Updates        : %u\n"
.LC9:
	.string	"Deletions      : %u\n"
.LC10:
	.string	"Evictions      : %u\n"
.LC11:
	.string	"Hit Ratio      : %.2f%%\n"
	.text
	.p2align 4
	.globl	displayStatistics
	.type	displayStatistics, @function
displayStatistics:
.LFB27:
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
	leaq	.LC3(%rip), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	movl	stats(%rip), %edx
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	4+stats(%rip), %edx
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	8+stats(%rip), %edx
	leaq	.LC7(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	12+stats(%rip), %edx
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	16+stats(%rip), %edx
	leaq	.LC9(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	20+stats(%rip), %edx
	xorl	%eax, %eax
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	4+stats(%rip), %eax
	movl	stats(%rip), %edx
	pxor	%xmm0, %xmm0
	addq	%rdx, %rax
	je	.L24
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssq	%rdx, %xmm0
	cvtsi2ssq	%rax, %xmm1
	divss	%xmm1, %xmm0
	mulss	.LC1(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
.L24:
	leaq	.LC11(%rip), %rsi
	movl	$2, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE27:
	.size	displayStatistics, .-displayStatistics
	.section	.rodata.str1.1
.LC12:
	.string	"w"
.LC13:
	.string	"data/statistics.dat"
.LC14:
	.string	"%u %u %u %u %u %u\n"
	.text
	.p2align 4
	.globl	saveStatistics
	.type	saveStatistics, @function
saveStatistics:
.LFB28:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	leaq	.LC12(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L34
	movq	%rax, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	20+stats(%rip), %eax
	movl	8+stats(%rip), %r9d
	movl	4+stats(%rip), %r8d
	movl	stats(%rip), %ecx
	movq	%rbx, %rdi
	leaq	.LC14(%rip), %rdx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	16+stats(%rip), %eax
	movl	$2, %esi
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
.L34:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
	.cfi_endproc
.LFE28:
	.size	saveStatistics, .-saveStatistics
	.section	.rodata.str1.1
.LC15:
	.string	"r"
.LC16:
	.string	"%u %u %u %u %u %u"
	.text
	.p2align 4
	.globl	loadStatistics
	.type	loadStatistics, @function
loadStatistics:
.LFB29:
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	pthread_mutex_lock@PLT
	leaq	.LC15(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	fopen@PLT
	testq	%rax, %rax
	je	.L42
	movq	%rax, %rbx
	leaq	20+stats(%rip), %rax
	leaq	.LC16(%rip), %rsi
	pushq	%rax
	.cfi_def_cfa_offset 40
	subq	$4, %rax
	movq	%rbx, %rdi
	pushq	%rax
	.cfi_def_cfa_offset 48
	leaq	-12(%rax), %rcx
	leaq	-16(%rax), %rdx
	leaq	-4(%rax), %r9
	leaq	-8(%rax), %r8
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rcx
	.cfi_def_cfa_offset 32
	cmpl	$6, %eax
	je	.L37
	movq	$0, 16+stats(%rip)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, stats(%rip)
.L37:
	movq	%rbx, %rdi
	call	fclose@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	pthread_mutex_unlock@PLT
.L42:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rsi
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	initializeStatistics
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
