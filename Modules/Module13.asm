# Important: do not put any other data before the frameBuffer
# Also: the Bitmap Display tool must be connected to MARS and set to
#   display width in pixels: 512
#   display height in pixels: 256
#   base address for display: 0x10010000 (static data)

.data
frameBuffer:    .space 0x80000
color:        .word 0x00ff0000

.text

# Example of drawing a rectangle; left x-coordinate is 100, width is 25
# top y-coordinate is 200, height is 50. Coordinate system starts with
# (0,0) at the display's upper left corner and increases to the right
# and down.  (Notice that the y direction is the opposite of math tradition.)

            li $a0,200    # left x coordinate
            li $a1,50        # width
            li $a2,100    # top y coordinate (y increases downward)
            li $a3,25        # height
            jal rectangle
            li $v0,10
            syscall

rectangle:

# $a0 is xmin (i.e., left edge; must be within the display)
# $a1 is width (must be nonnegative and within the display)
# $a2 is ymin  (i.e., top edge, increasing down; must be within the display)
# $a3 is height (must be nonnegative and within the display)
            beq $a1,$zero,rectangleReturn # zero width: draw nothing
            beq $a3,$zero,rectangleReturn # zero height: draw nothing

            #li $t0,-1 # color: white
            lw $t0, color
            la $t1,frameBuffer
            add $a1,$a1,$a0                 # simplify loop tests by switching to first too-far value
            add $a3,$a3,$a2
            sll $a0,$a0,2                 # scale x values to bytes (4 bytes per pixel)
            sll $a1,$a1,2
            sll $a2,$a2,11                   # scale y values to bytes (512*4 bytes per display row)
            sll $a3,$a3,11
            addu $t2,$a2,$t1             # translate y values to display row starting addresses
            addu $a3,$a3,$t1
            addu $a2,$t2,$a0             # translate y values to rectangle row starting addresses
            addu $a3,$a3,$a0
            addu $t2,$t2,$a1             # and compute the ending address for first rectangle row
            li $t4,0x800                     # bytes per display row
rectangleYloop:
            move $t3,$a2 # pointer to current pixel for X loop; start at left edge
rectangleXloop:
            sw $t0,($t3)
            addiu $t3,$t3,4
            bne $t3,$t2,rectangleXloop       # keep going if not past the right edge of the rectangle
            addu $a2,$a2,$t4                 # advace one row worth for the left edge
            addu $t2,$t2,$t4                 # and right edge pointers
            bne $a2,$a3,rectangleYloop       # keep going if not off the bottom of the rectangle

rectangleReturn:
            jr $ra
