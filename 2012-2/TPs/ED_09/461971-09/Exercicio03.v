// -------------------------
// Exercicio03 Guia 09
// CONTADOR DECADICO CRESCENTE
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
`include "FlipFlopJK.v"
module clear (output clr,
input clr0, input clr1, input clock);
reg clr;
always @ ( negedge clock )
begin
if ( !clr1 )
begin
clr = 1;
end 
else
begin
clr = 0;
end 
end
endmodule

module teste;
wire clock;
clock clk ( clock );
reg clr;
wire clr1, clr2;
wire [5:0] s;
wire [5:0] snot;
reg j, k;


jkff j1 (s[0], snot[0], j, k, clr2, clock);
jkff j2 (s[1], snot[1], j, k, clr2, snot[0]);
jkff j3 (s[2], snot[2], j, k, clr2, snot[1]);
jkff j4 (s[3], snot[3], j, k, clr2, snot[2]); // nao consigo entender porque essa saida s[3] nao ta resetando
jkff j5 (s[4], snot[4], j, k, clr2, snot[3]); // tentei de tudo aqui, mas nao consegui
jkff j6 (s[5], snot[5], j, k, clr2, snot[4]);
nand (clr1, s[0], ~s[1], ~s[2], s[3]);
clear clear1 (clr2, clr, clr1, clock);

initial begin
clr = 1; j = 0; k = 1;

#13
j = 1; k = 1;

$monitor ("%b, %b, %b, %b, %b, %b", clr1, s[4], s[3], s[2], s[1], s[0]);
#896 $finish;
end
endmodule // teste