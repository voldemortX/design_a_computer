module regfile_t(

    );
    reg clk;
    reg regwrite; //involve register's writing
    reg [4:0] ra1,ra2; //readadress rd1,rd2's Register address input port(just reading)
    reg [4:0] wa;      //writeadress wa's Register address input port(writing)
    reg [31:0] wd;     //writedata, wd would be written in wa
    wire [31:0] rd1,rd2; //readdata, they're ra1,ra2's data
    regfile myrefile(.clk(clk),.regwrite(regwrite),.ra1(ra1),.ra2(ra2),.wa(wa),.wd(wd),.rd1(rd1),.rd2(rd2));
    initial
    begin 
        clk = 1;
        regwrite = 0;
        #100 wa = 5'b01000; wd = 32'h55555555; regwrite = 1;
        #100 ra1 = 5'b01000; ra2 = 5'b00000; regwrite = 0;
    end
    always 
        #10 clk = ~clk;
endmodule
