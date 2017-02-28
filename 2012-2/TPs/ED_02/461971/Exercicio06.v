// -------------------------
// Exxercicio06 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module comp_de_1(output [7:0]s, input[7:0] r);
// ------------------------- definir dados
 assign s = ~(r);
  endmodule //comp_de_1

  module testa_comp_de_1;
  reg [7:0] a;
  wire [7:0] s;
  //intancia
  comp_de_1 C11(s, a);
  // ------------------------- preparacao
initial begin:start
a = 'b00000000; // valor inicial
end
// ------------------------- parte principal
 initial begin
$display("Exercicio06 - Herbert Alves - 461971");
$display("\nTesta complemento de 1");

$display("\a=numero  s=complemento de 1");
$monitor("a = %b  s = %b", a, s);
#1 a = 'b01010101;
#1 a = 'b11111111;
#1 a = 'b10101010;


end
endmodule // testa_comp_de_1