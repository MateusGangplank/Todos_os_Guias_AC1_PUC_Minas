// -------------------------
// Exercicio05 Guia 09
// CONTADOR MODULO 10
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
`include "FlipFlopT.v"
module teste;
wire clock;
clock clk ( clock );
reg clr, p;
wire clr1, clr2;
wire [5:0] s;
wire [5:0] snot;

tff t1 (s[0], snot[0], clock, p, clr2, clock);
tff t2 (s[1], snot[1], snot[0], p, clr2, snot[0]);
tff t3 (s[2], snot[2], snot[1], p, clr2, snot[1]);
tff t4 (s[3], snot[3], snot[2], p, clr2, snot[2]);  //mesmo problema do anterior, reseta para 8 em vez de 0

and (clr1, s[0], ~s[1], ~s[2], s[3]);
or (clr2, clr, clr1);

initial begin
clr = 1; p = 0;

#13
clr = 0;
$monitor ("%b, %b, %b, %b", s[3], s[2], s[1], s[0]);
#996 $finish;
end
endmodule // teste