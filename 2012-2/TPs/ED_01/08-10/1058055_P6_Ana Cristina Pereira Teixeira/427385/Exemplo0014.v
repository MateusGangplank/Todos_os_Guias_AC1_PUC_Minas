// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0014 - and - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 09.) Construir a tabela_verdade para a porta AND com 4 entradas.
// Obs.: Criar um módulo que use outros módulos AND de 2 entradas.

// --------------------- 
// -- and gate
// --------------------- 
module and2gate (output s, input p, input q);
	assign s = (p & q); // vinculo permanente
endmodule // and2gate

module and4gate (output s, input a, input b, input c, input d);
	wire z, z1; // conexao
	and2gate AND2_1 (z, a, b);
	and2gate AND2_2 (z1, z, c);
	and2gate AND2_3 (s, z1, d);
endmodule // and3gate

// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg a, b, c, d; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	and4gate AND4 (s, a, b, c, d);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0014 - Exercicio0009 - Ana Cristina - 427385");
		$display("Test and gate");
		$display("\n a & b & c & d= s\n");
		$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
		#1 a = 0; b = 0; c = 0; d = 0;
		#1 a = 0; b = 0; c = 0; d = 1;
		#1 a = 0; b = 0; c = 1; d = 0;
		#1 a = 0; b = 0; c = 1; d = 1;
		#1 a = 0; b = 1; c = 0; d = 0;
		#1 a = 0; b = 1; c = 0; d = 1;
		#1 a = 0; b = 1; c = 1; d = 0;
		#1 a = 0; b = 1; c = 1; d = 1;
		#1 a = 1; b = 0; c = 0; d = 0;
		#1 a = 1; b = 0; c = 0; d = 1;
		#1 a = 1; b = 0; c = 1; d = 0;
		#1 a = 1; b = 0; c = 1; d = 1;
		#1 a = 1; b = 1; c = 0; d = 0;
		#1 a = 1; b = 1; c = 0; d = 1;
		#1 a = 1; b = 1; c = 1; d = 0;
		#1 a = 1; b = 1; c = 1; d = 1;
	end
endmodule // testandgate