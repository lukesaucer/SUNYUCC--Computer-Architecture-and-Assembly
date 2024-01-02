#
#	Very simple procedure to demonstrate the register arguments and return value/code
#
#		argument 1 is in $a0
#		argument 2 is in $a1
#		return value or code is placed in $v0
#
.globl addProc

.text
addProc:	add $t0, $a0, $a1	# add the two arguments and store the result in temp register $t0

			move $v0, $t0			#move the return value to register $v0
			jr
