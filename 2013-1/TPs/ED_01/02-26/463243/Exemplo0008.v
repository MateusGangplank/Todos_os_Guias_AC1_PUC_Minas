/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Infxnormática
 * Arquitetura de Computadxnores - Exemplo0008
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xnor gate
 // ----------------
 
 module xnorgate (output s, input p, input q);
 assign s = (~(p ^ q)); // criar vínculo permanente
 					// dependência
 endmodule 		// xnorgate
 
 // ---------------
 // -- test xnor gate
 // ---------------
 
 module testxnorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradxnor
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	xnorgate XNOR1 (s, a, b);
 // --------------- preparação
 	initial begin:start
	
		a = 0;	b = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0008 - Izabela Caldeira Borges - 463243");
		$display("Test XNOR gate");
		$display("\n(~(a ^ b)) = s\n");
	  a = 0; b = 0;
#1 	$display("~( %b ^ %b )= %b", a, b, s);
     a = 0; b = 1;  
#1    $display("~( %b ^ %b )= %b", a, b, s);
     a = 1; b = 0;
#1    $display("~( %b ^ %b )= %b", a, b, s);
     a = 1; b = 1;
#1    $display("~( %b ^ %b )= %b", a, b, s);
					
	end
	
 endmodule // testxnorgate