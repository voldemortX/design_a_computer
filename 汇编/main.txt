	addi  $sp,$zero,1500  #sp初始指向500
	addi  $t1,$zero,1600  #存放结果的头位置
wait:	
	lw   $t8, 0x3ff1($zero)  #取按键内容	
	andi $t4, $t8, 0xffff    #是否有按键
	beq  $t4, $zero, wait	  #若无则继续查询等待
	jal delay               #延时一段时间
	
	lw   $t9, 0x3ff1($zero)  #取按键内容
	beq  $t8, $t9, wait      #与25ms前一致则重新等待按键(下降沿触发)
	
	#根据按键进入不同程序
	andi $t7, $t4, 0x0001
	bne  $t7, $zero, center
	andi $t7, $t4, 0x0008
	bne  $t7, $zero, left
	andi $t7, $t4, 0x0010
	bne  $t7, $zero, right
	j wait
	
center:
	andi $a0, $a0, 0
	addi  $a0,$zero,1026  #子程序参数
	jal travel   #进行中序遍历函数
	
	#数码管显示"in"
	andi  $t6, $t6, 0
	addi  $t6, $t6, 0x0160
	sll   $t6, $t6, 16
	addi  $t6, $t6, 0x08ec
	sw    $t6, 0x3ff2($zero)
	
	andi  $t2, $t2, 0  
	addi  $t2,$t1,-1600  #存放结果长度
	andi  $t1, $t1, 0  
	addi  $t1,$zero,1599 #存放结果的头位置
	j wait
	
left:
	#数码管清零
	andi  $t6, $t6, 0
	sw    $t6, 0x3ff2($zero)
	#读取指针-1位置的字母
	addi  $t1,$t1,-1
	lw $t0, 0($t1)
	j seg
	
seg:
	if_a:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0041
		bne   $t0, $t5, if_b
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x08ee
		sw    $t6, 0x3ff2($zero)
		j wait
	if_b:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0042
		bne   $t0, $t5, if_c
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x083e
		sw    $t6, 0x3ff2($zero)
		j wait
	if_c:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0043
		bne   $t0, $t5, if_d
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x089c
		sw    $t6, 0x3ff2($zero)
		j wait
	if_d:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0044
		bne   $t0, $t5, if_e
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x087a
		sw    $t6, 0x3ff2($zero)
		j wait
	if_e:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0045
		bne   $t0, $t5, if_f
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x089e
		sw    $t6, 0x3ff2($zero)
		j wait
	if_f:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0046
		bne   $t0, $t5, if_g
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x088e
		sw    $t6, 0x3ff2($zero)
		j wait
	if_g:
		andi  $t5, $t5, 0
		addi  $t5, $t5, 0x0047
		bne   $t0, $t5, other
		andi  $t6, $t6, 0
		addi  $t6, $t6, 0x08f6
		sw    $t6, 0x3ff2($zero)
		j wait
	other:
		j wait
		
right:
	#数码管清零
	andi  $t6, $t6, 0
	sw    $t6, 0x3ff2($zero)
	
	#读取指针+1位置的字母
	addi  $t1,$t1,1
	lw $t0, 0($t1)
	j seg

	

	
travel:
	addi  $sp,  $sp, -2    #修/改堆栈指针，准备入栈
	sw    $ra,  1($sp)     #返回地址入栈
	sw    $a0,  0($sp)     #参数入栈

	beq   $a0, $zero, pop #节点为空，出栈；不为空，其左节点继续执行函数

	lw    $t0, -1($a0)     #将$a0存储的字母的左子树的地址存入$t0
	addi  $a0, $t0, 0      #参数存入$a0
	jal   travel           #继续执行travel

	sll   $zero, $zero, 0
	lw    $ra, 1($sp)      #恢复本轮调用的返回地址至$ra
	lw    $a0, 0($sp)      #将栈指针指向的字母指针存入a0
	lw    $t0, 0($a0)      #将a0指向的字母值存入t0
	sw    $t0, 0($t1)      #把字母存入主存某位置
	addi  $t1, $t1, 1      #存字母的主存地址位置+1
	
	lw    $t0, 1($a0)      #将$a0存储的字母的右子树的地址存入$t0
	addi  $a0, $t0, 0      #参数存入$a0
	jal   travel           #继续执行travel

	sll   $zero, $zero, 0
	lw    $ra, 1($sp)      #恢复本轮调用的返回地址至$ra
pop:
	addi  $sp, $sp, 2
	jr    $ra
	
delay:
	andi $t9, $t9, 0
	addi $t9, $t9, 1         #延迟25ms
	sll  $t9, $t9, 18
	minus:		
		addi $t9, $t9, -1
		bne $t9, $zero, minus
	jr $ra
