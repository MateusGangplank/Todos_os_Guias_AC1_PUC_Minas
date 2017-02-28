// --------------------
// --- Contador Decimal Decrescente
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 04
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio04;

wire [3:0] x;
reg y;
reg pulse;
reg p , c;
wire qnot1,qnot2, qnot3, qnot4 , s1 , s2;

 initial
  begin
   y = 1'b1;
  end
  
and   AND1   (s1, ~x[3], x[2], ~x[1], x[0]);
nand  Nand1  (s2, s1, ~y);

tff etapa1 ( x[3], qnot1, y, pulse, s2,c );
tff etapa2 ( x[2], qnot2, y, qnot1 , s2,c );
tff etapa3 ( x[1], qnot3, y, qnot2 , s2,c );
tff etapa4 ( x[0], qnot4, y, qnot3 , s2,c );


endmodule