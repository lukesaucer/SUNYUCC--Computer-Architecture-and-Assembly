.data

PromptInput:    .asciiz   "CmdProcessor:~ User>: "
Buffer: 	.space 	  1024

.text

.globl 		echomenu

echomenu:	
		la $a0, PromptInput
                
                li $v0, 4
                
                SYSCALL
		
		
		li $v0,8 	# take in input
         	
         	la $a0, Buffer  # load byte space into address
         	
         	li $a1, 20 	# allot the byte space for string
        	
        	move $t9,$a0 	# save string to t9
        	
        	SYSCALL
        	
        	
        	la $a0, PromptInput
                
                li $v0, 4
                
                move $a0, $t9
        	
        	li $v0, 4
         	
         	SYSCALL