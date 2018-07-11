module mux4 #(parameter width = 32)(
    input[width - 1: 0] in0,
    input[width - 1: 0] in1,
    input[width - 1: 0] in2,
    input[width - 1: 0] in3,
    input[1: 0] select,
    output reg[width - 1: 0] out
    );
    
    always @(*)  // combinational logic
    begin
        case(select)
            2'b00: out <= in0;
            2'b01: out <= in1;
            2'b10: out <= in2;
            2'b11: out <= in3;
        endcase
    end

endmodule