// -------------------------
// Exercicio0008 - AND3
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- and gate 
// ------------------------- 

module andgate3 ( output s, input p, input q, input r); 
	assign s = p & q & r; 
endmodule // andgate

module testandgate; 
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	andgate3 AND3 (s, a, b, c);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0;c=0; 
	end 
	initial begin//:main
		// execucao unitaria
		$display("Exercicio 0008 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test AND3"); 
		$display("\na & b & c = s\n"); 
		a=0; b=0; c=0; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=0; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=0; c=0; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=1; c=0; 
		#1 $display("%b & %b & %b = %b", a, b, c, s);  
		a=0; b=0; c=1; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=1; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=0; c=1; 
		#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=1; c=1; 
		#1 $display("%b & %b & %b = %b", a, b, c, s);
	end
endmodule