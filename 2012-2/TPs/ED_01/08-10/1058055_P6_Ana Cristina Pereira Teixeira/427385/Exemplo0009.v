// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0009 - nand - de morgan 
// Nome: Ana Cristina P. Teixeira
// Matricula: 427385

// 04. Construir a tabela_verdade para a porta NAND com 2 entradas.
// Obs.: Usar na definição do módulo a propriedade de Morgan.

// --------------------- 
// -- nand gate 
// --------------------- 
module nandgate (output s, input p, input q);
	assign s = ~p | ~q; // vinculo permanente
endmodule // nand

// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	nandgate NAND1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0009 - Exercicio0004 - Ana Cristina - 427385");
		$display("Test nand gate");
		$display("\n ~a | ~b = s\n");
		$monitor("~%b | ~%b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testnandgate

// previsao de testes
// ~a | ~b
// resultados esperados
// ~0 | ~0 = 1 | 1 = 1
// ~0 | ~1 = 1 | 0 = 1
// ~1 | ~0 = 0 | 1 = 1
// ~1 | ~1 = 0 | 0 = 0
// conclusao nandgate funcionou corretamente como o esperado