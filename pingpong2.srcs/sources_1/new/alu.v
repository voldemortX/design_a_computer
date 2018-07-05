module alu(
    input [31:0] a,b,
    input [2:0]  alucont,
    output reg [31:0] result,
    output reg zero
    );
    always @(*)
    begin
        case(alucont)
            3'b000: result = a+b;
            3'b001: result = {a[30:0],a[31]};
        endcase
        if (result)  zero = 0;
        else  zero = 1;
    end
endmodule
