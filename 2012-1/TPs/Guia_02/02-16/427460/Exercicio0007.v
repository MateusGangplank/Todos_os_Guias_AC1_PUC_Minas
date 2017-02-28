// ------------------------- 
// Exercicio0007 - BASE 
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
	$display("Exercicio0007 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test number system"); 
		
		a = 8'b10000001;
		
	
	$display("\nPositive value"); 	
	$display("a = %d = %b", a, -a); 

	
		
end 
endmodule // test_base 