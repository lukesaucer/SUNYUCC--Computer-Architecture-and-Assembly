# Module 03 Demo b <first name> < last name>
# Program to demonstrate if statement logic in machine language
# Section 2.7

#        Pseudo code for program
#                if (i==j) f = g+h; else f = g-h;
#                f, g, … in $s0, $s1, …

.data

f:        .word 0
g:        .word 6
h:        .word 7
i:        .word 3
j:        .word 3

.text

# set up  registers

        lw  $s1, g
        lw  $s2, h
        lw  $s3, i
        lw  $s4, j

#perform the logic

        bne $s3, $s4, else
        add $s0, $s1, $s2
        j   exit

else:         sub $s0, $s1, $s2

exit:        sw  $s0, f

li $v0, 10                        # exit program

        SYSCALL
