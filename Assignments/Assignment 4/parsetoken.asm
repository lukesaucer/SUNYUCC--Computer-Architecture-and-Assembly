
.globl 		parsetoken


parsetoken:             addi $sp, $sp, -4                      # adjust stack for 1 item

                        sw   $s0, 0($sp)                       # save $s0 on stack

                        add  $s0, $zero, $zero         	       # i = 0

loop:                   add  $t1, $s0, $a1                     # addr of y[i] in $t1

                        lbu  $t2, 0($t1)                       # $t2 = y[i]

                        add  $t3, $s0, $a0                     # addr of x[i] in $t3

                        sb   $t2, 0($t3)                       # x[i] = y[i]

                        li   $t0,' '			       # $t0 = ' '

                        beq  $t2,$t0, ret		       # exit loop if y[i] == ' '

                        addi $s0, $s0, 1                       # i = i + 1

                        j    loop                              # next iteration of loop

ret:                    lw   $s0, 0($sp)                       # restore saved $s0

                        addi $sp, $sp, 4                       # pop 1 item from stack

                        jr   $ra                               # and return
