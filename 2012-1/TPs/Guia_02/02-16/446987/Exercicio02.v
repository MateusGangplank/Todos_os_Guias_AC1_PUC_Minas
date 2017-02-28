// ------------------------- 
// Exercicio02 - Guia 02 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
//
// ------------------------- 
// test number system 
// ------------------------- 

module Operacoes_02; 
// ------------------------- definir dados 
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [8:0] e;

// ------------------------- parte principal
initial begin
$display ("Exercicio02 - Luhan Mairinck - 446987");
$display ("Teste de operacoes");

a = 6'b101010 + 6'b11010;
b = 5'b11010 + 5'o25;
c = 10'o1234 / 6'h2B;
d = 9'h1CA - 9'b101110001;
e = 5'o25 * 5'o31 - 7'h7A;

$display("\nResultados em binario");
$display("a = %d = %6b", a, a);
$display("b = %d = %6b", b, b);
$display("c = %d = %5b", c, c);
$display("c = %d = %5b", d, d);
$display("e = %d = %5b", e, e); 

end
endmodule // Operacoes_02

// -- OBS
// Operacoes basicas com mudanca de base e resultado em binario.
// Recomendavel previsao de um bit a mais que o resultado
// para caso de transbordamento, mas seguindo o enunciado
// foi utilizada a minima necessaria.