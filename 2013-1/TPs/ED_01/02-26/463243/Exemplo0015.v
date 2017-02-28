/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Inform�tica
 * Arquitetura de Computadores - Exemplo0015
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- or gate
 // ----------------
 
 module orgate (output s, input p, q);
 assign s = (p|q); //criar vinculo permanente
              		 //(dependencia)
 endmodule 			 // orgate

 module orgate2 (output s, input p, q, r);
 wire s1;
 orgate OR1 (s1, p, q);
 orgate OR2 (s, r, s1);
 endmodule 			 //orgate
 
 // ---------------
 // -- test or gate
 // ---------------
 
 module testorgate;
 // --------------- dados locais
 
 reg a, b, c;			// definir registrador
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	orgate2 OR3 (s, a, b, c);
 // --------------- prepara��o
 	initial begin:start
	
		a = 0;	b = 0;	c = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0015 - Izabela Caldeira Borges - 463243");
		$display("Test OR gate");
		$display("\n((a | b) | c) = s\n");
			$monitor("(%b | %b) | %b = %b", a, b, c, s);
	#1 	a = 0; 	b = 0; 	c = 0;
	#1 	a = 0; 	b = 0; 	c = 1;     
	#1 	a = 0; 	b = 1; 	c = 0;
	#1 	a = 0; 	b = 1; 	c = 1;  
	#1 	a = 1; 	b = 0; 	c = 0;
	#1 	a = 1; 	b = 0; 	c = 1;  
	#1 	a = 1; 	b = 1; 	c = 0;
	#1 	a = 1; 	b = 1; 	c = 1; 
					
	end
	
 endmodule // testorgate