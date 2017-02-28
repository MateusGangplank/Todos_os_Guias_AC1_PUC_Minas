// -------------------------
// Exercicio06 EXTRA Guia 09
// CONTADOR CONTADOR EM ANEL
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
wire [5:0] s;
wire [5:0] snot;
reg data;
wire jk;
or (jk, data, s[5]);

jkff j1 (s[0], snot[0], jk, ~jk, clr, clock);
jkff j2 (s[1], snot[1], s[0], ~s[0], clr, clock);
jkff j3 (s[2], snot[2], s[1], ~s[1], clr, clock);
jkff j4 (s[3], snot[3], s[2], ~s[2], clr, clock);
jkff j5 (s[4], snot[4], s[3], ~s[3], clr, clock);
jkff j6 (s[5], snot[5], s[4], ~s[4], clr, clock);


initial begin
clr = 1;

#13
clr = 0;
data = 1;
#24
data = 0;
$monitor ("%b, %b, %b, %b, %b, %b", s[0], s[1], s[2], s[3], s[4], s[5]);
#896 $finish;
end
endmodule // teste