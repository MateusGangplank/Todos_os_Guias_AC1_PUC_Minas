// ------------------------- 
// Exemplo0032 - F4 EXERCICIO @@@@2222222222222222222222222222
// Nome: Fabio Fiuza Pereira
// Matricula: 406087
// -------------------------
//------------------EXERCICIO 2
// -------------------------
// --- selecionador
// -------------------------
module Chaveado (output s1, input a, input b, input ch);
	
	wire w1, w2, w3, w4;
	
	and And01 (w1, a, b);
   or or1 (w2, a, b);
	
	
	and and2 (w3, w1, ch);
	and and3 (w4, w2, ~ch);
	
	
	or or2 (s1, w3, w4);
	
	 
	
endmodule // -- selecionador

module test_f4;
	
	reg x, y, ch;
	wire s1;
	
	Chaveado modulo22 (s1, x, y, ch);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0032 - Fabio Fiuza Pereira - 406087");
	$display("Test LU's module");
		
	#1 x = 0; y = 0; ch = 0;
	
	$monitor("Chave = %1b A = %1b B = %1b Saida = %1b", ch, x, y, s1);
		
		#1 x = 0; y = 0; ch = 0;
		#1 x = 0; y = 1; ch = 0;
		#1 x = 1; y = 0; ch = 0;
		#1 x = 1; y = 1; ch = 0;
		#1 x = 0; y = 0; ch = 1;
		#1 x = 0; y = 1; ch = 1;
		#1 x = 1; y = 0; ch = 1;
		#1 x = 1; y = 1; ch = 1;
	
	
		
		
	end
endmodule // 