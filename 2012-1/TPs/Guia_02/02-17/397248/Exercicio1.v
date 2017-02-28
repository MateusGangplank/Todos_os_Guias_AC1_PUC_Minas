// ------------------------- 
// Exercicio1
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_01; 
// ------------------------- definir dados 
reg a; 
reg b; 
reg c; 
reg d; 
reg e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio1 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test number system"); 
a = 2 + 15; 
b = 3 * 8; 
c = 32 / 3; 
d = 21 - 11; 
e = 2 * 5 + 6 - 1; 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
 
end 
endmodule // test 