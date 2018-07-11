module memorycontrol_t();
    // concerning main memory
    reg clk;
    reg[31: 0] Address;
    reg[31: 0] WriteData;
    reg Read;
    reg Write;
    wire[31: 0] ReadData;
    
    // concerning I/O
    reg[3: 0] keys;
    wire[15: 0] led;
    wire[3: 0] cs;
    wire[7: 0] digit;
    
    memorycontrol m(
        .clk(clk),
        .Address(Address),
        .WriteData(WriteData),
        .Read(Read),
        .Write(Write),
        .ReadData(ReadData),
        .keys(keys),
        .led(led),
        .cs(cs),
        .digit(digit)
    );
    
    always #10 clk = ~clk;
    initial
    begin
        clk = 0;
        //#250
        //Read <= 0; Write <= 1; Address <= 32'b00000000000000000000010000000001; WriteData <= 32'h55555555;
        #250
        Read = 1; Write = 0; Address = 32'h00000001;
        #250
        Read = 1; Write = 0; Address = 32'b00000000000000000000010000000000;
        //#250
        //Read <= 1; Write <= 0; Address <= 32'b00000000000000000000010000000001;
        //#25
        //Read = 0; Write = 1; Address = 32'h00003ff0; WriteData = 32'hffffffff;
    end
    

endmodule