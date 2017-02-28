// ------------------------- 
// Exercicio02  - NOR 
// Nome: Arturo Morales Anez Junior
// Matricula: 396675

// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 

	module norgate (output s,input a,input b); 
	assign s = ~(a|b); 
	endmodule // norgate 

// --------------------- 
// -- test nor gate 
// --------------------- 

	module testnorgate; 

// ------------------------- dados locais 

	reg a, b; // entrada 
	wire s; // saida 

// ------------------------- instancia 
	
	norgate NOR1 (s, a, b); 

// ------------------------- preparacao 

	initial begin:start 
	a=0; b=0; 
	end 

// ------------------------- parte principal 
	
	initial begin 
	$display("Exercicio02 - Arturo M A Junior - 396675"); 
	$display("Test NOR gate"); 
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
	endmodule // testnorgate 