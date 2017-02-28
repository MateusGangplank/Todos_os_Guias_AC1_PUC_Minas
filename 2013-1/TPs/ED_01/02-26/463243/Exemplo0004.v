/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0004
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- or gate
 // ----------------
 
 module orgate (output s, input p, input q);
 assign s = p | q; // criar vínculo permanente
 					// dependência
 endmodule 		// orgate
 
 // ---------------
 // -- test or gate
 // ---------------
 
 module testorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registrador
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	orgate OR1 (s, a, b);
 // --------------- preparação
 	initial begin:start
							// atribuição simultânea 
		a = 0; b = 0; 	// dos valores iniciais
	end
 // --------------- parte principal
 	initial begin
					// execução unitária
		$display("Exemplo 0004 - Izabela Caldeira Borges - 463243");
		$display("Test OR gate");
		$display("\na & b =  s\n");
			a = 0; b = 0;
	#1 $display("%b & %b = %b", a, b, s);
			a = 0; b = 1;
	#1 $display("%b & %b = %b", a, b, s);
			a = 1; b = 0;
	#1 $display("%b & %b = %b", a, b, s);
			a = 1; b = 1;
	#1 $display("%b & %b = %b", a, b, s);
					
	end
	
 endmodule // testorgate