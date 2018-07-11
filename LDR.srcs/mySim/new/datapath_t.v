`timescale 1ns/1ns

module datapath_t();
    parameter width = 32, bits = 5;
    parameter cycle = 10;
    reg[2: 0] ALUCon;
    reg[1: 0] PCsrc;
    reg Pcen;
    reg[1: 0] Regsrc;
    reg[1: 0] ALUsrca;
    reg[1: 0] ALUsrcb;
    reg RegWrite;
    reg[1: 0] RegDst;
    reg IRWrite;
    reg IorD;
    wire[5: 0] funct;
    wire[5: 0] Op;
    wire Zero;
    
    // concerning Memory
    reg[width - 1: 0] ReadData;
    wire[width - 1: 0] WriteData;
    wire[width - 1: 0] Address;
    
    // other wires
    reg clk;
    reg reset; 
    
    datapath #(width, bits) m(
        .clk(clk),
        .reset(reset),
        .ALUCon(ALUCon),
        .PCsrc(PCsrc),
        .Pcen(Pcen),
        .Regsrc(Regsrc),
        .ALUsrca(ALUsrca),
        .ALUsrcb(ALUsrcb),
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .IRWrite(IRWrite),
        .IorD(IorD),
        .funct(funct),
        .Op(Op),
        .Zero(Zero)
    );
    
    always #cycle clk = ~clk;
    initial
    begin clk = 0; reset = 0;
        #20
        reset = 1;
        #20
        reset = 0; 
    end

endmodule