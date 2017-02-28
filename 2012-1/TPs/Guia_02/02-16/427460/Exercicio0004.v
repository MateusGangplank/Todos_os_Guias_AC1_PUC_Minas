// ------------------------- 
// Exercicio0004 - BASE 
// Nome: Rodrigo Arruda de Assis
// Matricula: 427460 

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
	$display("Exercicio0004 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 8'b101010;
		b = 7'b011011; 
		c = 23; 
		d = 5'hE; 
		e = 26;

	$display("\nPositive value"); 	
	$display("a = %d = %b", a, -a); 
	$display("b = %d = %b", b, -b); 
	$display("c = %d = %b", c, -c); 
	$display("d = %d = %b", d, -d); 
	$display("e = %d = %b", e, -e); 

	
		
end 
endmodule // test_base 