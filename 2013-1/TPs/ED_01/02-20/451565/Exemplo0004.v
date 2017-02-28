// -------------------------
// Exemplo0004 - OR
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input p, input q); 
	assign s = p | q; 
endmodule // andgate 
// --------------------- 
// -- test or gate 
// ---------------------  
module testandgate; 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	orgate OR1 (s, a, b);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; 
	end 
	initial begin//:main
		// execucao unitaria
		$display("Exemplo 0004 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test OR"); 
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