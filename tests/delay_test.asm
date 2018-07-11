
     andi $a0, $a0, 0
     addi $a0, $zero, 1
     sll $a0, $a0, 23
     NEXTW:
     	  lw $k1, 0x3ff1($zero)
          sw $k1, 0x3ff0($zero)
          andi $a1, $a1, 0
     	  addi $a1, $zero, 4096
     	  NEXTW2:
     	      addi $a1, $a1, -1
     	      bne $a1, $zero, NEXTW2
     	  addi $a1, $zero, 4096
     	  NEXTW3:
     	      addi $a1, $a1, -1
     	      bne $a1, $zero, NEXTW3
	  addi $a0,$a0,-8192
     	  bne $a0, $zero, NEXTW
     	  
BACK:
     lw $a1, 0x3ff1($zero)
     sw $a1, 0x3ff2($zero)
     j BACK