// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 06 - Construir a tabela_verdade para a porta XOR com 2 entradas
// Obs - Usar a expressao: a'b+a b' na definicao do modulo

// Exercicio006 - xor - a'b + ab'

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
		$display("Exercicio 0006 - ANA CRISTINA - 427385");
		$display("Test xor gate");
		$display("\n ((~a) & b) | (a & (~b)) = s\n");
		
		$monitor("\t%b \t%b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testxorgate

// -- Testes
// Exercicio 0006 - ANA CRISTINA - 427385
// Test xor gate
// ((~a) & b) | (a & (~b)) = s
// 	0 	0 = 0
// 	0 	1 = 1
// 	1 	0 = 1
// 	1 	1 = 0

// ((~a) & b) | (a & (~b))
// resultados esperados
// ((~0) & 0) | (0 & (~0)) = ((1) & 0) | (0 & (1)) = (0) | (0) = 0
// ((~0) & 1) | (0 & (~1)) = ((1) & 1) | (0 & (0)) = (1) | (0) = 1
// ((~1) & 0) | (1 & (~0)) = ((0) & 0) | (1 & (1)) = (0) | (1) = 1
// ((~1) & 1) | (1 & (~1)) = ((0) & 1) | (1 & (0)) = (0) | (0) = 0