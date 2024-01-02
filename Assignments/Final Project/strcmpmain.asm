.data

stringOne:        .asciiz "help"
.word             0 
stringTwo:        .asciiz "echo"
.word             0 
stringThree:	  .asciiz "exit"
.word		  0            		     # added to force word boundary
errorStatement:   .asciiz "Error: Command Not Found"
.word		  0
target:           .space 1024
.word             0 

.text

.globl		strcmpmain


strcmpmain:
		  la $t5, stringOne          # Load the stringOne String into register $t5
                  
                  la $t6, stringTwo          # Load the stringTwo String into register $t6
                  
                  la $t7, stringThree	     # Load the stringThree String into register #t7

              	  jal strcmp                 # Jump and link to the strcmp procedure.

                  j exit

exit:
                  li $v0, 10

               	  syscall                    # Syscall for terminating the program

strcmp:
                  add $t0,$zero,$zero
                  
                  add $t1,$zero,$t5
                  
                  add $t2,$zero,$t6

helploop:
                  lb $t3($t1)               # Load a byte from each string
                  
                  lb $t4($t9)               # Load a byte from each string
                  
                  beqz $t3,checkt2          #str1 end
                  
                  #beqz $t4,checkt2
                  
                  slt $t5,$t4,$t3           #compare two bytes
                  
                  bnez $t5,echoloop
                  
                  addi $t1,$t1,1            #t1 points to the next byte of str1
                  
                  addi $t9,$t9,1
                  
                  j helploop		    #needs to jump to help menu

echoloop:	  
		  lb $t3($t2)               # Load a byte from each string
                  
                  lb $t4($t9)               # Load a byte from each string
                  
                  beqz $t3,checkt3          #str1 end
                  
                  #beqz $t4,checkt3
                  
                  slt $t5,$t3,$t4           #compare two bytes
                  
                  bnez $t5, exitloop
                  
                  addi $t2,$t2,1            #t1 points to the next byte of str1
                  
                  addi $t9,$t9,1
                  
                  j echoloop		    # needs jump to echmo menu
                  			    
exitloop:	  
		  lb $t3($t7)               # Load a byte from each string
                  
                  lb $t4($t9)               # Load a byte from each string
                  
                  beqz $t3,checkt4          #str1 end
                  
                  #beqz $t4,checkt4
                  
                  slt $t5,$t3,$t4           #compare two bytes
                  
                  bnez $t5, errorstatement
                  
                  addi $t7,$t7,1            #t1 points to the next byte of str1
                  
                  addi $t9,$t9,1
                  
                  j exitloop	            #needs to jump to exitmenu
                  

errorstatement:	  
		  la $a0, errorStatement
                  
                  li $v0, 4
                  
                  SYSCALL
                  
                  jal exitmenu

checkt2:
                  #bnez $t4, helpmenu
                  
                  #add $v0,$zero,$zero
                  
                  jal helpmenu
                  
checkt3:
                  #bnez $t4, errorstatement
                  
                  #add $v0,$zero,$zero
                  
                  jal echomenu
                  
checkt4:
                  li $v0, 10
                  
                  SYSCALL
