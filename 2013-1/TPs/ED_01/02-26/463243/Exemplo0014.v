/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0014
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- and gate
 // ----------------
 
 module andgate (output s, input p, q);
 assign s = (p&q); //criar vinculo permanente
              		 //(dependencia)
 endmodule 			 // andgate

 module andgate2 (output s, input p, q, r);
 wire s1;
 andgate AND1 (s1, p, q);
 andgate AND2 (s, r, s1);
 endmodule 			 //andgate
 
 // ---------------
 // -- test and gate
 // ---------------
 
 module testandgate;
 // --------------- dados locais
 
 reg a, b, c;			// definir registradand
 					// variável independente
 wire s;			// definir conexão (fio)
					// variável dependente
 
 // --------------- instância
 	andgate2 AND3 (s, a, b, c);
 // --------------- preparação
 	initial begin:start
	
		a = 0;	b = 0;	c = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0014 - Izabela Caldeira Borges - 463243");
		$display("Test AND gate");
		$display("\n((a & b) & c) = s\n");
			$monitor("(%b & %b) & %b = %b", a, b, c, s);
	#1 	a = 0; 	b = 0; 	c = 0;
	#1 	a = 0; 	b = 0; 	c = 1;     
	#1 	a = 0; 	b = 1; 	c = 0;
	#1 	a = 0; 	b = 1; 	c = 1;  
	#1 	a = 1; 	b = 0; 	c = 0;
	#1 	a = 1; 	b = 0; 	c = 1;  
	#1 	a = 1; 	b = 1; 	c = 0;
	#1 	a = 1; 	b = 1; 	c = 1; 
					
	end
	
 endmodule // testandgate