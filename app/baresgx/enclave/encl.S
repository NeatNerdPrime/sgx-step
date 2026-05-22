        /* 
         * Minimal test enclave with a single code page with exactly 100
         * instructions.
         */
	.text
        .align 0x1000
encl_entry:
        mov     encl_secret(%rip), %rsi

	.rept 96
		nop
	.endr

	# EEXIT
        mov     %rcx, %rbx
	mov	$4, %rax
	enclu

        .data
encl_secret:
        .quad 0xdeadbeefcafebabe

