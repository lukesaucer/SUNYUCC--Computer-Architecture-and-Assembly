# Assignment #3 - Lucas Saucer
# Adding Machine

.data

PromptInput:   .asciiz   "Enter an Integer: "
OutputMsg:     .asciiz   "The total is: "
a:             .word	 0                 # Create a value of 0 in variable 'a'

.text

	        lw  $s0, a               # Load the variable 'a' of value '0' in register $s0

InputNum:       li $v0, 4                # Print string
                la $a0, PromptInput      # Address of null-terminated string to print
                syscall

                li $v0, 5                # Read integer ($v0 contains integer read)
                syscall

                add $t1, $v0, $zero      # Move $v0 to $t1


                bne $t1, $s0, else       # Check to see if the user-inputed value is equal to '0'
                                         # If not equal, jump to else statement below.
                j exit                   # If equal, fall-through and jump to exit.



else:
                li $v0, 4                # Print string
                la $a0, PromptInput      # Address of null-terminated string to print
                syscall

                li $v0, 5                # Read integer ($v0 contains integer read)
                syscall

                add $t2, $v0, $zero      # Move $v0 to $t2
		add $t0, $t1, $t2	 # Add $t2 and $t2 and store the result in $t0



		li $v0, 4                # Print string
		la $a0, OutputMsg        # Address of null-terminated string to print
		syscall

		move $a0, $t0     	# Move the value in register $t0 to register $a0
		li $v0, 1        	# Code to print an integer
		syscall          	# print integer ( $a0 )

exit:           Li $v0, 10              # Exit the program

                SYSCALL
