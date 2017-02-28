/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Infxormática
 * Arquitetura de Computadxores - Exemplo0005
 * Belo Horizonte 20 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- xor gate
 // ----------------
 
 module xorgate (output [0:3] s, input [0:3] p, input [0:3] q);
 assign s = p ^ q; // criar vínculo permanente
 					// dependência
 endmodule 		// xorgate
 
 // ---------------
 // -- test xor gate
 // ---------------
 
 module testxorgate;
 // --------------- dados locais
 
 reg [0:3] a, b;			// definir registradxor
 					// variável independente
 wire [0:3] s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	xorgate XOR1 (s, a, b);
 // --------------- preparação
 	initial begin:start
	
		a = 4'b0011;	// 4 valores binários
		b = 4'b0101;	// 4 valores binários
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0005 - Izabela Caldeira Borges - 463243");
		$display("Test XOR gate");
		$display("\n a ^ b =  s\n");
		$monitor("%b ^ %b = %b", a, b, s);
	#1		a = 0; b = 0;
	#1		a = 4'b0010; b = 4'b0001;
	#1		a = 4'd1; b = 3;
	#1		a = 4'o5; b = 2;
	#1		a = 4'hA; b = 3;
	#1		a = 4'h9; b = 4'o3;
					
	end
	
 endmodule // testxorgate