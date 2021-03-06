/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Inform�tica
 * Arquitetura de Computadores - Exemplo0004
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- or gate
 // ----------------
 
 module orgate (output s, input p, input q);
 assign s = p | q; // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// orgate
 
 // ---------------
 // -- test or gate
 // ---------------
 
 module testorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registrador
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	orgate OR1 (s, a, b);
 // --------------- prepara��o
 	initial begin:start
							// atribui��o simult�nea 
		a = 0; b = 0; 	// dos valores iniciais
	end
 // --------------- parte principal
 	initial begin
					// execu��o unit�ria
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