/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Inform�tica
 * Arquitetura de Computadores - Exemplo0002
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- not gate
 // ----------------
 
 module notgate (output s, input p);
 assign s = ~p; // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// notgate
 
 // ---------------
 // -- test not gate
 // ---------------
 
 module testnotgate;
 // --------------- dados locais
 
 reg a;			// definir registrador
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	notgate NOT1 (s, a);
 // --------------- prepara��o
 	initial begin:start
		a = 0; 	// valor inicial
	end
 // --------------- parte principal
 	initial begin
					// execu��o unit�ria
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