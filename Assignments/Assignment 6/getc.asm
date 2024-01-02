# Module 10 memeory mapped I/O demo

# Get character procedure

# Return the received character in $v0

.data

.text

.globl getc

getc:                lui     $t0,0xffff                        # load address of memory mapped control words

# into $t0



Gcloop:        lw        $t1,0($t0)                  # read rcv ctrl

                andi        $t1,$t1,0x0001        # extract ready bit

                beq        $t1,$0,gcloop                # keep polling till ready

                lw        $v0,4($t0)                # get input character from memory location into $v0

                jr        $ra                        # return to caller
