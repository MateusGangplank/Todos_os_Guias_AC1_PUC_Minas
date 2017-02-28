// -------------------------
// Exercicio0004 - NAND2
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate ( output s, input p, input q); 
	assign s = ~p | ~q; 
endmodule  
// --------------------- 
// -- test 
// ---------------------  
module testnandgate; 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	nandgate NAND1 (s, a, b);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; 
	end 
	initial begin
		// execucao unitaria
		$display("Exercicio 0004 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test NAND de morgan"); 
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