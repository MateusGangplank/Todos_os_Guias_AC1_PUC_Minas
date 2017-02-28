 // ------------------------- 
// Extra01 - BASE 
// Nome: Thauan Velasco Cunha 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
 

// ------------------------- parte principal 
initial begin 
$display("Extra01 - Thauan Velasco Cunha - 439995"); 
$display("Test number system"); 

a = 'b11111000;


$display("\nResultados"); 
$display("%8b = %8b ", a, ~a); 




end 
endmodule // test_base 