// --------------------
// --- Deslocamento para esquerda
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 02
// --------------------

`include "Flipflops.v"
`include "clock.v"

module load ();
endmodule
module Exercicio02;

wire [4:0] x;
reg y, load;
wire qnot1,qnot2, qnot3, qnot4, qnot5 ;

 initial
  begin
   y = 1'b0;
  end
//jkff=> ( output q, output qnot, input    j, input    k, input clk );
jkff etapa1 ( x[4], qnot1,(load|y)   , ~(load|y),clk );
jkff etapa2 ( x[3], qnot2,(load|x[4]), qnot1    ,clk );
jkff etapa3 ( x[2], qnot3,(load|x[3]), qnot2    ,clk );
jkff etapa4 ( x[1], qnot4,(load|x[2]), qnot3    ,clk );
jkff etapa5 ( x[0], qnot5,(load|x[1]), qnot4    ,clk );


endmodule