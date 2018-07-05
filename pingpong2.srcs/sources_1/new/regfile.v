module regfile(
    input clk,
    input regwrite, //involve register's writing
    input [4:0] ra1,ra2, //readadress rd1,rd2's Register address input port(just reading)
    input [4:0] wa,      //writeadress wa's Register address input port(writing)
    input [31:0] wd,     //writedata, wd would be written in wa
    output [31:0] rd1,rd2 //readdata, they're ra1,ra2's data
    );
    reg [31:0] register[0:31]; //32 registers
    //if regwrite==1&&the register needed to be written is not register[0], register[wa]<=wd at clk's posedge
    always @(posedge clk)
        if (regwrite && wa != 0)  register[wa] <= wd;
    //if register[0] is read, return 0; else, give the data register[ra] saved
    assign rd1 = ra1 ? register[ra1]:0;
    assign rd2 = ra2 ? register[ra2]:0;
endmodule
