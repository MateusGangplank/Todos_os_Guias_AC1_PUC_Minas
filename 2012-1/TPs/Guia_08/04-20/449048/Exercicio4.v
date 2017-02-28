//-- Miller 449049 --
//-- Guia 8 --
//-- Exercicio 4 --

`include "FFD.v"

module Exercicio3;
reg d, clk;
wire s0, s1, s2, s3, qnot0, qnot1, qnot2, qnot3;

FFD ffd1(s0, qnot0, d, clk);
FFD ffd2(s1, qnot1, s0, clk);
FFD ffd3(s2, qnot2, s1, clk);
FFD ffd4(s3, qnot3, s2, clk);

initial begin: start
d=0; clk=0;
end

initial begin
$display("PUC MINAS - Ciencia da Computacao");
$display("Arquitetura de Computadores 1");
$display("Miller - 449048");
$display("Exercicio 4");
$display("");

#1 d=1; clk=1;
#1 d=0; clk=0;
#1 d=1; clk=1;
#1 d=0; clk=0;
#1 d=1; clk=1;
#1 d=0; clk=0;
#1 d=1; clk=1;
#1 d=0; clk=0;

$monitor("%b %b %b %b", s0, s1, s2, s3);

#1 d=1; clk=1;
#1 d=0; clk=0;
#1 clk=1;
#1 clk=0;
#1 clk=1;
#1 clk=0;
#1 clk=1;
#1 clk=0;
#1 clk=1;
#1 clk=0;


end
endmodule