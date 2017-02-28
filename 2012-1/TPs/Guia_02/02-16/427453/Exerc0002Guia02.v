// ------------------------- 
// Exercicio0002 - BASE 
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [15:0] a; 
reg [15:0] b; 
reg [15:0] c; 
reg [15:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0002 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Executar as operações "); 
#1a = 6'b101010; 
#1b = 5'b11010; 
#1e = a + b; 
$display("%b + %b = %b", a, b, e); 
#1a = 5'b11010; 
#1b = 10'o25; 
#1e = a + b; 
$display("%b + %b = %b", a, b, e); 
#1a = 10'o1234; 
#1b = 15'h2b; 
#1e = a / b; 
$display("%b / %b = %b", a, b, e); 
#1a = 15'h1ca; 
#1b = 9'b101110001; 
#1e = a - b; 
$display("%b - %b = %b", a, b, e); 
#1a = 25; 
#1b = 15'o31; 
#1c = 15'h7a; 
#1e = a * b + c; 
$display("%b * %b + %b = %b", a, b, c, e); 
end 
endmodule // test_base 