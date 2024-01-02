.data

HelpMainMenu:     .asciiz   "Within this command processor you have the following choices: "
NewLine:	  .asciiz   "\n"
HelpMainMenu3:    .asciiz   "1) Type 'help' for the help menu. "
HelpMainMenu4:    .asciiz   "2) Type 'echo' for the echo command. "
HelpMainMenu5:    .asciiz   "3) Type 'exit' to exit the processor. "

.text

.globl 		helpmenu

helpmenu:
		la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL

                
                la $a0, HelpMainMenu
                
                li $v0, 4
                
                SYSCALL
                
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                
                la $a0, HelpMainMenu3
                
                li $v0, 4
                
                SYSCALL
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                
                la $a0, HelpMainMenu4
                
                li $v0, 4
                
                SYSCALL
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                
                la $a0, HelpMainMenu5
                
                li $v0, 4
                
                SYSCALL
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                la $a0, NewLine
                
                li $v0, 4
                
                SYSCALL
                
                jal main
                
  		