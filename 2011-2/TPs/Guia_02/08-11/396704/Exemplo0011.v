// ------------------------- 
// Exemplo0011 - BASE 
// Nome: 396704	
// Matricula: Igor Thadeu 
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
	$display("Exemplo0011 - Igor Thadeu - 396704"); 
	$display("Test number system"); 
	a = 5; 
	b = 10; 
	c = 15; 
	d = 20; 
	
	$display("\nResultado"); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", a, a); 
	$display("c = %d = %5b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
	$display("d = %d = %5b", d, d); 
	$display("d = %d = %5o", d, d); 
	$display("d = %d = %5h", d, d); 

end 
endmodule // test_base 