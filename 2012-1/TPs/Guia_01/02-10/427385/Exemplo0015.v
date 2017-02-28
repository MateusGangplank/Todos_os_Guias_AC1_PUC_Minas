// --------------------- 
// Exemplo0015 - or - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 10.) Construir a tabela_verdade para a porta OR com 3 entradas.
// Obs.: Criar um módulo que use outros módulos OR de 2 entradas.
// ---------------------

// --------------------- 
// -- or gate  - 3 entradas
// --------------------- 
module or2gate (output s, input p, input q);
	assign s = (p | q); // vinculo permanente
endmodule // or2gate

module or3gate (output s, input a, input b, input c);
	wire z; // conexao
	or2gate OR2_1 (z, a, b);
	or2gate OR2_2 (s, z, c);
endmodule // or3gate

// --------------------- 
// -- test orgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
	reg a, b, c; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	or3gate OR3 (s, a, b, c);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0015 - Exercicio0010 - Ana Cristina Pereira Teixeira - 427385");
		$display("Test or gate");
		$display("\n a | b | c = s\n");
		$monitor("%b | %b | %b = %b", a, b, c, s);
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
// a | b | c = s
// resultados esperados
// 0 | 0 | 0 = 0 | 0 = 0
// 0 | 0 | 1 = 0 | 1 = 1
// 0 | 1 | 0 = 1 | 0 = 1
// 0 | 1 | 1 = 1 | 1 = 1
// 1 | 0 | 0 = 1 | 0 = 1
// 1 | 0 | 1 = 1 | 1 = 1
// 1 | 1 | 0 = 1 | 0 = 1
// 1 | 1 | 1 = 1 | 1 = 1
// conclusao andgate funcionou corretamente como o esperado