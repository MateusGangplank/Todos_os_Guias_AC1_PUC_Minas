// -------------------------
// Evercicio0007 - XNOR
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- 
// ------------------------- 
module xnorgate ( output s, input p, input q); 
	assign s = (p&q)|(~p&~q);  
endmodule  
// --------------------- 
// -- test 
// ---------------------  
module testxnorgate; 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	xnorgate XNOR1 (s, a, b);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; 
	end 
	initial begin
		// execucao unitaria
		$display("Exercicio 0007 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test XNOR a b+a'b' "); 
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
endmodule