// -------------------------
// Exercicio02 Guia 09
// CONTADOR ASSINCRONO CRESCENTE
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
`include "FlipFlopJK.v"
module teste;
wire clock;
clock clk ( clock );
reg clr;
wire [4:0] s;
wire [4:0] snot;
reg j, k;

jkff j1 (s[0], snot[0], j, k, clr, clock);
jkff j2 (s[1], snot[1], j, k, clr, s[0]);
jkff j3 (s[2], snot[2], j, k, clr, s[1]);
jkff j4 (s[3], snot[3], j, k, clr, s[2]);
jkff j5 (s[4], snot[4], j, k, clr, s[3]);

initial begin
clr = 0; j = 1; k = 0;

#13
j = 1; k = 1;
$monitor ("%b, %b, %b, %b, %b", snot[4], snot[3], snot[2], snot[1], snot[0]);
#1000 $finish;
end
endmodule // teste