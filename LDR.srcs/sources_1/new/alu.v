module alu(
    input [31:0] a,b,
    input [2:0]  ALUCon,
    output reg [31:0] result,
    output reg zero
    );
    always @(*)
    begin
        case(ALUCon)
            3'b000: result = a + b;
            3'b001: result = b << a;
            3'b010: result = b >> a;
            3'b011: result = a ^ b;
            3'b100: result = a & b;
            3'b101: result = a | b;
            3'b110: result = a - b;
        endcase
        if (result)  zero = 0;
        else  zero = 1;
    end
endmodule
