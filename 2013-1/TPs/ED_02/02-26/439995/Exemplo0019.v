 // ------------------------- 
// Exmeplo0019 - BASE 
// Nome: Thauan Velasco Cunha 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d;
reg [7:0] e;  

// ------------------------- parte principal 
initial begin 
$display("Exmeplo0019 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = ~(6'b101111)+1;
b = ~(6'b111001)+1;
c = ~(5'd25)+1; 
d = ~(4'hd)+1;
e = ~(5'o24);

$display("\nResultados"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %5b", c, c); 
$display("d = %d = %5b", d, d); 
$display("e = %d = %5b", e, e); 



end 
endmodule // test_base 