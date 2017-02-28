// ------------------------- 
// Exercicio0003 - BASE 
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
	reg [4:0] c; 
	reg [5:0] d; 
	reg [3:0] e;

// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0003 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 6'b100111;
		b = 5'o23; 
		c = 23; 
		d = 6'h2B; 
		e = 26 - 36;

	$display("\nPositive value"); 	
	$display("a = %d = %b", a, -a); 
	$display("b = %d = %b", b, -b); 
	$display("c = %d = %b", c, -c); 
	$display("d = %d = %b", d, -d); 
	$display("e = %d = %b", e, -e); 

	
		
end 
endmodule // test_base 