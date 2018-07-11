module mux_t();
    parameter delay = 5;
    parameter width1 = 32;
    parameter width2 = 5;
    parameter width3 = 32;
    reg[width1 - 1: 0] in10;
    reg[width1 - 1: 0] in11;
    reg[width2 - 1: 0] in20;
    reg[width2 - 1: 0] in21;
    reg[width2 - 1: 0] in22;
    reg[width3 - 1: 0] in30;
    reg[width3 - 1: 0] in31;
    reg[width3 - 1: 0] in32;
    reg[width3 - 1: 0] in33;
    reg s1;
    reg[1: 0] s2;
    reg[1: 0] s3;
    wire[width1 - 1: 0] out1;
    wire[width2 - 1: 0] out2;
    wire[width3 - 1: 0] out3;
    mux2 #(width1) m1(.select(s1), .in0(in10), .in1(in11), .out(out1));
    mux3 #(width2) m2(.select(s2), .in0(in20), .in1(in21), .in2(in22), .out(out2));
    mux4 #(width3) m3(.select(s3), .in0(in30), .in1(in31), .in2(in32), .in3(in33), .out(out3));
    initial
    begin
        #delay
        s1 <= 1'b0; in10 <= 32'h55555555; in11 <= 32'haaaaaaaa;
        s2 <= 2'b00; in20 <= 5'b00001; in21 <= 5'b10000; in22 = 5'b11111;
        s3 <= 2'b00; in30 <= 32'h55555555; in31 <= 32'haaaaaaaa; in32 <= 32'hffffffff; in33 <= 32'h00000000;
        #delay
        s1 <= 1'b1; s2 <= 2'b01; s3 <= 2'b01;
        #delay
        s1 <= 1'b0; in11 <= 32'h55555555; in10 <= 32'haaaaaaaa; s2 <= 2'b10; s3 <= 2'b10; 
        #delay
        s3 <= 2'b11;
        
    end
    


endmodule