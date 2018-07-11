module alu_t(

    );
    reg[31:0] a,b;
    reg[2:0]  ALUCon;
    wire[31:0] result;
    wire zero;
    initial
    begin
    a <= 32'h55555555;
    b <= 32'haaaaaaaa;
    ALUCon <= 3'b000;
    #100
    a <= 32'h55555555;
    b <= 32'h00000001;
    ALUCon <= 3'b001;
    #100
    a <= 32'haaaaaaaa;
    b <= 32'h00000001;
    ALUCon <= 3'b010;
    #100
    a <= 32'hffffffff;
    b <= 32'hfffffff0;
    ALUCon <= 3'b011;
    #100
    a <= 32'hffffffff;
    b <= 32'h0000000f;
    ALUCon <= 3'b100;
    #100
    a <= 32'hfffffff0;
    b <= 32'h00000000;
    ALUCon <= 3'b101;
    #100
    a <= 32'h11111111;
    b <= 32'h11111111;
    ALUCon <= 3'b110;
    end
    alu myalu(.a(a),.b(b),.ALUCon(ALUCon),.result(result),.zero(zero));
endmodule
