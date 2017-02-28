// ------------------------- 
// Exercicio03 - Guia 02 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
//
// ------------------------- 
// test number system 
// ------------------------- 

module Complements; 
// ------------------------- definir dados 
reg [3:0] a;
reg [4:0] b;
reg [4:0] c;
reg [3:0] d;
reg [4:0] e;

// ------------------------- parte principal
initial begin
$display ("Exercicio03 - Luhan Mairinck - 446987");
$display ("Teste de operacoes");
$display("\nComplemento de 2:");

a = 'b100111;
b = ~a + 'b1;
$display("A) a = %6b", b);

c = 'o23;
b = ~c + 1;
$display("B) b = %6b", b);

b = 23;
c = ~b + 1;
$display("C) c = %5b", c);

c = 'hE;
d = ~c + 1;
$display("D) d = %5b", d);

a = 26;
b = 36;
e = a + (~b + 1'b1);
$display("E) e = %5b", e); 

end
endmodule // Complements

// -- OBS
// Representacao de Complemento de 2