# Module 03 Demo d, <first name> < last name>
# Program to demonstrate SYSCALL

.data

PromptInput:   .asciiz   "Enter an Integer"
OutputMsg:     .asciiz   "The total is"

.text

InputNum:       li $v0, 4                # Print string
                la $a0, PromptInput      # Address of null-terminated string to print
                syscall



                li $v0, 5                # Read integer ($v0 contains integer read)
                syscall

                add $a0, $v0, $zero      # Move $v0 to $a0

                li $v0, 1                # Print integer ($a0 contains integer to print
                syscall



Exit:           li $v0, 10          # Exit

                syscall
