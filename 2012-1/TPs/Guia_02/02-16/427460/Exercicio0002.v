// ------------------------- 
// Exercicio0002 - BASE 
// Nome: Rodrigo Arruda de Assis
// Matricula: 427460 

// ------------------------- 
// ------------------------- 
// test number system 

// ------------------------- 
	module test_base_01; 

// ------------------------- definir dados 
	reg [5:0] a; 
	reg [4:0] b; 
	reg [3:0] c; 
	reg [8:0] d; 
	reg [3:0] e;

// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0002 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 6'b101010 + 5'b11010; 
		b = 5'b11010 + 5'o25; 
		c = 10'o1234 / 6'h2B; 
		d = 9'h1CA - 9'b101110001; 
		e = 5'd25 * 5'o31 + 7'h7A;

	$display("\nPositive value"); 	
	$display("a = %d = %6b", a, a); 
	$display("b = %d = %5b", b, b); 
	$display("c = %d = %4b", c, c); 
	$display("d = %d = %7b", d, d); 
	$display("e = %d = %4b", e, e); 

	
		
end 
endmodule // test_base 