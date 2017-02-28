// ------------------------- 
// Exercicio5 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_05; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d; 
reg [7:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exercicio5 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test number system"); 
a = 6'b101010 - 4'b1101; 
b = 5'b11010 - 4'o15; 
c = 5'o34 - 4'hB; 
d = 8'hCA - 8'b10111001; 
e = 25 - 5'h1A; 
$display("a = %b", a); 
$display("b = %b", b); 
$display("c = %b", c); 
$display("d = %b", d); 
$display("e = %b", e); 
 
end 
endmodule // test 