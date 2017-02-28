// ------------------------- 
// Exercicio0005 - BASE 
// Nome: Rodrigo Arruda de Assis
// Matricula: 427460 

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
	$display("Exercicio0005 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 8'b101010 - 8'b1101;
		b = 8'b11010 - 8'o15; 
		c = 8'o34 - 8'hB; 
		d = 8'hCA - 8'b10111001 ; 
		e = 25 - 8'h1A;
	
	
	
	$display("\nPositive value"); 	
	$display("a = %d = %b", a, -a); 
	$display("b = %d = %b", b, -b); 
	$display("c = %d = %b", c, -c); 
	$display("d = %d = %b", d, -d); 
	$display("e = %d = %b", e, -e); 

	
		
end 
endmodule // test_base 