// Breno Macena Pereira de Souza
// 462017

// -----------------
// -- RAM 1x8
// -----------------

`include "ram1x4.v"

module RAM1x8 (output [7:0] out, input [7:0] in, input clk, input rw, input addr, input clear);
   wire [3:0] s0, s1;

   RAM1x4 R1 (out[3:0], in[3:0], clk, rw, addr, clear);
   RAM1x4 R2 (out[7:4], in[7:4], clk, rw, addr, clear);

endmodule
