
 // ------------------------- 
// Exercicio002
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
a = 6'b100110 +6'b11011; 
b = 5'b11101*5'o25; 
c = 12'o1234/7'h4c;
d = 9'hba-9'b101110011;
e = 25 * 5'o32 + 8'h8a; 
 
$display("\nPositive value"); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 

 
end 
endmodule // test_base 