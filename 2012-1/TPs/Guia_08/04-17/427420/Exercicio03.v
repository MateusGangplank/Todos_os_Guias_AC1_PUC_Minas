// --------------------
// --- Deslocamento para direita
// --- Jenifer Henrique - 427420
// --- Exercicio 03
// --------------------

`include "Flipflops.v"
`include "clock.v"

module load ();
endmodule
module Exercicio03;

wire [3:0] x;
reg y, load;
wire qnot1,qnot2, qnot3, qnot4;

 initial
  begin
   y = 1'b1;
  end
//dff ( output q, output qnot,input   d, input clk );
dff  etapa1 ( x[0], qnot1,(y|x[3]), clk );
initial
begin
#1 y=1'b0;
end
dff  etapa2 ( x[1], qnot2, x[0]   , clk );
dff  etapa3 ( x[2], qnot3, x[1]   , clk );
dff  etapa4 ( x[3], qnot4, x[2]   , clk );

endmodule