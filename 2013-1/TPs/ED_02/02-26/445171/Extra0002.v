// ------------------------- 
// Extra0002 - BASE 
// Nome: Raphael Quintao 
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a;
reg [7:0] b;

// ------------------------- parte principal 
initial begin 
$display("Extra 0002 - Raphael Quintao - 445171");  

a = 'b00000111;
b = ~a+1;

$display("%8b = %8b", a, b);
end 
endmodule // test_base 