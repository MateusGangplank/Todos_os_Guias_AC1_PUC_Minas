/*
Estudo Dirigido02 - Exercicio003
Sheila de Oliveira Santana - 415266
*/

module Exercicio003;

//definir dados

          reg[4:0]a;
          reg[5:0]b;
          reg[5:0]c;
          reg[4:0]d;
          reg[5:0]e;
//parte principal

initial begin

$display("Estudo Dirigido 02 - Exercicio03 - Sheila de Oliveira Santana - 415266");

a=~(6'b100110)+1;
b=~(5'o24)+1;
c=~(5'd25)+1;
d=~(6'h2d)+1;
e=27+(~37)+1;

$display("a = %b", a);
$display("b = %b", b);
$display("c = %b", c);
$display("d = %b", d);
$display("e = %b", e);
end

endmodule