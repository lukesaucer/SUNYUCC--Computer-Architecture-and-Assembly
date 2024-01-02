# Module 04 Demo a  <first name> <last name>

# Example of simple procedure call in section 2.8

#

# Pseudo code for program

#        int leaf_example (int g, h, i, j) {

#                int f;

#                f = (g + h) - (i + j);

#                return f;}

#        Notes on register usage

#                Arguments g,h, i, j in $a0, $a1, $a2, $a3

#                f will use $s0 so need to save $s0 on stack

#                Result returned in $v0

#

.data

f:        .word        0

g:        .word        1

h:        .word        2

i:        .word        3

j:         .word        4

.text

main:         la        $a0, g                # move the parameters into registers for procedure access

        lw        $a0, 0($a0)

        la        $a1, h

        lw        $a1, 0($a1)

        la        $a2, i

        lw        $a2, 0($a2)

        la        $a3, j

        lw        $a3, 0($a3)



# Call the leaf_example

        jal        leaf_example

# return from Call here

        sw        $v0, f                # save returned value in memory

        li        $v0, 10        # service 10 is EXIT

        syscall



# The leaf procedure

leaf_example:

# "prolog"

        addi $sp, $sp, -4

        sw   $s0, 0($sp)         # Save ra ($s0) on stack



# Procedure body


        add  $t0, $a0, $a1

        add  $t1, $a2, $a3

        sub  $s0, $t0, $t1

        add  $v0, $s0, $zero         # store result in $v0


# "epilog" (although it is not often called that)

        lw   $s0, 0($sp)         # restore registers from the stack

        addi $sp, $sp, 4        # reset the stack pointer

        jr   $ra                # return to caller
