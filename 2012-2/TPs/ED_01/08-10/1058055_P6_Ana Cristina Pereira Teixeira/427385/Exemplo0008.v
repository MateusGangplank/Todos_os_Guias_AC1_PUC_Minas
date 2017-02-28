// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0008 - xnor 
// Nome: Ana Cristina P. Teixeira
// Matricula: 427385

// 03. Construir a tabela_verdade para a porta XNOR com 2 entradas.
// Obs.: Usar operador ( ~(a^b) ) na definição do módulo.

// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output s, input p, input q);
	assign s = ~(p ^ q); // vinculo permanente
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
		$display("Exemplo0008 - Exercicio0003 - Ana Cristina - 427385");
		$display("Test xnor gate");
		$display("\n ~(a ^ b) = s\n");
		$monitor("~(%b ^ %b) = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testxnorgate
// previsao de testes

// ~(a ^ b) 
// ~(0 ^ 0) = ~(0) = 1
// ~(0 ^ 1) = ~(1) = 0
// ~(1 ^ 0) = ~(1) = 0
// ~(1 ^ 1) = ~(0) = 1
// conclusao nandgate funcionou corretamente como o esperado