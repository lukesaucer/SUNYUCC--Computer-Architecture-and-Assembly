# Lucas Saucer - Assignment #9


.data

prompt:           	.asciiz   "Enter the radius of the circle to be calculated in meters:"

outputMsg:        	.asciiz   "The area in meters is: "

fltPtZero:        	.float 0

pi:               	.float 3.1416

.text

# set up registers

.globl main

main:                la $t0, fltPtZero

                     lwc1 $f1, ($t0)        	# set f1 reg to fp zero

                     lwc1 $f12, ($t0)       	# set total reg (#f12) to fp zero

						# Loop: read number, check for zero and branch, add to total

						# Note:        $f0 will contain floating point number read

input:               li $v0, 52                 # Input dialog float

                     la $a0, prompt             # message to user result returned in $f0

                     syscall

                     c.eq.s $f0,$f1             # compare input to zero and set coproc 1 condition flag 0

                     bc1t   exit                # branch if coproc 1 condition flag 0 is true



                     add.s $f12,$f0,$f12        #Add read floating point number to total

 		     jal circleArea



						# Print outputMsg and exit

exit:               li $v0, 57

                    la $a0, outputMsg

                    syscall



                    li $v0, 10                  # exit gracefully

                    syscall
