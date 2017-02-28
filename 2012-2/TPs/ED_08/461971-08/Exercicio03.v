// -------------------------
// Exercicio03 Guia 08
//REGISTRADOR DE DESLOCAMENTO CIRCULAR DIREITA
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
`include "Clock.v"
`include "FlipFlopD.v"
module teste;
wire clock;
clock clk ( clock );
reg clr;
wire [4:0] s;
wire [4:0] snot;
reg d;
wire dd;
or (dd, d, s[4]);
dff d1 (s[0], snot[0], dd, clock, clr);
dff d2 (s[1], snot[1], s[0], clock, clr);
dff d3 (s[2], snot[2], s[1], clock, clr);
dff d4 (s[3], snot[3], s[2], clock, clr);
dff d5 (s[4], snot[4], s[3], clock, clr);

initial begin
clr = 1; d = 1;

#13
clr = 0;
#24
$monitor ("%b, %b, %b, %b, %b", s[0], s[1], s[2], s[3], s[4]);
d = 0;
#1000 $finish;
end
endmodule // teste