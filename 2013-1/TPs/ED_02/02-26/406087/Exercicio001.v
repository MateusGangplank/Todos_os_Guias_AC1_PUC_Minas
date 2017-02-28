
 // ------------------------- 
// Exercicio001
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 

 module Teste;
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d; 
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Fabio Fiuza Pereira - 406087"); 
$display("Test number system"); 
a = 3+14; 
b = 3*8; 
c = 33/5; 
d = 20-11;
e = 2 * 8 + 7 - 1; 
 
$display("\nPositive value"); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 

 
end 
endmodule // test_base 