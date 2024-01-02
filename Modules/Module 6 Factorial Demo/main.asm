# Example of simple non-leaf procedure call in section 2.8

#

# Pseudo code for program

#        int fact (int n)

#        {

#          if (n < 1) return f;

#          else return n * fact(n - 1);

#        }

#         Argument n in $a0

#         Result in $v0

#

.globl main

.data

f:                .word        0

g:                .word        0

PROMPT:         .asciiz "enter a number to calculate the factorial"

outmsg:         .asciiz "the factorial is: "

.text

main:

                li           $v0, 51

                la        $a0, PROMPT

                syscall

# Call fact

                jal        fact

# return from Call here

                move        $a1, $v0                # save returned value in memory

                li           $v0, 56

                la        $a0, outmsg

                syscall

                li        $v0, 10        # service 10 is EXIT

                syscall
