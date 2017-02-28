// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 09 - Construir a tabela_verdade para a porta AND com 3 entradas
// Obs - Criar um módulo que use outros módulos AND de 2 entradas

// Exercicio0009 - and - 3 entradas

// --------------------- 
// -- and gate
// ---------------------
module and2gate (output s, input p, input q);  
	assign s = p & q; 
endmodule

module and3gate(output s,input p,input q, input r);
	wire aux;
	and2gate AND1(aux,p,q);
	assign s = aux & r;
endmodule

// ------------------------- 
// -- test and gate 
// ------------------------- 
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
		$display("Exercicio 0009 - ANA CRISTINA - 427385");
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
// Exercicio 0009 - ANA CRISTINA - 427385
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