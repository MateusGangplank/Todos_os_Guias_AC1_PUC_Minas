/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Infnormática
 * Arquitetura de Computadnores - Exemplo0007
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- nor gate
 // ----------------
 
 module norgate (output s, input p, input q);
 assign s = (~(p | q)); // criar vínculo permanente
 					// dependência
 endmodule 		// norgate
 
 // ---------------
 // -- test nor gate
 // ---------------
 
 module testnorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradnor
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	norgate NOR1 (s, a, b);
 // --------------- preparação
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