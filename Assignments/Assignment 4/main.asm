# Assignment #4 - Lucas Saucer

#

# Pseudo code for program
#        void parseToken (char x[], char y[])

#                { int i;

#                  i = 0;

#                  while(y[i]!='\0’) /* While the index in Y does not equal a blank space */

#                          {x[i]=y[i]);

#                          i += 1;}

#                }

#

#                Addresses of x, y in $a0, $a1

#                i in $s0

.data

source:        .asciiz "hello world "

.word         		0               	 # added to force word boundary

target:        .space 1024



.globl		main

.text

main:           la $a1, source

                la $a0, target

                jal parsetoken

                li $v0, 10

                syscall
