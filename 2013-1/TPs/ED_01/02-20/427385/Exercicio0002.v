// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 02 - Construir a tabela_verdade para a porta NOR com 2 entradas
// Obs - Usar operador ( ~(a|b) ) na definicao do modulo
// Usar $monitor ( )

// Exercicio0002 - nor

// --------------------- 
// -- nor gate 
// --------------------- 
module norgate (output s, input p, input q);
	assign s = (~(p|q)); // vinculo permanente
endmodule // nor

// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
	// ------------------------- dados locais
	reg a,b; // definir registrador
	wire s; // definir conexao (fio)
	
	// ------------------------- instancia
	norgate NOR1 (s, a, b);
	
	// ------------------------- preparacao
	initial begin:start
		a=0;
		b=0;
	end
	
	// ------------------------- parte principal
	initial begin:main
		$display("Exercicio 0002 - ANA CRISTINA - 427385");
		$display("Test NOR gate");
		$display("\n~(a | b) = s\n");
		
		$monitor("~(%b | %b) = %b", a, b, s); 
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	end
endmodule // testnorgate

// -- Testes
// Exercicio 0002 - ANA CRISTINA - 427385
// Test NOR gate
// ~(a | b) = s
// ~(0 | 0) = 1
// ~(0 | 1) = 0
// ~(1 | 0) = 0
// ~(1 | 1) = 0