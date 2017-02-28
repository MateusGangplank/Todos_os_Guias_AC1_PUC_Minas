// Breno Macena Pereira de Souza
// 462017

// -----------------
// -- RAM 1x4
// -----------------

`include "jkff.v"

module RAM1x1 (output out, input in, input clk, input rw, input addr, input clear);
   wire s0, s1, s2;
   and AND1 (s0, addr, rw, clk);
   jkff JK  (s1, s2, in, in, s0, clear);
   and AND2 (out, s1, addr);
endmodule

module RAM1x4 (output [3:0] out, input [3:0] in, input clk, input rw, input addr, input clear);
   RAM1x1 R1 (out[0], in[0], clk, rw, addr, clear);
   RAM1x1 R2 (out[1], in[1], clk, rw, addr, clear);
   RAM1x1 R3 (out[2], in[2], clk, rw, addr, clear);
   RAM1x1 R4 (out[3], in[3], clk, rw, addr, clear);
endmodule