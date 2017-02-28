// ------------------------- 
// Exemplo0003 - AND 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// ------------------------- 
// Altera��es feitas:
// Troquei a porta NOT pela porta AND
// com duas entradas em vez de uma s�.
// Previs�o:
// A sa�da � a conjun��o das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0) e (a=1 e b=1).
// Observa��es da sa�da:
// A sa�da � uma tabela verdade da conjun��o.
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
	input p, 
	input q); 
	assign s = p & q; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
	// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s;   // definir conexao (fio) 
	// ------------------------- instancia 
	andgate AND1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0; b=0; 
	end 
	// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0003 - Daniel Telles McGinnis - 435042"); 
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