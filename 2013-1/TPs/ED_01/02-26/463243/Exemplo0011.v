/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Infxorm�tica
 * Arquitetura de Computadxores - Exemplo0011
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xor gate
 // ----------------
 
 module xorgate (output s, input p, input q);
 assign s = ((~p & q) | (p & ~q)); // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// xorgate
 
 // ---------------
 // -- test xor gate
 // ---------------
 
 module testxorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradxor
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	xorgate XOR1 (s, a, b);
 // --------------- prepara��o
 	initial begin:start
	
		a = 0;	b = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0011 - Izabela Caldeira Borges - 463243");
		$display("Test XOR gate");
		$display("\n((~a & b) | (a & ~b)) = s\n");
			$monitor("%b ^ %b = %b", a, b, s);
	#1 	a = 0; 	b = 0;      
	#1 	a = 0; 	b = 1;    
	#1 	a = 1; 	b = 0;    
	#1 	a = 1; 	b = 1; 
					
	end
	
 endmodule // testxorgate