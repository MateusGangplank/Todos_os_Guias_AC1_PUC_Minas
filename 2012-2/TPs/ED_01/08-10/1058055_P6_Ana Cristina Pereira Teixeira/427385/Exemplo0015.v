// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0015 - or - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 10.) Construir a tabela_verdade para a porta OR com 4 entradas.
// Obs.: Criar um módulo que use outros módulos OR de 2 entradas.

// --------------------- 
// -- or gate
// --------------------- 
module or2gate (output s, input p, input q);
	assign s = (p | q); // vinculo permanente
endmodule // or2gate

module or4gate (output s, input a, input b, input c, input d);
	wire z, z1; // conexao
	or2gate OR2_1 (z, a, b);
	or2gate OR2_2 (z1, z, c);
	or2gate OR3_3 (s, z1, d);
endmodule // or3gate

// --------------------- 
// -- test orgate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
	reg a, b, c, d; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	or4gate OR4 (s, a, b, c, d);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0015 - Exercicio0010 - Ana Cristina - 427385");
		$display("Test or gate");
		$display("\n a | b | c | d = s\n");
		$monitor("%b | %b | %b | %b = %b", a, b, c, d, s);
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