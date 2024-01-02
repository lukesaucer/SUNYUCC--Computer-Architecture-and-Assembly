# Lucas Saucer - Assignment #7

.text

main:                                                # user program
        ori       	$t1, $0,0                    # we enable interrupts                        
        la        	$t7, enable_rxint
        jalr 		$t7

loop:                                                # this is a simulated 'busy on other things'
        addi        	$t1, $t1, 1
        beq        	$0,$0, loop

exit:                                                # after we are busy long enough we will exit.
        li      	$v0, 10                
        syscall                        

.ktext 0x80000180                            	     # Forces interrupt routine below to be
                                                     # located at address 0x80000180.

interp:
        # interrupt handler - all registers are precious
        addiu       	$sp,$sp,-32                  # Save registers.
        sw        	$at,28($sp)                  # so we can use it.

        # Save registers.  Remember, this is an interrupt routine

        # so it has to save anything it touches, including $t registers.

        sw        	$ra,24($sp)
        sw        	$a0,20($sp)
        sw        	$v0,16($sp)
        sw        	$t3,12($sp)
        sw        	$t2,8($sp)
        sw        	$t1,4($sp)
        sw        	$t0,0($sp)        
        lui     	$t0,0xffff                   # prep base address of control regs
        lw        	$t1,0($t0)                   # get rcv ctrl
        andi        	$t1,$t1,0x0001        	     # extract rcv ready bit
	beq        	$t1,$0,intDone               # false interrupt
        lw        	$a0,4($t0)                   # get keyboard entered ASCII value

	li   	    	$t8, '\n'		     # $t8 = '\n'         
        beq  	    	$a0,$t8,exit		     # if t8 is equal to the recently entered character, jump to exit
          
        lw        	$t1,8($t0)                   # get output ctrl word
        andi       	$t1,$t1,0x0001               # extract ready bit
        beq        	$t1,$0,intDone               # still busy discard interrupt (keeping it simple)
        sw        	$a0, 0xc($t0)                # set keyboard value for output
        
        # fall through to interrupt handling complete

intDone:
        ## Clear Cause register

        mfc0        $t0,$13                 # get Cause register, then clear it
        mtc0        $0, $13
        
        ## restore registers

        lw        $t0,0($sp)
        lw        $t1,4($sp)
        lw        $t2,8($sp)
        lw        $t3,12($sp)
        lw        $v0,16($sp)
        lw        $a0,20($sp)
        lw        $ra,24($sp)
        lw         $at,28($sp)
        addiu        $sp,$sp,32
        eret                                        # rtn from int and reenable ints

enable_rxint:        
        mfc0        $t0, $12                # get interrupt state into work register
        andi        $t0, $t0,0xFFFE        # clear int enable flag
        mtc0    $t0, $12                # turn interrupts off.        
        lui     $t0, 0xffff                        # load control word base address
        lw        $t1, 0($t0)                        # read rcv ctrl
        ori        $t1, $t1, 0x0002        # set the *input* interrupt enable
        sw        $t1, 0($t0)                        # update rcv ctrl
        mfc0        $t0, $12                # get interrupt state into work register
       	ori        $t0, $t0, 0x0001        # set int enable flag
        mtc0    $t0, $12                # Turn interrupts back on
        jr        $ra

.kdata

# you can put any data needed by the interrupt handler here