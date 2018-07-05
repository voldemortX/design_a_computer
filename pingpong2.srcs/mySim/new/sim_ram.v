`timescale 1ns/1ns

module sim_ram();    
    reg clka, ena, wea;
    reg[9:0] addra;
    reg[31:0] dina;
    wire[31:0] douta;
    
    parameter DELAY = 80;
    parameter CYCLE = 10;
    //parameter DELAY = 100;
    always #(CYCLE/2) clka = ~clka;
    initial
    begin clka = 1'b1; ena = 1'b0;
        #DELAY ena = 1'b1; wea = 1'b1; dina = 32'hAAAAAAAA; addra = 10'b1010101010;
        #DELAY ena = 1'b0;
        #DELAY ena = 1'b1; wea = 1'b1; dina = 32'h55555555; addra = 10'b0101010101;
        #DELAY ena = 1'b0;
        #DELAY ena = 1'b1; wea = 1'b0; addra = 10'b1010101010;
        #DELAY ena = 1'b0;
        //#DELAY ena = 1'b1; wea = 1'b0; addra = 10'b1010101010;
        #DELAY $stop;
    end
    
    dat_mem ram_test(
        .clka(clka),    // input wire clka
        .ena(ena),      // input wire ena     enable?
        .wea(wea),      // input wire [0 : 0] wea     1-write, 0-read?
        .addra(addra),  // input wire [9 : 0] addra
        .dina(dina),    // input wire [31 : 0] dina
        .douta(douta)  // output wire [31 : 0] douta
        );
        
endmodule