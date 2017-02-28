// ------------------------- 
// Extra0001 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a;

// ------------------------- parte principal 
initial begin 
$display("Extra 0001 - Raphael Quintao - 445171");  

a = 'b00000111;

$display("%8b = %8b", a, ~a);
end 
endmodule // test_base 