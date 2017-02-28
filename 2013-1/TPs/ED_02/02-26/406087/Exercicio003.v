
 // ------------------------- 
// Exercicio003
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
$display("Exercicio003 - Fabio Fiuza Pereira - 406087"); 
$display("Test number system"); 
a = ~(6'b101010)+1; 
b = ~(5'o25)+1; 
c = ~(27)+1;
d = ~(9'h26)+1;
e = ~(25 - 35); 
 
$display("\nPositive value"); 
$display("a =", a); 
$display("b =", b); 
$display("c =", c); 
$display("d =", d); 
$display("e =", e); 

 
end 
endmodule // test_base 