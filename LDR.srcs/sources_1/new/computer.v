module computer #(parameter width = 32, bits = 5)(
    // concerning cpu & memory
    input clk, reset,
    
    // concerning I/O
    input[4: 0] keys,
    output wire[15: 0] led,
    output wire[3: 0] cs1,
    output wire[7: 0] digit1,
    output wire[3: 0] cs2,
    output wire[7: 0] digit2
    );
    
    wire[31: 0] Address;
    wire[31: 0] WriteData;
    wire MEMR;
    wire MEMW;
    wire[31: 0] ReadData;
    wire cpu_clk, locked;
    
    cpu #(32, 5) mips_cpu(
        .clk(cpu_clk),
        .reset(~reset),
        .ReadData(ReadData),
        .WriteData(WriteData),
        .Address(Address),
        .MEMR(MEMR),
        .MEMW(MEMW)
        );
        
    memorycontrol mc(
        .clk(clk),
        .ReadData(ReadData),
        .WriteData(WriteData),
        .Address(Address),
        .Read(MEMR),
        .Write(MEMW),
        .keys(keys),
        .led(led),
        .cs1(cs1),
        .digit1(digit1),
        .cs2(cs2),
        .digit2(digit2)
        );
        
    clk_wiz_0 instance_name
       (
        // Clock out ports
        .cpu_clk(cpu_clk),     // output cpu_clk
        // Status and control signals
        .reset(1'b0), // input reset
        .locked(locked),       // output locked
       // Clock in ports
        .clk(clk)  // input clk_in1
        );      
        
endmodule