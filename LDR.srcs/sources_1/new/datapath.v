// wire up everything

module datapath #(parameter width = 32, bits = 5)(
    // concerning CU
    input[2: 0] ALUCon,
    input[1: 0] PCsrc,
    input Pcen,
    input[1: 0] Regsrc,
    input[1: 0] ALUsrca,
    input[1: 0] ALUsrcb,
    input RegWrite,
    input[1: 0] RegDst,
    input IRWrite,
    input IorD,
    output wire[5: 0] funct,
    output wire[5: 0] Op,
    output wire Zero,
    
    // concerning Memory
    input[width - 1: 0] ReadData,
    output wire[width - 1: 0] WriteData,
    output wire[width - 1: 0] Address,
    
    // other wires
    input clk,
    input reset
    );
    
    // internal wires
    wire[width - 1: 0] MUX_PCsrc_out, PC_out;   
    wire[width - 1: 0] MDR_out;
    wire[width - 1: 0] IR_out;
    wire[bits - 1: 0] MUX_RegDst_out;
    wire[width - 1: 0] MUX_Regsrc_out, Registers_Rd1, Registers_Rd2;
    wire[width - 1: 0] A_out, B_out;
    wire[width - 1: 0] MUX_ALUsrca_out, MUX_ALUsrcb_out, ALU_result;
    wire[width - 1: 0] ALUOut_out;
    
    // extension hardwares
    wire[width - 1: 0] Logic_extend, Sign_extend, PC_extend;
    assign Logic_extend = {{26{1'b0}}, IR_out[10: 6]};
    assign Sign_extend = {{16{IR_out[15]}}, IR_out[15: 0]};
    assign PC_extend = {PC_out[31: 26], IR_out[25: 0]};
    assign Op = IR_out[31: 26];
    assign funct = IR_out[5: 0];
    assign WriteData = B_out;
    
    // registers & ALU
    flopenr #(width) PC(.clk(clk), .d(MUX_PCsrc_out), .q(PC_out), .en(Pcen), .reset(reset));
    flop #(width) MDR(.clk(clk), .d(ReadData), .q(MDR_out));
    flopen #(width) IR(.clk(clk), .d(ReadData), .q(IR_out), .en(IRWrite));
    regfile Registers(.clk(clk), .regwrite(RegWrite), .ra1(IR_out[25: 21]), .ra2(IR_out[20: 16]), .wa(MUX_RegDst_out), .wd(MUX_Regsrc_out), .rd1(Registers_Rd1), .rd2(Registers_Rd2));  // general registers
    flop #(width) A(.clk(clk), .d(Registers_Rd1), .q(A_out));
    flop #(width) B(.clk(clk), .d(Registers_Rd2), .q(B_out));
    alu ALU(.a(MUX_ALUsrca_out), .b(MUX_ALUsrcb_out), .result(ALU_result), .zero(Zero), .ALUCon(ALUCon));  // ALU
    flop #(width) ALUOut(.clk(clk), .d(ALU_result), .q(ALUOut_out));
    
    // muxes
    mux2 #(width) MUX_IorD(.in0(PC_out), .in1(ALUOut_out), .out(Address), .select(IorD));
    mux3 #(bits) MUX_RegDst(.in0(IR_out[20: 16]), .in1(IR_out[15: 11]), .in2(5'b11111), .out(MUX_RegDst_out), .select(RegDst));
    mux3 #(width) MUX_Regsrc(.in0(MDR_out), .in1(PC_out), .in2(ALUOut_out), .out(MUX_Regsrc_out), .select(Regsrc));
    mux3 #(width) MUX_ALUsrcb(.in0(B_out), .in1(Sign_extend), .in2(32'h00000001), .out(MUX_ALUsrcb_out), .select(ALUsrcb));
    mux3 #(width) MUX_ALUsrca(.in0(PC_out), .in1(A_out), .in2(Logic_extend), .out(MUX_ALUsrca_out), .select(ALUsrca));
    mux4 #(width) MUX_PCsrc(.in0(A_out), .in1(PC_extend), .in2(ALU_result), .in3(ALUOut_out), .out(MUX_PCsrc_out), .select(PCsrc));

endmodule