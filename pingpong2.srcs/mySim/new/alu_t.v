module alu_t(

    );
    reg[31:0] a,b;
    reg[2:0]  alucont;
    wire[31:0] result;
    wire zero;
    initial
    begin
    a <= 32'h00000010;
    b <= 32'haaaaaaaa;
    alucont <= 3'b001;
    #100
    a <= 32'h55555555;
    alucont <= 3'b000;
    #100
    a <= 32'hffffffff;
    b <= 32'h00000001;
    alucont <= 3'b000;
    end
    alu myalu(.a(a),.b(b),.alucont(alucont),.result(result),.zero(zero));
endmodule
