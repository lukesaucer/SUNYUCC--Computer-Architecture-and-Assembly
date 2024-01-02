# Module 10 Memory Mapped I/O Demo

# Memory mapped address of device registers.

# 0xFFFF0000 rcv contrl

# 0xFFFF0004 rcv data

# 0xFFFF0008 tx contrl

# 0xFFFF000c tx data

.data

.text

main:



        jal        getc                         # Get character from the keyboard

        move    $a0, $v0        # move the character to the "putc" argument register

        jal        putc                        # Output the character to the display

exit:                                        # Exit

        li      $v0, 10

        syscall        
