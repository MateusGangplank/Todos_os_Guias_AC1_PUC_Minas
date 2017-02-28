/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0001
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- buffer
 // ----------------
 
 module buffer (output s, input p);
 assign s = p; // criar vínculo permanente
 					// dependência
 endmodule 		// buffer
 
 // ---------------
 // -- test buffer
 // ---------------
 
 module testbuffer;
 // --------------- dados locais
 
 reg a;			// definir registrador
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	buffer BF1 (s, a);
 // --------------- preparação
 	initial begin:start
		a = 0; 	// valor inicial
	end
 // --------------- parte principal
 	initial begin:main
					// execução unitária
		$display("Exemplo 0001 - Izabela Caldeira Borges - 463243");
		$display("Test buffer");
		$display("\t   time \ta = s");
					// execução permanente
		$monitor("%d\t%b = %b",$time, a, s);
					// após uma unidade de tempo
					// mudar valor do registrador pra 0
	#1 a = 1;
					// após duas unidades de tempo
					// mudar valor do registrador para 1
	#2 a = 0;
	end
	
 endmodule // testbuffer