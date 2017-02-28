// -------------------------
// Exemplo0033 
// Nome: Thauan Velasco Cunha
// Matricula: 439995
// -------------------------
// -------------------------
// 
// -------------------------
module Exercicio33 (output s1, output s2, input a, input b, input ch);
	
	wire w1, w2, w3, w4, w5, w6, w7, w8;
	
	and And01 (w1, a, b);
	nand Nand1 (w2, a, b);
	or or1 (w3, a, b);
	nor nor1 (w4, a, b);
	
	and and2 (w5, w1, ~ch);
	and and3 (w6, w2, ch);
	and and4 (w7, w3, ~ch);
	and and5 (w8, ch, w4);
	
	or or2 (s1, w5, w6);
	or or3 (s2, w7, w8);
	 
	
endmodule // -- selecionador

module test_f4;
	
	reg x, y, chave;
	wire saida, saida2;
	
	Exercicio33 Exercicio0033 (saida, saida2, x, y, chave);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0033 - Thauan Velasco Cunha - 439995");
	$display("Test LU's module");
		
	#1 x = 0; y = 0; chave = 0;
	
	$monitor("Chave = %1b A = %1b B = %1b Saida = %1b  Saida = %1b", chave, x, y, saida, saida2);
		
		#1 x = 0; y = 0; chave = 0;
		#1 x = 0; y = 1; chave = 0;
		#1 x = 1; y = 0; chave = 0;
		#1 x = 1; y = 1; chave = 0;
		#1 x = 0; y = 0; chave = 1;
		#1 x = 0; y = 1; chave = 1;
		#1 x = 1; y = 0; chave = 1;
		#1 x = 1; y = 1; chave = 1;
	
	
		
		
	end
endmodule //