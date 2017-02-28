// ------------------------- 
// Exercicio0001 - BASE 
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [5:0] c; 
reg [5:0] d;
reg [5:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0001 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Executar as operações "); 
#1a = 2; 
#1b = 15; 
#1e = a + b; 
$display("%b + %b = %b", a, b, e); 
#1a = 3; 
#1b = 8; 
#1e = a * b; 
$display("%b * %b = %b", a, b, e); 
#1a = 32; 
#1b = 3; 
#1e = a / b; 
$display("%b / %b = %b", a, b, e); 
#1a = 21; 
#1b = 11; 
#1e = a - b; 
$display("%b - %b = %b", a, b, e); 
#1a = 2; 
#1b = 5; 
#1c = 6; 
#1d = 1; 
#1e = a * b + c - d; 
$display("%b * %b + %b - %b = %b", a, b, c, d, e); 
end 
endmodule // test_base 