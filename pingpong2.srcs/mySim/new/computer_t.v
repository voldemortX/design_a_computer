`timescale 1ns/1ns

module computer_t();
    // concerning cpu & memory
    reg clk, reset;
    
    // concerning I/O
    reg[3: 0] keys;
    wire[15: 0] led;
    wire[3: 0] cs;
    wire[7: 0] digit;
    
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
    begin reset = 0; clk = 0;
        #200
        reset = 1;
        #200
        reset = 0;
        
    end

endmodule
