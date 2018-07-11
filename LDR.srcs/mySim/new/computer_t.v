`timescale 1ns/1ns

module computer_t();
    // concerning cpu & memory
    reg clk, reset;
    
    // concerning I/O
    reg[4: 0] keys;
    wire[15: 0] led;
    wire[3: 0] cs1;
    wire[7: 0] digit1;
    wire[3: 0] cs2;
    wire[7: 0] digit2;
    
    computer #(32, 5) little_pc(
        .clk(clk),
        .reset(reset),
        .keys(keys),
        .led(led),
        .cs1(cs1),
        .digit1(digit1),
        .cs2(cs2),
        .digit2(digit2)
        );
        
    always #5 clk = ~clk;
    initial
    begin reset = 0; clk = 0;
        #200
        reset = 1;
        #200
        reset = 0;
        #2000
        keys = 5'b00001;
        #2000
        keys = 5'b00000;
    end

endmodule
