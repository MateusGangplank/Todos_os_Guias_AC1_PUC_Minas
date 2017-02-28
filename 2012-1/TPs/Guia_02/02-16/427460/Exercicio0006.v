// ------------------------- 
// Exercicio0006 - BASE 
// Nome: Rodrigo Arruda de Assis
// Matricula: 427460 

// ------------------------- 
// ------------------------- 
// test number system 

// ------------------------- 
	module test_base_01; 

// ------------------------- definir dados 
	reg [7:0] a; 
	

// ------------------------- parte principal 
	initial begin 
	$display("Exercicio0006 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 8'b0;
		
	
	$display("\nPositive value"); 	
	$display("a = %d = %b", a, ~a); 

	
		
end 
endmodule // test_base 