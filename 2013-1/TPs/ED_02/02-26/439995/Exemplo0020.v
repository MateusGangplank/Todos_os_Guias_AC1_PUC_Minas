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
reg [7:0] b; 
reg [7:0] c; 
reg [7:0] d;
reg [7:0] e;  

// ------------------------- parte principal 
initial begin 
$display("Exmeplo0019 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = (6'b101011)+(~(4'b1001)+1);
b = ('b10011)+(~('o15)+1);
c = ('o35)+(~('hc)+1); 
d = ('hba)+(~('b10111001)+1);
e = ('d37)+(~('h1b)+1);

$display("\nResultados"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %5b", c, c); 
$display("d = %d = %5b", d, d); 
$display("e = %d = %5b", e, e); 



end 
endmodule // test_base 