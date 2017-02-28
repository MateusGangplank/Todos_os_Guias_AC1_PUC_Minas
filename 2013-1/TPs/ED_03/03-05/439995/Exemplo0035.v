// -------------------------
// Exemplo0035 - F4
// Nome: Thauan Velasco Cunha
// Matricula: 439995
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module Exercicio35 (output s1, input a, input b, input ch, input ch2, input ch3);
	
	wire w1, w2, w3, w4, w5, w6, w7;
	
	or or1 (w1, a, b);
	nor nor1 (w2, a, b);
	and and1 (w3, a, b);
	nand nand1 (w4, a, b);
	xor xor1 (w5, a, b);
	xnor xnor1 (w6, a, b);
	not not1 (w7, a);
	
	wire f1, f2, f3, f4, f5, f6, f7;
// USAR PORTA not PARA ~c1, ~c2, ~c3 TAMBEM	
	and and2 (f1, ~ch, ~ch2, ~ch3);
	and and3 (f2, ~ch, ~ch2, ch3);
	and and4 (f3, ~ch, ch2, ~ch3);
	and and5 (f4, ~ch, ch2, ch3);
	and and6 (f5, ch, ~ch2, ~ch3);
	and and7 (f6, ch, ~ch2, ch3);
	and and8 (f7, ch, ch2, ~ch3);
		
	or or2 (s1, f1, f2, f3, f4, f5, f6, f7);
	
	endmodule // -- selecionador

module test_f4;
	
	reg x, y, chave, chave2, chave3;
	wire saida;
	
	Exercicio35 Exercicio0035 (saida, x, y, chave, chave2, chave3);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0035 - Thauan Velasco - 439995");
	$display("Test LU's module");
		
	#1 x = 0; y = 0; chave = 0; chave2 = 0;
	
	$monitor("A = %1b B = %1b Chave = %1b Chave2 = %1b Chave3 = %1b  Saida = %1b", x, y, chave, chave2, chave3, saida);
		
		#1 x = 0; y = 0; chave = 0; chave2 = 0; chave3 = 0;
		#1 x = 0; y = 1; chave = 0; chave2 = 0; chave3 = 0;
		#1 x = 1; y = 0; chave = 0; chave2 = 0; chave3 = 0;
		#1 x = 1; y = 1; chave = 0; chave2 = 0; chave3 = 0;
		
		#1 x = 0; y = 0; chave = 0; chave2 = 0; chave3 = 1;
		#1 x = 0; y = 1; chave = 0; chave2 = 0; chave3 = 1;
		#1 x = 1; y = 0; chave = 0; chave2 = 0; chave3 = 1;
		#1 x = 1; y = 1; chave = 0; chave2 = 0; chave3 = 1;
		
	   #1 x = 0; y = 0; chave = 0; chave2 = 1; chave3 = 0;
		#1 x = 0; y = 1; chave = 0; chave2 = 1; chave3 = 0;
		#1 x = 1; y = 0; chave = 0; chave2 = 1; chave3 = 0;
		#1 x = 1; y = 1; chave = 0; chave2 = 1; chave3 = 0;
		
		#1 x = 0; y = 0; chave = 0; chave2 = 1; chave3 = 1;
		#1 x = 0; y = 1; chave = 0; chave2 = 1; chave3 = 1;
		#1 x = 1; y = 0; chave = 0; chave2 = 1; chave3 = 1;
		#1 x = 1; y = 1; chave = 0; chave2 = 1; chave3 = 1;
		
		#1 x = 0; y = 0; chave = 1; chave2 = 0; chave3 = 0;
		#1 x = 0; y = 1; chave = 1; chave2 = 0; chave3 = 0;
		#1 x = 1; y = 0; chave = 1; chave2 = 0; chave3 = 0;
		#1 x = 1; y = 1; chave = 1; chave2 = 0; chave3 = 0;
		
		#1 x = 0; y = 0; chave = 1; chave2 = 0; chave3 = 1;
		#1 x = 0; y = 1; chave = 1; chave2 = 0; chave3 = 1;
		#1 x = 1; y = 0; chave = 1; chave2 = 0; chave3 = 1;
		#1 x = 1; y = 1; chave = 1; chave2 = 0; chave3 = 1;
		
		#1 x = 0; y = 0; chave = 1; chave2 = 1; chave3 = 0;
		#1 x = 0; y = 1; chave = 1; chave2 = 1; chave3 = 0;
		#1 x = 1; y = 0; chave = 1; chave2 = 1; chave3 = 0;
		#1 x = 1; y = 1; chave = 1; chave2 = 1; chave3 = 0;
		

	end
endmodule //