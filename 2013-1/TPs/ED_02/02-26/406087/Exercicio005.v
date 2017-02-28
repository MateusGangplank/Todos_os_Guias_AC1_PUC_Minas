
 // ------------------------- 
// Exercicio005
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 

 module Teste;
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [4:0] c; 
reg [8:0] d; 
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio005 - Fabio Fiuza Pereira - 406087"); 
$display("Test number system"); 
a = ~(8'b101011-8'b1001)+1; 
b = ~(8'b10011-8'o15)+1; 
c = ~(8'o35-8'hC)+1;
d = ~(8'hba-8'b10111001)+1;
e = ~(8'd37-8'h1b)+1; 
 
$display("\nPositive value"); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 

 
end 
endmodule // test_base 