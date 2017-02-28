// ------------------------- 
// Exercicio0011 - BASE 
// Nome: José Ferreira Reis Fonseca 
// Matricula: 405808
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d; 
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0011 - Jose Ferreira Reis Fonseca - 405808"); 
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11; 
e = 2 * 4 + 6 - 1;
$display("\nPositive value"); 
$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %3b", d, d);
$display("e = %d = %3b", e, e);
end 
endmodule // test_base 1