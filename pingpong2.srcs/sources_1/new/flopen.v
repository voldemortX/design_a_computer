module flopen #(parameter WIDTH = 32)
               (input clk, en,
                input[WIDTH-1:0] d, 
                output reg[WIDTH-1:0] q);

   always @(posedge clk)
      if (en) q <= d;
endmodule
