// -------------------------
// Exxercicio07 -
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// test number system
// -------------------------
module comp_de_2(output [7:0]s, input[7:0] r);
// ------------------------- definir dados
 assign s = ~r + 1;
  endmodule //comp_de_2

  module testa_comp_de_2;
  reg [7:0] a;
  wire [7:0] s;
  //intancia
  comp_de_2 C21(s, a);
  // ------------------------- preparacao
initial begin:start
a = 'b00000000; // valor inicial
end
// ------------------------- parte principal
 initial begin
$display("Exercicio07 - Herbert Alves - 461971");
$display("\nTesta complemento de 1");

$display("\a=numero  s=complemento de 1");
$monitor("a = %b  s = %b", a, s);
#1 a = 'b01010101;
#1 a = 'b11111111;
#1 a = 'b10101010;


end
endmodule // testa_comp_de_2