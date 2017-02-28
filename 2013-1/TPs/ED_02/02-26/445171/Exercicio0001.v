// ------------------------- 
// Exercicio0001 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d; 
reg [4:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio 0001 - Raphael Quintao - 445171"); 

a = 3 + 14; 
b = 3 * 8; 
c = 33 / 5; 
d = 25 - 11; 
e = 2 * 8 + 7 - 1;

$display("a = %2d = %5b", a, a); 
$display("b = %2d = %5b", b, b); 
$display("c = %2d = %5b", c, c);
$display("d = %2d = %5b", d, d);
$display("e = %2d = %5b", e, e);
end 
endmodule // test_base 