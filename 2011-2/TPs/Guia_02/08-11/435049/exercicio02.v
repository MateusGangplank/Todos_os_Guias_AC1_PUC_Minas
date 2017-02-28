// ------------------------- 
// Exemplo0017 - Exercicio02 
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
// -- modulo --
module testexer02; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [9:0] c; 
reg [6:0] d; 
reg [4:0] e;
// ------------------------- parte principal 
initial begin:start
$display("Exercicio02 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test number system"); 
a = 6'b100010 + 5'b11000; 
b = 5'b11010 + 5'o23; 
c = 10'o1234 + 6'h2D; 
d = 9'h1A9 - 9'b101101001;
e = 5'o25 * 6'o41 + 7'h6B;
$display("\nResultado em binario"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %4b", e, e);
end 
endmodule // testexer02 
