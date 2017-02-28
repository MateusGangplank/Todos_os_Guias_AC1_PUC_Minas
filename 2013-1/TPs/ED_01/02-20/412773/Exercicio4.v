// Exercicio 4 - NAND de Morgan 
// Nome: Silvino Henrique Santos de Souza 
// Matricula: 412773 

// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate (output s, input p, input q);  
	assign s = ~p | ~q; 
endmodule 

// ------------------------- 
// -- test nand gate 
// ------------------------- 
module testnandgate; 
	reg a,b; 	 
	wire s; 
	nandgate NAND1 (s, a, b); 
	
	initial begin:start 
		a=0;b=0; // valor inicial 
	end 

	initial begin:main 
		$display("Exercicio 4 - Silvino Henrique Santos de Souza - 412773"); 
		$display("Test NAND de Morgan Gate:"); 
		$display("\n ~a | ~b = s\n");
		$monitor("~%b | ~%b = %b", a,b,s);
		#1 a=0; b=0; 
		#1 a=0; b=1;
		#1 a=1; b=0;  
		#1 a=1; b=1; 
	end 
endmodule 