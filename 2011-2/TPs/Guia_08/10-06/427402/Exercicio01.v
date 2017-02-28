// --------------------
// --- Deslocamento para esquerda
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 01
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio01;

wire [4:0] x;
reg y;
wire qnot1,qnot2, qnot3, qnot4, qnot5 ;

 initial
  begin
   y = 1'b1;
  end
dff etapa1 ( x[4],qnot1,y, clk );
dff etapa2 ( x[3],qnot2,x[4], clk );
dff etapa3 ( x[2],qnot3,x[3], clk );
dff etapa4 ( x[1],qnot4,x[2], clk );
dff etapa5 ( x[0],qnot5,x[1], clk );


endmodule