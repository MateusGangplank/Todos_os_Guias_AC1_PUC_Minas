/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Infxormática
 * Arquitetura de Computadxores - Exemplo0011
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xor gate
 // ----------------
 
 module xorgate (output s, input p, input q);
 assign s = ((~p & q) | (p & ~q)); // criar vínculo permanente
 					// dependência
 endmodule 		// xorgate
 
 // ---------------
 // -- test xor gate
 // ---------------
 
 module testxorgate;
 // --------------- dados locais
 
 reg a, b;			// definir registradxor
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	xorgate XOR1 (s, a, b);
 // --------------- preparação
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