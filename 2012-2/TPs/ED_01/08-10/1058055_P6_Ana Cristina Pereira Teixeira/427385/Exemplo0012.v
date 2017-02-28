// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0012 - xnor - ab + a'b' 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 07. Construir a tabela_verdade para a porta XNOR com 2 entradas.
// Obs.: Usar a expressão: ab+a'b' na definição do módulo.  

// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output s, input p, input q);
	assign s = (p & q) | (~p & ~q); // vinculo permanente
endmodule // xnor

// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0012 - Exercicio0007 - Ana Cristina - 427385");
		$display("Test xnor gate");
		$display("\n (a & b) | (~a & (~b)) = s\n");
		$monitor("\t%b \t%b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testxnorgate

// previsao de testes
// (a & b) | ((~a) & (~b))
// resultados esperados
// (0 & 0) | ((~0) & (~0)) = (0 & 0) | ((1) & (1)) = (0) | (1) = 1
// (0 & 1) | ((~0) & (~1)) = (0 & 1) | ((1) & (0)) = (0) | (0) = 0
// (1 & 0) | ((~1) & (~0)) = (1 & 0) | ((0) & (1)) = (0) | (0) = 0
// (1 & 1) | ((~1) & (~1)) = (1 & 1) | ((0) & (0)) = (1) | (0) = 1
// conclusao xorgate funcionou corretamente como o esperado
// as saidas do $monitor são apenas da variacao dos registradores a e b de acordo com o tempo
// e nao o resultado de cada parentese/expressao