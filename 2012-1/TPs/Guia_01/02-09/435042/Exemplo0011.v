// --------------------- 
// Exemplo0011 - XOR 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Previsão:
// A saída é a disjunção exclusiva das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0) e (a=1 e b=1)
// Observações da saída:
// A saída é uma tabela verdade da disjunção exclusiva.
// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output s, input p, input q); 
	assign s = (~p & q) | (p & ~q); 
endmodule // xor gate
// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
	// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s;   // definir conexao (fio) 
	// ------------------------- instancia 
	xorgate XOR1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0;
		b=0;
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0011 - Daniel Telles McGinnis - 435042"); 
		$display("Test xor gate"); 
		$display("~(a ^ b) = s\n");
		$display("  a   b    s");
		$monitor("  %b   %b    %b", a, b, s);
		#1 a=0; b=0;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end 
endmodule // testxorgate 