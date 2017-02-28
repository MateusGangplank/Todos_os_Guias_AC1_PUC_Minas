// ------------------------- 
// Guia 02 - Exercicio 2 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// Exercício 2
// ------------------------- 
module operacoes; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d;
reg [9:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Guia 02 - Ex1 - 396690 - 999999"); 
$display("Operacoes"); 

a = 6'b100010 + 5'b11010; 
b = 5'b11010 + 'o23; 
c = 'o1234 / 'h2D; 
d = 'h1a9 - 9'b101101001;
e = 25 * 'o41 + 'h6B; 

$display("\nResultados: "); 
$display("a = %d = %3b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %3b", c, c); 
$display("d = %d = %3b", d, d); 
$display("e = %d = %3b", e, e); 
end 
endmodule // operacoes