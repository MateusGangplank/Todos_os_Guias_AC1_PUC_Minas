// --------------------- 
// Exemplo0014 - and - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 09.) Construir a tabela_verdade para a porta AND com 3 entradas.
// Obs.: Criar um módulo que use outros módulos AND de 2 entradas.
// ---------------------

// --------------------- 
// -- and gate  - 3 entradas
// --------------------- 
module and2gate (output s, input p, input q);
	assign s = (p & q); // vinculo permanente
endmodule // and2gate

module and3gate (output s, input a, input b, input c);
	wire z; // conexao
	and2gate AND2_1 (z, a, b);
	and2gate AND2_2 (s, z, c);
endmodule // and3gate

// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg a, b, c; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	and3gate AND3 (s, a, b, c);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0014 - Exercicio0009 - Ana Cristina Pereira Teixeira - 427385");
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