# Final Project - Lucas Saucer

# Project isn't fully completed. The help menu does not have any extra commands.
# The program simply pulls up a help menu with a list of commands, can perform an echo function, and can exit (with errors).

.data

PromptInput:    .asciiz   "CmdProcessor:~ User>: "
Buffer: 	.space 	  20

.text

.globl 		main
		

main:      
                la $a0, PromptInput
                
                li $v0, 4
                
                SYSCALL
                
                
                li $v0,8 #take in input
         	
         	la $a0, Buffer #load byte space into address
         	
         	li $a1, 20 # allot the byte space for string
        	
        	move $t9,$a0 #save string to t9
         	
         	SYSCALL
                
		jal strcmpmain


exit:           
		li $v0, 10
                
                SYSCALL
