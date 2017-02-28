// Exercicio 6 - XOR  
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- xor gate 
// ------------------------- 
module xorgate (output s, input p, input q);  
	assign s = (~p)&q | p&(~q); 
endmodule 

// ------------------------- 
// -- test xor gate 
// ------------------------- 
module testxorgate; 
	reg a,b; 	 
	wire s; 
	xorgate XOR1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 6 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test XOR Gate:"); 
		$display("\na ~| b = s\n");
		$monitor("%b ~| %b = %b", a,b,s);
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1; 
	end 
endmodule 