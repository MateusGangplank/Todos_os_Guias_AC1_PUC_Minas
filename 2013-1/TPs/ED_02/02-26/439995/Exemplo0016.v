 // ------------------------- 
// Exemplo0016 - BASE 
// Nome: Thauan Velasco Cunha 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d;
reg [4:0] e;  

// ------------------------- parte principal 
initial begin 
$display("Exemplo0016 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = 3 + 14; 
b = 3 * 8; 
c = 33 / 5 ; 
d = 25 - 11;
e = (2 * 8) + 7 -1;

$display("\nResultados"); 
$display("a = %2d = %5b", a, a); 
$display("b = %2d = %5b", b, b); 
$display("c = %2d = %5b", c, c); 
$display("d = %2d = %5b", d, d); 
$display("e = %2d = %5b", e, e); 
 


end 
endmodule // test_base 