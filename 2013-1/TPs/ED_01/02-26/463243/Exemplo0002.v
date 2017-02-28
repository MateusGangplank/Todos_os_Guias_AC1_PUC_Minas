/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0002
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- not gate
 // ----------------
 
 module notgate (output s, input p);
 assign s = ~p; // criar vínculo permanente
 					// dependência
 endmodule 		// notgate
 
 // ---------------
 // -- test not gate
 // ---------------
 
 module testnotgate;
 // --------------- dados locais
 
 reg a;			// definir registrador
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	notgate NOT1 (s, a);
 // --------------- preparação
 	initial begin:start
		a = 0; 	// valor inicial
	end
 // --------------- parte principal
 	initial begin
					// execução unitária
		$display("Exemplo 0002 - Izabela Caldeira Borges - 463243");
		$display("Test NOT gate");
		$display("\n~a =  s\n");
			a = 0;
					// mudar valor do registrador pra 0
	#1 $display("~%b = %b", a, s);
			a = 1;
					// mudar valor do registrador para 1
	#1 $display("~%b = %b", a, s);
	end
	
 endmodule // testnotgate