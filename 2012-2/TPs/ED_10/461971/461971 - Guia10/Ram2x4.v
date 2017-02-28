// -------------------------
// Exercicio02 Guia 10
// MEMORIA RAM 2X4
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram1x4.v"
`include "mux.v"

module ram2x4(output [3:0] s,
input adr, input clk, input rw, input clr, input [3:0]data);
//reg [3:0] s;
wire [3:0] stmp;
wire [3:0] stmp1;

ram1x4 r1 (stmp, adr, clk, rw, clr, data);
ram1x4 r2 (stmp1, ~adr, clk, rw, clr, data);

mux m1 (s, stmp, stmp1, adr);

endmodule