// ------------------------- 
// Exercicios03 - BASE 
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
reg [4:0] c; 
reg [4:0] d;
reg [4:0] e;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Milton costa teles da silva - 2751"); 
$display("Test number system"); 
a = 6'b100111; 
b = 6'o54; 
c = 13; 
d = 5'h1b;
e = 25 - 36 ;   
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d);   
$display("e = %d = %b", e, e);  
end 
endmodule // test_base