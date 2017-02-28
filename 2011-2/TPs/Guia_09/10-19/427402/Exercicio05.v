// --------------------
// --- Contador Decimal Decrescente
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 04
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio04;

wire [2:0] x;
reg y;
reg pulse;
reg p , c;
wire qnot1,qnot2, qnot3, s1 , s2, s3 , s4, s5, s6, s7, s8;

 initial
  begin
   y = 1'b1;
  end
  
and   AND1   (s1, x[2], x[1], ~x[0]);
or    Or0    (s2, s1, c); // clear geral
or    Or1    (s3, s2, pulse); //primeiro or de k e clk
or    Or2    (s4, s1, qnot1);
or    Or3    (s5, s1, qnot2);
and   AND2   (s6, ~s1,pulse);
and   AND3   (s7, ~s1,qnot1);
and   AND3   (s8, ~s1,qnot2);


jkff etapa1 ( x[2], qnot1, s6, s3 , s3 );
jkff etapa2 ( x[1], qnot2, s7, s4 , s4 );
jkff etapa3 ( x[0], qnot3, s8, s5 , s5 );


endmodule