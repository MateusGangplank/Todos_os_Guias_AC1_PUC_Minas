// Breno Macena Pereira de Souza
// 462017

// -----------------
// -- RAM 1x16
// -----------------

`include "ram1x8.v"

module RAM1x16 (output [15:0] out, input [15:0] in, input clk, input rw, input addr, input clear);
   wire [7:0] s0, s1;

   RAM1x8 R1 (s0, in[7:0], clk, rw, addr, clear);
   RAM1x8 R2 (s1, in[15:8], clk, rw, addr, clear);
   buf BUF1 (out[0], s0[0]);
   buf BUF2 (out[1], s0[1]);
   buf BUF3 (out[2], s0[2]);
   buf BUF4 (out[3], s0[3]);
   buf BUF5 (out[4], s0[4]);
   buf BUF6 (out[5], s0[5]);
   buf BUF7 (out[6], s0[6]);
   buf BUF8 (out[7], s0[7]);
   buf BUF9 (out[8], s1[0]);
   buf BUF10 (out[9], s1[1]);
   buf BUF11 (out[10], s1[2]);
   buf BUF12 (out[11], s1[3]);
   buf BUF13 (out[12], s1[4]);
   buf BUF14 (out[13], s1[5]);
   buf BUF15 (out[14], s1[6]);
   buf BUF16 (out[15], s1[7]);
endmodule
