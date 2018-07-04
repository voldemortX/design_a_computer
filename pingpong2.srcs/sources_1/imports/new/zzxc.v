`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Members:zhengjiahui jiaozhengang huyijie 
// Create Date:2017.7.11
// Project Name: zzxc
//
//////////////////////////////////////////////////////////////////////////////////


module top #(parameter WIDTH =32 )(seg7,scan,clk,switches,btnc,btnr,led,btr22);
  output [7:0]seg7;
  output [15:0]led;
  input  clk;
  output [3:0]scan;
  input  [15:0] switches;
  input  btnc;  //used for calculate
  input  btnr;  //used for reset
  reg   [15:0]led_r;
  reg  reset;
  wire memread,memwrite;
  wire [WIDTH-1:0] adr,writedata;
  wire [WIDTH-1:0] memdata;
  wire [WIDTH-1:0] rd3;
  wire [3:0] scan ;
  wire [7:0] seg7 ;
  reg  count1=0;
  reg  clk1=0;
  assign    led=led_r[15:0];
  always @ (posedge clk)
  begin 
      if(count1==1)
      begin 
            clk1 <= ~clk1;
            count1 <= 0;
      end
      else
      begin 
            count1<=count1+1;
      end
  end
 
  mips     #(WIDTH) dut(clk1,reset,memdata,memread,memwrite,adr,writedata,rd3,switches,btnc,btnr);
  exmemory #(WIDTH) exmem(clk1,reset,memwrite,adr,writedata,memdata);
  display           result_disp(clk1,rd3,seg7,scan);
//  paomadeng         aa(clk1,btr22,led);
 /* always@(posedge clk)
   begin 
    led_r<=led_r<<1;
    if(led_r == 16'b0000000000000000)
     led_r <= 16'b1111111111111111;
   end*/
  initial
    begin
	  reset <= 0;
	  clk1  <= 0;
    end
endmodule
module paomadeng(     
	 input clk,     
	 input [1:0] sel,     
	 output [15:0] led 
    );
	reg[15:0] led;
	reg[15:0] led_r,led_r1;
	reg cnt1,dir;               //cnt1控制状态2 led灯的亮次数     
	reg[3:0] cnt2;              //cnt2控制状态2 led灯的亮次数     
	reg[2:0] cnt3;               //cnt3控制状态2 led灯的亮次数     
	reg[25:0] divclk_cnt;
	reg divclk;

	
	always@(posedge clk)                 //把系统时钟分频     
		begin      
			if(divclk_cnt==26'd12000000)         
				begin             
					divclk =~ divclk;             
					divclk_cnt = 0;         
				end      
			else         
				begin       
			divclk_cnt = divclk_cnt+1'b1;         
				end      
		end

		
	always@(posedge divclk)
	begin  
	  case(sel) 
          // LED按奇数，偶数依次显示 
       2'b00:
		begin 
        led_r=16'b0101010101010101;
		if(cnt1==0)led<=led_r;
		else led<=led_r<<1;
		cnt1<=cnt1+1;
		end 
           // LED从右到左依次点亮，全部点亮后依次熄灭 
      2'b01: 
        begin
			if(!dir)
				begin
				if(cnt2==0) begin led_r=16'b0000000000000001;led<=led_r;end
				else begin led<=(led<<1)+led_r;end
				if(cnt2==15) begin dir<=~dir;end
				cnt2<=cnt2+1;
				end
			else          
			begin            
				if(cnt2==0) begin led_r=16'b1111111111111110;led<=led_r;end
				else begin led<=led<<1; end
				if(cnt2==15) begin dir<=~dir;end
				cnt2<=cnt2+1;
				end
			end
			2'b10:
			begin
				if(!dir)
					begin 
						if(cnt2==0) begin led_r=16'b1000000000000000;led<=led_r;end
						else begin led<=(led>>1)+led_r;end
						if(cnt2==15) begin dir<=~dir;end
						cnt2<=cnt2+1;
						end
					else
				begin
				if(cnt2==0) begin
				led_r=16'b0111111111111111;led<=led_r;end
				else begin led<=led>>1; end
				if(cnt2==15) begin dir<=~dir;end
				cnt2<=cnt2+1;
				end
			end     
     // LED由两侧向中间依次显示，由中间向两侧依次熄灭 
	   2'b11:
		begin
			if(!dir)
				begin
					if(cnt3==0) begin
						led_r=16'b0000000000000001;
						led_r1=16'b1000000000000000;end
					else  
            begin led_r=(led_r<<1)|led_r;
				led_r1=(led_r1>>1)|led_r1;end
				led<=led_r|led_r1;
				if(cnt3==7)begin dir<=~dir;end
				cnt3<=cnt3+1;
			end
            else
			begin
			if(cnt3==0) begin led_r=16'b1111111111111110;
			led_r1=16'b0111111111111111;end
			else
				begin led_r=led_r<<1;led_r1=led_r1>>1;end
				led<=led_r&led_r1;
				if(cnt3==7)begin dir<=~dir;end
				cnt3<=cnt3+1;
				end
			end
				default: ;
			endcase
		end 
	endmodule 

//display
module display #(parameter WIDTH =32 )
    (input  clk,
     input  [31:0] result,
     output reg [7:0] seg7,
     output reg [3:0] scan);
    
    reg clk1khz = 0;
    reg [3:0]  data;
    reg [1:0]  cnt = 0;
    reg [14:0] count1 = 0;
    reg [31:0] res; //caching the binary result
    reg [15:0] bcd; //decimal output
    
    //binary to decimal
    always @ (posedge clk)
    begin
        res = result;
        bcd = 0;
        
        repeat(15)
        begin
            bcd[0] = res[15];
            if(bcd[3:0] > 4)
                bcd[3:0] = bcd[3:0] + 4'd3;
            if(bcd[7:4] > 4)
                bcd[7:4] = bcd[7:4] + 4'd3;
            if(bcd[11:8] > 4)
                bcd[11:8] = bcd[11:8] + 4'd3;
            if(bcd[15:12] > 4)
                bcd[15:12] = bcd[15:12] + 4'd3;
            bcd = bcd << 1;
            res = res << 1;
        end
        bcd[0] = res[15];
    end

    always @ (posedge clk)
    begin 
	   if(count1 == 25000)
		  begin clk1khz <= ~clk1khz;
		      count1 <= 0;
		  end
	   else
		  begin 
		      count1 <= count1 + 1;
		  end
    end

    always @(posedge clk1khz)
    begin
	   if(cnt == 3)
	   begin 
	       cnt <= 0;
       end
	   else
	   begin 
	       cnt <= cnt + 1;
	   end
    end  
 
    always @ (*)
    begin
        case(cnt)
           2'b00:
                 begin
                    data[3:0] <= bcd[3:0];
                    scan[3:0] <= 4'b1110;
                 end
           2'b01:
                 begin
                    if(result[31:0] <= 9)
                    begin
                        data[3:0] <= 4'b1111;
                    end
                    else
                    begin
                        data[3:0] <= bcd[7:4];
                    end
                    
                    scan[3:0] <= 4'b1101;
                 end
           2'b10:
                 begin
                    if(result[31:0] <= 99) 
                    begin
                        data[3:0] <= 4'b1111;
                    end
                    else
                    begin
                        data[3:0] <= bcd[11:8];
                    end

                    scan[3:0] <= 4'b1011;
                 end
           2'b11:
                 begin
                    if(result[31:0] <= 999)
                    begin
                        data[3:0] <= 4'b1111;
                    end
                    else
                    begin
                        data[3:0] <= bcd[15:12];
                    end 

                    scan[3:0] <= 4'b0111;
                 end
           endcase  
           
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
           //4'b1010:seg7[7:0]=8'b10001000;//a
           //4'b1011:seg7[7:0]=8'b10000011;//b
           //4'b1100:seg7[7:0]=8'b11000110;//c
           //4'b1101:seg7[7:0]=8'b10100001;//d
           //4'b1110:seg7[7:0]=8'b10000110;//e
           //4'b1111:seg7[7:0]=8'b11111111;//f
           4'b1111:seg7[7:0]=8'b11111111;
           default:seg7[7:0]=8'b11111111;
       endcase
       
                  
    end
endmodule
//external memory
module exmemory #(parameter WIDTH =32)
    (input  clk,
     input  reset,
     input  memwrite,                   //control the mem to write
     input  [WIDTH-1:0] adr,            //address            
     input  [WIDTH-1:0] writedata,      //datainput
     output reg [WIDTH-1:0] memdata);   //dataouput
 
  reg  [31:0] ROM [1023:0]; //for system instructions
  wire [31:0] word;
  
  initial
  begin
	 $readmemh("D:/GCD.dat",ROM);
  end
  
  always @ (posedge clk)
  if(memwrite)
    ROM[adr] <= writedata;
    
  assign word = ROM[adr];
  
  always @ (*)
	memdata <= word;
endmodule
//mips
module mips #(parameter WIDTH=32)
    (input  clk,reset,
     input  [WIDTH-1:0] memdata,
     output memread,memwrite,
     output [WIDTH-1:0] adr,writedata,rd3,
     input  [15:0] switches,
     input  btnc,
     input  btnr);
     
  wire [31:0] instr; //IR
  wire memtoreg,irwrite,iord,pcen,regwrite,regdst,zero;
  wire [1:0] alusrca,alusrcb,pcsource;
  wire [5:0] aluop;
  //CU
  controller cont(clk,reset,instr[31:26],instr[5:0],
    zero,memread,memwrite,memtoreg,iord,irwrite,
    pcen,regwrite,regdst,pcsource,alusrca,alusrcb,
    aluop);
  //datapath
  datapath #(WIDTH) dp(clk,reset,memdata,memtoreg,iord,pcen,regwrite,regdst,
    irwrite,alusrca,alusrcb,pcsource,aluop,zero,
    instr,adr,writedata,rd3,switches,btnc,btnr);
  
endmodule
//CU
module controller
    (input  clk,reset,
     input  [5:0] op,
     input  [5:0] func,
     input  zero,
     output reg memread,memwrite,memtoreg,iord,irwrite,
     output pcen,
     output reg regwrite,regdst,
     output reg [1:0] pcsource,alusrca,alusrcb,
     output reg [5:0] aluop);
  //state
  parameter FETCHS       = 4'b0000;
  parameter DECODES      = 4'b0001;
  parameter MTYPES       = 4'b0010;
  parameter ITYPES       = 4'b0011;
  parameter JRUMPS       = 4'b0100;
  parameter BEQS         = 4'b0101;
  parameter BLTZS        = 4'b0110;
  parameter BGTZS        = 4'b0111;
  parameter JUMPS        = 4'b1000;
  parameter ReadMS       = 4'b1001;
  parameter WriteMS      = 4'b1010;
  parameter IWriteToRegS = 4'b1011;
  parameter RITYPES      = 4'b1100;
  parameter ROTYPES      = 4'b1101;
  parameter MWriteToRegS = 4'b1110;
  parameter RWriteToRegS = 4'b1111;
  //OP[5:0]
  parameter RType   =6'b000000;
  parameter Bltzop  =6'b000001;
  parameter Jop     =6'b000010;
  parameter Beqop   =6'b000100;
  parameter Bgtzop  =6'b000111;
  parameter Addiop  =6'b001000;
  parameter Addiuop =6'b001001;
  parameter Sltiop  =6'b001010;
  parameter Adiop   =6'b001100;
  parameter Oriop   =6'b001101;
  parameter Xoriop  =6'b001110;
  parameter Luiop   =6'b001111;
  parameter Lwop    =6'b100011;
  parameter Swop    =6'b101011;
  //func[5:0]
  parameter Func1  =6'b000000;  //sll
  parameter Func2  =6'b000010;  //srl
  parameter Func3  =6'b000011;  //sra
  parameter Func4  =6'b000100;  //sllv
  parameter Func5  =6'b000111;  //srav
  parameter Func6  =6'b001000;  //jr
  parameter Func7  =6'b100000;  //add
  parameter Func8  =6'b100001;  //addu
  parameter Func9  =6'b100010;  //sub
  parameter Func10 =6'b100011;  //subu
  parameter Func11 =6'b100110;  //xor
  parameter Func12 =6'b100100;  //and
  parameter Func13 =6'b100101;  //or
  parameter Func14 =6'b100111;  //nor
  parameter Func15 =6'b101010;  //slt
  parameter Func16 =6'b101011;  //sltu
  
  reg [3:0] state,nextstate;
  reg pcwrite,pcwritecond;
  
  always @(posedge clk )
  begin
    if(reset)
      state <= FETCHS;
    else
      state <= nextstate;
  end
  
  always @(*)
  begin
    case(state)
      FETCHS : nextstate <= DECODES;
      DECODES: case(op)
                  RType:
                    case(func)
                      Func1: nextstate <=RITYPES;
                      Func2: nextstate <=RITYPES;
                      Func3: nextstate <=RITYPES;
                      Func4: nextstate <=ROTYPES;
                      Func5: nextstate <=ROTYPES;
                      Func6: nextstate <=JRUMPS;
                      Func7: nextstate <=ROTYPES;
                      Func8: nextstate <=ROTYPES;
                      Func9: nextstate <=ROTYPES;
                      Func10: nextstate<=ROTYPES;
                      Func11: nextstate<=ROTYPES;
                      Func12: nextstate<=ROTYPES;
                      Func13: nextstate<=ROTYPES;
                      Func14: nextstate<=ROTYPES;
                      Func15: nextstate<=ROTYPES;
                      Func16: nextstate<=ROTYPES;
                    endcase
                  Bltzop:  nextstate<=BLTZS;
                  Jop:     nextstate<=JUMPS;
                  Beqop:   nextstate<=BEQS;
                  Bgtzop:  nextstate<=BGTZS;
                  Addiop:  nextstate<=ITYPES;
                  Addiuop: nextstate<=ITYPES;
                  Sltiop:  nextstate<=ITYPES;
                  Adiop:   nextstate<=ITYPES;
                  Oriop:   nextstate<=ITYPES;
                  Xoriop:  nextstate<=ITYPES;
                  Luiop:   nextstate<=ITYPES;
                  Lwop:    nextstate<=MTYPES;
                  Swop:    nextstate<=MTYPES;
                  default: nextstate<=FETCHS;
                  endcase
        ITYPES:  nextstate<=IWriteToRegS;
        RITYPES: nextstate<=RWriteToRegS;
        ROTYPES: nextstate<=RWriteToRegS;
        BLTZS:   nextstate<=FETCHS;
        BEQS:    nextstate<=FETCHS;
        BGTZS:   nextstate<=FETCHS;
        JUMPS:   nextstate<=FETCHS;
        JRUMPS:  nextstate<=FETCHS;
        MTYPES:  case(op)
                  Lwop:
                    nextstate<=ReadMS;
                  Swop:
                    nextstate<=WriteMS;
                  endcase
        ReadMS:       nextstate<=MWriteToRegS;
        WriteMS:      nextstate<=FETCHS;
        IWriteToRegS: nextstate<=FETCHS;
        MWriteToRegS: nextstate<=FETCHS;
        RWriteToRegS: nextstate<=FETCHS;
        default:      nextstate<=FETCHS;
    endcase
  end
    
  always @(*)
  begin
    irwrite  <= 0;
    pcwrite  <= 0; 
    pcwritecond <= 0;
    regwrite <= 0; 
    regdst   <= 0;
    memread  <= 0; 
    memwrite <= 0;
    alusrca  <= 2'b00; 
    alusrcb  <= 2'b00; 
    aluop    <= 6'b100000;
    pcsource <= 2'b00;
    iord     <= 0; 
    memtoreg <= 0;
    
    case(state)
      FETCHS:
        begin
          iord     <=0;
          irwrite  <=1;
          memread  <=1;
          memwrite <=0;
          alusrca  <=2'b00;
          alusrcb  <=2'b01;
          pcsource <=2'b00;
          pcwrite  <=1;
          aluop    <=6'b100000;
        end
      DECODES:
        begin
          aluop   <=6'b100000;
          alusrca <=2'b00;
          alusrcb <=2'b11;
        end
      MTYPES:
        begin
          alusrca <=2'b01;
          alusrcb <=2'b11;
          aluop   <=6'b100000;
        end
      ITYPES:
        begin
          alusrca <=2'b01;
          alusrcb <=2'b11;
          case(op)
            Addiop:
              aluop <=6'b100000;
            Addiuop:
              aluop <=6'b100001;
            Sltiop:
              aluop <=6'b101010;
            Adiop:
              aluop <=6'b100100;
            Oriop:
              aluop <=6'b100101;
            Xoriop:
              aluop <=6'b100110;
            Luiop:
              aluop <=6'b010001;
          endcase
        end
      JRUMPS:
        begin
          pcwrite  <=1;
          pcsource <=2'b11;
        end
      BEQS:
        begin
          alusrca     <=2'b01;
          alusrcb     <=2'b00;
          aluop       <=6'b100010;
          pcsource    <=2'b01;
          pcwritecond <=1;
        end
      BLTZS:
        begin
          alusrca     <=2'b01;
          alusrcb     <=2'b00;
          aluop       <=6'b000001;
          pcsource    <=2'b01;
          pcwritecond <=1;
          pcwrite     <=0;
        end
      BGTZS:
        begin
          alusrca     <=2'b01;
          alusrcb     <=2'b00;
          aluop       <=6'b001010;
          pcsource    <=2'b01;
          pcwritecond <=1;
          pcwrite     <=0;
        end
      JUMPS:
        begin
          pcwrite  <=1;
          pcsource <=2'b10;
        end
      ReadMS:
        begin
          memread <=1;
          iord    <=1;
        end
      WriteMS:
        begin
          memwrite <=1;
          iord     <=1;
        end
      IWriteToRegS:
        begin
          memtoreg <=0;
          regwrite <=1;
          regdst   <=0;
        end
      RITYPES:
        begin
          alusrca <=2'b10;
          alusrcb <=2'b00;
          case(func)
            Func1: aluop<=6'b000000;
            Func2: aluop<=6'b000010;
            Func3: aluop<=6'b000011;
          endcase
        end
      ROTYPES:
        begin
          alusrca<=2'b01;
          alusrcb<=2'b00;
          case(func)
            Func4: aluop <=6'b000000;
            Func5: aluop <=6'b000010;
            Func7: aluop <=6'b100000;
            Func8: aluop <=6'b100001;
            Func9: aluop <=6'b100010;
            Func10:aluop <=6'b100011;
            Func11:aluop <=6'b100110;
            Func12:aluop <=6'b100100;
            Func13:aluop <=6'b100101;
            Func14:aluop <=6'b100111;
            Func15:aluop <=6'b101010;
            Func16:aluop <=6'b101011;
          endcase
        end
      MWriteToRegS:
        begin
          regdst   <=0;
          regwrite <=1;
          memtoreg <=1;
        end
      RWriteToRegS:
        begin
          regdst   <=1;
          regwrite <=1;
          memtoreg <=0;
        end
      endcase
    end
    
  assign pcen =pcwrite | (pcwritecond & zero);
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
     output [WIDTH-1:0] adr,writedata,rd3,
     input  [15:0]switches,
     input  btnc,
     input  btnr);
     
  parameter CONST_ZERO = 32'b0;
  parameter CONST_ONE = 32'b1;
  wire [4:0] ra1,ra2,wa;
  wire [WIDTH-1:0] pc,nextpc,md,rd1,rd2,wd,a,src1,src2,aluresult,aluout;
  wire [31:0] jp1;
  assign jp1 ={6'b000000,instr[25:0]};
  wire [31:0] ta1,ta2;
  assign ta1 ={27'b0,instr[10:6]};
  assign ta2 ={16'b0,instr[15:0]};
  assign ra1 =instr[25:21];
  assign ra2 =instr[20:16];
  
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
  regfile #(WIDTH) rf(clk,reset,regwrite,ra1,ra2,wa,wd,rd1,rd2,rd3,switches,btnc,btnr);
  alu #(WIDTH) alunit(src1,src2,aluop,aluresult);
  zerodetect #(WIDTH) zd(aluresult,zero);
endmodule
//ALU
module alu #(parameter WIDTH=32)
      (input [WIDTH-1:0] a,b,
       input [5:0] aluop,
       output reg [WIDTH-1:0] result);
       
  wire [30:0] b2;
  assign b2=a[30:0];
  wire [WIDTH-1:0] sum,slt,shamt;
  
  always @(*)
  begin
  case(aluop)
    6'b000000: result <= (b<<a);
    6'b000010: result <= (b>>a);
    6'b000011: result <= (b>>>a);
    6'b001000: result <= 32'b0;
    6'b100000: result <= (a+b);
    6'b100001: result <= (a+b);
    6'b100010: result <= (a-b);
    6'b100011: result <= (a-b);
    6'b100110: result <= (a^b);
    6'b100100: result <= (a&b);
    6'b100101: result <= (a|b);
    6'b100111: result <= ~(a&b);
    6'b101010: result <= (a<b ? 1 : 0);
    6'b101011: result <= (a<b ? 1 : 0);
    6'b000001: //Bltz
		begin
			result<=(a<0 ? 0:1);
		end
    6'b001010: //Bgtz
		begin
			result<=(a>0 ? 0:1);
		end
	6'b010001: result<=((b<<16) & 32'b11111111111111110000000000000000);//LUI
  endcase
  end
endmodule
//regfile
module regfile #(parameter WIDTH=32,REGBITS=5)
      (input  clk,
       input  reset,
       input  regwrite,
       input  [REGBITS-1:0] ra1,ra2,wa,
       input  [WIDTH-1:0] wd,
       output [WIDTH-1:0] rd1,rd2,rd3,
       input  [15:0]switches,
       input  btnc,
       input  btnr);
       
  reg [WIDTH-1:0] RAM2 [(1<<REGBITS)-1:0];
  initial
  begin
	RAM2[0] <=32'b00000000000000000000000000000000;
	RAM2[1] <=32'b11111111111111111111111111111111;
    RAM2[30]<=32'b00000000000000000000000000000000;
  end
    
  always @(posedge clk)
  begin
   if(btnc == 1)    //for calculation
   begin
        RAM2[4]  <= switches[15:8]; //dividend
        RAM2[5]  <= switches[ 7:0]; //divisor
        RAM2[30] <= 32'b11111111111111111111111111111111;
   end
   if(btnr == 1)    //for reset
   begin
        RAM2[30] <= 32'b00000000000000000000000000000000;
        RAM2[3]  <= 32'b00000000000000000000000000000000;
        RAM2[4]  <= 32'b00000000000000000000000000000000;
        RAM2[5]  <= 32'b00000000000000000000000000000000;
   end
   if(regwrite)
        RAM2[wa] <= wd;
  end
    
  assign rd1 = ra1 ? RAM2[ra1] : 0;
  assign rd2 = ra2 ? RAM2[ra2] : 0;
  assign rd3 = RAM2[3]; //return the result
endmodule
//zerodetect
module zerodetect #(parameter WIDTH=32)
    (input [WIDTH-1:0] a,
    output y);
    assign y = (a==0);
endmodule
//flop
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
    q <= d;
endmodule
//flopenr
module flopenr #(parameter WIDTH =32)
    (input clk,reset,en,
     input [WIDTH-1:0] d,
     output reg [WIDTH-1:0] q);
     
  always @(posedge clk)
  begin
    if(reset)
        q<=0;
    else
        if(en)
            q<=d;
  end
endmodule
//mux2
module mux2 #(parameter WIDTH =32)
    (input [WIDTH-1:0] d0,d1,
     input s,
     output [WIDTH-1:0] y);
 assign y= s ? d1 : d0;
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
