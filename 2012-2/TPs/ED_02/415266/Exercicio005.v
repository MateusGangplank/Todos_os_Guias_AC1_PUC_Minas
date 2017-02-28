/*
Estudo Dirigido02 - Exercicio005
Sheila de Oliveira Santana - 415266
*/

module Exercicio005;

//definir dados

          reg[7:0]a;
          reg[7:0]b;
          reg[7:0]c;
          reg[7:0]d;
          reg[7:0]e;
//parte principal

initial begin

$display("Estudo Dirigido 02 - Exercicio05 - Sheila de Oliveira Santana - 415266");

a=6'b10101+(~4'b1001+1);
b=5'b11011+(~5'o15+1);
c=5'o34+(~4'hc+1);
d=8'hda+(~8'b10111001+1);
e= 5'd27+(5'h1b+1);

$display("a = %b", a);
$display("b = %b", b);
$display("c = %b", c);
$display("d = %b", d);
$display("e = %b", e);
end

endmodule