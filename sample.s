.text

.globl _Main
_ain:
	pushl %ebp #Save Original EBP
	movl %esp,%ebp #Point EBP to top of stack
	subl $4,%esp #make room for local variables
	pushl %ebx#Save Used Registor
	pushl $1
	pushl $2
	popl %ebx
	popl %eax
	cmpl %ebx,%eax
	setg %al
	movzbl %al,%eax
	pushl %eax
	popl %eax
	popl %ebx#save store register
	movl %ebp,%esp
	popl %ebp
	ret
_fact:
	pushl %ebp #Save Original EBP
	movl %esp,%ebp #Point EBP to top of stack
	subl $12,%esp #make room for local variables
	movl 8(%ebp),%ebx
	movl %ebx,-4(%ebp)
	pushl %ebx#Save Used Registor
	movl -4(%ebp),%ebx
	pushl %ebx
	pushl $0
	popl %ebx
	popl %eax
	cmpl %ebx,%eax
	sete %al
	movzbl %al,%eax
	pushl %eax
	movl -4(%ebp),%ebx
	pushl %ebx
	pushl $1
	popl %ebx
	popl %eax
	cmpl %ebx,%eax
	sete %al
	movzbl %al,%eax
	pushl %eax
	popl %ebx 
	popl %eax
	orl %ebx,%eax
	pushl %eax
	popl %eax#start IfwithElse
	cmpl $1,%eax
	jne label0
	pushl $1
	popl %ebx
	movl %ebx,-8(%ebp)
	jmp label1
label0:#end if
	movl -4(%ebp),%ebx
	pushl %ebx
	pushl $1
	popl %ebx 
	popl %eax
	subl %ebx,%eax
	pushl %eax
	popl %ebx#start visit call
	pushl %ebx
	call _fact
	movl %eax,-8(%ebp)#end visit call
	popl %ebx
	movl -4(%ebp),%ebx
	pushl %ebx
	movl -8(%ebp),%ebx
	pushl %ebx
	popl %ebx 
	popl %eax
	imull %ebx,%eax
	pushl %eax
	popl %ebx
	movl %ebx,-8(%ebp)
label1:#end if
	movl -8(%ebp),%ebx
	pushl %ebx
	popl %eax
	popl %ebx#save store register
	movl %ebp,%esp
	popl %ebp
	ret
_Main:
	pushl %ebp #Save Original EBP
	movl %esp,%ebp #Point EBP to top of stack
	subl $8,%esp #make room for local variables
	pushl %ebx#Save Used Registor
	pushl $4
	popl %ebx#start visit call
	pushl %ebx
	call _fact
	movl %eax,-4(%ebp)#end visit call
	popl %ebx
	pushl $1
	popl %eax#start IfwithElse
	cmpl $1,%eax
	jne label2
	pushl $2
	popl %ebx
	movl %ebx,-4(%ebp)
	jmp label3
label2:#end if
	pushl $10
pushl $-1
	popl %ebx 
	popl %eax
	imull %ebx,%eax
	pushl %eax
	popl %ebx
	cdq
	xor %ebx, %eax
	sub %ebx, %eax
	pushl %eax
	popl %ebx
	movl %ebx,-4(%ebp)
label3:#end if
	movl -4(%ebp),%ebx
	pushl %ebx
	popl %eax
	popl %ebx#save store register
	movl %ebp,%esp
	popl %ebp
	ret
