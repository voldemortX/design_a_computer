`timescale 1ns/1ns

module computer_t();
    // concerning cpu & memory
    reg clk, reset;
    
    // concerning I/O
    reg[3: 0] keys;
    wire[15: 0] led;
    wire[3: 0] cs;
    wire[7: 0] digit;
    parameter delay = 15000000;
    computer #(32, 5) little_pc(
        .clk(clk),
        .reset(reset),
        .keys(keys),
        .led(led),
        .cs(cs),
        .digit(digit)
        );
        
    always #5 clk = ~clk;
    initial
    begin reset = 0; clk = 0; keys = 4'b0000; 
        #200
        reset = 1;
        #200
        reset = 0;
        #delay
        keys = 4'b0001;
        #delay
        keys = 4'b0000;
        #delay
        keys = 4'b0010;
        #delay
        keys = 4'b0000;
    end

endmodule
