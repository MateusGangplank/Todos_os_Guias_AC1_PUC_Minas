// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0013 - and - 3 entradas 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 08. Construir a tabela_verdade para a porta AND com 4 entradas.
// Obs.: Usar expressão na definição do módulo.   

// --------------------- 
// -- and gate 
// --------------------- 
module andgate (output s, input a, input b, input c, input d);
	assign s = a & b & c & d; // vinculo permanente
endmodule // and

// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg a, b, c, d; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	andgate AND1 (s, a, b, c, d);
// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exemplo0013 - Exercicio0008 - Ana Cristina - 427385");
		$display("Test and gate");
		$display("\n a & b & c & d = s\n");
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
