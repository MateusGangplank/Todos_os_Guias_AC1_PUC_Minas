 // ------------------------- 
// Exemplo0012 - BASE 
// Nome: Rafael Santos Moura 
// Matricula: 441705 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [4:0] d; 

// ------------------------- parte principal 
initial begin 
$display("Exemplo0012 - Rafael Santos Moura - 441705"); 
$display("Test number system"); 
a = 5; 
b = 10; 
c = 15; 
d = 20; 
$display("\nPositive value"); 
$display("a = %d = %3b", a, a); 
$display("b = %d = %4b", a, a); 
$display("c = %d = %5b", a, a); 
$display("b = %d = %4b", b, b); 
$display("c = %d = %5b", c, c); 
$display("d = %d = %5b", d, d); 
$display("d = %d = %5o", d, d); 
$display("d = %d = %5h", d, d); 
a = -5; 
b = -5; 
c = -5; 
$display("\nNegative value"); 
$display("a = -5 [3] = %d = %3b", a, a); 
$display("b = -5 [4] = %d = %4b", b, b); 
$display("c = -5 [5] = %d = %5b", c, c); 
end 
endmodule // test_base 