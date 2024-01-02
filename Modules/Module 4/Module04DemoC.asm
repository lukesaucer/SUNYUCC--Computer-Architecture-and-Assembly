# Module 04 Demo c  <first name>  <last name>

# String Copy Example in section 2.9

#

# Pseudo code for program (note this is slightly different than text for simplicity)

#        void strcpy (char x[], char y[])

#                { int i;

#                  i = 0;

#                  while(y[i]!='\0’) /* check the last character moved */

#                          {x[i]=y[i]);

#                          i += 1;}

#                }

#

#                Addresses of x, y in $a0, $a1

#                i in $s0

.data

source:        .asciiz "123456789"

.word         0                # added to force word boundary

target:                 .space 1024

.text

main:                la $a1, source

                la $a0, target

                jal strcpy

                li $v0, 10

                syscall

# String Copy Procedure

# Copy string pointed to by $a0 to space pointed to by $a1 (do not check overflow)

strcpy:                 addi $sp, $sp, -4                      # adjust stack for 1 item

                        sw   $s0, 0($sp)                       # save $s0 on stack

                        add  $s0, $zero, $zero         # i = 0

loop:                 add  $t1, $s0, $a1                     # addr of y[i] in $t1

                        lbu  $t2, 0($t1)                       # $t2 = y[i]

                        add  $t3, $s0, $a0                     # addr of x[i] in $t3

                        sb   $t2, 0($t3)                       # x[i] = y[i]

                        beq  $t2, $zero, ret                   # exit loop if y[i] == 0

                        addi $s0, $s0, 1                       # i = i + 1

                        j    loop                              # next iteration of loop

ret:                 lw   $s0, 0($sp)                       # restore saved $s0

                        addi $sp, $sp, 4                       # pop 1 item from stack

                        jr   $ra                               # and return
