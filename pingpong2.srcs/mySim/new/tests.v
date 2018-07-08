module tests();

    reg[31: 0] in;
    wire[31: 0] out;
    assign out = {{26{in[10]}}, in[10: 6]};
    initial
    begin
        in <= 32'b0000011111001001101110101000100;
    end

endmodule