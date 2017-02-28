// --------------------- 
// Exemplo0011 - xor - a'b + ab' 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 06. Construir a tabela_verdade para a porta XOR com 2 entradas.
// Obs.: Usar a expressão: a'b+a b' na definição do módulo. 
// ---------------------

// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output s, input p, input q);
	assign s = (~p & q) | (p & ~q); // vinculo permanente
	// assign s = (p | q) & (~p | ~q);
endmodule // xor

// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xorgate XOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0011 - Exercicio0006 - Ana Cristina Pereira Teixeira - 427385");
		$display("Test xor gate");
		$display("\n ((~a) & b) | (a & (~b)) = s\n");
		$monitor("\t%b \t%b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testxorgate
// previsao de testes
// ((~a) & b) | (a & (~b))
// resultados esperados
// ((~0) & 0) | (0 & (~0)) = ((1) & 0) | (0 & (1)) = (0) | (0) = 0
// ((~0) & 1) | (0 & (~1)) = ((1) & 1) | (0 & (0)) = (1) | (0) = 1
// ((~1) & 0) | (1 & (~0)) = ((0) & 0) | (1 & (1)) = (0) | (1) = 1
// ((~1) & 1) | (1 & (~1)) = ((0) & 1) | (1 & (0)) = (0) | (0) = 0
// conclusao xorgate funcionou corretamente como o esperado
// as saidas do $monitor são apenas da variacao dos registradores a e b de acordo com o tempo
// e nao o resultado de cada parentese/expressao