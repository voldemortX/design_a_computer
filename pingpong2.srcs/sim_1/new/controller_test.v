`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/08 12:44:56
// Design Name: 
// Module Name: controller_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller_test(

    );
    reg clk,reset;
    reg [5:0] op,funct;
    reg zero;
    wire pcen;
    wire MEMR,MEMW,RegWrite,IorD,IRWrite;
    wire [2:0] ALUCon;
    wire [1:0] PCsrc,Regsrc,ALUsrca,ALUsrcb,RegDst;
    controller mycontroller(.clk(clk),.reset(reset),.op(op),.funct(funct),.zero(zero),.pcen(pcen),.MEMR(MEMR),.MEMW(MEMW),.RegWrite(RegWrite),.IorD(IorD),.IRWrite(IRWrite),.ALUCon(ALUCon),.PCsrc(PCsrc),.Regsrc(Regsrc),.ALUsrca(ALUsrca),.ALUsrcb(ALUsrcb),.RegDst(RegDst));
    initial
        begin 
            clk = 1;
            reset = 0;
            #100
                op = 6'b000000;
                funct = 6'b010100;
                zero = 0;
        end
        always 
            #10 clk = ~clk;
    
endmodule
