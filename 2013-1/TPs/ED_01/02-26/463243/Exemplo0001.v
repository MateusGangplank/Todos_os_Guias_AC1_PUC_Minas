/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Inform�tica
 * Arquitetura de Computadores - Exemplo0001
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- buffer
 // ----------------
 
 module buffer (output s, input p);
 assign s = p; // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// buffer
 
 // ---------------
 // -- test buffer
 // ---------------
 
 module testbuffer;
 // --------------- dados locais
 
 reg a;			// definir registrador
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	buffer BF1 (s, a);
 // --------------- prepara��o
 	initial begin:start
		a = 0; 	// valor inicial
	end
 // --------------- parte principal
 	initial begin:main
					// execu��o unit�ria
		$display("Exemplo 0001 - Izabela Caldeira Borges - 463243");
		$display("Test buffer");
		$display("\t   time \ta = s");
					// execu��o permanente
		$monitor("%d\t%b = %b",$time, a, s);
					// ap�s uma unidade de tempo
					// mudar valor do registrador pra 0
	#1 a = 1;
					// ap�s duas unidades de tempo
					// mudar valor do registrador para 1
	#2 a = 0;
	end
	
 endmodule // testbuffer