module mux2 #(parameter width = 32)(
    input[width - 1: 0] in0,
    input[width - 1: 0] in1,
    input select,
    output reg[width - 1: 0] out
    );
    
    always @(*)  // combinational logic
    begin
        case(select)
            1'b0: out <= in0;
            1'b1: out <= in1;
        endcase
    end

endmodule