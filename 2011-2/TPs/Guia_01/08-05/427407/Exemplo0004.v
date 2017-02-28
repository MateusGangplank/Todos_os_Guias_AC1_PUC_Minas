// ------------------------- 
// Exemplo0004 - OR 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// -- or gate 
// ------------------------- 
	module orgate ( output s, input p, q); 
	assign s = p | q; 
	endmodule // orgate 
	
// --------------------- 
// -- test or gate 
// --------------------- 
	module testorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	orgate OR1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
		a=0; b=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0004 - Guilherme Terra - 427407"); 
		$display("Test OR gate"); 
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

endmodule // testorgate 

// ------------------------- testes

/*
	Test OR gate

	a & b = s

	0 & 0 = 0
	0 & 1 = 1
	1 & 0 = 1
	1 & 1 = 1
*/