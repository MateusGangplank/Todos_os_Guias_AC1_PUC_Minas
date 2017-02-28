// -------------------------
// Exercicio0010 - OR3
// Nome: Guilherme Gideoni Albinati Batista
// Matricula: 451565
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input p, input q); 
	assign s = p | q; 
endmodule
// ------------------------- 
module orgate3 ( output s, input p, input q, input r); 
	wire buff;
	
	orgate OR1( buff, q, r);
	orgate OR2( s, p, buff);

endmodule
// --------------------- 
// -- test 
// ---------------------  
module testnorgate; 
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 
	// ------------------------- instancia 
	orgate3 OR3 (s, a, b, c);  
	// ------------------------- preparacao 
	initial begin:start 
	// atribuicao simultanea 
	// dos valores iniciais 
	a=0; b=0; c=0;
	end 
	initial begin//:main
		// execucao unitaria
		$display("Exercicio 0010 - Guilherme Gideoni Albinati Batista - 451565");
		$display("Test OR3"); 
		$display("\na & b & c= s\n"); 
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