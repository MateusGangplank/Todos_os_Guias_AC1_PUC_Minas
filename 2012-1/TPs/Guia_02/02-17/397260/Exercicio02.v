// ------------------------- 
// Exercicio2 
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_02; 
// ------------------------- definir dados 
reg a; 
reg b; 
reg c; 
reg d; 
reg e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio2 - Pedro Henrique Hardeman Guedes - 397260"); 
$display("Test number system"); 
a = (6'b101010)+(5'b11010); 
b = (5'b11010)+(5'o25); 
c = (10'o1234)/(6'h2B); 
d = (9'h1CA)-(9'b101110001); 
e = 25*(5'o31)+(7'h7A); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 
 
end 
endmodule // test 