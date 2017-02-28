// ------------------------- 
// Exercicios02 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 2751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d;
reg [9:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Milton costa teles da silva - 2751"); 
$display("Test number system");  
a = 6'b100010 + 5'b11010; 
b = 5'b11010 + 5'o23; 
c = 10'o1234 / 6'h2d; 
d = 9'h1A9 - 9'b101101001; 
e = 25 * 6'o41 + 7'h6b; 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e);  
end 
endmodule // test_base