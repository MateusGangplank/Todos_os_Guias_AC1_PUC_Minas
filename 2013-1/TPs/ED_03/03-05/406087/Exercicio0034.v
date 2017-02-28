// ------------------------- 
// Exemplo0034 - F4 
// Nome: Fabio Fiuza Pereira 
// Matricula: 406087
// -------------------------
//------------------EXERCICIO 4!!!!!!!!!!
// -------------------------
// --- selecionador
// -------------------------
module Chaveado (output s1, input a, input b, input ch, input ch2);
	
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;
	
	and And01 (w1, a, b);
	nand Nand1 (w2, a, b);
	or or1 (w3, a, b);
	nor nor1 (w4, a, b);
	
	and and2 (w5, w1, ~ch);
	and and3 (w6, w2, ch);
	and and4 (w7, w3, ~ch);
	and and5 (w8, ch, w4);
	
	or or2 (w9, w5, w6);
	or or3 (w10, w7, w8);
	
	and and6 (w11, w9, ~ch2);
	and and7 (w12, w10, ch2);
	
	or orfinal (s1, w11, w12);
	 
	
endmodule // -- selecionador

module test_f4;
	
	reg x, y, chave, chave2;
	wire saida;
	
	Chaveado modulo22 (saida, x, y, chave, chave2);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0032 - Fabio Fiuza Pereira - 406087");
	$display("Test LU's module");
		
	#1 x = 0; y = 0; chave = 0; chave2 = 0;
	
	$monitor("A = %1b B = %1b Chave = %1b Chave2 = %1b  Saida = %1b", x, y, chave, chave2, saida);
		
		#1 x = 0; y = 0; chave = 0; chave2 = 0;
		#1 x = 0; y = 1; chave = 0; chave2 = 0;
		#1 x = 1; y = 0; chave = 0; chave2 = 0;
		#1 x = 1; y = 1; chave = 0; chave2 = 0;
		
		#1 x = 0; y = 0; chave = 0; chave2 = 1;
		#1 x = 0; y = 1; chave = 0; chave2 = 1;
		#1 x = 1; y = 0; chave = 0; chave2 = 1;
		#1 x = 1; y = 1; chave = 0; chave2 = 1;
		
		#1 x = 0; y = 0; chave = 1; chave2 = 0;
		#1 x = 0; y = 1; chave = 1; chave2 = 0;
		#1 x = 1; y = 0; chave = 1; chave2 = 0;
		#1 x = 1; y = 1; chave = 1; chave2 = 0;
		
		#1 x = 0; y = 0; chave = 1; chave2 = 1;
		#1 x = 0; y = 1; chave = 1; chave2 = 1;
		#1 x = 1; y = 0; chave = 1; chave2 = 1;
		#1 x = 1; y = 1; chave = 1; chave2 = 1;
		
	end
endmodule // 