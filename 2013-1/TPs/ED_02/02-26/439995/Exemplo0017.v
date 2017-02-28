 // ------------------------- 
// Exemplo0017 - BASE 
// Nome: Thauan Velasco Cunha 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d;
reg [9:0] e;  

// ------------------------- parte principal 
initial begin 
$display("Exemplo0017 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = 6'b100110 + 5'b11011;
b = 5'b11101 + 5'o25;
c = 10'o1234 / 7'h4c; 
d = 9'h1ba - 9'b101110011;
e = 5'd25 * 5'o32 + 8'h8a;

$display("\nResultados"); 
$display("a = %2d = %5b", a, a); 
$display("b = %2d = %5b", b, b); 
$display("c = %2d = %5b", c, c); 
$display("d = %2d = %5b", d, d); 
$display("e = %2d = %5b", e, e); 



end 
endmodule // test_base 