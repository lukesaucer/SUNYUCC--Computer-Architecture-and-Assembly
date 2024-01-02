# Module 03 Demo d, <first name> < last name>
# Program to demonstrate SYSCALL

.data
PromptInput:   .asciiz   "Enter an Integer"
OutputMsg:     .asciiz   "The total is"

.text

InputNum:       Li $v0, 4
                La $a0, PromptInput
                SYSCALL
                
                Li $v0, 5

                SYSCALL



Exit:           Li $v0, 10

                SYSCALL
