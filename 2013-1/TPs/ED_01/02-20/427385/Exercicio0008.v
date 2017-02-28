// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 08 - Construir a tabela_verdade para a porta AND com 3 entradas
// Obs - Usar expressão na definicao do modulo

// Exercicio0008 - and - 3 entradas

// --------------------- 
// -- and gate 
// --------------------- 
module andgate (output s, input a, input b, input c);
	assign s = a & b & c ; // vinculo permanente
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
		$display("Exercicio 0008 - ANA CRISTINA - 427385");
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

// -- Testes
// Exercicio 0008 - ANA CRISTINA - 427385
// Test and gate
// a & b & c = s
// 0 & 0 & 0 = 0
// 0 & 0 & 1 = 0
// 0 & 1 & 0 = 0
// 0 & 1 & 1 = 0
// 1 & 0 & 0 = 0
// 1 & 0 & 1 = 0
// 1 & 1 & 0 = 0
// 1 & 1 & 1 = 1
    