 // ------------------------- 
// Exemplo0018 - BASE 
// Nome: Thauan Velasco Cunha 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [4:0] b; 
reg [4:0] c; 
reg [5:0] d;
reg [2:0] e;  

// ------------------------- parte principal 
initial begin 
$display("Exemplo0018 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = ~6'b101010+1;
b = ~5'b10101+1;
c = ~5'b11011+1; 
d = ~('h2C)+1;
e = ~5'b11001+(011100+1);

$display("\nResultados"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %5b", c, c); 
$display("d = %d = %5b", d, d); 
$display("e = %d = %5b", e, e); 



end 
endmodule // test_base 