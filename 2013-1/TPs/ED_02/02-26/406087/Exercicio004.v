
 // ------------------------- 
// Exercicio004
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 

 module Teste;
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [4:0] c; 
reg [4:0] d; 
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio004 - Fabio Fiuza Pereira - 406087"); 
$display("Test number system"); 
a = ~(8'b101111)+1; 
b = ~(321)+1;//nao achei octal por isso estou utilizando base decimal 
c = ~(6'd25)+1;
d = ~(5'hd)+1;
e = ~(8'o24)+1; 
 
$display("\nPositive value"); 
$display("a =", a); 
$display("b =", b); 
$display("c =", c); 
$display("d =", d); 
$display("e =", e); 

 
end 
endmodule // test_base 