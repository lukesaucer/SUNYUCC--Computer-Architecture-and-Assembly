#
#     Demo of procedure call conventions
#

.data
msg1:	.asciiz "Enter integer 1 "
msg2:     .asciiz "Enter integer 2 "
msg3:     .asciiz "The total is "
.text

main:	la $a0, msg1
		li $v0, 51
		syscall

		move $t0, $a0

		la $a0, msg2
		li $v0, 51
		syscall

		move $t1, $a0

		move $a0, $t0
		move $a1, $t1
		jal  addProc

		la  $a0, msg3
		move $a1, $v0
		syscall

		li $v0, 10
		syscall
