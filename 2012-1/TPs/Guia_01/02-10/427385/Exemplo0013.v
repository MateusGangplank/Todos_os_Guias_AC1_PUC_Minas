// --------------------- 
// Exemplo0013 - and - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 08. Construir a tabela_verdade para a porta AND com 3 entradas.
// Obs.: Usar expressão na definição do módulo.   
// ---------------------

// --------------------- 
// -- and gate 
// --------------------- 
module andgate (output s, input a, input b, input c);
	assign s = a & b & c; // vinculo permanente
endmodule // and

// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg a, b, c; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	andgate AND1 (s, a, b, c);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0013 - Exercicio0008 - Ana Cristina Pereira Teixeira - 427385");
		$display("Test and gate");
		$display("\n a & b & c = s\n");
		$monitor("%b & %b & %b = %b", a, b, c, s);
		#1 a = 0; b = 0; c = 0;
		#1 a = 0; b = 0; c = 1;
		#1 a = 0; b = 1; c = 0;
		#1 a = 0; b = 1; c = 1;
		#1 a = 1; b = 0; c = 0;
		#1 a = 1; b = 0; c = 1;
		#1 a = 1; b = 1; c = 0;
		#1 a = 1; b = 1; c = 1;
	end
endmodule // testandgate
// previsao de testes
// a & b & c = s
// resultados esperados
// 0 & 0 & 0 = 0 & 0 = 0
// 0 & 0 & 1 = 0 & 1 = 0
// 0 & 1 & 0 = 0 & 0 = 0
// 0 & 1 & 1 = 0 & 1 = 0
// 1 & 0 & 0 = 0 & 0 = 0
// 1 & 0 & 1 = 0 & 1 = 0
// 1 & 1 & 0 = 1 & 0 = 0
// 1 & 1 & 1 = 1 & 1 = 1
// conclusao andgate funcionou corretamente como o esperado