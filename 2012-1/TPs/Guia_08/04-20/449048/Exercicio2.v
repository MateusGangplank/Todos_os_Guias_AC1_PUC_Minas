//-- Miller 449049 --
//-- Guia 8 --
//-- Exercicio 2 --

`include "FFD.v"

module Exercicio2;
reg clk, d;
wire q0, q1, q2, q3, qnot0, qnot1, qnot2, qnot3;

FFD ffd0(q0, qnot0, d, clk);
FFD ffd1(q1, qnot1, q0, clk);
FFD ffd2(q2, qnot2, q1, clk);
FFD ffd3(q3, qnot3, q2, clk);

initial begin: start
clk=0; d=0;
end

initial begin
$display("PUC MINAS - Ciencia da Computacao");
$display("Arquitetura de Computadores 1");
$display("Miller - 449048");
$display("Exercicio 2");
$display("");

#1 clk=1; d=1;
#1 clk=0; d=0;
#1 clk=1; d=1;
#1 clk=0; d=0;
#1 clk=1; d=1;
#1 clk=0; d=0;
#1 clk=1; d=1;
#1 clk=0; d=0;

$monitor("%b %b %b %b", q3, q2, q1, q0);

#1	clk=1;
#1	clk=0;
#1	clk=1;
#1	clk=0;
#1	clk=1;
#1	clk=0;
#1	clk=1;
#1	clk=0;

end
endmodule

