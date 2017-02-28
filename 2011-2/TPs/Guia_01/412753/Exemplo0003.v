// ------------------------- 
// Exemplo0003 - AND 
// Nome: Luís Vasconcelos Dias
// Matricula: 412753
// ------------------------- 

// ------------------------- 
// -- and gate 
// ------------------------- 
	module andgate ( output s, input p, input q); 
	assign s = p & q; 
	endmodule // andgate
	
// --------------------- 
// -- test and gate 
// --------------------- 
	module testandgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	andgate AND1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
	a=0; b=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0003 - Luís Vasconcelos Dias - 412753"); 
		$display("Test AND gate"); 
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

// ------------------------- testes

/*
	Test AND gate

	a & b = s

	0 & 0 = 0
	0 & 1 = 0
	1 & 0 = 0
	1 & 1 = 1
*/