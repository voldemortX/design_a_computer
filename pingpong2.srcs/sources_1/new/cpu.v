module cpu #(parameter width = 32, bits = 5)(
    input clk, reset,
    input[width - 1: 0] ReadData,
    output wire[width - 1: 0] WriteData, Address,
    output wire MEMR, MEMW
    );
    
    wire [5:0] Op,funct;
    wire Zero;
    wire Pcen;
    wire RegWrite, IorD, IRWrite;
    wire[2:0] ALUCon;
    wire[1:0] PCsrc, Regsrc, ALUsrca, ALUsrcb, RegDst;
    
    datapath #(width, bits) dp(
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
        .Zero(Zero),
        .ReadData(ReadData),
        .WriteData(WriteData),
        .Address(Address),
        .clk(clk),
        .reset(reset)
        );
        
    controller cu(
        .clk(clk),
        .reset(reset),
        .op(Op),
        .funct(funct),
        .zero(Zero),
        .pcen(Pcen),
        .MEMR(MEMR),
        .MEMW(MEMW),
        .ALUCon(ALUCon), 
        .PCsrc(PCsrc), 
        .Regsrc(Regsrc), 
        .ALUsrca(ALUsrca), 
        .ALUsrcb(ALUsrcb),
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .IRWrite(IRWrite),
        .IorD(IorD)
        );

endmodule