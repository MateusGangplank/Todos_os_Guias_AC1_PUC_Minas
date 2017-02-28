// -------------------------
// Exercicio01 Guia 10
// MEMORIA RAM 1X4
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
//`include "FlipFlopJK.v"
`include "Ram1x4.v"

module teste;
wire clok;
clock clk ( clok );
reg clr, adr, rw;
reg [3:0] in;
wire [3:0] s;

ram1x4 r1 (s, adr, clok, rw, clr, in);

initial begin
adr = 1; rw = 1; clr = 0;
in = 4'b0111;
#12
$monitor ("%b, %b, %b, %b", s[3], s[2], s[1], s[0]);
$dumpfile ( "Exercicio01.vcd" );
$dumpvars;
#25
rw = 0;
#1000 $finish;
end
endmodule