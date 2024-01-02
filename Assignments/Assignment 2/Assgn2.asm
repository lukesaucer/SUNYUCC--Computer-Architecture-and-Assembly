# Assignment #2 - Lucas Saucer
# Hello, World!

.data # Data declaration section

msg_string: .asciiz "\nHello, Lucas Saucer!\n"        # String to be printed:


.text # Assembly language instructions go in text segment

# Start of code section

main:   li $v0, 4                          # system call code for printing string = 4
            la $a0, msg_string             # load address of string to be printed into $a0
        syscall                            # call operating system to perform operation
        li $v0, 10                         # terminate program
        syscall
