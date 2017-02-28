// Breno Macena Pereira de Souza
// 462017

// ------------
// -- RAM 2x8
// ------------

`include "ram2x4.v"

module mux_8_bits (output [7:0] out, input [7:0] a, input [7:0] b, input key);
   mux M1 (out[0], a[0], b[0], key);
   mux M2 (out[1], a[1], b[1], key);
   mux M3 (out[2], a[2], b[2], key);
   mux M4 (out[3], a[3], b[3], key);
   mux M5 (out[4], a[4], b[4], key);
   mux M6 (out[5], a[5], b[5], key);
   mux M7 (out[6], a[6], b[6], key);
   mux M8 (out[7], a[7], b[7], key);
endmodule

module RAM2x8 (output [7:0] out, input [7:0] in, input clk, input rw, input addr, input clear);
   wire [3:0] s0, s1, s2, s3;
   wire [7:0] out1, out2;

   RAM2x4 R1 (s0, in[3:0], clk, rw, ~addr, clear);
   RAM2x4 R2 (s1, in[7:4], clk, rw, ~addr, clear);
   RAM2x4 R3 (s2, in[3:0], clk, rw, addr, clear);
   RAM2x4 R4 (s3, in[7:4], clk, rw, addr, clear);

   buf BUF1a (out1[0], s0[0]);
   buf BUF1b (out1[1], s0[1]);
   buf BUF1c (out1[2], s0[2]);
   buf BUF1d (out1[3], s0[3]);

   buf BUF2a (out1[4], s1[0]);
   buf BUF2b (out1[5], s1[1]);
   buf BUF2c (out1[6], s1[2]);
   buf BUF2d (out1[7], s1[3]);

   buf BUF3a (out2[0], s2[0]);
   buf BUF3b (out2[1], s2[1]);
   buf BUF3c (out2[2], s2[2]);
   buf BUF3d (out2[3], s2[3]);

   buf BUF4a (out2[4], s3[0]);
   buf BUF4b (out2[5], s3[1]);
   buf BUF4c (out2[6], s3[2]);
   buf BUF4d (out2[7], s3[3]);

   mux_8_bits M (out, out1, out2, addr);

endmodule