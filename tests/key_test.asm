     andi $a0, $a0, 0
     addi $a0, $zero, 1
     sll $a0, $a0, 24
     NEXTW:
     	  lw $t1, 0x3ff1($zero)
          sw $t1, 0x3ff0($zero)
	  addi $a0,$a0,-1
     	  bne $a0, $zero, NEXTW
     
     BACK:
     lw $t1, 0x3ff1($zero)
     sw $t1, 0x3ff2($zero)
     j BACK	  
     	  