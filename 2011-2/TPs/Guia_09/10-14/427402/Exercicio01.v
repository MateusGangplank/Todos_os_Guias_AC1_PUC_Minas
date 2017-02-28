// --------------------
// --- Contador Decrescente
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 01
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio01;

wire [3:0] x;
reg y;
reg pulse;
reg p , c;
wire q1,q2, q3, q4;

 initial
  begin
   y = 1'b1;
  end

tff etapa1 ( q1, x[3], y, pulse, p,c );
tff etapa2 ( q2, x[2], y, x[3], p,c );
tff etapa3 ( q3, x[1], y, x[2], p,c );
tff etapa4 ( q4, x[0], y, x[1], p,c );


endmodule