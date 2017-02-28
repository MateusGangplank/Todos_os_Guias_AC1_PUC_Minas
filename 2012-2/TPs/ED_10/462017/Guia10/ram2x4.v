// Breno Macena Pereira de Souza
// 462017

// --------------
// -- RAM 2x4
// --------------

`include "ram1x4.v"
module mux (output out, input a, input b, input key);
   wire s0, s1;
   and AND1 (s0, a, ~key);
   and AND2 (s1, b, key);
   or OR (out, s0, s1);
endmodule

module mux_4_bits (output [3:0] out, input [3:0] a, input [3:0] b, input key);
   mux M1 (out[0], a[0], b[0], key);
   mux M2 (out[1], a[1], b[1], key);
   mux M3 (out[2], a[2], b[2], key);
   mux M4 (out[3], a[3], b[3], key);
endmodule

module RAM2x4 (output [3:0] out, input [3:0] in, input clk, input rw, input addr, input clear);
   wire [3:0] s0, s1;
   reg clkin = 0;

   RAM1x4 R1 (s0, in, clk, rw, ~addr, clear);
   RAM1x4 R2 (s1, in, clk, rw, addr, clear);
   mux_4_bits M (out, s0, s1, addr);

endmodule