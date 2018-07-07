module flop_t();
    parameter cycle = 10;
    reg clk, reset;
    reg[31: 0] in;
    wire[31: 0] out;
    reg en;
    flopenr pc(.clk(clk), .reset(reset), .d(in), .q(out), .en(en));
    always #cycle clk <= ~clk; 
    initial
    begin clk = 0; reset = 1;
        #15
        reset = 0; en = 1; in = 32'h55555555;
        #cycle
        reset = 0; en = 1; in = 32'h55555555;
        #cycle
        reset = 0; en = 0; in = 32'h55555555;
        #cycle
        reset = 0; en = 0; in = 32'hffffffff;
        #cycle
        $stop;
    end
    
    
endmodule