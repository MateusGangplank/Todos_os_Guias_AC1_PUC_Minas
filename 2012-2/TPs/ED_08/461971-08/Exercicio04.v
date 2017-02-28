// -------------------------
// Exercicio04 Guia 08
// REGISTRADOR DE DESLOCAMENTO EM ANEL TORCIDO ESQUERDA
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
reg p1, notp1;

jkff j1 (s[0], snot[0], snot[4], s[4], clr, clock);
jkff j2 (s[1], snot[1], s[0], snot[0], clr, clock);
jkff j3 (s[2], snot[2], s[1], snot[1], clr, clock);
jkff j4 (s[3], snot[3], s[2], snot[2], clr, clock);
jkff j5 (s[4], snot[4], s[3], snot[3], clr, clock);


initial begin
clr = 1; p1 = 0; notp1 = 1;

#13
clr = 0;
#23
$monitor ("%b, %b, %b, %b, %b", s[4], s[3], s[2], s[1], s[0]);

#896 $finish;
end
endmodule // teste