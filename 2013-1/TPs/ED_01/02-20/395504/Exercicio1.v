// Exercicio 1 - NAND 
// Nome: Thaise Souto Martins 
// Matricula: 395504

// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate (output s, input p, input q);  
	assign s = ~(p & q); 
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
		$display("Exercicio 1 - Thaise Souto Martins - 395504"); 
		$display("Test NAND Gate:"); 
		$display("\n ~(a & b) = s\n");
		
		a=0; b=0; 
		#1 $display("%b ~& %b = %b", a,b,s);
		a=0; b=1;
		#1 $display("%b ~& %b = %b", a,b,s);
		a=1; b=0;  
		#1 $display("%b ~& %b = %b", a,b,s);
		a=1; b=1; 
		#1 $display("%b ~& %b = %b", a,b,s);
	end 
endmodule 