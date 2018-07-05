

module top #(parameter WIDTH =32 )(seg7,scan,clk,button,SW,led,btn);
  output [7:0]seg7;
  output [15:0]led;
  input clk;
  input [15:0]SW;
  input [4:0]btn;
  input button;
  output [3:0]scan;
  //input [15:0]SW;
 // reg clk;
  //reg clk1;		//????
  reg reset,reset1;
 // reg  button;
  wire memread,memwrite;
  wire [WIDTH-1:0] adr,writedata;
  wire [WIDTH-1:0] memdata;
  
  wire [WIDTH-1:0] rd3,rd4,rd5,rd6,rd7;
  wire[3:0] scan ;
  wire [7:0] seg7 ;
  reg count1=0;
  reg clk1=0;
  //always@(negedge button)
  //begin
  
  //end
  always @ (posedge clk)   //二分频
  begin 
      if(count1==1)
          begin clk1<=~clk1;
          count1<=0;end
      else
          begin count1<=count1+1;end
  end
  /*always @ (posedge clk)
  begin 
      if(reset1==0)
          begin clk1<=~clk1;end
  end*/
  //instantiate devices to be tested  需要仿真的CPU模块
  mips #(WIDTH) dut(clk1,reset,memdata,memread,memwrite,adr,writedata,rd3,rd4,rd5,rd6,rd7,SW,btn);
  display a(clk1,rd3,seg7,scan,led,rd4,rd5,rd6,rd7);				//rd3 是t1 负责输出的
  //exmemory	存储器模块
  exmemory #(WIDTH) exmem(clk1,reset,memwrite,adr,writedata,memdata);
  //initial
  initial
    begin
        clk1<=0;
        #20 reset<=1;
        #50 reset<=0;
	  //reset<=0;
	 // button<=1;
	  
	// #50;
	  //button<=0;
	 /* #500;
	  reset<=1;
	  #50
	  reset<=0;*/
	   //# 50;
          // reset <=0;
    end
  //generate clock
	//always
		//begin
			//clk <=1;
			//# 5; 
			//clk <=0;
			//# 5;
		//end
	/*always @(negedge clk)
		begin
			if(memwrite)
				if(adr==5&writedata==7)
					$display("Simulation completely successful");
				else
					$display("Simulation failed");
		end*/
endmodule

module display(clk,t1,seg7,scan,led,rd4,rd5,rd6,rd7);
input clk;
input [31:0]t1;      //要输出的结果
output seg7;         //数码管
output reg [15:0]led;
output scan;		//四个数码管的片选
input  [31:0]rd4,rd5,rd6,rd7;
reg[4:0] data=0;
reg[31:0] num;
reg[3:0] scan ;
reg [7:0] seg7 ;
reg[1:0] cnt=0;
reg clk1khz=0;
reg[14:0] count1=0;
reg[31:0]qian,bai,shi,ge;
//  initial
//  begin
//    qian=t1/1000;
//    bai=(t1%1000)/100;
//    shi=(t1%100)/10;
//    ge=t1%10;
//  end
always @ (posedge clk)
begin 
led[15]<=t1[31];			//led保存16位有符号数
led[14:0]<=t1[14:0];
	if(count1==25000)    //得到1khz的时钟
		begin clk1khz<=~clk1khz;
		count1<=0;end
	else
		begin count1<=count1+1;end
end
always @(posedge clk1khz)
begin
	if(cnt==3)
		begin cnt<=0;end
	else
		begin cnt<=cnt+1;end
end
/*always @(t1)
begin
num<=t1;
end*/
always @ (cnt)
begin
if(t1[31])		//如果是负数
case(cnt)			//将
	2'b00:begin data[3:0]<=t1[3:0];data[4]<=0;scan[3:0]<=4'b1110/*&{4{blink[0]}}*/;end
	2'b01:begin data[3:0]<=t1[7:4];data[4]<=0;scan[3:0]<=4'b1101/*&{4{blink[0]}}*/;end
	2'b10:begin data[3:0]<=t1[11:8];data[4]<=0;scan[3:0]<=4'b1011/*&{4{blink[1]}}*/;end
	2'b11:begin data[3:0]<=t1[15:12];data[4]<=0;scan[3:0]<=4'b0111/*&{4{blink[1]}}*/;end
	default:begin data<=5'b0;scan<=4'b1111;end
	endcase

else 			//如果是正数

	case(cnt)
	2'b00:begin data[3:0]<=rd7[3:0];data[4]<=0;scan[3:0]<=4'b1110/*&{4{blink[0]}}*/;end
	2'b01:begin data[3:0]<=rd6[3:0];data[4]<=0;scan[3:0]<=4'b1101/*&{4{blink[0]}}*/;end
	2'b10:begin data[3:0]<=rd5[3:0];data[4]<=0;scan[3:0]<=4'b1011/*&{4{blink[1]}}*/;end
	2'b11:begin data[3:0]<=rd4[3:0];data[4]<=0;scan[3:0]<=4'b0111/*&{4{blink[1]}}*/;end
	default:begin data<=5'b0;scan<=4'b1111;end
        	endcase
//    	case(cnt)
//            2'b00:begin data[3:0]<=t1[3:0];data[4]<=0;scan[3:0]<=4'b1110/*&{4{blink[0]}}*/;end
//            2'b01:begin data[3:0]<=t1[7:4];data[4]<=0;scan[3:0]<=4'b1101/*&{4{blink[0]}}*/;end
//            2'b10:begin data[3:0]<=t1[11:8];data[4]<=0;scan[3:0]<=4'b1011/*&{4{blink[1]}}*/;end
//            2'b11:begin data[3:0]<=t1[15:12];data[4]<=0;scan[3:0]<=4'b0111/*&{4{blink[1]}}*/;end
//            default:begin data<=5'b0;scan<=4'b1111;end
//                    endcase
end
always @ (data)
begin
if(data[4])		//如果是负数 则显示负号	（这个是只把数用了后3个4位  最前4位只放符号）
seg7[7:0]=8'b10111111;//-
else
	case(data[3:0])
	
	4'b0000:seg7[7:0]=8'b11000000;//0
	4'b0001:seg7[7:0]=8'b11111001;//1
	4'b0010:seg7[7:0]=8'b10100100;//2
	4'b0011:seg7[7:0]=8'b10110000;//3
	4'b0100:seg7[7:0]=8'b10011001;//4
	4'b0101:seg7[7:0]=8'b10010010;//5
	4'b0110:seg7[7:0]=8'b10000010;//6
	4'b0111:seg7[7:0]=8'b11111000;//7
	4'b1000:seg7[7:0]=8'b10000000;//8
	4'b1001:seg7[7:0]=8'b10010000;//9
	4'b1010:seg7[7:0]=8'b10001000;//a
	4'b1011:seg7[7:0]=8'b10000011;//b
	4'b1100:seg7[7:0]=8'b11000110;//c
	4'b1101:seg7[7:0]=8'b10100001;//d
	4'b1110:seg7[7:0]=8'b10000110;//e
	4'b1111:seg7[7:0]=8'b10001110;//f
	
	
	default:seg7[7:0]=8'b11111111;//11111111;
	endcase
end
endmodule



//external memory
module exmemory #(parameter WIDTH =32)
      (clk,reset,memwrite,adr,writedata,memdata,word);
      //input [15:0]SW1;
  input clk;
  input reset;
  input memwrite;
  input [WIDTH-1:0] adr,writedata;
  output reg [WIDTH-1:0] memdata;
  output [31:0] word;
  reg [31:0] RAM [2047:0];
  wire [31:0] word;
  initial
	begin
	//$readmemh("D:/vivadoproject/keshe/jiqima",RAM);
    RAM[0] <=32'b00000000000000001100000000100000;	//add		$t8,	$zero,	$zero	
    
    RAM[1] <=32'b00100000000000100000000000000001;    //addi        $2,    $zero,    1    
   
    //WAIT
    RAM[2] <=32'b00000001100000000111100000100000;    //add        $t7,    $t4,    $zero
    RAM[3] <=32'b00010001111110000000000000000011;    //beq        $t7,    $t8,    BTN
    RAM[4] <=32'b00000001111000001100000000100000;    //add        $t8,    $t7,    $zero
    
    //RAM[5] <=32'b00000001100000001000000000100000;    //add        $s0,    $t4,    $zero
    //RAM[6] <=32'b00001000000000000000000000000010;    //j        WAIT    
    
    RAM[5] <=32'b00000001100000001111000000100000;    //add        $s0,    $t4,    $zero
    RAM[6] <=32'b00001000000000000000000000110011;    //j        FINAL
    
    //BTN
    
    RAM[7] <=32'b00010001000000000000000000000001;    //beq        $t0,    $zero,JWAIT
    RAM[8] <=32'b00001000000000000000000000001010;    //j        START
    
    //JWAIT
    RAM[9] <=32'b00001000000000000000000000000010;
    
    //START
    RAM[10] <=32'b00000001100000001000000000100000;    //add        $s0,    $t4,     $zero
    RAM[11] <=32'b00100000000100010000001111101000;    //addi        $s1,    $zero,    1000 
    RAM[12] <=32'b00100000000100100000101110111000;    //addi        $s2,    $zero,    3000
    RAM[13] <=32'b00100000000100110001001110001000;    //addi        $s3,    $zero,    5000
    RAM[14] <=32'b00000000000000001010000000100000;    //add        $s4,    $zero,    $zero
    RAM[15] <=32'b00000000000000001011100000100000;    //add        $s7,    $zero,    $zero    
    RAM[16] <=32'b00000010000100010100100000101010;    //slt        $t1,    $s0,    $s1
    RAM[17] <=32'b00011101001000000000000000000101;    //bgtz        $t1,    LONE
    RAM[18] <=32'b00000010000100100100100000101010;    //slt        $t1,    $s0,    $s2
    RAM[19] <=32'b00011101001000000000000000000101;    //bgtz        $t1,    LTWO
    RAM[20] <=32'b00000010000100110100100000101010;    //slt        $t1,    $s0,    $s3
    RAM[21] <=32'b00011101001000000000000000000101;    //bgtz        $t1,    LTHREE    
    RAM[22] <=32'b00001000000000000000000000011101;    //j        LFOUR
    //LONE:
    RAM[23] <=32'b00000010000000001111000000100000;    //add        $s8,    $s0,    $zero
    RAM[24] <=32'b00001000000000000000000000110011;    //j        FINAL
    //LTWO:
    RAM[25] <=32'b00100000000010010000000000001001;    //addi        $t1,    $zero,9
    RAM[26] <=32'b00001000000000000000000000011111;    //j        MULT
    //LTHREE:
    RAM[27] <=32'b00100000000010010000000000001000;    //addi        $t1,    $zero,8
    RAM[28] <=32'b00001000000000000000000000011111;    //j        MULT
    //LFOUR:
    RAM[29] <=32'b00100000000010010000000000000111;    //addi        $t1,    $zero,7
    RAM[30] <=32'b00001000000000000000000000011111;    //j        MULT
    //MULT:
    RAM[31] <=32'b00000010100100001010000000100000;    //add        $s4,    $s4,    $s0
    RAM[32] <=32'b00000001001000100100100000100010;    //sub        $t1,    $t1,    $2
    RAM[33] <=32'b00010001001000000000000000000010;    //beq        $t1,    $zero,NEXT
    RAM[34] <=32'b00001000000000000000000000011111;    //j        MULT
    
    
    //NEXT:
    RAM[35] <=32'b00000010100000001011000000100000;    //add        $s6,    $s4,    $zero
    RAM[36] <=32'b00100000000010010000000000001010;    //addi        $t1,    $zero,10    
    RAM[37] <=32'b00000000000000001010100000100000;    //add        $s5,    $zero,$zero    
    RAM[38] <=32'b00001000000000000000000000100111;    //j        DIV
    //DIV:    
    
    RAM[39] <=32'b00000010100010011010000000100010;    //sub        $s6,    $s6,    $t1
    
    RAM[40] <=32'b00100010101101010000000000000001;    //addi        $s5,    $s5,    1    
    RAM[41] <=32'b00000010100010010101000000101010;    //slt        $t2,    $s6,    $t1
    RAM[42] <=32'b00011101010000000000000000000001;    //bgtz        $t2,    NNEXT
    RAM[43] <=32'b00001000000000000000000000100111;    //j        DIV
    //NNEXT:
    RAM[44] <=32'b00100000000010010000000000000101;    //addi        $t1,    $zero,5    
    RAM[45] <=32'b00000010100010011011100000101010;    //slt        $s7,    $s6,    $t1
    RAM[46] <=32'b00010010111000000000000000000010;    //beq        $s7,    $zero,PLUS
    RAM[47] <=32'b00000010101000001111000000100000;    //add        $s8,    $s5,    $zero
    RAM[48] <=32'b00001000000000000000000000110011;    //j        FINAL
    //PLUS:
    RAM[49] <=32'b00100010101111100000000000000001;    //addi        $s8,    $s5,    1
    RAM[50] <=32'b00001000000000000000000000110011;    //j        FINAL
    //FINAL:    
    
    //RAM[51] <=32'b00000011110000001000000000100000;    //add        $s0,    $s8,    $zero
    //RAM[52] <=32'b00001000000000000000000000000010;    //j        WAIT
    
    RAM[51] <=32'b00000011110000001000000000100000;    //add        $s0,    $s8,    $zero
    
    
    RAM[52] <=32'b00100000000000110000001111101000;        //3,1000
    RAM[53] <=32'b00100000000110010000000001100100;        //25,100
    RAM[54] <=32'b00100000000110100000000000001010;        //26,10
    RAM[55] <=32'b00100000000110110000000000000000;        //27,0
    RAM[56] <=32'b00100000000111000000000000000000;        //28,0
    RAM[57] <=32'b00100000000111010000000000000000;        //29,0
    //QIAN
    
    RAM[58] <=32'b00000011110000110101000000101010;    //slt        $t2,    $s8,    $3
    RAM[59] <=32'b00011101010000000000000000000011;    //bgtz        $t2,    BAI
    
    RAM[60] <=32'b00000011110000111111000000100010;        //$30=$30-$3
    RAM[61] <=32'b00100011011110110000000000000001;        //$27++
    
    RAM[62] <=32'b00001000000000000000000000111010;    //j        QIAN
    
    //BAI
    RAM[63] <=32'b00000011110110010101000000101010;    //slt        $t2,    $s8,    $25
    RAM[64] <=32'b00011101010000000000000000000011;    //bgtz        $t2,    SHI
    
    RAM[65] <=32'b00000011110110011111000000100010;        //$30=$30-$25
    RAM[66] <=32'b00100011100111000000000000000001;        //$28++
    
    RAM[67] <=32'b00001000000000000000000000111111;    //j        BAI
    
    //SHI
    RAM[68] <=32'b00000011110110100101000000101010;    //slt        $t2,    $s8,    $26
    RAM[69] <=32'b00011101010000000000000000000011;    //bgtz        $t2,    GE
    
    RAM[70] <=32'b00000011110110101111000000100010;        //$30=$30-$26
    RAM[71] <=32'b00100011101111010000000000000001;        //$29++
    
    
    RAM[72] <=32'b00001000000000000000000001000100;    //j        SHI
    
    //GE
    RAM[73] <=32'b00001000000000000000000000000010;

    $displayb(RAM[0]);
     $displayb(RAM[1]);
      $displayb(RAM[2]);
       $displayb(RAM[3]);
        $displayb(RAM[8]);



	end
  always @(posedge clk)
	if(memwrite)
		RAM[adr] <= writedata;
		/*else
                    begin
                 RAM[12][7:0]=  SW1[7:0];
                 RAM[12][31:8]=0; 
                 
                  memdata =  RAM[adr>>2][31:0];   
                         RAM[13][7:0]=  SW1[7:0];
                                   RAM[13][31:8]=0; 
                                     memdata =  RAM[adr>>2][31:0];   
                  end*/
                  
  assign word =RAM[adr];
  always @(*)
	memdata <=word;
endmodule
//mips
module mips #(parameter WIDTH=32) //?????
          (input clk,reset,
          
           input [WIDTH-1:0] memdata,
           output memread,memwrite,
           output [WIDTH-1:0] adr,writedata,rd3,rd4,rd5,rd6,rd7,
           input [15:0]SW,
           input [4:0]btn,
           output [5:0] aluop,
           output  aluresult,
           output  [WIDTH-1:0] src1,
           output  [WIDTH-1:0] src2
           );
  wire [31:0] instr;//IR
  wire memtoreg,irwrite,iord,pcen,regwrite,regdst,zero;
  wire [1:0] alusrca,alusrcb,pcsource;
  wire [5:0] aluop;
  wire [WIDTH-1:0] aluresult;
  wire [WIDTH-1:0] src1;
  wire [WIDTH-1:0] src2;
//CU
  controller cont(clk,reset,instr[31:26],instr[5:0],
    zero,memread,memwrite,memtoreg,iord,irwrite,
    pcen,regwrite,regdst,pcsource,alusrca,alusrcb,
    aluop);
//datapath
  datapath #(WIDTH) dp(clk,reset,memdata,memtoreg,iord,pcen,regwrite,regdst, irwrite,alusrca,alusrcb,pcsource,aluop,zero,instr,adr,writedata,rd3,rd4,rd5,rd6,rd7,SW,btn,aluresult,src1,src2);
  
endmodule

//CU
module controller(input clk,reset, //?????
                  input [5:0] op,
                  input [5:0] func,
                  input zero,
                  output reg memread,memwrite,memtoreg,iord,irwrite,
                  output pcen,
                  output reg regwrite,regdst,
                  output reg [1:0] pcsource,alusrca,alusrcb,
                  output reg[5:0] aluop);
//state
  parameter FETCHS =4'b0000;
  parameter DECODES=4'b0001;
  parameter MTYPES =4'b0010;
  parameter ITYPES =4'b0011;
  parameter JRUMPS =4'b0100;
  parameter BEQS =4'b0101;
  parameter BLTZS =4'b0110;
  parameter BGTZS =4'b0111;
  parameter JUMPS =4'b1000;
  parameter ReadMS =4'b1001;
  parameter WriteMS=4'b1010;
  parameter IWriteToRegS=4'b1011;
  parameter RITYPES=4'b1100;
  parameter ROTYPES=4'b1101;
  parameter MWriteToRegS=4'b1110;
  parameter RWriteToRegS=4'b1111;
//OP[5:0]
  parameter RType =6'b000000;
  parameter Bltzop =6'b000001;
  parameter Jop =6'b000010;
  parameter Beqop =6'b000100;  //04  beq
  parameter Bgtzop =6'b000111;
  parameter Addiop =6'b001000;   //08
  parameter Addiuop =6'b001001;  //09
  parameter Sltiop =6'b001010;
  parameter Adiop =6'b001100;
  parameter Oriop =6'b001101;
  parameter Xoriop =6'b001110;
  parameter Luiop =6'b001111;
  parameter Lwop =6'b100011;  //23 lw 取字
  parameter Swop =6'b101011;	//2b sw 存字
//func
  parameter FuncSLL =6'b000000;   //sll 逻辑左移
  parameter FuncSRL =6'b000010;   //srl 逻辑右移
  parameter FuncSRA =6'b000011;   //sra 算数右移
  parameter FuncSLLV =6'b000100;   //sllv 位数可变逻辑左移
  parameter FuncSRAV =6'b000111;    //srav 位数可变算数右移
  parameter FuncJR =6'b001000;    //jr 寄存器寻址的无条件转移
  parameter FuncADD =6'b100000;	//add 加
  parameter FuncADDU =6'b100001;     //addu   无符号加
  parameter FuncSUB =6'b100010;		//sub  减
  parameter FuncSUBU =6'b100011;		//subu  无符号减
  parameter FuncXOR =6'b100110;		//XOR	异或
  parameter FunAND =6'b100100;		//24 AND   与
  parameter FuncOR =6'b100101;		//25  OR  或
  parameter FuncNOR =6'b100111;		//27  NOR  或非
  parameter FuncSLT =6'b101010;		//2A	slt		小于则置1
  reg [3:0] state,nextstate;
  reg pcwrite,pcwritecond;
  always @(posedge clk )
  begin
    if(reset)
      state <=FETCHS;
      //  state <=FETCHS;
        else
            state <=nextstate;
  end
  always @(*)
    begin
    case(state)
      FETCHS : nextstate <=DECODES;
      DECODES: case(op)
                  RType:
                    case(func)
                      FuncSLL: nextstate<=RITYPES;
                      FuncSRL: nextstate<=RITYPES;
                      FuncSRA: nextstate<=RITYPES;
                      FuncSLLV: nextstate<=ROTYPES;
                      FuncSRAV: nextstate<=ROTYPES;
                      FuncJR: nextstate<=JRUMPS;
                      FuncADD: nextstate<=ROTYPES;
                      FuncADDU: nextstate<=ROTYPES;
                      FuncSUB: nextstate<=ROTYPES;
                      FuncSUBU: nextstate<=ROTYPES;
                      FuncXOR: nextstate<=ROTYPES;
                      FunAND: nextstate<=ROTYPES;
                      FuncOR: nextstate<=ROTYPES;
                      FuncNOR: nextstate<=ROTYPES;
                      FuncSLT: nextstate<=ROTYPES;
                    endcase
                  Bltzop: nextstate <=BLTZS;
                  Jop: nextstate <=JUMPS;
                  Beqop: nextstate<=BEQS;
                  Bgtzop: nextstate<=BGTZS;
                  Addiop: nextstate<=ITYPES;
                  Addiuop: nextstate<=ITYPES;
                  Sltiop: nextstate<=ITYPES;
                  Adiop: nextstate<=ITYPES;
                  Oriop: nextstate<=ITYPES;
                  Xoriop: nextstate<=ITYPES;
                  Luiop: nextstate<=ITYPES;
                  Lwop: nextstate<=MTYPES;
                  Swop: nextstate<=MTYPES;
                  default:nextstate<=FETCHS;
                  endcase
        ITYPES: nextstate<=IWriteToRegS;
        RITYPES: nextstate<=RWriteToRegS;
        ROTYPES: nextstate<=RWriteToRegS;
        BLTZS: nextstate<=FETCHS;
        BEQS: nextstate<=FETCHS;
        BGTZS: nextstate<=FETCHS;
        JUMPS: nextstate<=FETCHS;
        JRUMPS: nextstate<=FETCHS;
        MTYPES: case(op)
                  Lwop:
                    nextstate<=ReadMS;
                  Swop:
                    nextstate<=WriteMS;
                  endcase
        ReadMS: nextstate<=MWriteToRegS;
        WriteMS: nextstate<=FETCHS;
        IWriteToRegS: nextstate<=FETCHS;
        MWriteToRegS: nextstate<=FETCHS;
        RWriteToRegS: nextstate<=FETCHS;
        default: nextstate<=FETCHS;
    endcase
    end
  always @(*)
  begin
    irwrite <= 0;
    pcwrite <= 0; pcwritecond <= 0;
    regwrite <= 0; regdst <= 0;
    memread <= 0; memwrite <= 0;
    alusrca <= 2'b00; alusrcb <= 2'b00; aluop <= 6'b100000;
    pcsource <= 2'b00;
    iord <= 0; memtoreg <= 0;
    case(state)
      FETCHS:
        begin
          iord<=0;
          irwrite<=1;
          memread<=1;
          memwrite<=0;
          alusrca<=2'b00;
          alusrcb<=2'b01;
          pcsource<=2'b00;
          pcwrite<=1;
          aluop<=6'b100000;
        end
      DECODES:
        begin
          aluop<=6'b100000;
          alusrca<=2'b00;
          alusrcb<=2'b11;
        end
      MTYPES:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b11;
          aluop<=6'b100000;
        end
      ITYPES:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b11;
          case(op)
            Addiop:
              aluop<=6'b100000;
            Addiuop:
              aluop<=6'b100001;
            Sltiop:
              aluop<=6'b101010;
            Adiop:
              aluop<=6'b100100;
            Oriop:
              aluop<=6'b100101;
            Xoriop:
              aluop<=6'b100110;
            Luiop:
              aluop<=6'b010001;
          endcase
        end
      JRUMPS:
        begin
          pcwrite<=1;
          pcsource<=2'b11;
        end
      BEQS:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b00;
          aluop<=6'b100010;
          pcsource<=2'b01;
          pcwritecond<=1;
        end
      BLTZS:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b00;
          aluop<=6'b000001;
          pcsource<=2'b01;
          pcwritecond<=1;
          pcwrite<=0;
        end
      BGTZS:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b00;
          aluop<=6'b001010;
          pcsource<=2'b01;
          pcwritecond<=1;
          pcwrite<=0;
        end
      JUMPS:
        begin
          pcwrite<=1;
          pcsource<=2'b10;
        end
      ReadMS:
        begin
          memread<=1;
          iord<=1;
        end
      WriteMS:
        begin
          memwrite<=1;
          iord<=1;
        end
      IWriteToRegS:
        begin
          memtoreg<=0;
          regwrite<=1;
          regdst<=0;
        end
      RITYPES:
        begin
          alusrca<=2'b10;				//000'''shamt
          alusrcb<=2'b00;				//RB
          case(func)
            FuncSLL: aluop<=6'b000000;   //sll 逻辑左移    进行a<<b 操作
            FuncSRL: aluop<=6'b000010;	//srl 逻辑右移		进行a>>b 操作
            FuncSRA: aluop<=6'b000011;	////sra 算数右移   进行a>>>b 操作
          endcase
        end
      ROTYPES:							//r型指令
        begin
          alusrca<=2'b01;				//scra选择01    RA
          alusrcb<=2'b00;				//scrb选择00	   RB
          case(func)
            FuncSLLV: aluop<=6'b000000;    //sllv 位数可变逻辑左移  进行a<<b 操作
            FuncSRAV: aluop<=6'b000010;	//srav 位数可变算数右移  进行a>>b 操作
            FuncADD: aluop<=6'b100000;	//add 加
            FuncADDU: aluop<=6'b100001;	//addu   无符号加
            FuncSUB: aluop<=6'b100010;	//sub  减
            FuncSUBU:aluop<=6'b100011;	//subu  无符号减
            FuncXOR:aluop<=6'b100110;	//XOR	异或
            FunAND:aluop<=6'b100100;	//24 AND   与
            FuncOR:aluop<=6'b100101;	//25  OR  或
            FuncNOR:aluop<=6'b100111;	//27  NOR  或非
            FuncSLT:aluop<=6'b101010;	//2A	slt		小于则置1
          endcase
        end
      MWriteToRegS:
        begin
          regdst<=0;
          regwrite<=1;
          memtoreg<=1;
        end
      RWriteToRegS:
        begin
          regdst<=1;
          regwrite<=1;
          memtoreg<=0;
        end
      endcase
    end
  assign pcen =pcwrite|(pcwritecond & zero);
endmodule


//datapath
module datapath #(parameter WIDTH =32 )
        (input clk,reset,
         input [WIDTH-1:0] memdata,
         input memtoreg,iord,pcen,regwrite,regdst,irwrite,
         input [1:0] alusrca,alusrcb,pcsource,
         input [5:0] aluop,
         output zero,
         output [31:0] instr,
         output [WIDTH-1:0] adr,writedata,rd3,rd4,rd5,rd6,rd7,
         input [15:0]SW,
         input [4:0]btn,
         output aluresult,
         output [WIDTH-1:0]src1,
         output [WIDTH-1:0]src2
                 );
  parameter CONST_ZERO = 32'b0;
  parameter CONST_ONE = 32'b1;
  wire [4:0] ra1,ra2,wa;//
  wire [WIDTH-1:0] pc,nextpc,md,rd1,rd2,wd,a,src1,src2,aluresult,aluout;
  wire [31:0] jp1;
  assign jp1 ={6'b000000,instr[25:0]};
  wire [31:0] ta1,ta2;
  assign ta1 ={27'b0,instr[10:6]};
  assign ta2 ={16'b0,instr[15:0]};	//offset扩展成32位
  //assign ta2=
  assign ra1 =instr[25:21];
  assign ra2 =instr[20:16];
  
  //assign adr[31:12]=16'b0;
  
  mux2 regmux(instr[20:16],instr[15:11],regdst,wa);
  flopen #(32) ir(clk,irwrite,memdata,instr);
//datapath
  flopenr #(WIDTH) pcreg(clk,reset,pcen,nextpc,pc);
  flop #(WIDTH) mdr(clk,memdata,md);
  flop #(WIDTH) areg(clk,rd1,a);
  flop #(WIDTH) wrd(clk,rd2,writedata);
  flop #(WIDTH) res(clk,aluresult,aluout);
  mux2 #(WIDTH) adrmux(pc,aluout,iord,adr);
  mux4 #(WIDTH) src1mux(pc,a,ta1,ta2,alusrca,src1);
  mux4 #(WIDTH) src2mux(writedata,CONST_ONE,ta1,ta2,alusrcb,src2);
  mux4 #(WIDTH) pcmux(aluresult,aluout,jp1,rd1,pcsource,nextpc);
  mux2 #(WIDTH) wdmux(aluout,md,memtoreg,wd);
  regfile #(WIDTH) rf(clk,reset,regwrite,ra1,ra2,wa,wd,rd1,rd2,rd3,rd4,rd5,rd6,rd7,SW,btn);
  alu #(WIDTH) alunit(src1,src2,aluop,aluresult);
  zerodetect #(WIDTH) zd(aluresult,zero);			//aluresult=0 则zero=1
endmodule


//ALU ??????
module alu #(parameter WIDTH=32)
      (
      input [WIDTH-1:0] a,b,
       input [5:0] aluop,
       output reg [WIDTH-1:0] result
       );
  wire [30:0] b2;
  assign b2=a[30:0];
  wire [WIDTH-1:0] sum,slt,shamt;
  always @(*)
 
  begin
  case(aluop)
    6'b000000: result<=(b<<a);    //sllv 位数可变逻辑左移
    6'b000010:
        case(a[4:0])
					5'b11000:result<={b[31],b[22:0],8'b00000000};		//左移八位
					5'b00100:result<={{5{b[31]}},b[30:4]};        //右移四位
					5'b00101:result<={{6{b[31]}},b[30:5]};          //右移五位
					5'b01000:result<={{9{b[31]}},b[30:8]};          //右移八位
					5'b01001:result<={{10{b[31]}},b[30:9]};           //右移九位
		endcase
    6'b000011: result<=(b>>>a);
    6'b001000: result<= 32'b0;
    6'b100000: result<=(a+b);
    6'b100001: result<=(a+b);
    6'b100010: result<=(a-b);
    6'b100011: result<=(a-b);
    6'b100110: result<=(a^b);
    6'b100100: result<=(a&b);
    6'b100101: result<=(a|b);
    6'b100111: result<=~(a&b);
    6'b101010: result<=(a<b? 1:0);
    6'b000001: //Bltz
		begin
			result<=(a<0 ? 0:1);
		end
    6'b001010: //Bgtz
		begin
			result<=(a>0 ? 0:1);
		end
	6'b010001: result<=((b<<16)& 32'b11111111111111110000000000000000);//LUI

  endcase
  end
endmodule


//regfile
module regfile #(parameter WIDTH=32,REGBITS=5)
      (input clk,
      input reset,
      input regwrite,
      input [REGBITS-1:0] ra1,ra2,wa,
      input [WIDTH-1:0] wd,
      output [WIDTH-1:0] rd1,rd2,rd3,rd4,rd5,rd6,rd7,
            input [15:0]SW,
            input [4:0]btn);
  reg [WIDTH-1:0] RAM2 [(1<<REGBITS)-1:0];  //[31:0]
    initial
    begin
      //$readmemh("regfile.dat",RAM);
	 /*RAM2[0] <=32'b00000000000000000000000000000000;
	  RAM2[1] <=32'b11111111111111111111111111111111;
      RAM2[8] <=32'b00000000000000000000000000010000;//地址 %
      RAM2[9] <=32'b00000000000000000000000000000000;//要找的数
      RAM2[10]<=32'b00000000000000000000000000000000;//内存中取来的数
      RAM2[15]<=32'b00000000000000000000000000000001;//常数1
      RAM2[12]<=32'b00000000000000000000001000000000;
      RAM2[11]<=32'b00000000000000000000000000010110;//末位+1的地址 %
      RAM2[13]<=32'b00000000000000000000000000000000;//读入的数暂存
      RAM2[14]<=32'b00000000000000000000000000011010;//%
      RAM2[16]<=32'b00000000000000000000000000000000;//数码管输出寄存器*/
      //RAM2[31]<=32'b00000000000000001010101111001101;//00000000000000000001001000110100;
    end
  always @(posedge clk)  //每个时钟状态出发    将当前5个按键的状态存入ram[8]  拨码的状态存入ram[13][12]
  begin
  if(btn[1]==1) RAM2[8]=8;
  else if(btn[0]==1)    RAM2[8]=16; //左键
  else if(btn[2]==1)   RAM2[8]=4;
  else if(btn[3]==1)    RAM2[8]=2;
  else if(btn[4]==1)    RAM2[8]=1;
  else  RAM2[8]=0;
  //RAM2[8]=btn[4:0];
  //RAM2[13]=SW[7:0];
  RAM2[12]=SW[15:0];       //增加的代码
  if(regwrite)
    RAM2[wa]<=wd;
    
    end
  assign rd1 =ra1 ? RAM2[ra1]:0;  //由指令的[25:21]为决定数据rd1
  assign rd2 =ra2 ? RAM2[ra2]:0;	//由指令的[20:16]为决定数据rd2
  assign rd3 =RAM2[16];				//rd3由内存中的一个字决定    只要将内存改写就可以用display显示
  assign rd4 =RAM2[27];
  assign rd5=RAM2[28];
  assign rd6=RAM2[29];
  assign rd7=RAM2[30];
  
endmodule

//zerodetect  ???????0???beq??
module zerodetect #(parameter WIDTH=32)
    (input [WIDTH-1:0] a,
    output y);
    assign y= (a==0);
endmodule
//flop ????
module flop #(parameter WIDTH =32)
    (input clk,
     input [WIDTH-1:0] d,
     output reg [WIDTH-1:0] q);
  always @(posedge clk)
  q<=d;
endmodule
//flopen
module flopen #(parameter WIDTH =32)
   (input clk,en,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q);
  always @(posedge clk)
  if(en)
    q<=d;
endmodule
//flopenr
module flopenr #(parameter WIDTH =32)
    (input clk,reset,en,
     input [WIDTH-1:0] d,
     output reg [WIDTH-1:0] q);
  always @(posedge clk)
  if(reset)
    q<=0;
  else
    if(en)
      q<=d;
endmodule
//mux2
module mux2 #(parameter WIDTH =32)
    (input [WIDTH-1:0] d0,d1,
     input s,
     output [WIDTH-1:0] y);
 assign y= s ? d1:d0;
endmodule
//mux4
module mux4 #(parameter WIDTH =32)
    (input [WIDTH-1:0] d0,d1,d2,d3,
     input [1:0] s,
     output reg [WIDTH-1:0] y);
     always @(*)
  case(s)
  2'b00: y<= d0;
  2'b01: y<= d1;
  2'b10: y<= d2;
  2'b11: y<= d3;
  endcase
endmodule
