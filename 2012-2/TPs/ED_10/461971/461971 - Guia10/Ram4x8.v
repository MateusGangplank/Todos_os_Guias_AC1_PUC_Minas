// -------------------------
// Exercicio03 Guia 10
// MEMORIA RAM 1X8
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram1x4.v"
`include "mux4x1.v"
`include "Demux2x4.v"

module ram4x8(output [7:0] s,
input [1:0] adr, input clk, input rw, input clr, input [7:0]data);
//reg [7:0] s;
wire [3:0] stmp0;
wire [3:0] stmp1;
wire [3:0] stmp2;
wire [3:0] stmp3;
wire [3:0] stmp4;
wire [3:0] stmp5;
wire [3:0] stmp6;
wire [3:0] stmp7;
wire [3:0] dmx;

demux dm1 (dmx, adr, 1);

ram1x4 r1 (stmp0, dmx[0], clk, rw, clr, data[3:0]);
ram1x4 r2 (stmp1, dmx[1], clk, rw, clr, data[3:0]);
ram1x4 r3 (stmp2, dmx[2], clk, rw, clr, data[3:0]);
ram1x4 r4 (stmp3, dmx[3], clk, rw, clr, data[3:0]);
ram1x4 r5 (stmp4, dmx[0], clk, rw, clr, data[7:4]);
ram1x4 r6 (stmp5, dmx[1], clk, rw, clr, data[7:4]);
ram1x4 r7 (stmp6, dmx[2], clk, rw, clr, data[7:4]);
ram1x4 r8 (stmp7, dmx[3], clk, rw, clr, data[7:4]);

mux m1 (s[3:0], stmp0, stmp1, stmp2, stmp3, adr);
mux m2 (s[7:4], stmp4, stmp5, stmp6, stmp7, adr);

endmodule