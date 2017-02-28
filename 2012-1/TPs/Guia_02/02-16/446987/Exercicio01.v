// ------------------------- 
// Exercicio01 - Guia 02 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
//
// ------------------------- 
// test number system 
// ------------------------- 

module Operacoes_01; 
// ------------------------- definir dados 
reg [4:0] a;
reg [4:0] b;
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;

// ------------------------- parte principal
initial begin
$display ("Exercicio01 - Luhan Mairinck - 446987");
$display ("Teste de operacoes");

a = 2 + 15;
b = 3 * 8;
c = 32 / 3;
d = 21 - 11;
e = 2 * 5 + 6 - 1;

$display("Resultados em binario");
$display("a = %d = %6b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %5b", c, c);
$display("c = %d = %5b", d, d);
$display("e = %d = %5b", e, e); 

end
endmodule // Operacoes_01

// -- OBS
// Operacoes basicas com resultado em binario.
// Recomendavel previsao de um bit a mais que o resultado
// para caso de transbordamento, mas seguindo o enunciado
// foi utilizada a minima necessaria.