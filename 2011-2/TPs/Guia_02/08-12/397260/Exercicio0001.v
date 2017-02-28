// ------------------------- 
// Exemplo0011 - BASE 
// Nome: Pedro Henrique Hardeman Guedes 
// Matricula: 397260
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
$display("Exemplo0011 - Pedro Henrique Hardeman Guedes - 397260"); 
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11;
e = 2 * 4 + 6 -1; 
$display("\nPositive value"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c); 
$display("d = %d = %4b", d, d); 
$display("e = %e = %4b", e, e); 
end 
endmodule // test_base 