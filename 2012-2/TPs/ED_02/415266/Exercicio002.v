/*
Estudo Dirigido02 - Exercicio002
Sheila de Oliveira Santana - 415266
*/

module Exercicio002;

//definir dados

          reg[6:0]a;
          reg[5:0]b;
          reg[3:0]c;
          reg[6:0]d;
          reg[9:0]e;
//parte principal

initial begin

$display("Estudo Dirigido 02 - Exercicio02 - Sheila de Oliveira Santana - 415266");

a=6'b101010+5'b11011;
b=5'b11011+5'o25;
c=10'o1234/6'h3c;
d=9'h1ba-9'b101110001;
e=5'd25*5'o32+7'h7a;

$display("a = %d = %b", a,a);
$display("b = %d = %b", b,b);
$display("c = %d = %b", c,c);
$display("d = %d = %b", d,d);
$display("e = %d = %b", e,e);
end

endmodule