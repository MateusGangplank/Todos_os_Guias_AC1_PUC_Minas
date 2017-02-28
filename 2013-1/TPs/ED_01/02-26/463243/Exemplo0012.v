/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Inform�tica
 * Arquitetura de Computadores - Exemplo0012
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xnor gate
 // ----------------
 
 module xnorgate (output s, input p, input q);
 assign s = ((p & q) | (~p & ~q)); // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// xnorgate
 
 // ---------------
 // -- test xnor gate
 // ---------------
 
 module testxnorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradxnor
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	xnorgate XNOR1 (s, a, b);
 // --------------- prepara��o
 	initial begin:start
	
		a = 0;	b = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0012 - Izabela Caldeira Borges - 463243");
		$display("Test XNOR gate");
		$display("\n((a & b) | (~a & ~b)) = s\n");
   		$monitor("%b ^ %b = %b", a, b, s);
	#1 	a = 0; 	b = 0;      
	#1 	a = 0; 	b = 1;    
	#1 	a = 1; 	b = 0;    
	#1 	a = 1; 	b = 1; 
					
	end
	
 endmodule // testxnorgate