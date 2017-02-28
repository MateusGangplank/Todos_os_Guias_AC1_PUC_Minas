// -------------------------
// Exercicio0005 - NOR2
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
module norgate ( output s, input p, input q); 
	assign s = ~p & ~q; 
endmodule  
// --------------------- 
// -- test 
// ---------------------  
module testnorgate; 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	norgate NOR1 (s, a, b);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; 
	end 
	initial begin//:main
		// execucao unitaria
		$display("Exercicio 0005 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test NOR de morgan"); 
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