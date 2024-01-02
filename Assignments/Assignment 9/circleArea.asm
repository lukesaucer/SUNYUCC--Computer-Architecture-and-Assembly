.data

pi:               	.float 3.1416

.text

.globl circleArea

circleArea:

          	    la $t1, pi            	# load value of pi into register t1

          	    lwc1 $f4, ($t1)       	# load value of register t1 into register f4


         	    mul.s $f13, $f12, $f12      # procedure to find the radius squared

          	    mul.s $f12, $f13, $f4   	# multiply the result of the radius squared by the value of pi

          	    jr   $ra                    # return to main
