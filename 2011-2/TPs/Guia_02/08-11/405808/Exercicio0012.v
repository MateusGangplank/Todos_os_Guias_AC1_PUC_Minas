// ------------------------- 
// Exercicio0012 - BASE 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_02; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [9:0] d; 
reg [5:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0012 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test number system"); 
a = 6'b100010 + 5'b11010; 
b = 5'b11010 + 6'o23; 
c = 12'o1234 / 32'h2d; 
d = 48'h1a9 + 9'b101101001; 
e = 6'o25 * 6'o41 + 32'h6b;
$display("\nPositive value"); 
$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %3b", d, d);
$display("e = %d = %3b", e, e);
end 
endmodule // test_base 2