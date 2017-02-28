// ------------------------- 
// Exemplo0010 - OR 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// ------------------------- 
// -- or gate 
// ------------------------- 
	module orgate ( output s, input p, q, r); 
	assign s = ~(~p & ~q & ~r); // por de Morgan
	endmodule // orgate 
	
// --------------------- 
// -- test or gate 
// --------------------- 
	module testorgate; 
// ------------------------- dados locais 
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
	initial begin:start 
		a=0; b=0; c=0; 
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0010 - Guilherme Terra - 427407"); 
		$display("Test OR gate"); 
		$display("\na | b | c = s\n"); 
		a=0; b=0; c=0; 
	#1 $display("%b | %b | %b = %b", a, b, c, s); 
		a=0; b=0; c=1; 
	#1 $display("%b | %b | %b = %b", a, b, c, s); 
		a=0; b=1; c=0; 
	#1 $display("%b | %b | %b = %b", a, b, c, s); 
		a=0; b=1; c=1; 
	#1 $display("%b | %b | %b = %b", a, b, c, s); 
		a=1; b=0; c=0; 
	#1 $display("%b | %b | %b = %b", a, b, c, s);
		a=1; b=0; c=1; 
	#1 $display("%b | %b | %b = %b", a, b, c, s);
		a=1; b=1; c=0; 
	#1 $display("%b | %b | %b = %b", a, b, c, s);
		a=1; b=1; c=1; 
	#1 $display("%b | %b | %b = %b", a, b, c, s);
	end 

endmodule // testorgate 

// ------------------------- testes

/*
	Test OR gate

	a | b | c = s

	0 | 0 | 0 = 0
	0 | 0 | 1 = 1
	0 | 1 | 0 = 1
	0 | 1 | 1 = 1
	1 | 0 | 0 = 1
	1 | 0 | 1 = 1
	1 | 1 | 0 = 1
	1 | 1 | 1 = 1
*/