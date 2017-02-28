// ------------------------- 
// Exemplo0012 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 2751 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [4:0] d;// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Milton costa teles da silva - 2751"); 
$display("Test number system");  
a = -5; 
b = -5; 
c = -5; 
$display("\nNegative value"); 
$display("a = -5 [3] = %d = %3b", a, a); 
$display("b = -5 [4] = %d = %4b", b, b); 
$display("c = -5 [5] = %d = %5b", c, c); 
end 
endmodule // test_base 
 