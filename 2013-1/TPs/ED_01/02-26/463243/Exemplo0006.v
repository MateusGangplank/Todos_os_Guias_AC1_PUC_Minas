/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Infnandmática
 * Arquitetura de Computadnandes - Exemplo0006
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- nand gate
 // ----------------
 
 module nandgate (output s, input p, input q);
 assign s = (~(p & q)); // criar vínculo permanente
 					// dependência
 endmodule 		// nandgate
 
 // ---------------
 // -- test nand gate
 // ---------------
 
 module testnandgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradnand
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	nandgate NAND1 (s, a, b);
 // --------------- preparação
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