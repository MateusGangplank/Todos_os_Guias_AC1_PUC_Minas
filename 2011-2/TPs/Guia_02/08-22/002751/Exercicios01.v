// ------------------------- 
// Exercicios01 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 2751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [4:0] c; 
reg [4:0] d;
reg [3:0] e;
reg [5:0] f;
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Milton costa teles da silva - 2751"); 
$display("Test number system");  
a = 2 + 14; 
b = 3 * 7 ;
c = 34 / 3; 
d = 19 - 11 ;
e = 2 * 4 + 6 - 1 ; 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("c = %d = %b", c, c); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e);  
end 
endmodule // test_base