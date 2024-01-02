# Module 10 Memory Mapped I/O Demo

# put character procedure

# a0 = byte to transmit

.data

.text

.globl putc

putc:        lui     $t0,0xffff                # load address of memory mapped I/O words into register

pcloop:        lw        $t1,8($t0)                        # read output ctrl memory address

                andi $t1,$t1,0x0001                      # extract ready bit

                beq        $t1,$0,pcloop                # poll till ready

                sw        $a0, 0xc($t0)                # when ready write character to output register.

ccloop:        lw        $t1,8($t0)                        # read output control memory address

                andi        $t1,$t1,0x0001          # extract ready bit

                beq        $t1,$0,ccloop                # keep polling until character written out

                jr        $ra                        # return
