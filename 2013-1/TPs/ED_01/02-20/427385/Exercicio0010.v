// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 10 - Construir a tabela_verdade para a porta OR com 3 entradas
// Obs - Criar um módulo que use outros módulos OR de 2 entradas

// Exercicio0010 - or - 3 entradas

// --------------------- 
// -- or gate
// --------------------- 
module or2gate (output s, input p, input q);
	assign s = (p | q); // vinculo permanente
endmodule // or2gate

module or3gate (output s, input a, input b, input c);
	wire aux;
	or2gate OR1(aux,a,b);
	assign s = aux | c;
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
		$display("Exercicio 0010 - ANA CRISTINA - 427385");
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

// -- Testes
// Exercicio 0010 - ANA CRISTINA - 427385
// Test or gate
// a | b | c = s
// 0 | 0 | 0 = 0
// 0 | 0 | 1 = 1
// 0 | 1 | 0 = 1
// 0 | 1 | 1 = 1
// 1 | 0 | 0 = 1
// 1 | 0 | 1 = 1
// 1 | 1 | 0 = 1
// 1 | 1 | 1 = 1