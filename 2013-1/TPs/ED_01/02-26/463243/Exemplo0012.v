/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0012
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xnor gate
 // ----------------
 
 module xnorgate (output s, input p, input q);
 assign s = ((p & q) | (~p & ~q)); // criar vínculo permanente
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