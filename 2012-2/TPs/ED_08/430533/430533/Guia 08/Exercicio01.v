// --------------------
// --- Deslocamento para esquerda
// --- Roger Rubens Machado 430533
// --- Exercicio 01
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio01;

wire [4:0] x;
reg y;
wire qnot0, qnot1,qnot2, qnot3, qnot4;

 initial
  begin
   y = 1'b1;
  end
  //dff ( output q, output qnot,input   d, input clk );
dff etapa1 ( x[4],qnot4,y, clk );
dff etapa2 ( x[3],qnot3,x[4], clk );
dff etapa3 ( x[2],qnot2,x[3], clk );
dff etapa4 ( x[1],qnot1,x[0], clk );
dff etapa5 ( x[0],qnot0,x[1], clk );

endmodule