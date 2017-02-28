// --------------------- 
// Exemplo0010 - nor - de morgan 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 05. Construir a tabela_verdade para a porta NOR com 2 entradas.
// Obs.: Usar na definição do módulo a propriedade de Morgan.
// ---------------------

// --------------------- 
// -- nor gate 
// --------------------- 
module norgate (output s, input p, input q);
	assign s = ~p & ~q; // vinculo permanente
endmodule // nor

// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	norgate NOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0010 - Exercicio0005 - Ana Cristina Pereira Teixeira - 427385");
		$display("Test nor gate");
		$display("\n ~a & ~b = s\n");
		$monitor("~%b & ~%b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testnorgate
// previsao de testes
// ~a & ~b
// resultados esperados
// ~0 & ~0 = 1 & 1 = 1
// ~0 & ~1 = 1 & 0 = 0
// ~1 & ~0 = 0 & 1 = 0
// ~1 & ~1 = 0 & 0 = 0
// conclusao norgate funcionou corretamente como o esperado