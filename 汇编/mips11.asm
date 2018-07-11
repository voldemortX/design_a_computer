#t1 left score
#t2 right score
#t3 game status(0: ongoing, 1: ended)
#t4 ball position(16-2048: shift from right to left)
#t5 ball flag(0: flying, 1: pending)
#t6 0: left-response, 1: right-response

MAIN:
     j WAIT
     BACK:
     #lw $a1, 0x3ff1($zero)
     #sw $a1, 0x3ff2($zero)
     #j BACK
     andi $s0, $s0, 0
     lw	$s0, 0x3ff1($zero)
     andi $s1, $s1, 0
     andi $s1, $s0, 1
     bne $s1, $zero, CENTER
     andi $s1, $s0, 16
     bne $s1, $zero, RIGHT
     BACKLEFT:
     andi $s1, $s0, 8
     bne $s1, $zero, LEFT
     andi $s1, $s0, 16
     bne $s1, $zero, BACKMAIN
     andi $s1, $s0, 2
     bne $s1, $zero, UP
     BACKMAIN:
     andi $a1, $a1, 0
     addi $a1,$zero,4096
         bne $t5, $zero, ELSEA
     	 bne $t6, $zero, ELSEB
     	     sll $t4, $t4, 1
	     bne $t4,$a1 , ELSEA
	         addi $t2, $t2, 1
                 jal NEXT
                 j ELSEA

         ELSEB:
            srl $t4, $t4, 1
            xori $s1, $t4, 8
	    bne $s1, $zero, ELSEA
	    	addi $t1, $t1, 1
	        jal NEXT

     ELSEA:
     jal LED
     j MAIN


WAIT:  #100ms?
     andi $a0, $a0, 0
     addi $a0, $zero, 1
     sll $a0, $a0, 19
     NEXTW:
     	  #lw $k1, 0x3ff1($zero)
          #sw $k1, 0x3ff0($zero)
          andi $a1, $a1, 0
     	  addi $a1, $zero, 4096
     	  jal SCANRGHT
     	  NEXTW2:
     	      addi $a1, $a1, -1
     	      bne $a1, $zero, NEXTW2
     	  addi $a1, $zero, 4096
     	  jal SCANLEFT
     	  NEXTW3:
     	      addi $a1, $a1, -1
     	      bne $a1, $zero, NEXTW3
	  addi $a0,$a0,-8192
     	  bne $a0, $zero, NEXTW
     	  
     j BACK
     
     
CENTER:
     # init game
     andi $t1, $t1, 0
     andi $t2, $t2, 0  
     andi $t3, $t3, 0
     andi $t4, $t4, 0
     addi $t4, $zero, 2048  
     andi $t5, $t5, 0
     addi $t5, $t5, 1
     andi $t6, $t6, 0
     addi $t6, $t6, 1
     j BACKMAIN


LEFT:
     xori $s1, $t4, 2048
     or $s1, $s1, $t5
     or $s1, $s1, $t6
     bne $s1, $zero, ELSEL
         andi $t6, $t6, 0
	 addi $t6, $zero, 1
     ELSEL:
     	j BACKMAIN


RIGHT:
     xori $s1, $t4, 16
     or $s1, $s1, $t5
     xori $s2, $t6, 1
     or $s1, $s1, $s2
     bne $s1, $zero, ELSER
	 andi $t6, $t6, 0
     ELSER:
     	j BACKLEFT


UP:
     bne $t3, $zero, ELSEU
         andi $t5, $zero, 0
     ELSEU:
     	j BACKMAIN
     

NEXT:
     # interesting
     andi $t5, $t5, 0
     addi $t5, $zero, 1
     add $s2, $t1, $t2
     srl $s1, $s2, 1
     andi $s1, $s1, 1
     bne $s1, $zero, ELSEN
         andi $t6, $t6, 0
     	 addi $t6, $zero, 1
     	 andi $t4, $t4, 0
         addi $t4, $zero, 2048
         j FOLLOW
     ELSEN:
     	 andi $t6, $t6, 0
         addi $t6, $zero, 0
         andi $t4, $t4, 0
         addi $t4, $zero, 16
     
     FOLLOW:
     xori $s2, $t1, 7
     xori $s3, $t2, 7
     beq $s2, $zero, ELSEC
     beq $s3, $zero, ELSEC
     jr $ra	 
         
     ELSEC:
     	 andi $t3, $t3, 0
         addi $t3, $zero, 1
     	 jr $ra
	 
	 
SCANRGHT:
	andi $s5, $s5, 0
	addi $s5, $zero, 13
	sll $s5,$s5,8
	andi $s6, $s6, 0	
	beq $t2, $zero, SEG0
		andi $k0, $k0, 0
		addi $k0, $k0, 1
		beq $t2, $k0,SEG1
			andi $k0, $k0, 0
			addi $k0, $k0, 2
			beq $t2, $k0,SEG2
				andi $k0, $k0, 0
				addi $k0, $k0, 3
				beq $t2, $k0,SEG3
					andi $k0, $k0, 0
					addi $k0, $k0, 4
					beq $t2, $k0,SEG4
						andi $k0, $k0, 0
						addi $k0, $k0, 5
						beq $t2, $k0,SEG5
							andi $k0, $k0, 0
							addi $k0, $k0, 6
							beq $t2, $k0,SEG6
								andi $k0, $k0, 0
								addi $k0, $k0, 7
								beq $t2, $k0,SEG7
									bne $t2, $k0,SEG8
SCANLEFT:
	andi $s5, $s5, 0
	addi $s5, $zero, 11
	sll $s5,$s5,8						
	andi $s6, $s6, 0
	beq $t1, $zero, SEG0
		andi $k0, $k0, 0
		addi $k0, $k0, 1
		beq $t1, $k0,SEG1
			andi $k0, $k0, 0
			addi $k0, $k0, 2
			beq $t1, $k0,SEG2
				andi $k0, $k0, 0
				addi $k0, $k0, 3
				beq $t1, $k0,SEG3
					andi $k0, $k0, 0
					addi $k0, $k0, 4
					beq $t1, $k0,SEG4
						andi $k0, $k0, 0
						addi $k0, $k0, 5
						beq $t1, $k0,SEG5
							andi $k0, $k0, 0
							addi $k0, $k0, 6
							beq $t1, $k0,SEG6
								andi $k0, $k0, 0
								addi $k0, $k0, 7
								beq $t1, $k0,SEG7
									bne $t1, $k0,SEG8
SCANNEXT:
	# save seg status
        andi $k0, $k0, 0
	add $k0,$s5,$s6
	sw $k0, 0x3ff2($zero)	
	jr $ra
SEG0:
	addi $s6, $s6, 0x03
	j SCANNEXT
SEG1:
	addi $s6, $s6, 0xf3
	j SCANNEXT
SEG2:
	addi $s6, $s6, 0x25
	j SCANNEXT
SEG3:
	addi $s6, $s6, 0x0d
	j SCANNEXT
SEG4:
	addi $s6, $s6, 0x99
	j SCANNEXT
SEG5:
	addi $s6, $s6, 0x49
	j SCANNEXT
SEG6:
	addi $s6, $s6, 0x41
	j SCANNEXT
SEG7:
	addi $s6, $s6, 0x1f
	j SCANNEXT
SEG8:
	addi $s6, $s6, 0x01
	j SCANNEXT

LED:
	# directly save led status
	sw $t4, 0x3ff0($zero)
	jr $ra
