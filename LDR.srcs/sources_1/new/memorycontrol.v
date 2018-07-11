// API

module memorycontrol(
    // concerning main memory
    input clk,
    input[31: 0] Address,
    input[31: 0] WriteData,
    input Read,
    input Write,
    output reg[31: 0] ReadData,
    
    // concerning I/O
    input[4: 0] keys,
    output reg[15: 0] led,
    output reg[3: 0] cs1,
    output reg[7: 0] digit1,
    output reg[3: 0] cs2,
    output reg[7: 0] digit2
    
);
    wire en_RAM, en_ROM, en_led, en_digit, en_keys, wea, en;
    reg  cs_RAM, cs_ROM, cs_led, cs_digit, cs_keys;
    wire[31: 0] temp_ram, temp_rom;
    assign en = Read | Write;
    
    // cell select signals
    always @(*)
    begin
        if(Address[13: 0] == 14'h3ff0)
        begin
            cs_led <= 1;
            cs_keys <= 0;
            cs_digit <= 0;
            cs_RAM <= 0;
            cs_ROM <= 0;
        end
        else if(Address[13: 0] == 14'h3ff1)
        begin
            cs_led <= 0;
            cs_keys <= 1;
            cs_digit <= 0;
            cs_RAM <= 0;
            cs_ROM <= 0;
        end
        else if(Address[13: 0] == 14'h3ff2)
        begin
            cs_led <= 0;
            cs_keys <= 0;
            cs_digit <= 1;
            cs_RAM <= 0;
            cs_ROM <= 0;
        end
        else if(Address[13: 10] == 4'b0000)
        begin
            cs_led <= 0;
            cs_keys <= 0;
            cs_digit <= 0;
            cs_RAM <= 0;
            cs_ROM <= 1;
        end
        else if(Address[13: 10] == 4'b0001)
        begin
            cs_led <= 0;
            cs_keys <= 0;
            cs_digit <= 0;
            cs_RAM <= 1;
            cs_ROM <= 0;
        end
        else
        begin
            cs_led <= 0;
            cs_keys <= 0;
            cs_digit <= 0;
            cs_RAM <= 0;
            cs_ROM <= 0;
        end
    end
    
    // enable signals
    assign en_RAM = cs_RAM & en;
    assign en_ROM = cs_ROM & Read;
    assign en_led = cs_led & Write;
    assign en_keys = cs_keys & Read;
    assign en_digit = cs_digit & Write;
    
    // I/O read & write
    always @(*)
    begin
        if(en_keys)
        begin
            ReadData <= {{27{1'b0}}, keys[4: 0]};
        end
        else if(en_led)
        begin
            led <= WriteData[15: 0];
        end
        else if(en_digit)
        begin
            cs1 <= WriteData[27: 24];
            digit1 <= WriteData[23: 16];
            cs2 <= WriteData[11: 8];
            digit2 <= WriteData[7: 0];
        end
        else if((en_RAM && Read))
        begin
            ReadData <= temp_ram;
        end
        else if(en_ROM)
        begin
            ReadData <= temp_rom;
        end
    end
    
    
    dat_mem RAM(
        .clka(clk),    // input wire clka
        .ena(en_RAM),      // input wire ena
        .wea(Write),      // input wire [0 : 0] wea
        .addra(Address[9: 0]),  // input wire [9 : 0] addra
        .dina(WriteData),    // input wire [31 : 0] dina
        .douta(temp_ram)  // output wire [31 : 0] douta
    );
    
    ins_mem ROM(
        .clka(clk),    // input wire clka
        .ena(en_ROM),      // input wire ena
        .addra(Address[9: 0]),  // input wire [9 : 0] addra
        .douta(temp_rom)  // output wire [31 : 0] douta
    );
    
    


endmodule