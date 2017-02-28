// ------------------------- 
// Exercicio01   
// Nome: Arturo Morales Anez Junior
// Matricula: 396675
// ------------------------- 

	module nandgate (output s,input a,input b); 
	assign s = ~(a&b); 
	endmodule // nandgate 

// --------------------- 
// -- test nand gate 
// ---------------------
	module testnandgate; 

// ------------------------- dados locais 
	
	reg a, b; // entrada 
	wire s; //saida 

// ------------------------- instancia 
	
	nandgate NAND1 (s, a, b); 

// ------------------------- preparacao 

	initial begin:start 
	a=0; b=0; 
	end 

// ------------------------- parte principal 
	
	initial begin 
	$display("Exercicio01 - Arturo Morales Anez Junior - 396675"); 
	$display("Test NAND gate"); 
	$display("\na & b = s\n"); 
	a=0; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
	a=0; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
	a=1; b=0; 
	#1 $display("%b & %b = %b", a, b, s); 
	a=1; b=1; 
	#1 $display("%b & %b = %b", a, b, s); 
	end 
	endmodule // testandgate 