// Exemplo0004 - OR 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate (output s, input p, input q); 
	assign s = p | q; 
endmodule 

// ------------------------- 
// -- test or gate 
// ------------------------- 
module testortgate; 
	reg a,b; 	 
	wire s; 
	orgate OR1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exemplo 0004 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test OR Gate:"); 
		$display("\na | b = s\n"); 
		
		$monitor("%b | %b = %b", a, b, s);
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1;
	end 
endmodule