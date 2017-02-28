// Exercicio 7 - XNOR  
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- xnor gate 
// ------------------------- 
module xnorgate (output s, input p, input q);  
	assign s = p&q | (~p)&(~q); 
endmodule 

// ------------------------- 
// -- test xnor gate 
// ------------------------- 
module testxnorgate; 
	reg a,b; 	 
	wire s; 
	xnorgate XNOR1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 7 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test XNOR Gate:"); 
		$display("\na ~^ b = s\n");
		$monitor("%b ~^ %b = %b", a,b,s);
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1; 
	end 
endmodule 