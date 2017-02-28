/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0003
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- and gate
 // ----------------
 
 module andgate (output s, input p, input q);
 assign s = p & q; // criar vínculo permanente
 					// dependência
 endmodule 		// andgate
 
 // ---------------
 // -- test and gate
 // ---------------
 
 module testandgate;
 // --------------- dados locais
 
 reg a, b;			// definir registrador
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	andgate AND1 (s, a, b);
 // --------------- preparação
 	initial begin:start
							// atribuição simultânea 
		a = 0; b = 0; 	// dos valores iniciais
	end
 // --------------- parte principal
 	initial begin
					// execução unitária
		$display("Exemplo 0003 - Izabela Caldeira Borges - 463243");
		$display("Test AND gate");
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
	
 endmodule // testandgate