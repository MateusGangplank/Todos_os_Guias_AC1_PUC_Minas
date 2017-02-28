// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 03 - Construir a tabela_verdade para a porta XNOR com 2 entradas
// Obs - Usar operador ( ~(a^b) ) na definicao do modulo

// Exercicio0003 - xnor

// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output s, input p, input q);
	assign s = ~(p ^ q); // vinculo permanente
endmodule // xnor

// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate;
	// ------------------------- dados locais
	reg a, b; // definir registrador
	wire s; // definir conexao (fio)
	
	// ------------------------- instancia
	xnorgate XNOR1 (s, a, b);
	
	// ------------------------- preparacao
	initial begin:start
		a = 0;
		b = 0;
	end
	
	// ------------------------- parte principal
	initial begin:main
		$display("Exercicio 0003 - ANA CRISTINA - 427385");
		$display("Test xnor gate");
		$display("\n ~(a ^ b) = s\n");
		
		$monitor("~(%b ^ %b) = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testxnorgate

// -- Testes
// Exercicio 0003 - ANA CRISTINA - 427385
// Test xnor gate
// ~(a ^ b) = s
// ~(0 ^ 0) = 1
// ~(0 ^ 1) = 0
// ~(1 ^ 0) = 0
// ~(1 ^ 1) = 1