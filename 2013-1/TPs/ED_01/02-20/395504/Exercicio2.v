// Exercicio 2 - NOR 
// Nome:  Thaise Souto Martins
// Matricula: 395504

// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate (output s, input p, input q);  
	assign s = ~(p | q); 
endmodule 

// ------------------------- 
// -- test nor gate 
// ------------------------- 
module testnorgate; 
	reg a,b; 	 
	wire s; 
	norgate NOR1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 2 - Thaise Souto Martins - 395504"); 
		$display("Test NOR Gate:"); 
		$display("\n ~(a | b) = s\n");
		$monitor("%b ~| %b = %b", a,b,s);
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1; 
	end 
endmodule 