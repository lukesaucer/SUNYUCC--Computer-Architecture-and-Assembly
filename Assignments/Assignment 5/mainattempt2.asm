# Assignment #5 - Lucas Saucer


.data

stringOne:        .asciiz "hello world "

stringTwo:        .asciiz "helloworld "

msgEQ:    	      .asciiz "1"

msgNEQ:  	        .asciiz "0"


.text
.globl main
main:
         	        la $a1, stringOne          # Load the stringOne String into register $a1

                  la $a2, stringTwo          # Load the stringTwo String into register $a2

                	jal strcmp                 # Jump and link to the strcmp procedure.

                  beq $v0,$zero,ok           #check result

                  li $v0,4
                  la $a0,msgNEQ
                  syscall
                  j exit
ok:
                  li $v0,4
                  la $a0,msgEQ
                  syscall


exit:
                	li $v0, 10

               		syscall                    # Syscall for terminating the program





strcmp:
                  add $t0,$zero,$zero
                  add $t1,$zero,$a1
                  add $t2,$zero,$a2

loop:
                  lb $t3($t1)               # Load a byte from each string
                  lb $t4($t2)               # Load a byte from each string
                  beqz $t3,checkt2          #str1 end
                  beqz $t4,missmatch
                  slt $t5,$t3,$t4           #compare two bytes
                  bnez $t5,missmatch
                  addi $t1,$t1,1            #t1 points to the next byte of str1
                  addi $t2,$t2,1
                  j loop

missmatch:
                  addi $v0,$zero,1
                  j endfunction
checkt2:
                  bnez $t4,missmatch
                  add $v0,$zero,$zero

endfunction:
                  jr $ra
