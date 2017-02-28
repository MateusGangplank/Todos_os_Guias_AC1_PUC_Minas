// Exercicio 8 - AND com 3 entradas
// Nome: Thaise Souto Martins
// Matricula:  395504

// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate (output s, input p, input q, input r);  
	assign s = p & q & r; 
endmodule 

// ------------------------- 
// -- test and gate 
// ------------------------- 
module testandgate; 
	reg a,b,c; 	 
	wire s; 
	andgate AND1 (s, a, b, c); 
	
	initial begin:start 
		a=0;b=0;c=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 8 - Thaise Souto Martins - 395504"); 
		$display("Test AND Gate com 3 entradas:"); 
		$display("\na & b & c = s\n");
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=0;b=0;c=1;
		#1 a=0;b=1;c=0;
		#1 a=1;b=0;c=0;
		#1 a=1;b=1;c=0;
		#1 a=1;b=0;c=1;
		#1 a=0;b=1;c=1;
		#1 a=1;b=1;c=1; 
	end 
endmodule 