/*
Estudo Dirigido02 - Exercicio004
Sheila de Oliveira Santana - 415266
*/

module Exercicio004;

//definir dados

          reg[7:0]a;
          reg[6:0]b;
          reg[5:0]c;
          reg[4:0]d;
          reg[7:0]e;
//parte principal

initial begin

$display("Estudo Dirigido 02 - Exercicio04 - Sheila de Oliveira Santana - 415266");

a=~(6'b101011)+1;
b=~(6'b111001)+1;
c=~(5'd27)+1;
d=~(4'hc)+1;
e=(6'o21)+1;

$display("a = %b", a);
$display("b = %b", b);
$display("c = %b", c);
$display("d = %b", d);
$display("e = %b", e);
end

endmodule