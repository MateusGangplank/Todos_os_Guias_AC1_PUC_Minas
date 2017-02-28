// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 01 - Construir a tabela-verdade para a porta NAND com 2 entradas
// Obs -  Usar operador ( ~(a&b) ) na definicao do modulo
// Usar $display ( )
 
// Exercicio0001 - nand

// --------------------- 
// -- nand gate 
// --------------------- 
module nandgate (output s, input p, input q);
	assign s = (~(p&q)); // vinculo permanente
endmodule // nand

// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
	// ------------------------- dados locais
	reg a,b; // definir registrador
	wire s; // definir conexao (fio)
	
	// ------------------------- instancia
	nandgate NAND1 (s, a, b);
	
	// ------------------------- preparacao
	initial begin:start
		a=0;
		b=0;
	end
	
	// ------------------------- parte principal
	initial begin:main
		$display("Exercicio 0001 - ANA CRISTINA - 427385");
		$display("Test NAND gate");
		$display("\n~(a & b) = s\n");
		
		#1 a = 0; b = 0;
		#1 $display("~(%b & %b) = %b", a, b, s);
		#1 a = 0; b = 1;
		#1 $display("~(%b & %b) = %b", a, b, s);
		#1 a = 1; b = 0;
		#1 $display("~(%b & %b) = %b", a, b, s);
		#1 a = 1; b = 1;
		#1 $display("~(%b & %b) = %b", a, b, s);
	end
endmodule // testnandgate

// -- Testes
// Exercicio 0001 - ANA CRISTINA - 427385
// Test NAND gate
// ~(a & b) = s
// ~(0 & 0) = 1
// ~(0 & 1) = 1
// ~(1 & 0) = 1
// ~(1 & 1) = 0