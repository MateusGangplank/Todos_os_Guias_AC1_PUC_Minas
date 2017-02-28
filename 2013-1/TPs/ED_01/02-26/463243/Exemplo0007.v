/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Infnorm�tica
 * Arquitetura de Computadnores - Exemplo0007
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- nor gate
 // ----------------
 
 module norgate (output s, input p, input q);
 assign s = (~(p | q)); // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// norgate
 
 // ---------------
 // -- test nor gate
 // ---------------
 
 module testnorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradnor
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	norgate NOR1 (s, a, b);
 // --------------- prepara��o
 	initial begin:start
	
		a = 0;	b = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0007 - Izabela Caldeira Borges - 463243");
		$display("Test NOR gate");
		$display("\n(~(a | b)) = s\n");
	  a = 0; b = 0;
#1 	$display("~( %b | %b )= %b", a, b, s);
     a = 0; b = 1;  
#1    $display("~( %b | %b )= %b", a, b, s);
     a = 1; b = 0;
#1    $display("~( %b | %b )= %b", a, b, s);
     a = 1; b = 1;
#1    $display("~( %b | %b )= %b", a, b, s);
					
	end
	
 endmodule // testnorgate