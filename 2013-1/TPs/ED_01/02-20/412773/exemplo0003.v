// Exemplo0003 - AND 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate (output s, input p, input q); 
	assign s = p & q; 
endmodule 

// ------------------------- 
// -- test and gate 
// ------------------------- 
module testandgate; 
	reg a,b; 	 
	wire s; 
	andgate AND1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exemplo 0003 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test AND Gate:"); 
		$display("\na & b = s\n");
		
		$monitor("%b & %b = %b", a, b, s); 
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1;
	end 
endmodule 