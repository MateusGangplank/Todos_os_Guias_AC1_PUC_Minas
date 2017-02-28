// ------------------------- 
// Guia 02 - Exercicio 1 
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// Exercício 1
// ------------------------- 
module operacoes; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d;
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Guia 02 - Ex1 - 396690 - 999999"); 
$display("Operacoes"); 

a = 14 + 2; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11;
e = 2*4+6-1; 

$display("\nResultados: "); 
$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %3b", c, c); 
$display("d = %d = %3b", d, d); 
$display("e = %d = %3b", e, e); 
end 
endmodule // operacoes