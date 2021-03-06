// --------------------
// --- Deslocamento circular em anel torcido para a esquerda.
// --- Jenifer Henrique - 427420
// --- Exercicio 04
// --------------------

`include "Flipflops.v"
`include "clock.v"


module Exercicio04;

wire [4:0] x;
reg y, load;
wire qnot1,qnot2, qnot3, qnot4,qnot5 ;


 //dff ( output q, output qnot,input   d, input clk );
dff etapa1 ( x[4],qnot1,qnot5, clk );
dff etapa2 ( x[3],qnot2,x[4], clk );
dff etapa3 ( x[2],qnot3,x[3], clk );
dff etapa4 ( x[1],qnot4,x[2], clk );
dff etapa5 ( x[0],qnot5,x[1], clk );

endmodule