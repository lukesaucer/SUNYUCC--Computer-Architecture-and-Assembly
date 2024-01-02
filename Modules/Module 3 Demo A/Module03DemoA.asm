# Module 03 Demo A   <first name> <last name>
# Program to demonstrate operands in memory (a variation of the example in Section 2.3)
#
#        Pseudo code for program A[12] = h + A[8];
#

.data

A:         .word 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15    # allocate/initialize a vector array of numbers
h:         .word 6                                        # constant used in program

.text

                la  $s0, A                        # load base address of array A (address of A[0]) into $s0
                lw  $t0, 32($s0)                  # load A[8] into $t0
                lw  $s1, h                        # load h into $s1
                add $t1, $s1, $t0
                sw  $t1, 48($s0)

exit:           li $v0, 10                        # exit program

                SYSCALL
