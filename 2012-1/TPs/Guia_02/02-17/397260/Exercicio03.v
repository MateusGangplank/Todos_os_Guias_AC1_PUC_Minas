// ------------------------- 
// Exercicio3
// Nome: Pedro Henrique Hardeman Guedes 
// Matricula: 397260
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_03; 
// ------------------------- definir dados 
reg a; 
reg b; 
reg c; 
reg d; 
reg e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio3 - Pedro Henrique Hardeman Guedes - 397260"); 
$display("Test number system"); 
a = -(6'b100111); 
b = -(5'o23); 
c = -23; 
d = -(6'h2B); 
e = -(26 - 36); 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 

end 
endmodule // test 