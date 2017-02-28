/*
 * Pontificia Universidade Cat�lica de Minas Gerais
 * Instituto de Ci�ncias Exatas e Infnandm�tica
 * Arquitetura de Computadnandes - Exemplo0006
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- nand gate
 // ----------------
 
 module nandgate (output s, input p, input q);
 assign s = (~(p & q)); // criar v�nculo permanente
 					// depend�ncia
 endmodule 		// nandgate
 
 // ---------------
 // -- test nand gate
 // ---------------
 
 module testnandgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradnand
 					// vari�vel independente
 wire s;			// definir conex�o (fio)
					// vari�vel dependente
 
 // --------------- inst�ncia
 	nandgate NAND1 (s, a, b);
 // --------------- prepara��o
 	initial begin:start
	
		a = 0;	b = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0006 - Izabela Caldeira Borges - 463243");
		$display("Test NAND gate");
		$display("\n(~(a & b)) = s\n");
	  a = 0; b = 0;
#1 	$display("~ %b & %b = %b", a, b, s);
     a = 0; b = 1;  
#1    $display("~ %b & %b = %b", a, b, s);
     a = 1; b = 0;
#1    $display("~ %b & %b = %b", a, b, s);
     a = 1; b = 1;
#1    $display("~ %b & %b = %b", a, b, s);
					
	end
	
 endmodule // testnandgate