// -------------------------
// Exemplo0005 - XOR
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- xor gate 
// ------------------------- 
module xorgate ( output s, input p, input q); 
	assign s = p ^ q; 
endmodule  
// --------------------- 
// -- test xor gate 
// ---------------------  
module testxorgate; 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	xorgate OR1 (s, a, b);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; 
	end 
	initial begin
		// execucao unitaria
		$display("Exemplo 0005 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test XOR"); 
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