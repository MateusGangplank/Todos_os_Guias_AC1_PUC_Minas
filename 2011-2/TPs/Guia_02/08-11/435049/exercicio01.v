// -------------------------
// Exemplo0016 - Exercicio01 
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
// -- modulo --
module testexer01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d; 
reg [3:0] e;
// ------------------------- parte principal 
initial begin:start
$display("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11;
e = 2 * 4 + 6 - 1;
$display("\nResultado em binario");
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %4b", e, e);
end 
endmodule // testexer01